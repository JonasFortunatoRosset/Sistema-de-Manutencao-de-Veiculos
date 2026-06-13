CREATE TABLE [veiculos] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [placa] char(7) UNIQUE NOT NULL,
  [ano] smallint NOT NULL,
  [tp_combustivel] nvarchar(255) NOT NULL CHECK (tp_combustivel in ('diesel','gasolina','elétrico','híbrido')),
  [cliente_id] integer NOT NULL,
  [tipo_veiculo_id] tinyint NOT NULL,
  [marca_veiculo_id] tinyint,
  [modelo_veiculo_id] smallint
)
GO

ALTER TABLE [veiculos] ADD FOREIGN KEY ([tipo_veiculo_id]) REFERENCES [tipo_veiculo] ([id])
GO

ALTER TABLE [veiculos] ADD FOREIGN KEY ([modelo_veiculo_id]) REFERENCES [modelo_veiculo] ([id])
GO

ALTER TABLE [veiculos] ADD FOREIGN KEY ([marca_veiculo_id]) REFERENCES [marca_veiculo] ([id])
GO

ALTER TABLE [veiculos] ADD FOREIGN KEY ([cliente_id]) REFERENCES [clientes] ([id])
GO