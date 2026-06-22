<?php
// ==========================================
// 1. CONFIGURAÇÃO DO BANCO DE DADOS
// ==========================================
$serverName = "localhost"; // Se for instância, use "localhost\\SQLEXPRESS"
$connectionInfo = array(
    "Database" => "NomeDoSeuBanco", // <-- COLOQUE SEU BANCO AQUI
    "CharacterSet" => "UTF-8"
);

$conn = sqlsrv_connect($serverName, $connectionInfo);

if (!$conn) {
    die("Falha na conexão com o banco de dados: " . print_r(sqlsrv_errors(), true));
}

// ==========================================
// 2. LÓGICA DE INSERÇÃO (CREATE)
// ==========================================
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['cadastrar'])) {
    $sqlInsert = "INSERT INTO clientes (cpf, nome, telefone, email, estado, cidade, rua, numero, cep) 
                  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $params = array(
        $_POST['cpf'], $_POST['nome'], $_POST['telefone'], $_POST['email'], 
        $_POST['estado'], $_POST['cidade'], $_POST['rua'], $_POST['numero'], $_POST['cep']
    );

    $stmtInsert = sqlsrv_query($conn, $sqlInsert, $params);
    if ($stmtInsert) {
        $mensagem = "<div class='alert alert-success'>Cliente cadastrado com sucesso!</div>";
    } else {
        $mensagem = "<div class='alert alert-danger'>Erro ao cadastrar: " . print_r(sqlsrv_errors(), true) . "</div>";
    }
}

// ==========================================
// 3. LÓGICA DE EXCLUSÃO (DELETE)
// ==========================================
if (isset($_GET['delete'])) {
    $cpfDelete = $_GET['delete'];
    $sqlDelete = "DELETE FROM clientes WHERE cpf = ?";
    sqlsrv_query($conn, $sqlDelete, array($cpfDelete));
    header("Location: index.php"); // Recarrega a página limpando a URL
    exit;
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Gestão de Clientes - PHP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">Gestão de Clientes</h2>
    
    <?php if(isset($mensagem)) echo $mensagem; ?>

    <div class="card mb-4">
        <div class="card-header bg-primary text-white">Novo Cliente</div>
        <div class="card-body">
            <form method="POST" action="index.php">
                <div class="row g-3">
                    <div class="col-md-3"><input type="text" name="cpf" class="form-control" placeholder="CPF" required></div>
                    <div class="col-md-5"><input type="text" name="nome" class="form-control" placeholder="Nome Completo" required></div>
                    <div class="col-md-4"><input type="text" name="telefone" class="form-control" placeholder="Telefone" required></div>
                    <div class="col-md-4"><input type="email" name="email" class="form-control" placeholder="E-mail" required></div>
                    <div class="col-md-2"><input type="text" name="estado" class="form-control" placeholder="Estado (SC)" required></div>
                    <div class="col-md-3"><input type="text" name="cidade" class="form-control" placeholder="Cidade" required></div>
                    <div class="col-md-3"><input type="text" name="cep" class="form-control" placeholder="CEP" required></div>
                    <div class="col-md-8"><input type="text" name="rua" class="form-control" placeholder="Rua" required></div>
                    <div class="col-md-4"><input type="text" name="numero" class="form-control" placeholder="Número" required></div>
                </div>
                <button type="submit" name="cadastrar" class="btn btn-success mt-3">Cadastrar Cliente</button>
            </form>
        </div>
    </div>

    <div class="card">
        <div class="card-header bg-dark text-white">Clientes Cadastrados</div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>CPF</th>
                        <th>Nome</th>
                        <th>Telefone</th>
                        <th>Cidade/UF</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // ==========================================
                    // 4. LÓGICA DE LEITURA (READ)
                    // ==========================================
                    $sqlSelect = "SELECT * FROM clientes";
                    $stmtSelect = sqlsrv_query($conn, $sqlSelect);

                    if ($stmtSelect !== false) {
                        while ($row = sqlsrv_fetch_array($stmtSelect, SQLSRV_FETCH_ASSOC)) {
                            echo "<tr>";
                            echo "<td>" . $row['cpf'] . "</td>";
                            echo "<td>" . $row['nome'] . "</td>";
                            echo "<td>" . $row['telefone'] . "</td>";
                            echo "<td>" . $row['cidade'] . "/" . $row['estado'] . "</td>";
                            echo "<td>
                                    <a href='index.php?delete=" . $row['cpf'] . "' class='btn btn-sm btn-danger' onclick='return confirm(\"Tem certeza que deseja excluir?\")'>Excluir</a>
                                  </td>";
                            echo "</tr>";
                        }
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>