﻿







-- =============================================
-- Author:		Michał Błędowski
-- Create date: 2015-12-10
-- Description:	Procedura czyści wszystkie tabele przygotowując je do zasilenia (przyrostowego).
-- =============================================
CREATE PROCEDURE [aimp2].[TruncateAIMP2]


AS
BEGIN
	SET NOCOUNT ON;


TRUNCATE TABLE aimp2.ais_zcp_natural_pers_add_info;
TRUNCATE TABLE aimp2.ariadna_dokument;
TRUNCATE TABLE aimp2.ariadna_metody_kontroli;
TRUNCATE TABLE aimp2.ariadna_owk;
TRUNCATE TABLE aimp2.ariadna_owk_podsumowanie;
TRUNCATE TABLE aimp2.ariadna_owk_pozycje;
TRUNCATE TABLE aimp2.ariadna_zespol_kontroli;
TRUNCATE TABLE aimp2.ICS_CHANG;
TRUNCATE TABLE aimp2.ICS_DECL;
TRUNCATE TABLE aimp2.ICS_DECL_PARAM;
TRUNCATE TABLE aimp2.ICS_DIRT;
TRUNCATE TABLE aimp2.ICS_DIRT_CHANGE;
TRUNCATE TABLE aimp2.ICS_DIRT_CONTROL_METHOD;
TRUNCATE TABLE aimp2.ICS_DIRT_IND;
TRUNCATE TABLE aimp2.ICS_DIRT_INTR;
TRUNCATE TABLE aimp2.ICS_DIRT_POSITION;
TRUNCATE TABLE aimp2.ICS_DPZ_CONS_RECEIVER;
TRUNCATE TABLE aimp2.ICS_DPZ_DECISION;
TRUNCATE TABLE aimp2.ICS_DPZ_LOCATION;
TRUNCATE TABLE aimp2.ICS_DSK;
TRUNCATE TABLE aimp2.ICS_DSK_DOKUMENT_POPRZ;
TRUNCATE TABLE aimp2.ICS_DSK_DOKUMENT_POPRZ_POS;
TRUNCATE TABLE aimp2.ICS_DSK_KONTENER;
TRUNCATE TABLE aimp2.ICS_DSK_LOKALIZACJA;
TRUNCATE TABLE aimp2.ICS_DSK_LOKALIZACJA_ADRES;
TRUNCATE TABLE aimp2.ICS_DSK_NIESKUTECZNE_ZAB;
TRUNCATE TABLE aimp2.ICS_DSK_OPERACJA;
TRUNCATE TABLE aimp2.ICS_DSK_OSOB_PODP_DOK;
TRUNCATE TABLE aimp2.ICS_DSK_PODM_W_LANCUCHU;
TRUNCATE TABLE aimp2.ICS_DSK_POW_O_KONTROLI;
TRUNCATE TABLE aimp2.ICS_DSK_TOWAR;
TRUNCATE TABLE aimp2.ICS_DSK_TOWAR_DOKUMENT_POPRZ;
TRUNCATE TABLE aimp2.ICS_DSK_TOWAR_DOKUMENT_WYMAG;
TRUNCATE TABLE aimp2.ICS_DSK_TOWAR_KONTENER;
TRUNCATE TABLE aimp2.ICS_DSK_TOWAR_ODMOWA_SKLAD;
TRUNCATE TABLE aimp2.ICS_DSK_TOWAR_OPAKOWANIE;
TRUNCATE TABLE aimp2.ICS_DSK_TOWAR_PODM_W_LANCUCHU;
TRUNCATE TABLE aimp2.ICS_DSK_TOWAR_WNIOSKOWANE_UNIE;
TRUNCATE TABLE aimp2.ICS_DSK_TRANSPORT;
TRUNCATE TABLE aimp2.ICS_DSK_WSP_ADRES;
TRUNCATE TABLE aimp2.ICS_DSK_WSP_INFORMACJA_DOD;
TRUNCATE TABLE aimp2.ICS_DSK_WSP_OSOBA_FIZYCZNA;
TRUNCATE TABLE aimp2.ICS_DSK_WSP_PODMIOT_GOSP;
TRUNCATE TABLE aimp2.ICS_DSK_ZAMK_CELNE;
TRUNCATE TABLE aimp2.ICS_DSK_ZAMK_CELNE_NUMERY;
TRUNCATE TABLE aimp2.ICS_GAN_ZCP_CUST_DATA;
TRUNCATE TABLE aimp2.ICS_GAN_ZCP_CUST_DATA_DETL;
TRUNCATE TABLE aimp2.ICS_MESS;
TRUNCATE TABLE aimp2.ICS_MESS_KANAL;
TRUNCATE TABLE aimp2.ICS_OPER;
TRUNCATE TABLE aimp2.ICS_OTHER;
TRUNCATE TABLE aimp2.ICS_OTHER_ADDRESS;
TRUNCATE TABLE aimp2.ICS_OTHER_BUSINESS_ENTITY;
TRUNCATE TABLE aimp2.ICS_OTHER_CUSTOM_DEST;
TRUNCATE TABLE aimp2.ICS_OTHER_NATURAL_PERSON;
TRUNCATE TABLE aimp2.ICS_PWD;
TRUNCATE TABLE aimp2.ICS_PWD_ITEM_ARR_DATA;
TRUNCATE TABLE aimp2.ics_pwd_item_irregularity;
TRUNCATE TABLE aimp2.ICS_PWD_PROCEDURE;
TRUNCATE TABLE aimp2.ICS_PWD_PROCEDURE_DETAIL;
TRUNCATE TABLE aimp2.ICS_ZCP;
TRUNCATE TABLE aimp2.ICS_ZCP_ADDITIONAL_INFO;
TRUNCATE TABLE aimp2.ICS_ZCP_ADDRESS;
TRUNCATE TABLE aimp2.ICS_ZCP_BONDED_WAREHOUSE;
TRUNCATE TABLE aimp2.ICS_ZCP_BUSINESS_ENTITY;
TRUNCATE TABLE aimp2.ICS_ZCP_BUSINESS_ENTITY_AI;
TRUNCATE TABLE aimp2.ICS_ZCP_CANCEL_REQUEST;
TRUNCATE TABLE aimp2.ICS_ZCP_CONTAINER;
TRUNCATE TABLE aimp2.ICS_ZCP_CONTRACT;
TRUNCATE TABLE aimp2.ICS_ZCP_CONTROL_CO;
TRUNCATE TABLE aimp2.ICS_ZCP_DECISION;
TRUNCATE TABLE aimp2.ICS_ZCP_DELIVERY_REQS;
TRUNCATE TABLE aimp2.ICS_ZCP_DOC_SIGNER;
TRUNCATE TABLE aimp2.ICS_ZCP_DV1_INCREM_DEDUCTION;
TRUNCATE TABLE aimp2.ICS_ZCP_DV1_VALUATION_RATIOS;
TRUNCATE TABLE aimp2.ICS_ZCP_EAD_INFO;
TRUNCATE TABLE aimp2.ICS_ZCP_EAD_INFO_ITEM;
TRUNCATE TABLE aimp2.ICS_ZCP_ENTITY_ICD;
TRUNCATE TABLE aimp2.ICS_ZCP_GUARANT;
TRUNCATE TABLE aimp2.ICS_ZCP_INEFFECTIVE_GUARANT;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_ADD_INFO;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_ARR_DATA;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_CONTAINER;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_CONTRACT;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_CUSTOM_DEST;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_ENTITY_ICD;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_OSOZ2_GUARANTEE;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_PACK;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_PAYMENT;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_PODZ;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_POSTAGE;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_POSTAL_VALUE;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_PREV_DOC;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_PREV_DOC_POS;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_PROCEDURE_DETAILS;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_QUOTA;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_QUOTA_DEF;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_QUOTA_GRANTED;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_REQ_DOC;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_RETROSPECTIVE_REQ;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_TARIC_QUANTITY;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_TARIFF_MEASURE;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_TAX_IDENTITY;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_VALUE_CORRECTION;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_VALUE_DETAILS;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_VALUE_INFO;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_VEHICLE;
TRUNCATE TABLE aimp2.ICS_ZCP_ITEM_WDZ;
TRUNCATE TABLE aimp2.ICS_ZCP_LOCATION;
TRUNCATE TABLE aimp2.ICS_ZCP_NAT_ADD_CODES;
TRUNCATE TABLE aimp2.ICS_ZCP_NATURAL_PERSON;
TRUNCATE TABLE aimp2.ICS_ZCP_NOTIF_ABOUT_CONTROL;
TRUNCATE TABLE aimp2.ICS_ZCP_OFFICIAL_ANNOTATION;
TRUNCATE TABLE aimp2.ICS_ZCP_OSOZ_ZEFIR_OQ;
TRUNCATE TABLE aimp2.ICS_ZCP_PAYMENT;
TRUNCATE TABLE aimp2.ICS_ZCP_PERMITS_HOLDER;
TRUNCATE TABLE aimp2.ICS_ZCP_POD;
TRUNCATE TABLE aimp2.ICS_ZCP_POD_ITEM;
TRUNCATE TABLE aimp2.ICS_ZCP_PODZ;
TRUNCATE TABLE aimp2.ICS_ZCP_PREV_DOC;
TRUNCATE TABLE aimp2.ICS_ZCP_PREV_DOC_POS;
TRUNCATE TABLE aimp2.ICS_ZCP_TARIC_ADD_CODES;
TRUNCATE TABLE aimp2.ICS_ZCP_TAX_IDENTITY;
TRUNCATE TABLE aimp2.ICS_ZCP_TRANSACTION;
TRUNCATE TABLE aimp2.ICS_ZCP_TRANSPORT_AT_BORDER;
TRUNCATE TABLE aimp2.ICS_ZCP_TRANSPORT_DOCUMENT;
TRUNCATE TABLE aimp2.ICS_ZCP_TRANSPORT_INTERNAL;
TRUNCATE TABLE aimp2.ICS_ZCP_VAT_PERIOD;
TRUNCATE TABLE aimp2.ICS_ZCP_WDZ;



END