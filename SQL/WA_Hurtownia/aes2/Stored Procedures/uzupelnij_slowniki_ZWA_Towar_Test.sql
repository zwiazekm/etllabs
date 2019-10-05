
---- =============================================
---- Author:		MN
---- Create date: 
---- Description:	
---- =============================================


--CREATE PROCEDURE [aes2].[uzupelnij_slowniki_ZWA_Towar_Test]
--AS

--BEGIN
--SET NOCOUNT ON;

--	DECLARE @id numeric(19, 0); 
--	DECLARE @KrajWysylki nvarchar(2);
--	DECLARE @KrajWysylkiPid nvarchar(2);

--	DECLARE cur2 CURSOR FOR  
--	SELECT id, KrajWysylki  From WA_Hurtownia.aes2.ZWA_Dokument;
--	OPEN cur2;
--	FETCH NEXT FROM cur2 INTO @id, @KrajWysylki
--	WHILE @@FETCH_STATUS = 0
--	BEGIN
--		IF (@KrajWysylki IS NOT NULL)
--			BEGIN
--				 SET @KrajWysylkiPid = 
--				 (SELECT max(s007_id) FROM WA_Hurtownia.pdr.s007 WHERE code = @KrajWysylki)
--				 	IF (@KrajWysylkiPid IS NOT NULL)
--						BEGIN
--							UPDATE WA_Hurtownia.aes2.ZWA_Dokument SET KrajWysylkiPid = @KrajWysylkiPid  
--							WHERE Id = @id;
--					END
--			END
--	END



--END