CREATE PROCEDURE [dbo].[Uzytkownik_PobierzUzytkownika]
(
	@Login	nvarchar(256)
)

AS

BEGIN 


	SELECT
		Uzytkownik.Imie,
		Uzytkownik.Nazwisko,
		Uzytkownik.UzytkownikId,
		Uzytkownik.[Login]
	FROM
		Uzytkownik
	WHERE
		Uzytkownik.[Login] = @Login

END