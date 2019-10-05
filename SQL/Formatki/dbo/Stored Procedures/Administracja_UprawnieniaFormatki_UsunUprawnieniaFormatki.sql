CREATE PROCEDURE [dbo].[Administracja_UprawnieniaFormatki_UsunUprawnieniaFormatki]
(
	@ID	int
)

AS

DELETE FROM
	FormatkaUprawnienia
WHERE
	Id = @ID

select @@ROWCOUNT