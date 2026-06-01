CREATE TABLE [veiculos] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [placa] nvarchar(255) UNIQUE NOT NULL,
  [tp_veiculo] nvarchar(255) NOT NULL CHECK (tp_veiculo in ('carro','moto')),
  [marca] nvarchar(255) NOT NULL,
  [modelo] nvarchar(255) NOT NULL,
  [ano] smallint NOT NULL,
  [tp_combustivel] nvarchar(255) NOT NULL CHECK (tp_combustivel in ('diesel','gasolina','elétrico','híbrido')),
  [cliente_id] integer NOT NULL
)
GO

ALTER TABLE [veiculos] ADD FOREIGN KEY ([cliente_id]) REFERENCES [clientes] ([id])
GO