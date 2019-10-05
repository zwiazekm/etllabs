CREATE PROCEDURE [a2].[DziennikWpisInfo]
	@Info varchar(1900),
	@ProcId int = NULL,
	@CzyZaktualizowacOstatniCzas bit = 0
AS
	DECLARE @ContextInfo VARBINARY(128) = null;
	SELECT @ContextInfo = ContextInfo
	FROM a2.DziennikContextInfo
	WHERE SPID = @@SPID;

	INSERT INTO a2.Dziennik (Data, [Status], ContextInfo, Procedura, Poziom, Informacja, SPID)
	VALUES (GETDATE(), 'I', @ContextInfo, @ProcId, @@NESTLEVEL-1, @Info, @@SPID);

	DECLARE @Id BIGINT = @@IDENTITY;

	IF (@CzyZaktualizowacOstatniCzas = 1) BEGIN
		DECLARE @PoprzedniWpisId BIGINT = @Id - 1;
		EXEC a2.DziennikCzas @PoprzedniWpisId;
	END

	PRINT CONCAT('[INF] Procedura [' + OBJECT_NAME(@ProcId) + ']: ', @Info);

RETURN @Id