CREATE TABLE [servicos] (
  [id] tinyint PRIMARY KEY IDENTITY(1, 1),
  [nome] varchar(100) UNIQUE NOT NULL
)
GO