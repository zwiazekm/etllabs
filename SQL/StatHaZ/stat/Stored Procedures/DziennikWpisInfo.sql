CREATE PROCEDURE [stat].[DziennikWpisInfo]
	@Info varchar(1900),
	@ProcId int = NULL,
	@CzyZaktualizowacOstatniCzas bit = 0
AS
	DECLARE @ContextInfo VARBINARY(128) = null;
	SELECT @ContextInfo = ContextInfo
	FROM stat.DziennikContextInfo
	WHERE SPID = @@SPID;

	INSERT INTO stat.Dziennik (Data, [Status], ContextInfo, Procedura, Poziom, Informacja, SPID)
	VALUES (GETDATE(), 'I', @ContextInfo, @ProcId, @@NESTLEVEL-1, @Info, @@SPID);
	
	DECLARE @Id BIGINT = @@IDENTITY;
	IF (@CzyZaktualizowacOstatniCzas = 1) BEGIN
		DECLARE @PoprzedniWpisId BIGINT = @Id - 1;
		EXEC stat.DziennikCzas @PoprzedniWpisId;
	END

	PRINT CONCAT('Procedura [' + OBJECT_NAME(@ProcId) + ']: ', @Info);

RETURN @Id