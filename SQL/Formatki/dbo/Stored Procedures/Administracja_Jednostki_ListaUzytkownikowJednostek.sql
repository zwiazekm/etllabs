CREATE PROCEDURE [dbo].[Administracja_Jednostki_ListaUzytkownikowJednostek]
AS

SELECT 
	V.JednostkaId,
	V.KodPocztowy,
	V.KodUrzedu,
	V.KodUrzeduNadrzedny,
	V.Kraj,
	V.Miejscowosc,
	V.NazwaKrotka,
	V.NazwaPelna,
	V.NazwaWyswietlana,
	Uzytkownik.Imie,
	Uzytkownik.Nazwisko,
	Uzytkownik.Login,
	Uzytkownik.UzytkownikId
	FROM dbo.vStrukturaOrganizacyjna as V
	INNER JOIN UzytkownikJednostka ON UzytkownikJednostka.JednostkaOrgId = V.JednostkaId
	INNER JOIN Uzytkownik ON Uzytkownik.UzytkownikId = UzytkownikJednostka.UzytkownikId