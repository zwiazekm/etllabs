


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [ncts2].[Test_NCTS2_proc] 
	 @DataOd varchar(30) = '2016-09-01 07:50:41',
	 @DataDo varchar(30) = '2016-12-12 07:50:41',
	 @TSQL nvarchar(4000) = NULL,
	 @INS nvarchar(4000) = NULL

AS
BEGIN

	SET NOCOUNT ON;

	SET  @TSQL = 'SELECT * FROM OPENQUERY(NCTS2_LINKED,''SELECT towar_id, kod, nr, uwagi, DPW.id, DPW.poz_id
    FROM dokumenty_poprzednie_wpt DPW
    INNER JOIN towary AS T ON DPW.towar_id = T.id
    INNER JOIN operacje_tranzytowe AS OT ON T.operacja_tranzytowa_id = OT.id
    WHERE OT.data_modyfikacji  >=' +  '''''' + @DataOd + '''''' + 'AND OT.data_modyfikacji  <=' +  '''''' + @DataDo + '''''' + '
    '')'

	SET @INS = 
	'INSERT INTO [WI_StageODS].[ncts2].[dokumenty_poprzednie_wpt]' + @TSQL

	EXEC (@INS) 

END