CREATE TABLE [clientes_pessoa_juridica] (
  [id] integer,
  [cnpj] nvarchar(255),
  [cliente_id] integer
)
GO

ALTER TABLE [clientes_pessoa_juridica] ADD FOREIGN KEY ([cliente_id]) REFERENCES [clientes] ([id])
GO