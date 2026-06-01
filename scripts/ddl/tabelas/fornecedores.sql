CREATE TABLE [fornecedores] (
  [id] tinyint PRIMARY KEY IDENTITY(1, 1),
  [estado] char(2) NOT NULL,
  [cidade] varchar(50) NOT NULL,
  [rua] varchar(60) NOT NULL,
  [numero] varchar(10) NOT NULL,
  [cep] char(9) NOT NULL,
  [complemento] varchar(50) NOT NULL,
  [dt_cadastro] timestamp NOT NULL DEFAULT (getdate()),
  [status] tinyint NOT NULL
)
GO