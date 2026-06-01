CREATE TABLE [pecas] (
  [id] integer,
  [preco] numeric(14,2),
  [quantidade] smallint,
  [dt_compra] date,
  [fornecedores_id] integer
)
GO

ALTER TABLE [pecas] ADD FOREIGN KEY ([fornecedores_id]) REFERENCES [fornecedores] ([id])
GO