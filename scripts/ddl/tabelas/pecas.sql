CREATE TABLE [pecas] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [preco] numeric(14,2),
  [quantidade] smallint NOT NULL,
  [dt_compra] date,
  [fornecedores_id] integer
)
GO

ALTER TABLE [pecas] ADD FOREIGN KEY ([fornecedores_id]) REFERENCES [fornecedores] ([id])
GO