







-- =============================================
-- Author:		Michał Błędowski
-- Create date: 2015-12-10
-- Description:	Procedura merge'ująca w schemacie ais2.
-- =============================================

CREATE PROCEDURE [ais2].[MergeAllAIS2FromStageODS]
AS
BEGIN
	SET NOCOUNT ON;

EXEC [ais2].[MergeTableFromStageODS] 'ICS_BALANCE_REQ';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_CONTROL_NOTIFICATION';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_DECL';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_DISREPANCY';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_CANCEL_BALANCE_REQ';
--EXEC [ais2].[MergeTableFromStageODS] 'ICS_CONTROL_NOTIFICATION_REQ_DOC'; usunięto tabelę ze źródła??
EXEC [ais2].[MergeTableFromStageODS] 'ICS_DECL_PARAM';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_DIRT';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_GAN';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_MESS';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_OPER';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_CHANG';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_DIRT_CHANGE';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_DIRT_CONTROL_METHOD';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_DIRT_IND';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_DIRT_INTR';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_DIRT_POINTER';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_DIRT_POSITION';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS_CUST';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS_ITEMS';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS_ITI';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS_SEALS';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS_SUBS_ENTR';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_GAN_CUST';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_GAN_ITEMS';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_MESS_KANAL';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_BALANCE_REQ_POS';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS_ITEM_ADD_INFO';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS_ITEM_CONT';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS_ITEM_CUST';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS_ITEM_PACK';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS_ITEM_TRANS';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS_PROD_DOCU';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_ENS_SPEC_MENT';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_GAN_CUST_DATA';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_GAN_CUST_DATA_DETL';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_GAN_ZCP_CUST_DATA';
EXEC [ais2].[MergeTableFromStageODS] 'ICS_GAN_ZCP_CUST_DATA_DETL';

END