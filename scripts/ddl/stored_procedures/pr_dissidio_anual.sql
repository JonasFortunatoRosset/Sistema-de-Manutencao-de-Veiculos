CREATE OR ALTER PROCEDURE pr_dissidio_anual(@percentual NUMERIC(38,18)) AS
BEGIN
	if @percentual >= 1 AND @percentual <= 100
	BEGIN
		DECLARE @id SMALLINT, @salario NUMERIC(14,2)

		DECLARE cursor_colaboradores CURSOR LOCAL FOR
		SELECT id, salario FROM colaboradores

		OPEN cursor_colaboradores

		FETCH NEXT FROM cursor_colaboradores INTO @id, @salario

		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @salario += @salario * (@percentual/100)

			UPDATE colaboradores SET salario = @salario WHERE id = @id

			FETCH NEXT FROM cursor_colaboradores INTO @id, @salario
		END
	END
	ELSE
		RAISERROR ('São aceitos apenas valores de 1 a 100!',16,1)
END