CREATE TABLE [colaboradores_os] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [colaboradores_id] integer NOT NULL,
  [ordem_de_serviço_id] integer NOT NULL
)
GO

ALTER TABLE [colaboradores_os] ADD FOREIGN KEY ([ordem_de_serviço_id]) REFERENCES [ordem_de_servico] ([id])
GO

ALTER TABLE [colaboradores_os] ADD FOREIGN KEY ([colaboradores_id]) REFERENCES [colaboradores] ([id])
GO