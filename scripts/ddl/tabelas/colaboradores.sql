CREATE TABLE [colaboradores] (
  [id] smallint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) NOT NULL,
  [cpf] char(11) UNIQUE NOT NULL,
  [estado] char(2) NOT NULL,
  [cidade] varchar(50) NOT NULL,
  [rua] varchar(60) NOT NULL,
  [numero] varchar(10) NOT NULL,
  [cep] char(9) NOT NULL,
  [complemento] varchar(50),
  [salario] numeric(14,2) NOT NULL,
  [status] tinyint NOT NULL,
  [dt_cadastro] datetime2(2) NOT NULL,
  [dt_demissao] datetime2(2),
  [cargo_id] tinyint NOT NULL
)
GO

ALTER TABLE [colaboradores] ADD FOREIGN KEY ([cargo_id]) REFERENCES [cargos] ([id])
GO