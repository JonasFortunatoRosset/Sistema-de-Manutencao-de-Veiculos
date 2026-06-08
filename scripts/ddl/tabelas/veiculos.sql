CREATE TABLE [veiculos] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [placa] char(7) UNIQUE NOT NULL,
  [tp_veiculo] varchar(5) CHECK (tp_veiculo in ('carro','moto')) NOT NULL,
  [marca] varchar(45) NOT NULL,
  [modelo] varchar(60) NOT NULL,
  [ano] smallint NOT NULL,
  [tp_combustivel] nvarchar(255) CHECK (tp_combustivel in ('diesel','gasolina','elétrico','híbrido')) NOT NULL,
  [cliente_id] integer NOT NULL
)
GO

ALTER TABLE [veiculos] ADD FOREIGN KEY ([cliente_id]) REFERENCES [clientes] ([id])
GO