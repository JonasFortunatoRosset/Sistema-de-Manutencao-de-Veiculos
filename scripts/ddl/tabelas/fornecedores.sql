CREATE TABLE [fornecedores] (
  [id] tinyint PRIMARY KEY,
  [estado] char(2),
  [cidade] varchar(50),
  [rua] varchar(60),
  [numero] varchar(10),
  [cep] char(9),
  [complemento] varchar(50),
  [dt_cadastro] timestamp DEFAULT (getdate()),
  [status] tinyint
)
GO