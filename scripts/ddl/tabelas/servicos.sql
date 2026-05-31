CREATE TABLE [servicos] (
  [id] tinyint PRIMARY KEY,
  [nome] varchar(100),
  [descricao] varchar(255),
  [valor_minimo] numeric(14,2),
  [valor_maximo] numeric(14,2)
)
GO
