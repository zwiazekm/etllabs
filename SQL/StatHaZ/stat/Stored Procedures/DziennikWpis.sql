CREATE PROCEDURE [stat].[DziennikWpis]
	@Status CHAR(1) = 'I',
	@Info varchar(1900),
	@ProcId int = NULL
AS

	DECLARE @ContextInfo VARBINARY(128) = null;
	SELECT @ContextInfo = ContextInfo
	FROM stat.DziennikContextInfo
	WHERE SPID = @@SPID;

	INSERT INTO stat.Dziennik (Data, [Status], ContextInfo, Procedura, Poziom, Informacja, SPID)
	VALUES (GETDATE(), @Status, @ContextInfo, @ProcId, @@NESTLEVEL-1, @Info, @@SPID);

RETURN @@IDENTITY