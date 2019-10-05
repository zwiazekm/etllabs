CREATE PROCEDURE [a2].[DziennikRowCount]
AS

	UPDATE a2.Dziennik
	SET RowCnt = @@ROWCOUNT
	WHERE Id = (SELECT ISNULL(MAX(Id), -1) from a2.Dziennik )

RETURN 0