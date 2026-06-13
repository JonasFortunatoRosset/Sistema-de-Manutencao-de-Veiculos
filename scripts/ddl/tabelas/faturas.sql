CREATE TABLE [faturas] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [ordem_de_servico_id] int NOT NULL,
  [tipo_de_pagamento_id] tinyint NOT NULL
)
GO