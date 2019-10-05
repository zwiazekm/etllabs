CREATE PROCEDURE [stat].[DziennikCzas]
	@Id BIGINT,
	@Info VARCHAR(1900) = NULL
AS

	IF @Info IS NULL
		UPDATE stat.Dziennik
		SET CzasWykonaniaMs = DATEDIFF(ms, Data, getdate())
		WHERE Id = @Id;
	ELSE
		UPDATE stat.Dziennik
		SET CzasWykonaniaMs = DATEDIFF(ms, Data, getdate())
			,Informacja = @Info
		WHERE Id = @Id;

RETURN 0