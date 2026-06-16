CREATE TABLE [servicos_os] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [descricao] varchar(255) NOT NULL,
  [preco_servico] numeric(14,2) NOT NULL,
  [servicos_id] tinyint NOT NULL,
  [ordem_de_servico_id] integer NOT NULL
)
GO

ALTER TABLE [servicos_os] ADD FOREIGN KEY ([ordem_de_servico_id]) REFERENCES [ordem_de_servico] ([id])
GO

ALTER TABLE [servicos_os] ADD FOREIGN KEY ([servicos_id]) REFERENCES [servicos] ([id])
GO