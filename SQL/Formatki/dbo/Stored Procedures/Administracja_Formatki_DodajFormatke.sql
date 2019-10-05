CREATE PROCEDURE [dbo].[Administracja_Formatki_DodajFormatke]
	@FormatkaKod	varchar(5),
	@Nazwa			nvarchar(50),
	@Opis			nvarchar(500),
	@FormatkaKodOld	varchar(5) = null

AS
	
	if (@FormatkaKodOld is null) 
	BEGIN

		INSERT INTO Formatka VALUES (@FormatkaKod, @Nazwa, @Opis)

		SELECT @@ROWCOUNT

	END
	ELSE
	BEGIN

		UPDATE
			Formatka
		SET
			FormatkaKod = @FormatkaKod,
			Nazwa = @Nazwa,
			Opis = @Opis
		WHERE
			FormatkaKod = @FormatkaKodOld

			SELECT @@ROWCOUNT

	END