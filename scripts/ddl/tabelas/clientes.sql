CREATE TABLE [clientes] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [cpf] char(11) UNIQUE NOT NULL,
  [nome] varchar(100) UNIQUE NOT NULL,
  [telefone] varchar(15) NOT NULL,
  [email] varchar(254) NOT NULL,
  [estado] char(2) NOT NULL,
  [cidade] varchar(50) NOT NULL,
  [rua] varchar(60) NOT NULL,
  [numero] varchar(10) NOT NULL,
  [cep] char(9) NOT NULL
)
GO