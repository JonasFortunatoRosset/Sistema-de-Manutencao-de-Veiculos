CREATE TABLE [clientes_pessoa_fisica] (
  [id] integer,
  [cpf] nvarchar(255),
  [cliente_id] integer
)
GO

ALTER TABLE [clientes_pessoa_fisica] ADD FOREIGN KEY ([cliente_id]) REFERENCES [clientes] ([id])
GO