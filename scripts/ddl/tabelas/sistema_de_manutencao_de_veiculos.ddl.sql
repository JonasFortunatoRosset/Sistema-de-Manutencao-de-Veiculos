CREATE DATABASE sistema_de_manutencao_de_veiculos
GO

USING sistema_de_manutencao_de_veiculos
GO

CREATE TABLE [faturas] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [ordem_de_servico_id] int NOT NULL,
  [tipo_de_pagamento_id] tinyint NOT NULL
)
GO

CREATE TABLE [tipos_de_pagamento] (
  [id] tinyint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) NOT NULL
)
GO

CREATE TABLE [clientes] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [cpf] char(11) UNIQUE NOT NULL,
  [nome] varchar(100) UNIQUE NOT NULL,
  [telefone] varchar(15) NOT NULL,
  [email] varchar(254) NOT NULL,
  [estado] char(2) NOT NULL,
  [cidade] varchar(50) NOT NULL,
  [rua] varchar(60) NOT NULL,
  [numero] varchar(10) NOT NULL,
  [cep] char(9) NOT NULL
)
GO

CREATE TABLE [colaboradores_os] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [colaboradores_id] smallint NOT NULL,
  [ordem_de_servico_id] integer NOT NULL
)
GO

CREATE TABLE [colaboradores] (
  [id] smallint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) NOT NULL,
  [cpf] char(11) UNIQUE NOT NULL,
  [estado] char(2) NOT NULL,
  [cidade] varchar(50) NOT NULL,
  [rua] varchar(60) NOT NULL,
  [numero] varchar(10) NOT NULL,
  [cep] char(9) NOT NULL,
  [complemento] varchar(50),
  [salario] numeric(14,2) NOT NULL,
  [status] tinyint NOT NULL,
  [dt_cadastro] datetime2(2) NOT NULL,
  [dt_demissao] datetime2(2),
  [cargo_id] tinyint NOT NULL
)
GO

CREATE TABLE [itens_inventario] (
  [id] smallint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) NOT NULL,
  [descricao] varchar(255) NOT NULL,
  [status] bit NOT NULL,
  [dt_compra] date NOT NULL,
  [dt_baixa] date
)
GO

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

CREATE TABLE [pecas] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) NOT NULL,
  [preco] numeric(14,2),
  [quantidade] smallint NOT NULL,
  [dt_compra] date
)
GO

CREATE TABLE [servicos_os_pecas] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [quantidade] smallint NOT NULL,
  [preco_venda] numeric(14,2) NOT NULL,
  [servicos_os_id] integer NOT NULL,
  [pecas_id] integer NOT NULL
)
GO

CREATE TABLE [servicos_os] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [descricao] varchar(255) NOT NULL,
  [preco_servico] numeric(14,2) NOT NULL,
  [servicos_id] tinyint NOT NULL,
  [ordem_de_servico_id] integer NOT NULL
)
GO

CREATE TABLE [servicos] (
  [id] tinyint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) UNIQUE NOT NULL,
  [preco] numeric(14,2) NOT NULL
)
GO

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

CREATE TABLE [cargos] (
  [id] tinyint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) NOT NULL
)
GO

CREATE TABLE [tipo_veiculo] (
  [id] tinyint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(50) NOT NULL
)
GO

CREATE TABLE [marca_veiculo] (
  [id] tinyint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(50) NOT NULL
)
GO

CREATE TABLE [modelo_veiculo] (
  [id] smallint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(50) NOT NULL
)
GO

ALTER TABLE [faturas] ADD FOREIGN KEY ([ordem_de_servico_id]) REFERENCES [ordem_de_servico] ([id])
GO

ALTER TABLE [faturas] ADD FOREIGN KEY ([tipo_de_pagamento_id]) REFERENCES [tipos_de_pagamento] ([id])
GO

ALTER TABLE [colaboradores] ADD FOREIGN KEY ([cargo_id]) REFERENCES [cargos] ([id])
GO

ALTER TABLE [veiculos] ADD FOREIGN KEY ([tipo_veiculo_id]) REFERENCES [tipo_veiculo] ([id])
GO

ALTER TABLE [veiculos] ADD FOREIGN KEY ([modelo_veiculo_id]) REFERENCES [modelo_veiculo] ([id])
GO

ALTER TABLE [veiculos] ADD FOREIGN KEY ([marca_veiculo_id]) REFERENCES [marca_veiculo] ([id])
GO

ALTER TABLE [veiculos] ADD FOREIGN KEY ([cliente_id]) REFERENCES [clientes] ([id])
GO

ALTER TABLE [servicos_os] ADD FOREIGN KEY ([ordem_de_servico_id]) REFERENCES [ordem_de_servico] ([id])
GO

ALTER TABLE [servicos_os] ADD FOREIGN KEY ([servicos_id]) REFERENCES [servicos] ([id])
GO

ALTER TABLE [servicos_os_pecas] ADD FOREIGN KEY ([servicos_os_id]) REFERENCES [servicos_os] ([id])
GO

ALTER TABLE [servicos_os_pecas] ADD FOREIGN KEY ([pecas_id]) REFERENCES [pecas] ([id])
GO

ALTER TABLE [ordem_de_servico] ADD FOREIGN KEY ([veiculo_id]) REFERENCES [veiculos] ([id])
GO

ALTER TABLE [colaboradores_os] ADD FOREIGN KEY ([ordem_de_servico_id]) REFERENCES [ordem_de_servico] ([id])
GO

ALTER TABLE [colaboradores_os] ADD FOREIGN KEY ([colaboradores_id]) REFERENCES [colaboradores] ([id])
GO
