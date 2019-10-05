






-- =============================================
-- Author:		Michał Błędowski
-- Create date: 2015-12-15
-- Description:	Procedura merge'ująca w schemacie aimp2.
-- =============================================

CREATE PROCEDURE [aimp2].[MergeAllAIMP2FromStageODS]
AS
BEGIN
	SET NOCOUNT ON;

EXEC [aimp2].[MergeTableFromStageODS] 'ariadna_dokument';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DECL';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_WSP_ADRES';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_GAN_ZCP_CUST_DATA';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_OTHER_ADDRESS';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ADDRESS';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_DOC_SIGNER';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_QUOTA_DEF';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_VAT_PERIOD';
EXEC [aimp2].[MergeTableFromStageODS] 'ariadna_owk';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DECL_PARAM';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DIRT';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_WSP_OSOBA_FIZYCZNA';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_WSP_PODMIOT_GOSP';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_GAN_ZCP_CUST_DATA_DETL';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_MESS';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_OPER';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_OTHER_BUSINESS_ENTITY';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_OTHER_NATURAL_PERSON';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP';
EXEC [aimp2].[MergeTableFromStageODS] 'ariadna_metody_kontroli';
EXEC [aimp2].[MergeTableFromStageODS] 'ariadna_owk_podsumowanie';
EXEC [aimp2].[MergeTableFromStageODS] 'ariadna_owk_pozycje';
EXEC [aimp2].[MergeTableFromStageODS] 'ariadna_zespol_kontroli';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_CHANG';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DIRT_CHANGE';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DIRT_CONTROL_METHOD';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DIRT_IND';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DIRT_INTR';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DIRT_POSITION';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DPZ_CONS_RECEIVER';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DPZ_DECISION';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DPZ_LOCATION';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_TOWAR';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_MESS_KANAL';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_OTHER';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_PWD';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_PWD_PROCEDURE';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ADDITIONAL_INFO';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_BONDED_WAREHOUSE';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_BUSINESS_ENTITY';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_CANCEL_REQUEST';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_CONTAINER';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_CONTRACT';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_CONTROL_CO';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_DECISION';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_DELIVERY_REQS';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_EAD_INFO';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ENTITY_ICD';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_INEFFECTIVE_GUARANT';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_LOCATION';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_NATURAL_PERSON';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_NOTIF_ABOUT_CONTROL';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_PERMITS_HOLDER';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_PODZ';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_PREV_DOC';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_TAX_IDENTITY';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_TRANSACTION';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_TRANSPORT_AT_BORDER';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_TRANSPORT_DOCUMENT';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_TRANSPORT_INTERNAL';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_WDZ';
EXEC [aimp2].[MergeTableFromStageODS] 'ais_zcp_natural_pers_add_info';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_DOKUMENT_POPRZ';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_KONTENER';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_LOKALIZACJA';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_NIESKUTECZNE_ZAB';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_OPERACJA';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_OSOB_PODP_DOK';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_PODM_W_LANCUCHU';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_POW_O_KONTROLI';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_TOWAR_DOKUMENT_POPRZ';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_TOWAR_DOKUMENT_WYMAG';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_TOWAR_KONTENER';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_TOWAR_ODMOWA_SKLAD';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_TOWAR_OPAKOWANIE';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_TOWAR_PODM_W_LANCUCHU';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_TOWAR_WNIOSKOWANE_UNIE';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_TRANSPORT';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_WSP_INFORMACJA_DOD';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_ZAMK_CELNE';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_OTHER_CUSTOM_DEST';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_PWD_PROCEDURE_DETAIL';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_BUSINESS_ENTITY_AI';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_EAD_INFO_ITEM';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_PAYMENT';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_POD';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_PREV_DOC_POS';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_DOKUMENT_POPRZ_POS';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_LOKALIZACJA_ADRES';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_DSK_ZAMK_CELNE_NUMERY';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_PWD_ITEM_ARR_DATA';
EXEC [aimp2].[MergeTableFromStageODS] 'ics_pwd_item_irregularity';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_DV1_INCREM_DEDUCTION';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_DV1_VALUATION_RATIOS';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_GUARANT';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_ADD_INFO';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_CONTAINER';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_CONTRACT';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_CUSTOM_DEST';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_ENTITY_ICD';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_OSOZ2_GUARANTEE';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_PACK';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_PODZ';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_POSTAGE';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_POSTAL_VALUE';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_PREV_DOC';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_PROCEDURE_DETAILS';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_QUOTA';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_QUOTA_GRANTED';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_REQ_DOC';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_RETROSPECTIVE_REQ';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_TARIC_QUANTITY';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_TARIFF_MEASURE';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_TAX_IDENTITY';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_VALUE_INFO';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_VEHICLE';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_WDZ';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_NAT_ADD_CODES';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_OFFICIAL_ANNOTATION';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_POD_ITEM';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_TARIC_ADD_CODES';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_ARR_DATA';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_PAYMENT';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_PREV_DOC_POS';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_VALUE_CORRECTION';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_ITEM_VALUE_DETAILS';
EXEC [aimp2].[MergeTableFromStageODS] 'ICS_ZCP_OSOZ_ZEFIR_OQ';

END