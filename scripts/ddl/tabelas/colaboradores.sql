CREATE TABLE [colaboradores] (
  [id] smallint PRIMARY KEY,
  [nome] varchar(100),
  [funcao] varchar(50),
  [estado] char(2),
  [cidade] varchar(50),
  [rua] varchar(60),
  [numero] varchar(10),
  [cep] char(9),
  [complemento] varchar(50),
  [status] tinyint,
  [dt_cadastro] timestamp,
  [dt_demissao] timestamp
)
GO