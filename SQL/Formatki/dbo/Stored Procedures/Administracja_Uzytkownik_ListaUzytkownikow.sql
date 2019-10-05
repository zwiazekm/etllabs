CREATE PROCEDURE [dbo].[Administracja_Uzytkownik_ListaUzytkownikow]

AS

BEGIN 


	SELECT
		Uzytkownik.Imie,
		Uzytkownik.Nazwisko,
		Uzytkownik.UzytkownikId,
		Uzytkownik.[Login]
	FROM
		Uzytkownik
	

END