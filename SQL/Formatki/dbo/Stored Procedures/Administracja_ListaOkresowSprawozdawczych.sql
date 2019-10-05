CREATE PROCEDURE [dbo].[Administracja_ListaOkresowSprawozdawczych]

AS

BEGIN

	SELECT
		OkresSprawozdawczy.ID,
		OkresSprawozdawczy.Kwartal,
		OkresSprawozdawczy.Miesiac,
		OkresSprawozdawczy.Rok,
		OkresSprawozdawczy.Aktywny,
		OkresSprawozdawczy.FormatkaKod
	FROM
		OkresSprawozdawczy
	
		
END