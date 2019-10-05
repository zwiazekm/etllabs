CREATE PROCEDURE [dbo].[Administracja_SekcjeFormatki_ListaSekcjiFormatki]
(
	@KodFormularza			varchar(5)
)
AS
	
	BEGIN

		SELECT
			FormatkaSekcje.LP,
			FormatkaSekcje.Nazwa,
			FormatkaSekcje.SekcjaId,
			FormatkaSekcje.SekcjaKod
		FROM	
			FormatkaSekcje 
		WHERE
			FormatkaSekcje.FormatkaKod = @KodFormularza
		ORDER BY
			LP ASC

	END