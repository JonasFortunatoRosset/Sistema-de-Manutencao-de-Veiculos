-- Pergunta 4 — OS abertas por mês em 2025 (ranking + comparação ao mês anterior)

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

--Pergunta 5 — Veículo com mais OS, com nome do cliente e ranking

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