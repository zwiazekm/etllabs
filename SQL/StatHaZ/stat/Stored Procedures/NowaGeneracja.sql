CREATE PROCEDURE [stat].[NowaGeneracja]
	@RokMcOd INT,
	@RokMcDo INT,
	@generacjaNr INT
AS
	
	DECLARE @GeneracjaId INT = @RokMcDo * 1000 + @generacjaNr;

	INSERT INTO stat.GeneracjaWersja (GeneracjaId, RokMcOd, RokMcDo)
	VALUES (@GeneracjaId, @RokMcOd, @RokMcDo);

RETURN @GeneracjaId