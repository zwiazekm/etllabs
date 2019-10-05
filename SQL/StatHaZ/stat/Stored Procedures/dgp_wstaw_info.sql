CREATE PROCEDURE [stat].dgp_wstaw_info
  @p_opis varchar (1000),
  @ProcId int = null
as

	DECLARE @ContextInfo VARBINARY(128) = null;
	SELECT @ContextInfo = ContextInfo
	FROM stat.DziennikContextInfo
	WHERE SPID = @@SPID;

	INSERT INTO stat.Dziennik (Data, [Status], Procedura, ContextInfo, Poziom, Informacja, SPID)
	VALUES (GETDATE(), 'I', @ProcId, @ContextInfo, @@NESTLEVEL-1, @p_opis, @@SPID);

	RETURN @@IDENTITY;