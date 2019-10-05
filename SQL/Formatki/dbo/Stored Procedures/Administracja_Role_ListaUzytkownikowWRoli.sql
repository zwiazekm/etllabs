CREATE PROCEDURE [dbo].[Administracja_Role_ListaUzytkownikowWRoli]
	
AS


SELECT 
	RolaUzytkownika.RolaUzytkownikaId,
	RolaUzytkownika.NazwaRoli,
	Uzytkownik.Imie,
	Uzytkownik.Nazwisko,
	Uzytkownik.Login,
	Uzytkownik.UzytkownikId
	FROM
		Uzytkownik 
			INNER JOIN UzytkownikWRoli on Uzytkownik.UzytkownikId = UzytkownikWRoli.UzytkownikId 
			INNER JOIN RolaUzytkownika on UzytkownikWRoli.RolaUzytkownikaId = RolaUzytkownika.RolaUzytkownikaId