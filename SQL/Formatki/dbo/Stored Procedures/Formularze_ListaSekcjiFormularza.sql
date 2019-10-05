CREATE PROCEDURE [dbo].[Formularze_ListaSekcjiFormularza]
(
	@KodFormularza			varchar(5),
	@LoginUzytkownika		nvarchar(250)
)
AS
	
	BEGIN

		SELECT
			FormatkaSekcje.LP,
			FormatkaSekcje.Nazwa,
			FormatkaSekcje.SekcjaId,
			FormatkaSekcje.SekcjaKod,
			FormatkaUprawnienia.Uprawnienia,
			Uzytkownik.Imie,
			Uzytkownik.Nazwisko
		FROM	
			FormatkaSekcje 
				INNER JOIN FormatkaUprawnienia ON FormatkaSekcje.SekcjaId = FormatkaUprawnienia.SekcjaId
				INNER JOIN UzytkownikWRoli ON FormatkaUprawnienia.RolaUzytkownikaId = UzytkownikWRoli.RolaUzytkownikaId
				INNER JOIN Uzytkownik ON Uzytkownik.UzytkownikId = UzytkownikWRoli.UzytkownikId 
		WHERE
			Uzytkownik.[Login] = @LoginUzytkownika 
			AND FormatkaSekcje.FormatkaKod = @KodFormularza

	END