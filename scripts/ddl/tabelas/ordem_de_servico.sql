CREATE TABLE [ordem_de_servico] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [odometro] integer,
  [valor_total] numeric(14,2),
  [status] bit NOT NULL,
  [dt_inicio] date NOT NULL,
  [dt_fim] date,
  [dt_liberacao] date,
  [veiculo_id] integer NOT NULL
)
GO

ALTER TABLE [ordem_de_servico] ADD FOREIGN KEY ([veiculo_id]) REFERENCES [veiculos] ([id])
GO