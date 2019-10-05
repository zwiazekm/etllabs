CREATE PROCEDURE [dbo].[Administracja_Role_ListaRol]

AS
	SELECT 
		RolaUzytkownika.RolaUzytkownikaId,
		RolaUzytkownika.NazwaRoli
	FROM	
		RolaUzytkownika