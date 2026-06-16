CREATE TABLE [faturas] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [ordem_de_servico_id] int NOT NULL,
  [tipo_de_pagamento_id] tinyint NOT NULL
)
GO

ALTER TABLE [faturas] ADD FOREIGN KEY ([ordem_de_servico_id]) REFERENCES [ordem_de_servico] ([id])
GO

ALTER TABLE [faturas] ADD FOREIGN KEY ([tipo_de_pagamento_id]) REFERENCES [tipos_de_pagamento] ([id])
GO