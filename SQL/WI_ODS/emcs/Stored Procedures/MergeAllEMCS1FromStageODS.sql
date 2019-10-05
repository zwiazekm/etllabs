-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-04-14
-- Description: Merge schematu EMCS ze StageODS do ODS	
-- =============================================

CREATE PROCEDURE [emcs].[MergeAllEMCS1FromStageODS]
AS
BEGIN
	SET NOCOUNT ON;

		EXEC [emcs].[MergeTableFromStageODS] 'DICTIONARIES';
		EXEC [emcs].[MergeTableFromStageODS] 'DICTIONARY_VALUES';
		EXEC [emcs].[MergeTableFromStageODS] 'ECS_DECL_VERIFY_RESULTS';
		EXEC [emcs].[MergeTableFromStageODS] 'ECS_DECLARATION_MVMTS';
		EXEC [emcs].[MergeTableFromStageODS] 'ECS_DECLARATIONS';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_ACO';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_ACO_MESSAGE_RELATIONS'
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_ACO_MESSAGES';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_ACO_MOVEMENTS';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_ACO_PROCESS_INSTANCES';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_ACO_READERS';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_DOWN_MESSAGES';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_DOWN_MOVEMENTS';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_DOWN_MVMT_PROD';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_EXCISE_RATES';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_FOLLOW_UP_MESSAGES';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_TIMER_TYPES';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_TIMERS';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_USER_TASK_TYPES';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_USER_TASKS';
		EXEC [emcs].[MergeTableFromStageODS] 'EMCS_USER_TASKS_SAD_DOCS';
		EXEC [emcs].[MergeTableFromStageODS] 'EXCISE_PRODUCTS';
		EXEC [emcs].[MergeTableFromStageODS] 'MESSAGE_TYPES';
		EXEC [emcs].[MergeTableFromStageODS] 'MESSAGES';
		EXEC [emcs].[MergeTableFromStageODS] 'MOVEMENTS';
		EXEC [emcs].[MergeTableFromStageODS] 'MVMT_CERTIFICATES';
		EXEC [emcs].[MergeTableFromStageODS] 'MVMT_DOWNSTREAM_MOVEMENTS';
		EXEC [emcs].[MergeTableFromStageODS] 'MVMT_INTERESTED_OFFICES';
		EXEC [emcs].[MergeTableFromStageODS] 'MVMT_PACKAGES';
		EXEC [emcs].[MergeTableFromStageODS] 'MVMT_PRODUCTS';
		EXEC [emcs].[MergeTableFromStageODS] 'MVMT_SAD_DOCUMENTS';
		EXEC [emcs].[MergeTableFromStageODS] 'MVMT_TRANSPORT_DETAILS';
		EXEC [emcs].[MergeTableFromStageODS] 'MVMT_WINE_OPERATION_CODES';
		EXEC [emcs].[MergeTableFromStageODS] 'PACKAGING_CODES';
		EXEC [emcs].[MergeTableFromStageODS] 'REF_SD2_MIEJSCA_ODBIORU';
		EXEC [emcs].[MergeTableFromStageODS] 'REF_SD2_PODMIOTY';
		EXEC [emcs].[MergeTableFromStageODS] 'REF_SD2_PRZEDSTAWICIELE';
		EXEC [emcs].[MergeTableFromStageODS] 'REF_SD2_UBYTKI_TRANS';
		EXEC [emcs].[MergeTableFromStageODS] 'REF_SD2_UBYTKI_TRANS_KODY_CN';
		EXEC [emcs].[MergeTableFromStageODS] 'REF_SD2_UBYTKI_TRANS_OPAK';
		EXEC [emcs].[MergeTableFromStageODS] 'REF_SD2_UBYTKI_TRANS_SRODKI';
		EXEC [emcs].[MergeTableFromStageODS] 'REF_SD2_WLASCICIELE';
		EXEC [emcs].[MergeTableFromStageODS] 'REF_SD2_WYROBY';
		EXEC [emcs].[MergeTableFromStageODS] 'REF_SD2_ZABEZPIECZENIA';
		EXEC [emcs].[MergeTableFromStageODS] 'REQUEST_MESSAGES';
		EXEC [emcs].[MergeTableFromStageODS] 'TFILE';
	
END