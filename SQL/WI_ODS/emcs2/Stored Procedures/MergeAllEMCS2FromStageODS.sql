




-- =============================================
-- Author:		
-- Create date: 2015-10-29
-- Description: Merge schematu EMCS2 ze StageODS do ODS	
-- =============================================

CREATE PROCEDURE [emcs2].[MergeAllEMCS2FromStageODS]
AS
BEGIN
	SET NOCOUNT ON;
	
		EXEC [emcs2].[MergeTableFromStageODS] 'DICTIONARIES';
		EXEC [emcs2].[MergeTableFromStageODS] 'ECS_DECLARATIONS';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_DOWN_MOVEMENTS';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_EXCISE_RATES';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_FUEL_EXCISE_RATES';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_TIMER_TYPES';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_UNAVAILABILITIES';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_USER_TASK_TYPES';
		--EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_USER_TASKS_JN'; tabela bez klucza głównego, ładowana w całości
		EXEC [emcs2].[MergeTableFromStageODS] 'EXCISE_PRODUCTS';
		EXEC [emcs2].[MergeTableFromStageODS] 'MESSAGE_TYPES';
		EXEC [emcs2].[MergeTableFromStageODS] 'MOVEMENTS';
		EXEC [emcs2].[MergeTableFromStageODS] 'PACKAGING_CODES';
		EXEC [emcs2].[MergeTableFromStageODS] 'REF_SD2_PODMIOTY';
		EXEC [emcs2].[MergeTableFromStageODS] 'TFILE';
		EXEC [emcs2].[MergeTableFromStageODS] 'DICTIONARY_VALUES';
		EXEC [emcs2].[MergeTableFromStageODS] 'ECS_DECLARATION_MVMTS';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_DOWN_DOWNSTREAM_MVMTS';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_DOWN_MESSAGES';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_DOWN_MVMT_PROD';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_PROCESS_INSTANCES';
		EXEC [emcs2].[MergeTableFromStageODS] 'MESSAGES';
		EXEC [emcs2].[MergeTableFromStageODS] 'MVMT_CERTIFICATES';
		EXEC [emcs2].[MergeTableFromStageODS] 'MVMT_CONSIGNEE_HISTORY';
		EXEC [emcs2].[MergeTableFromStageODS] 'MVMT_DOWNSTREAM_MOVEMENTS';
		EXEC [emcs2].[MergeTableFromStageODS] 'MVMT_INTERESTED_OFFICES';
		EXEC [emcs2].[MergeTableFromStageODS] 'MVMT_PRODUCTS';
		EXEC [emcs2].[MergeTableFromStageODS] 'MVMT_SAD_DOCUMENTS';
		EXEC [emcs2].[MergeTableFromStageODS] 'MVMT_TRANSPORT_DETAILS';
		EXEC [emcs2].[MergeTableFromStageODS] 'REF_SD2_MIEJSCA_ODBIORU';
		EXEC [emcs2].[MergeTableFromStageODS] 'REF_SD2_PRZEDSTAWICIELE';
		EXEC [emcs2].[MergeTableFromStageODS] 'REF_SD2_UBYTKI_TRANS';
		EXEC [emcs2].[MergeTableFromStageODS] 'REF_SD2_WLASCICIELE';
		EXEC [emcs2].[MergeTableFromStageODS] 'REF_SD2_WYROBY';
		EXEC [emcs2].[MergeTableFromStageODS] 'REF_SD2_ZABEZPIECZENIA';
		EXEC [emcs2].[MergeTableFromStageODS] 'ECS_DECL_VERIFY_RESULTS';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_ACO';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_FOLLOW_UP_MESSAGES';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_PROCESS_COMM';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_PROCESS_STATE_INST';
		EXEC [emcs2].[MergeTableFromStageODS] 'MVMT_PACKAGES';
		EXEC [emcs2].[MergeTableFromStageODS] 'MVMT_WINE_OPERATION_CODES';
		EXEC [emcs2].[MergeTableFromStageODS] 'REF_SD2_UBYTKI_TRANS_KODY_CN';
		EXEC [emcs2].[MergeTableFromStageODS] 'REF_SD2_UBYTKI_TRANS_OPAK';
		EXEC [emcs2].[MergeTableFromStageODS] 'REF_SD2_UBYTKI_TRANS_SRODKI';
		EXEC [emcs2].[MergeTableFromStageODS] 'REQUEST_MESSAGES';
		EXEC [emcs2].[MergeTableFromStageODS] 'AIS_VERIFICATIONS';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_ACO_MESSAGES';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_ACO_MOVEMENTS';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_ACO_OUTER_MESSAGES';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_ACO_PROCESS_INSTANCES';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_ACO_READERS';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_HELPDESK';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_USER_TASKS';
		EXEC [emcs2].[MergeTableFromStageODS] 'AIS_VERIFICATIONS_MVMT';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_ACO_MESSAGE_RELATIONS';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_TIMERS';
		EXEC [emcs2].[MergeTableFromStageODS] 'EMCS_USER_TASKS_SAD_DOCS';
	
END