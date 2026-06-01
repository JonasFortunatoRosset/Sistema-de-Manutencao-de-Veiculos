CREATE TABLE [clientes] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) UNIQUE NOT NULL,
  [telefone] nvarchar(255) NOT NULL,
  [email] nvarchar(255) NOT NULL,
  [estado] char(2) NOT NULL,
  [cidade] varchar(50) NOT NULL,
  [rua] varchar(60) NOT NULL,
  [numero] varchar(10) NOT NULL,
  [cep] char(9) NOT NULL
)
GO