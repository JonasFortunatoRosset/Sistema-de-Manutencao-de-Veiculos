-- calcula o lucro liquido gerado pelo funcionario

CREATE OR ALTER FUNCTION fn_calc_valor_liquido(@dt_inicio DATE, @dt_fim DATE, @colaborador_id INT) RETURNS NUMERIC(14,2) AS
BEGIN
	DECLARE @valor_total numeric(14,2);
	DECLARE @salario numeric(14,2);
	DECLARE @mes INT;

	SET @mes = DATEDIFF(MONTH, @dt_inicio, @dt_fim) + 1;

	SELECT @valor_total = SUM(os.valor_total) FROM ordem_de_servico os 
	INNER JOIN colaboradores_os c_os ON c_os.ordem_de_servico_id = os.id
	WHERE c_os.colaboradores_id = @colaborador_id
	AND os.dt_fim BETWEEN @dt_inicio AND @dt_fim;

	SELECT @salario = salario FROM colaboradores c WHERE c.id = @colaborador_id;

	RETURN ISNULL(@valor_total, 0) - (ISNULL(@salario, 0) * @mes);
END
GO
