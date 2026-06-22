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

-- Pergunta 4: Desempenho Mensal de Abertura de OS
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

-- Pergunta 5: Ranking de Clientes e Veículos por Volume de OS
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