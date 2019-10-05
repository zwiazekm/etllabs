CREATE PROCEDURE [dbo].[Administracja_Formatki_DodajZmienOkresSprawozdawczy]
(
	@ID				int	= null,
	@FormatkaKod	varchar(5),
	@Rok			int,
	@Kwartal		int = null,
	@Miesiac		int = null,
	@Aktywny		bit
)
	
AS

BEGIN

	IF (@ID is null)
	BEGIN


		INSERT INTO OkresSprawozdawczy
			(
				FormatkaKod,
				Rok,
				Kwartal,
				Miesiac,
				Aktywny
			)
		VALUES
			(
				@FormatkaKod,
				@Rok,
				@Kwartal,
				@Miesiac,
				@Aktywny
			)

		SELECT SCOPE_IDENTITY()

	END
	ELSE
	BEGIN

		UPDATE OkresSprawozdawczy
		SET
			FormatkaKod = @FormatkaKod,
			Rok = @Rok,
			Miesiac = @Miesiac,
			Kwartal = @Kwartal,
			Aktywny = @Aktywny
		WHERE
			ID = @ID

		SELECT @@ROWCOUNT

	END

END