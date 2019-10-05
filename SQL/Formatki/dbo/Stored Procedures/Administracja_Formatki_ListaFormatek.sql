CREATE PROCEDURE [dbo].[Administracja_Formatki_ListaFormatek]

AS
	SELECT 
		FormatkaKod,
		Nazwa,
		Opis
	FROM	
		Formatka

RETURN 0