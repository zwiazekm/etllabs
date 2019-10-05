CREATE PROCEDURE [dbo].[Administracja_SekcjeFormatki_UsunSekcjeFormatki]
(
	@SekcjaId	int
)
AS
	
	DELETE FROM 
		FormatkaSekcje
	WHERE
		SekcjaId = @SekcjaId

RETURN @@ERROR