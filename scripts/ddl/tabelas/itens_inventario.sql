CREATE TABLE [itens_inventario] (
  [id] smallint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) NOT NULL,
  [descricao] varchar(255) NOT NULL,
  [status] bit NOT NULL,
  [dt_compra] date NOT NULL,
  [dt_baixa] date
)
GO