CREATE PROCEDURE [a2].[DziennikCzas]
	@Id BIGINT,
	@Info VARCHAR(1900) = NULL
AS

	IF @Info IS NULL
		UPDATE a2.Dziennik
		SET CzasWykonaniaMs = DATEDIFF(ms, Data, getdate())
		WHERE Id = @Id;
	ELSE
		UPDATE a2.Dziennik
		SET CzasWykonaniaMs = DATEDIFF(ms, Data, getdate())
			,Informacja = @Info
		WHERE Id = @Id;

RETURN 0