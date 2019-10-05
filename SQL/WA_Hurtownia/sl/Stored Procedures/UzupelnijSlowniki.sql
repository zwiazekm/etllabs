CREATE PROCEDURE [sl].[UzupelnijSlowniki]
AS

	IF NOT EXISTS (SELECT * FROM sl.RodzajPodmiotu) BEGIN
		INSERT INTO sl.RodzajPodmiotu (Kod, Nazwa)
		VALUES ('O', 'Odbiorca')
			, ('N', 'Nadawca')
			, ('S', 'Składający')
			, ('P', 'Przedstawiciel')
	END

	IF NOT EXISTS (SELECT * FROM sl.TakNie) BEGIN
		INSERT INTO sl.TakNie(Kod, OpisPL, OpisEN)
		VALUES (0, 'Nie', 'No')
			,  (1, 'Tak', 'Yes')
	END



RETURN 0