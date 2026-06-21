CREATE OR ALTER FUNCTION fn_calc_quantd_os_colaborador(@dt_inicio date, @dt_fim date, @colaborador_id smallint) RETURNS INT AS
BEGIN
	DECLARE @contagem INT; -- Armazena a quantidade de ordens de servico concluidas no periodo estipulado

    -- Validacao
	SELECT @contagem = COUNT(c_os.colaboradores_id) FROM colaboradores_os c_os
	INNER JOIN ordem_de_servico os ON os.id = c_os.ordem_de_servico_id
	WHERE c_os.colaboradores_id = @colaborador_id
	AND CAST(os.dt_inicio AS DATE) >= @dt_inicio
	AND CAST(os.dt_fim AS DATE) <= @dt_fim 

    -- Retorno do resultado
	RETURN @contagem;
END
GO