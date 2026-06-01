CREATE TABLE [clientes] (
  [id] integer PRIMARY KEY,
  [nome] varchar(100),
  [telefone] nvarchar(255),
  [email] nvarchar(255),
  [estado] char(2),
  [cidade] varchar(50),
  [rua] varchar(60),
  [numero] varchar(10),
  [cep] char(9)
)
GO