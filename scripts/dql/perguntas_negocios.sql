-- Pergunta 1: Margem de lucro líquida por funcionário com data definida por escopo de pesquisa
BEGIN
	DECLARE @dt_inicio DATE;
	DECLARE @dt_fim DATE;

	SET @dt_inicio = '2024-01-01';
	SET @dt_fim = '2026-01-31';

	
WITH calcular_os AS (
		SELECT c.id, c.nome as 'nome colaborador', c.dt_cadastro, dbo.fn_calc_quantd_os_colaborador(@dt_inicio, @dt_fim, c.id) as 'os fechadas', car.nome as cargo, c.salario
		FROM colaboradores c
		LEFT JOIN cargos car ON car.id = c.cargo_id
		WHERE @dt_fim >= CAST(c.dt_cadastro AS DATE)
		AND dt_demissao IS NULL
	),
	particiona_por_cargo AS
	(
	SELECT id, [nome colaborador], dt_cadastro, cargo, salario, [os fechadas], dbo.fn_calc_valor_liquido(@dt_inicio, @dt_fim, id) as 'lucro liquido'
	FROM calcular_os
	) SELECT * FROM particiona_por_cargo
END
GO

-- Pergunta 4: OS abertas por mês em 2025 (ranking + comparação ao mês anterior)

WITH os_por_mes AS (
    SELECT 
        MONTH(dt_inicio) AS mes,
        COUNT(*) AS total_os
    FROM ordem_de_servico
    WHERE YEAR(dt_inicio) = 2025
    GROUP BY MONTH(dt_inicio)
)
SELECT 
    mes,
    total_os,
    RANK() OVER (ORDER BY total_os DESC) AS posicao_ranking,
    LAG(total_os) OVER (ORDER BY mes) AS total_mes_anterior,
    total_os - LAG(total_os) OVER (ORDER BY mes) AS variacao
FROM os_por_mes
ORDER BY mes
GO

--Pergunta 5: Veículo com mais OS, com nome do cliente e ranking

WITH os_por_veiculo AS (
    SELECT 
        v.id AS veiculo_id,
        v.placa,
        c.nome AS cliente_nome,
        COUNT(os.id) AS total_os
    FROM veiculos v
    INNER JOIN clientes c ON v.cliente_id = c.id
    INNER JOIN ordem_de_servico os ON os.veiculo_id = v.id
    GROUP BY v.id, v.placa, c.nome
)
SELECT 
    placa,
    cliente_nome,
    total_os,
    RANK() OVER (ORDER BY total_os DESC) AS posicao_ranking
FROM os_por_veiculo
ORDER BY posicao_ranking
GO