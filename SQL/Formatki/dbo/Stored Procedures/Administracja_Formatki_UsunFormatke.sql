CREATE PROCEDURE [dbo].[Administracja_Formatki_UsunFormatke]
	@FormatkaKod	varchar(5)
AS
	DELETE FROM
		Formatka
	WHERE
		FormatkaKod = @FormatkaKod

	select @@ERROR