CREATE TABLE [ordem_de_servico] (
  [id] integer PRIMARY KEY,
  [odometro] integer,
  [tempo] time,
  [preco] numeric(14,2),
  [veiculo_id] integer,
  [servico_id] integer
)
GO

ALTER TABLE [ordem_de_servico] ADD FOREIGN KEY ([servico_id]) REFERENCES [servicos] ([id])
GO

ALTER TABLE [ordem_de_servico] ADD FOREIGN KEY ([veiculo_id]) REFERENCES [veiculos] ([id])
GO