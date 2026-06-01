CREATE TABLE [colaboradores_os] (
  [id] integer PRIMARY KEY,
  [colaboradores_id] integer,
  [ordem_de_serviço_id] integer
)
GO

ALTER TABLE [colaboradores_os] ADD FOREIGN KEY ([ordem_de_serviço_id]) REFERENCES [ordem_de_servico] ([id])
GO

ALTER TABLE [colaboradores_os] ADD FOREIGN KEY ([colaboradores_id]) REFERENCES [colaboradores] ([id])
GO