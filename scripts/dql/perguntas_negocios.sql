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

-- Pergunta 2: Gere um relatorio com filtro por cargo e determinado escopo de tempo a 
-- quantidade de OS fechadas por colaborador e o lucro líquido obtido com ele no período

BEGIN
	DECLARE @dt_inicio DATE;
	DECLARE @dt_fim DATE;
	DECLARE @cargo_filtro VARCHAR(100);

	SET @dt_inicio = '2024-01-01';
	SET @dt_fim = '2026-01-31';
	SET @cargo_filtro = 'Mecânico Sênior';

	WITH metricas_colaborador AS (
		-- Filtra o cargo e calcula a quantidade de OS e o Lucro Líquido
		SELECT 
			c.id,
			c.nome AS [nome colaborador],
			car.nome AS cargo,
			dbo.fn_calc_quantd_os_colaborador(@dt_inicio, @dt_fim, c.id) AS [os fechadas],
			dbo.fn_calc_valor_liquido(@dt_inicio, @dt_fim, c.id) AS [lucro liquido]
		FROM colaboradores c
		INNER JOIN cargos car ON car.id = c.cargo_id
		WHERE car.nome = @cargo_filtro
		  AND c.dt_demissao IS NULL
		  AND CAST(c.dt_cadastro AS DATE) <= @dt_fim
	),
	rankeamento_performance AS (
		-- Cria o ranking baseado no lucro líquido gerado dentro do grupo selecionado
		SELECT 
			id,
			[nome colaborador],
			cargo,
			[os fechadas],
			[lucro liquido],
			DENSE_RANK() OVER (ORDER BY [lucro liquido] DESC) AS [posicao ranking]
		FROM metricas_colaborador
	)
	-- Retorna o resultado final ordenado pelos melhores resultados do cargo
	SELECT 
		[posicao ranking],
		[nome colaborador],
		cargo,
		[os fechadas],
		[lucro liquido]
	FROM rankeamento_performance
	ORDER BY [posicao ranking] ASC;
END
GO

-- Pergunta 3: Desempenho Mensal de Abertura de OS
BEGIN
    DECLARE @ano_referencia INT;
    SET @ano_referencia = 2025;


    WITH os_por_mes AS (
        SELECT 
            MONTH(dt_inicio) AS mes,
            COUNT(*) AS total_os
        FROM ordem_de_servico
        WHERE YEAR(dt_inicio) = @ano_referencia
        GROUP BY MONTH(dt_inicio)
    ),
    analise_crescimento AS (
        SELECT 
            mes AS 'Mês de Referência',
            total_os AS 'Total de OS Abertas',
            ISNULL(LAG(total_os) OVER (ORDER BY mes), 0) AS 'OS Mês Anterior',
            ISNULL(total_os - LAG(total_os) OVER (ORDER BY mes), 0) AS 'Variação (Crescimento/Queda)',
            RANK() OVER (ORDER BY total_os DESC) AS 'Ranking no Ano'
        FROM os_por_mes
    )
    

    SELECT * FROM analise_crescimento
    ORDER BY [Mês de Referência];
END
GO

-- Pergunta 4: Ranking de Clientes e Veículos por Volume de OS
BEGIN

    DECLARE @dt_inicio DATE;
    DECLARE @dt_fim DATE;

    SET @dt_inicio = '2025-01-01';
    SET @dt_fim = '2025-12-31';

    WITH os_por_veiculo AS (
        SELECT 
            c.nome AS cliente_nome,
            v.placa AS placa_veiculo,
            COUNT(os.id) AS total_os
        FROM veiculos v
        INNER JOIN clientes c ON v.cliente_id = c.id
        INNER JOIN ordem_de_servico os ON os.veiculo_id = v.id
        WHERE os.dt_inicio BETWEEN @dt_inicio AND @dt_fim
        GROUP BY v.id, v.placa, c.nome
    ),
    relatorio_final AS (
        SELECT 
            cliente_nome AS 'Nome do Cliente',
            placa_veiculo AS 'Placa do Veículo',
            total_os AS 'Volume de Serviços (OS)',
            RANK() OVER (ORDER BY total_os DESC) AS 'Posição no Ranking Geral'
        FROM os_por_veiculo
    )
    

    SELECT * FROM relatorio_final
    ORDER BY [Posição no Ranking Geral];
END
GO

--Pergunta 5: Analise de recorrências 
--Intervalos em dias dos serviços prestados para cada veiculo de cada cliente. 


WITH cliente_veiculo_ordem AS (
    SELECT 
        clientes.nome AS nome_cliente, 
        modelo_veiculo.nome AS modelo_veiculo, 
        clientes.id AS cli_id, 
        veiculos.id AS vei_id, 
        ordem_de_servico.dt_inicio,
        LEAD(dt_inicio, 1, NULL) OVER (
            PARTITION BY clientes.id, veiculos.id 
            ORDER BY ordem_de_servico.dt_inicio DESC
        ) AS dt_anterior
    FROM clientes 
    INNER JOIN veiculos ON clientes.id = veiculos.cliente_id
    INNER JOIN ordem_de_servico ON veiculos.id = ordem_de_servico.veiculo_id
    INNER JOIN modelo_veiculo ON veiculos.modelo_veiculo_id = modelo_veiculo.id
	)
	SELECT cli_id, nome_cliente, modelo_veiculo,dt_inicio,dt_anterior, DATEDIFF(day, dt_anterior, dt_inicio) AS contagem_dias
from cliente_veiculo_ordem
ORDER BY nome_cliente, modelo_veiculo;
GO

--Pergunta 6: Faturamento dos serviços
--Quanto cada serviço faturou e a porcentagem dele no faturamento total da oficina

WITH preco_somado AS (
    SELECT 
        s.nome AS nome_servico,
        SUM(so.preco_servico) AS faturamento_do_servico 
    FROM servicos s
    INNER JOIN servicos_os so ON s.id = so.servicos_id
    GROUP BY s.id, s.nome
), 
faturamento_calculado AS (
    SELECT 
        nome_servico,
        faturamento_do_servico,
        SUM(faturamento_do_servico) OVER() AS faturamento_total_oficina
    FROM preco_somado
)
SELECT 
    nome_servico,
    faturamento_do_servico,
    faturamento_total_oficina,
    ROUND((faturamento_do_servico / faturamento_total_oficina) * 100, 2) AS porcentagem_do_total
FROM faturamento_calculado
ORDER BY faturamento_do_servico DESC;
GO 
