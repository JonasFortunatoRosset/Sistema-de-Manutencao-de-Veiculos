CREATE TABLE [veiculos] (
  [id] integer PRIMARY KEY,
  [placa] nvarchar(255),
  [tp_veiculo] nvarchar(255) CHECK (tp_veiculo in ('carro','moto')),
  [marca] nvarchar(255),
  [modelo] nvarchar(255),
  [ano] smallint,
  [tp_combustivel] nvarchar(255) CHECK (tp_combustivel in ('diesel','gasolina','elétrico','híbrido')),
  [cliente_id] integer
)
GO

ALTER TABLE [veiculos] ADD FOREIGN KEY ([cliente_id]) REFERENCES [clientes] ([id])
GO