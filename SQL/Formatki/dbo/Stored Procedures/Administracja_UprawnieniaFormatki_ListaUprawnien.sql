CREATE PROCEDURE [dbo].[Administracja_UprawnieniaFormatki_ListaUprawnien]
(
	@KodFormularza			varchar(5)
)
AS
	
	BEGIN

		SELECT
			Id,
			FormatkaUprawnienia.FormatkaKod,
			null as SekcjaId,
			null as SekcjaKod,
			FormatkaUprawnienia.RolaUzytkownikaId,
			RolaUzytkownika.NazwaRoli,
			Uprawnienia
		FROM	
			FormatkaUprawnienia
			INNER JOIN RolaUzytkownika On RolaUzytkownika.RolaUzytkownikaId = FormatkaUprawnienia.RolaUzytkownikaId
		WHERE
			FormatkaUprawnienia.FormatkaKod = @KodFormularza

		UNION ALL

		SELECT
			Id,
			FormatkaUprawnienia.FormatkaKod,
			FormatkaSekcje.SekcjaId,
			FormatkaSekcje.SekcjaKod,
			FormatkaUprawnienia.RolaUzytkownikaId,
			RolaUzytkownika.NazwaRoli,
			Uprawnienia
		FROM	
			FormatkaUprawnienia
			LEFT JOIN FormatkaSekcje ON FormatkaSekcje.SekcjaId = FormatkaUprawnienia.SekcjaId
			INNER JOIN RolaUzytkownika On RolaUzytkownika.RolaUzytkownikaId = FormatkaUprawnienia.RolaUzytkownikaId
		WHERE
			FormatkaSekcje.FormatkaKod = @KodFormularza
		
			

	END