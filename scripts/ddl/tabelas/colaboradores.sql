CREATE TABLE [colaboradores] (
  [id] smallint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) NOT NULL,
  [funcao] varchar(50) NOT NULL,
  [estado] char(2) NOT NULL,
  [cidade] varchar(50) NOT NULL,
  [rua] varchar(60) NOT NULL,
  [numero] varchar(10) NOT NULL,
  [cep] char(9) NOT NULL,
  [complemento] varchar(50),
  [status] tinyint NOT NULL,
  [dt_cadastro] timestamp NOT NULL,
  [dt_demissao] timestamp NOT NULL
)
GO