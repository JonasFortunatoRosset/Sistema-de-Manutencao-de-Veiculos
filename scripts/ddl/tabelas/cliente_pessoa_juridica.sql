CREATE TABLE [clientes_pessoa_juridica] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [cnpj] nvarchar(255) UNIQUE NOT NULL,
  [cliente_id] integer NOT NULL
)
GO

ALTER TABLE [clientes_pessoa_juridica] ADD FOREIGN KEY ([cliente_id]) REFERENCES [clientes] ([id])
GO