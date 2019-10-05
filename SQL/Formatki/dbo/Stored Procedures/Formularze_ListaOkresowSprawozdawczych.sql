CREATE PROCEDURE [dbo].[Formularze_ListaOkresowSprawozdawczych]
(
	@KodFormularza	varchar(5)
)
AS

BEGIN

	SELECT
		OkresSprawozdawczy.ID,
		OkresSprawozdawczy.Kwartal,
		OkresSprawozdawczy.Miesiac,
		OkresSprawozdawczy.Rok
	FROM
		OkresSprawozdawczy
	WHERE
		OkresSprawozdawczy.Aktywny <> 0 
		AND OkresSprawozdawczy.FormatkaKod = @KodFormularza
		
END