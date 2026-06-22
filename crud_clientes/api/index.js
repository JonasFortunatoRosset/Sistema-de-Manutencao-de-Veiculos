const express = require('express');
const sql = require('mssql/msnodesqlv8');
const cors = require('cors');

const app = express();
app.use(cors({
  origin: ["http://localhost:8000"],
  methods: ["GET", "POST", "PUT", "DELETE"]
}));
app.use(express.json());

const config = {
  connectionString: 
    'Driver={ODBC Driver 17 for SQL Server};' +
    'Server=(localdb)\\crud_clientes;' +
    'Database=crud_clientes;' +
    'Trusted_Connection=Yes;'
};
let pool;
async function getPool() {
  if (!pool) {
    pool = await sql.connect(config);
  }
  return pool;
}

app.post('/usuarios', async (req, res) => {
  try {
    const {
      cpf, nome, telefone, email, cep,
      rua, bairro, numero, cidade, estado
    } = req.body;
 
    const pool = await getPool();
    await pool.request()
      .input('cpf', sql.VarChar, cpf)
      .input('nome', sql.VarChar, nome)
      .input('telefone', sql.VarChar, telefone)
      .input('email', sql.VarChar, email)
      .input('cep', sql.VarChar, cep)
      .input('rua', sql.VarChar, rua)
      .input('numero', sql.VarChar, numero)
      .input('cidade', sql.VarChar, cidade)
      .input('estado', sql.VarChar, estado)
      .query(`
        INSERT INTO clientes (cpf, nome, telefone, email, cep, rua, numero, cidade, estado)
        VALUES (@cpf, @nome, @telefone, @email, @cep, @rua, @numero, @cidade, @estado)
      `);
 
    res.status(201).json({ mensagem: 'Usuário cadastrado com sucesso.' });
  } catch (erro) {
    console.error(erro);
    res.status(500).json({ erro: erro.message });
  }
});

app.get('/usuarios', async (req, res) => {
  try {
    const pool = await getPool();
    const resultado = await pool.request().query(`SELECT * FROM clientes`);
    res.json(resultado.recordset);
  } catch (erro) {
    console.error(erro);
    res.status(500).json({ erro: erro.message });
  }
});

app.put('/usuarios/:cpf', async (req, res) => {
  try {
    const { cpf } = req.params;
    const {
      nome, telefone, email, cep,
      rua, bairro, numero, cidade, estado
    } = req.body;
 
    const pool = await getPool();
    await pool.request()
      .input('cpf', sql.VarChar, cpf)
      .input('nome', sql.VarChar, nome)
      .input('telefone', sql.VarChar, telefone)
      .input('email', sql.VarChar, email)
      .input('cep', sql.VarChar, cep)
      .input('rua', sql.VarChar, rua)
      .input('numero', sql.VarChar, numero)
      .input('cidade', sql.VarChar, cidade)
      .input('estado', sql.VarChar, estado)
      .query(`
        UPDATE clientes
        SET nome = @nome,
            telefone = @telefone,
            email = @email,
            cep = @cep,
            rua = @rua,
            numero = @numero,
            cidade = @cidade,
            estado = @estado
        WHERE cpf = @cpf
      `);
 
    res.json({ mensagem: 'Usuário atualizado com sucesso.' });
  } catch (erro) {
    console.error(erro);
    res.status(500).json({ erro: erro.message });
  }
});

app.delete('/usuarios/:cpf', async (req, res) => {
  try {
    const { cpf } = req.params;
 
    const pool = await getPool();
    await pool.request()
      .input('cpf', sql.VarChar, cpf)
      .query(`DELETE FROM clientes WHERE cpf = @cpf`);
 
    res.json({ mensagem: 'Usuário excluído com sucesso.' });
  } catch (erro) {
    console.error(erro);
    res.status(500).json({ erro: erro.message });
  }
});

app.listen(3000, () => {
  console.log(`rodando...`);
});