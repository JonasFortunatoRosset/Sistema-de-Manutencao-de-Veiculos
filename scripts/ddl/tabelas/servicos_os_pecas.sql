CREATE TABLE [servicos_os_pecas] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [quantidade] smallint NOT NULL,
  [preco_venda] numeric(14,2) NOT NULL,
  [servicos_os_id] integer NOT NULL,
  [pecas_id] integer NOT NULL
)
GO

ALTER TABLE [servicos_os_pecas] ADD FOREIGN KEY ([servicos_os_id]) REFERENCES [servicos_os] ([id])
GO

ALTER TABLE [servicos_os_pecas] ADD FOREIGN KEY ([pecas_id]) REFERENCES [pecas] ([id])
GO