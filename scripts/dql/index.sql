-- 1. Índice para otimizar os filtros de data (WHERE dt_inicio...)
CREATE NONCLUSTERED INDEX IX_ordem_de_servico_dt_inicio 
ON ordem_de_servico (dt_inicio);
GO

-- 2. Índice para otimizar o JOIN entre ordem_de_servico e veiculos
CREATE NONCLUSTERED INDEX IX_ordem_de_servico_veiculo_id 
ON ordem_de_servico (veiculo_id);
GO

-- 3. Índice para otimizar o JOIN entre veiculos e clientes
CREATE NONCLUSTERED INDEX IX_veiculos_cliente_id 
ON veiculos (cliente_id);
GO