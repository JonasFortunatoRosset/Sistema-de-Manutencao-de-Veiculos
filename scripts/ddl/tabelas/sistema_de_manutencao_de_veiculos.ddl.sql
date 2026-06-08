CREATE DATABASE sistema_de_manutencao_de_veiculos
GO
USE sistema_de_manutencao_de_veiculos
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
  [funcao] varchar(50) NOT NULL,
  [estado] char(2) NOT NULL,
  [cidade] varchar(50) NOT NULL,
  [rua] varchar(60) NOT NULL,
  [numero] varchar(10) NOT NULL,
  [cep] char(9) NOT NULL,
  [complemento] varchar(50),
  [status] tinyint NOT NULL,
  [dt_cadastro] datetime2(2)  DEFAULT (SYSDATETIME()) NOT NULL,
  [dt_demissao] datetime2(2) NULL
)
GO
CREATE TABLE [fornecedores] (
  [id] tinyint PRIMARY KEY IDENTITY(1, 1),
  [cnpj] char(14) UNIQUE NOT NULL,
  [nome] varchar(100) UNIQUE NOT NULL,
  [estado] char(2) NOT NULL,
  [cidade] varchar(50) NOT NULL,
  [rua] varchar(60) NOT NULL,
  [numero] varchar(10) NOT NULL,
  [cep] char(9) NOT NULL,
  [complemento] varchar(50) NOT NULL,
  [dt_cadastro] datetime2(2) DEFAULT (SYSDATETIME()) NOT NULL,
  [status] tinyint NOT NULL
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
  [dt_inicio] date NOT NULL,
  [dt_fim] date,
  [veiculo_id] integer NOT NULL
)
GO
CREATE TABLE [pecas] (
  [id] integer PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) NOT NULL,
  [preco] numeric(14,2),
  [quantidade] smallint NOT NULL,
  [dt_compra] date,
  [fornecedores_id] tinyint
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
  [preco] numeric(14,2) NOT NULL,
  [servicos_id] tinyint NOT NULL,
  [ordem_de_servico_id] integer NOT NULL
)
GO
CREATE TABLE [servicos] (
  [id] tinyint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) UNIQUE NOT NULL
)
GO
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

ALTER TABLE [servicos_os] ADD FOREIGN KEY ([ordem_de_servico_id]) REFERENCES [ordem_de_servico] ([id])
GO

ALTER TABLE [servicos_os] ADD FOREIGN KEY ([servicos_id]) REFERENCES [servicos] ([id])
GO

ALTER TABLE [servicos_os_pecas] ADD FOREIGN KEY ([servicos_os_id]) REFERENCES [servicos_os] ([id])
GO

ALTER TABLE [servicos_os_pecas] ADD FOREIGN KEY ([pecas_id]) REFERENCES [pecas] ([id])
GO


ALTER TABLE [pecas] ADD FOREIGN KEY ([fornecedores_id]) REFERENCES [fornecedores] ([id])
GO

ALTER TABLE [ordem_de_servico] ADD FOREIGN KEY ([veiculo_id]) REFERENCES [veiculos] ([id])
GO

ALTER TABLE [colaboradores_os] ADD FOREIGN KEY ([ordem_de_servico_id]) REFERENCES [ordem_de_servico] ([id])
GO

ALTER TABLE [colaboradores_os] ADD FOREIGN KEY ([colaboradores_id]) REFERENCES [colaboradores] ([id])
GO