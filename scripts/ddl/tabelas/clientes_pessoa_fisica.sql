CREATE TABLE [clientes_pessoa_fisica] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [cpf] nvarchar(255) NOT NULL,
  [cliente_id] integer NOT NULL
)
GO

ALTER TABLE [clientes_pessoa_fisica] ADD FOREIGN KEY ([cliente_id]) REFERENCES [clientes] ([id])
GO