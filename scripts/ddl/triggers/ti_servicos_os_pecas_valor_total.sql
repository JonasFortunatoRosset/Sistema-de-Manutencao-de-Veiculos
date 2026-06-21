CREATE OR ALTER TRIGGER ti_servicos_os_pecas_valor_total ON servicos_os_pecas INSTEAD OF INSERT AS
BEGIN
	DECLARE @preco numeric (14,2);
	DECLARE @servicos_os_pecas TABLE 
		(
		quantidade smallint,
		preco_venda numeric(14,2),
		servicos_os_id integer,
		pecas_id integer
		);

	BEGIN TRY
		BEGIN TRAN;

			INSERT INTO @servicos_os_pecas(quantidade, preco_venda, servicos_os_id, pecas_id)
			SELECT i.quantidade, p.preco, i.servicos_os_id, i.pecas_id
			FROM inserted i INNER JOIN pecas p ON p.id = i.pecas_id;

			-- Executa o insert com o valor correto para preco_servico
			INSERT INTO servicos_os_pecas(quantidade, preco_venda, servicos_os_id, pecas_id) 
			SELECT quantidade, preco_venda, servicos_os_id, pecas_id FROM @servicos_os_pecas;

			UPDATE os
            SET os.valor_total = ISNULL(os.valor_total, 0) + tabela_soma.total_novas_pecas
            FROM ordem_de_servico os
            INNER JOIN (
                -- Agrupa e soma multiplicando quantidade * preço, mapeando até a Ordem de Serviço
                SELECT 
                    s_os.ordem_de_servico_id, 
                    SUM(tmp.preco_venda * tmp.quantidade) AS total_novas_pecas
                FROM @servicos_os_pecas tmp
                INNER JOIN servicos_os s_os ON s_os.id = tmp.servicos_os_id
                GROUP BY s_os.ordem_de_servico_id
            ) tabela_soma ON os.id = tabela_soma.ordem_de_servico_id;

		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
            ROLLBACK TRAN;
		THROW 50000, 'Ocorreu um erro', 1
	END CATCH
END
GO