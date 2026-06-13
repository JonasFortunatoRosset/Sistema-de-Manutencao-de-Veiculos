CREATE TABLE [pecas] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) NOT NULL,
  [preco] numeric(14,2),
  [quantidade] smallint NOT NULL,
  [dt_compra] date,
)
GO