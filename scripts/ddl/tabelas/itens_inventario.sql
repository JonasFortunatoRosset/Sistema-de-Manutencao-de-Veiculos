CREATE TABLE [itens_inventario] (
  [id] smallint PRIMARY KEY,
  [nome] varchar(100),
  [descricao] varchar(255),
  [status] bit,
  [dt_compra] date,
  [dt_baixa] date
)
GO