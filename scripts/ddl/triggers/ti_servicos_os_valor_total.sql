-- trigger
CREATE OR ALTER TRIGGER ti_servicos_os_valor_total ON servicos_os INSTEAD OF INSERT AS
BEGIN
	DECLARE @preco numeric (14,2);
	DECLARE @servicos_os TABLE 
		(
		descricao varchar(255),
		preco_servico numeric(14,2),
		servicos_id tinyint,
		ordem_de_servico_id integer
		);

	BEGIN TRY
		BEGIN TRAN;
			-- Popula a tabela variavel com base na tabela inserted
			INSERT INTO @servicos_os(descricao, preco_servico, servicos_id, ordem_de_servico_id)
			SELECT i.descricao, s.preco, i.servicos_id, i.ordem_de_servico_id
			FROM inserted i INNER JOIN servicos s ON s.id = i.servicos_id;

			-- Executa o insert com o valor correto para preco_servico
			INSERT INTO servicos_os(descricao, preco_servico, servicos_id, ordem_de_servico_id) 
			SELECT descricao, preco_servico, servicos_id, ordem_de_servico_id FROM @servicos_os;

			-- Atualiza o valor total da ordem de servico
			UPDATE os
            SET os.valor_total = ISNULL(os.valor_total, 0) + tabela_soma.total_novos_servicos
            FROM ordem_de_servico os
            INNER JOIN (
                -- Agrupa e soma os preços por OS para o caso de varias insercoes
                SELECT ordem_de_servico_id, SUM(preco_servico) AS total_novos_servicos
                FROM @servicos_os
                GROUP BY ordem_de_servico_id
            ) tabela_soma ON os.id = tabela_soma.ordem_de_servico_id;

		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		-- Valida se houve algum erro e executa um ROLLBACK
		IF @@TRANCOUNT > 0
            ROLLBACK TRAN;
		THROW 50000, 'Ocorreu um erro', 1
	END CATCH
END
GO