<?php
// ==========================================
// 1. CONFIGURAÇÃO DO BANCO DE DADOS
// ==========================================
$serverName = "localhost"; // Use "localhost\\SQLEXPRESS" se necessário no SSMS
$connectionInfo = array("Database" => "COLOQUE_SEU_BANCO_AQUI", "CharacterSet" => "UTF-8");
$conn = sqlsrv_connect($serverName, $connectionInfo);

if (!$conn) {
    die("Falha na conexão com o banco de dados: " . print_r(sqlsrv_errors(), true));
}

$mensagem = "";
$clienteEdicao = null;

// ==========================================
// 2. EXCLUIR CLIENTE (DELETE)
// ==========================================
if (isset($_GET['delete'])) {
    $cpf = $_GET['delete'];
    $sql = "DELETE FROM clientes WHERE cpf = ?";
    if (sqlsrv_query($conn, $sql, array($cpf))) {
        header("Location: index.php?msg=excluido");
        exit;
    } else {
        $mensagem = "<div class='alert alert-danger'>Erro ao excluir (Pode estar atrelado a um veículo/OS).</div>";
    }
}

// ==========================================
// 3. CARREGAR DADOS PARA EDIÇÃO
// ==========================================
if (isset($_GET['edit'])) {
    $cpf = $_GET['edit'];
    $sql = "SELECT * FROM clientes WHERE cpf = ?";
    $stmt = sqlsrv_query($conn, $sql, array($cpf));
    $clienteEdicao = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC);
}

// ==========================================
// 4. CADASTRAR OU ATUALIZAR CLIENTE (CREATE / UPDATE)
// ==========================================
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cpf = $_POST['cpf'];
    $nome = $_POST['nome'];
    $telefone = $_POST['telefone'];
    $email = $_POST['email'];
    $estado = $_POST['estado'];
    $cidade = $_POST['cidade'];
    $cep = $_POST['cep'];
    $rua = $_POST['rua'];
    $numero = $_POST['numero'];
    $acao = $_POST['acao']; // 'novo' ou 'editar'

    if ($acao == 'novo') {
        $sql = "INSERT INTO clientes (cpf, nome, telefone, email, estado, cidade, rua, numero, cep) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $params = array($cpf, $nome, $telefone, $email, $estado, $cidade, $rua, $numero, $cep);
        if (sqlsrv_query($conn, $sql, $params)) {
            header("Location: index.php?msg=cadastrado");
            exit;
        } else {
            $mensagem = "<div class='alert alert-danger'>Erro ao cadastrar. Verifique se o CPF já existe.</div>";
        }
    } elseif ($acao == 'editar') {
        $sql = "UPDATE clientes SET nome=?, telefone=?, email=?, estado=?, cidade=?, rua=?, numero=?, cep=? WHERE cpf=?";
        $params = array($nome, $telefone, $email, $estado, $cidade, $rua, $numero, $cep, $cpf);
        if (sqlsrv_query($conn, $sql, $params)) {
            header("Location: index.php?msg=atualizado");
            exit;
        } else {
            $mensagem = "<div class='alert alert-danger'>Erro ao atualizar os dados.</div>";
        }
    }
}

// Mensagens de sucesso após redirecionamento
if (isset($_GET['msg'])) {
    if ($_GET['msg'] == 'excluido') $mensagem = "<div class='alert alert-warning'>Cliente excluído com sucesso!</div>";
    if ($_GET['msg'] == 'cadastrado') $mensagem = "<div class='alert alert-success'>Cliente cadastrado com sucesso!</div>";
    if ($_GET['msg'] == 'atualizado') $mensagem = "<div class='alert alert-info'>Dados do cliente atualizados!</div>";
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>CRUD Clientes - SQL Server</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">Gestão de Clientes</h2>
    
    <?= $mensagem ?>

    <div class="card mb-4 shadow-sm">
        <div class="card-header <?= $clienteEdicao ? 'bg-warning' : 'bg-primary text-white' ?>">
            <?= $clienteEdicao ? 'Editar Cliente' : 'Novo Cliente' ?>
        </div>
        <div class="card-body">
            <form method="POST" action="index.php">
                <input type="hidden" name="acao" value="<?= $clienteEdicao ? 'editar' : 'novo' ?>">
                
                <div class="row g-3">
                    <div class="col-md-3">
                        <label>CPF</label>
                        <input type="text" name="cpf" class="form-control" value="<?= $clienteEdicao ? $clienteEdicao['cpf'] : '' ?>" <?= $clienteEdicao ? 'readonly' : 'required' ?>>
                    </div>
                    <div class="col-md-5">
                        <label>Nome Completo</label>
                        <input type="text" name="nome" class="form-control" value="<?= $clienteEdicao ? $clienteEdicao['nome'] : '' ?>" required>
                    </div>
                    <div class="col-md-4">
                        <label>Telefone</label>
                        <input type="text" name="telefone" class="form-control" value="<?= $clienteEdicao ? $clienteEdicao['telefone'] : '' ?>" required>
                    </div>
                    <div class="col-md-4">
                        <label>E-mail</label>
                        <input type="email" name="email" class="form-control" value="<?= $clienteEdicao ? $clienteEdicao['email'] : '' ?>" required>
                    </div>
                    <div class="col-md-2">
                        <label>Estado</label>
                        <input type="text" name="estado" class="form-control" value="<?= $clienteEdicao ? $clienteEdicao['estado'] : '' ?>" required maxlength="2">
                    </div>
                    <div class="col-md-3">
                        <label>Cidade</label>
                        <input type="text" name="cidade" class="form-control" value="<?= $clienteEdicao ? $clienteEdicao['cidade'] : '' ?>" required>
                    </div>
                    <div class="col-md-3">
                        <label>CEP</label>
                        <input type="text" name="cep" class="form-control" value="<?= $clienteEdicao ? $clienteEdicao['cep'] : '' ?>" required>
                    </div>
                    <div class="col-md-9">
                        <label>Rua</label>
                        <input type="text" name="rua" class="form-control" value="<?= $clienteEdicao ? $clienteEdicao['rua'] : '' ?>" required>
                    </div>
                    <div class="col-md-3">
                        <label>Número</label>
                        <input type="text" name="numero" class="form-control" value="<?= $clienteEdicao ? $clienteEdicao['numero'] : '' ?>" required>
                    </div>
                </div>
                
                <div class="mt-3">
                    <button type="submit" class="btn <?= $clienteEdicao ? 'btn-warning' : 'btn-success' ?>">
                        <?= $clienteEdicao ? 'Salvar Alterações' : 'Cadastrar Cliente' ?>
                    </button>
                    <?php if($clienteEdicao): ?>
                        <a href="index.php" class="btn btn-secondary">Cancelar Edição</a>
                    <?php endif; ?>
                </div>
            </form>
        </div>
    </div>

    <div class="card shadow-sm mb-5">
        <div class="card-header bg-dark text-white">Clientes Cadastrados</div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-striped table-hover mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>CPF</th>
                            <th>Nome</th>
                            <th>Telefone</th>
                            <th>Cidade/UF</th>
                            <th class="text-center">Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $sql = "SELECT * FROM clientes ORDER BY id DESC";
                        $stmt = sqlsrv_query($conn, $sql);

                        if ($stmt !== false) {
                            while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
                                echo "<tr>";
                                echo "<td class='align-middle'>" . htmlspecialchars($row['cpf']) . "</td>";
                                echo "<td class='align-middle'>" . htmlspecialchars($row['nome']) . "</td>";
                                echo "<td class='align-middle'>" . htmlspecialchars($row['telefone']) . "</td>";
                                echo "<td class='align-middle'>" . htmlspecialchars($row['cidade']) . "/" . htmlspecialchars($row['estado']) . "</td>";
                                echo "<td class='align-middle text-center'>
                                        <a href='index.php?edit=" . $row['cpf'] . "' class='btn btn-sm btn-primary'>Editar</a>
                                        <a href='index.php?delete=" . $row['cpf'] . "' class='btn btn-sm btn-danger' onclick='return confirm(\"Tem certeza que deseja excluir o cliente " . htmlspecialchars($row['nome']) . "?\")'>Excluir</a>
                                      </td>";
                                echo "</tr>";
                            }
                        } else {
                            echo "<tr><td colspan='5' class='text-center'>Nenhum cliente cadastrado ou erro ao carregar.</td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>