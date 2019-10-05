CREATE PROCEDURE [dbo].[Formularze_StatusyFormularza]

AS
	
	SELECT
		FormatkaStatus.StatusKod,
		FormatkaStatus.NazwaStatusu
	FROM
		FormatkaStatus 
	ORDER BY
		FormatkaStatus.LP