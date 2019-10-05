
CREATE PROCEDURE [dbo].[Formularze_UprawnieniaDoFormularza]
(	
	@LoginUzytkownika	nvarchar(250),
	@KodFormularza		nvarchar(5),
	@Wersja				int = null,
	@ID					int = null
)
	
AS
	
		SELECT
			FormatkaUprawnienia.Uprawnienia
		FROM	
			 
			FormatkaUprawnienia 
				INNER JOIN UzytkownikWRoli ON FormatkaUprawnienia.RolaUzytkownikaId = UzytkownikWRoli.RolaUzytkownikaId
				INNER JOIN Uzytkownik ON Uzytkownik.UzytkownikId = UzytkownikWRoli.UzytkownikId 
		WHERE
			Uzytkownik.[Login] = @LoginUzytkownika 
			AND FormatkaUprawnienia.FormatkaKod = @KodFormularza


RETURN 0