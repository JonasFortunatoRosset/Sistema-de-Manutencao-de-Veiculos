CREATE TABLE [ordem_de_servico] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [odometro] integer,
  [dt_inicio] date NOT NULL,
  [dt_fim] date,
  [veiculo_id] integer NOT NULL
)
GO

ALTER TABLE [ordem_de_servico] ADD FOREIGN KEY ([servico_id]) REFERENCES [servicos] ([id])
GO

ALTER TABLE [ordem_de_servico] ADD FOREIGN KEY ([veiculo_id]) REFERENCES [veiculos] ([id])
GO