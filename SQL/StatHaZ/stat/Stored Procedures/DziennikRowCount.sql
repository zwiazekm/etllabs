CREATE PROCEDURE [stat].[DziennikRowCount]
AS

	UPDATE stat.Dziennik
	SET RowCnt = @@ROWCOUNT
	WHERE Id = (SELECT ISNULL(MAX(Id), -1) from stat.Dziennik )

RETURN 0