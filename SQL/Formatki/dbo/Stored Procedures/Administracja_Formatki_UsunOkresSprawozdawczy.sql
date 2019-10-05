CREATE PROCEDURE [dbo].[Administracja_Formatki_UsunOkresSprawozdawczy]
(
	@ID		int
)
AS
	
BEGIN

DELETE FROM
	OkresSprawozdawczy
WHERE
	ID = @ID

SELECT @@ROWCOUNT


END