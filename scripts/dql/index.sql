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

--4. Índice para acelerar o JOIN com veículos e entregar as datas já ordenadas para a função LEAD.

CREATE NONCLUSTERED INDEX IX_ordem_de_servico_veiculo_datas
ON ordem_de_servico (veiculo_id, dt_inicio DESC);
GO

--5. Índice para otimizar o JOIN entre clientes e veículos e trazer o modelo.

CREATE NONCLUSTERED INDEX IX_veiculos_cliente_modelo
ON veiculos (cliente_id)
INCLUDE (modelo_veiculo_id);
GO

--6. Índice para acelerar o JOIN entre as tabelas servicos_os e servicos e trazer o preço.

CREATE NONCLUSTERED INDEX IX_servicos_os_servicos_preco
ON servicos_os (servicos_id)
INCLUDE (preco_servico);
GO

-- 7. Índice para acelerar a filtragem inicial de colaboradores ativos e escopo de tempo de cadastro 

CREATE NONCLUSTERED INDEX IX_colaboradores_demissao_cadastro
ON colaboradores (dt_demissao, dt_cadastro);
GO

-- 8. Índice para acelerar o JOIN entre a tabela de colaboradores e a tabela de cargos.

CREATE NONCLUSTERED INDEX IX_colaboradores_cargo_id
ON colaboradores (cargo_id);
GO

-- 9. Otimiza a busca pelo nome do cargo e cobre o JOIN com colaboradores

CREATE NONCLUSTERED INDEX IX_cargos_nome_id
ON cargos (nome)
INCLUDE (id);
GO

-- 10. Otimiza o filtro de colaboradores ativos, data de cadastro e o JOIN com o cargo

CREATE NONCLUSTERED INDEX IX_colaboradores_performance
ON colaboradores (cargo_id, dt_demissao, dt_cadastro)
INCLUDE (nome, salario); -- Inclui salario porque a funcao fn_calc_valor_liquido usa ele
GO