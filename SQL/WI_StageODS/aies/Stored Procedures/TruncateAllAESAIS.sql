-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-07-09
-- Description:	Procedura czyści wszystkie tabele przygotowując je do zasilenia (przyrostowego) z systemu AESAIS
-- =============================================
CREATE PROCEDURE [aies].[TruncateAllAESAIS]
AS
BEGIN
	SET NOCOUNT ON;

	TRUNCATE TABLE aies.customs_decl;
	TRUNCATE TABLE aies.customs_directive;
	TRUNCATE TABLE aies.customs_operation;
	TRUNCATE TABLE aies.customs_change;
	TRUNCATE TABLE aies.customs_verification_item;
	TRUNCATE TABLE aies.customs_information;
	TRUNCATE TABLE aies.customs_directive_change;
	TRUNCATE TABLE aies.customs_directive_pointer;
	/* Pierwszy kontener */
	
	TRUNCATE TABLE aies.ecs_exp_declcoexport;
	TRUNCATE TABLE aies.ecs_exp_cancellation_request;
	TRUNCATE TABLE aies.ecs_exp_itinerary;
	TRUNCATE TABLE aies.ecs_exp_deferred_payment;
	TRUNCATE TABLE aies.ecs_exp_card3_receipient;
	TRUNCATE TABLE aies.ecs_exp_seal;
	TRUNCATE TABLE aies.ecs_exp_exporter;
	TRUNCATE TABLE aies.ecs_exp_decl_br_c;
	TRUNCATE TABLE aies.ecs_exp_declarant;
	TRUNCATE TABLE aies.ecs_exp_consignee;
	TRUNCATE TABLE aies.ecs_exp_stat_requ;
	TRUNCATE TABLE aies.ecs_exp_trader_at_present;
	TRUNCATE TABLE aies.ecs_exp_goods_item;
	TRUNCATE TABLE aies.ecs_exp_tax;
	TRUNCATE TABLE aies.ecs_exp_tariff_measure;
	TRUNCATE TABLE aies.ecs_exp_taric_add_code;
	TRUNCATE TABLE aies.ecs_exp_special_mention;
	TRUNCATE TABLE aies.ecs_exp_quantity_of_goods;
	TRUNCATE TABLE aies.ecs_exp_produced_document;
	TRUNCATE TABLE aies.ecs_exp_package;
	TRUNCATE TABLE aies.ecs_exp_national_add_code;
	TRUNCATE TABLE aies.ecs_exp_item_br_c;
	TRUNCATE TABLE aies.ecs_exp_exporter_of_item;
	TRUNCATE TABLE aies.ecs_exp_correction;
	TRUNCATE TABLE aies.ecs_exp_container;
	TRUNCATE TABLE aies.ecs_exp_consignee_of_item;
	/* Drugi kontener */
	
	TRUNCATE TABLE aies.ecs_ext_declcoexit;
	TRUNCATE TABLE aies.ecs_ext_seal;
	TRUNCATE TABLE aies.ecs_ext_exporter;
	TRUNCATE TABLE aies.ecs_ext_decl_br_c;
	TRUNCATE TABLE aies.ecs_ext_consignee;
	TRUNCATE TABLE aies.ecs_ext_trader_at_exit;
	TRUNCATE TABLE aies.ecs_ext_risk_analysis;
	TRUNCATE TABLE aies.ecs_ext_additional_info;
	TRUNCATE TABLE aies.ecs_ext_itinerary;
	TRUNCATE TABLE aies.ecs_ext_goods_item;
	TRUNCATE TABLE aies.ecs_ext_special_mention;
	TRUNCATE TABLE aies.ecs_ext_produced_document;
	TRUNCATE TABLE aies.ecs_ext_previous_document;
	TRUNCATE TABLE aies.ecs_ext_package;
	TRUNCATE TABLE aies.ecs_ext_consignee_of_item;
	TRUNCATE TABLE aies.ecs_ext_exporter_of_item;
	TRUNCATE TABLE aies.ecs_ext_item_br_c;
	TRUNCATE TABLE aies.ecs_ext_container;
	/* Trzeci kontener */
	
	TRUNCATE TABLE aies.ecs_los_declcoexit;
	TRUNCATE TABLE aies.ecs_los_seal;
	TRUNCATE TABLE aies.ecs_los_risk_analysis;
	TRUNCATE TABLE aies.ecs_los_declarant;
	TRUNCATE TABLE aies.ecs_los_submitter;
	TRUNCATE TABLE aies.ecs_los_itinerary;
	TRUNCATE TABLE aies.ecs_los_exporter;
	TRUNCATE TABLE aies.ecs_los_consignee;
	TRUNCATE TABLE aies.ecs_los_goods_item;
	TRUNCATE TABLE aies.ecs_los_produced_document;
	TRUNCATE TABLE aies.ecs_los_package;
	TRUNCATE TABLE aies.ecs_los_exporter_of_item;
	TRUNCATE TABLE aies.ecs_los_container;
	TRUNCATE TABLE aies.ecs_los_consignee_of_item;
	/* Czwarty kontener */
	
	TRUNCATE TABLE aies.ecs_mft_manifest;
	TRUNCATE TABLE aies.ecs_mft_goodsitem;
	TRUNCATE TABLE aies.ecs_mft_trader_at_exit;
	TRUNCATE TABLE aies.ecs_mft_customsdata;
	/* Piaty kontener */
	
	TRUNCATE TABLE aies.ecs_spp_declcoexpsuppl;
	TRUNCATE TABLE aies.ecs_spp_seal_suppl;
	TRUNCATE TABLE aies.ecs_spp_seal;
	TRUNCATE TABLE aies.ecs_spp_itinerary;
	TRUNCATE TABLE aies.ecs_spp_exporter;
	TRUNCATE TABLE aies.ecs_spp_deferred_payment;
	TRUNCATE TABLE aies.ecs_spp_declarant;
	TRUNCATE TABLE aies.ecs_spp_consignee;
	TRUNCATE TABLE aies.ecs_spp_goods_item;
	TRUNCATE TABLE aies.ecs_spp_tariff_measure;
	TRUNCATE TABLE aies.ecs_spp_quantity_of_goods;
	TRUNCATE TABLE aies.ecs_spp_package;
	TRUNCATE TABLE aies.ecs_spp_container;
	TRUNCATE TABLE aies.ecs_spp_taric_add_code;
	TRUNCATE TABLE aies.ecs_spp_produced_document;
	TRUNCATE TABLE aies.ecs_spp_national_add_code;
	TRUNCATE TABLE aies.ecs_spp_tax;
	TRUNCATE TABLE aies.ecs_spp_tar_add_cod_spp;
	TRUNCATE TABLE aies.ecs_spp_previous_document;
	TRUNCATE TABLE aies.ecs_spp_nat_add_code_suppl;
	TRUNCATE TABLE aies.ecs_spp_special_mention;
	TRUNCATE TABLE aies.ecs_spp_prev_doc_proc_gosp;
	TRUNCATE TABLE aies.ecs_spp_consignee_of_item;
	/* Szosty kontener */
	
	TRUNCATE TABLE aies.ecs_sum_declcoexit;
	TRUNCATE TABLE aies.ecs_sum_goods_item;
	TRUNCATE TABLE aies.ecs_sum_produced_document;
	TRUNCATE TABLE aies.ecs_sum_package;
	TRUNCATE TABLE aies.ecs_sum_exporter_of_item;
	TRUNCATE TABLE aies.ecs_sum_consignee_of_item;
	TRUNCATE TABLE aies.ecs_sum_container;
	TRUNCATE TABLE aies.ecs_sum_tariff_measure;
	TRUNCATE TABLE aies.ecs_sum_submitter;
	TRUNCATE TABLE aies.ecs_sum_seal;
	TRUNCATE TABLE aies.ecs_sum_itinerary;
	TRUNCATE TABLE aies.ecs_sum_exporter;
	TRUNCATE TABLE aies.ecs_sum_declarant;
	TRUNCATE TABLE aies.ecs_sum_consignee;
	TRUNCATE TABLE aies.ecs_sum_trader_at_exit;
	/* Siodmy kontener */
	
	TRUNCATE TABLE aies.customs_message;
	TRUNCATE TABLE aies.ecs_query_exportquery;
	TRUNCATE TABLE aies.ecs_query_seal;
	TRUNCATE TABLE aies.ecs_query_risk_analysis;
	TRUNCATE TABLE aies.ecs_query_consignee;
	TRUNCATE TABLE aies.ecs_query_itinerary;
	TRUNCATE TABLE aies.ecs_query_exporter;
	TRUNCATE TABLE aies.ecs_query_goods_item;
	TRUNCATE TABLE aies.ecs_query_special_mention;
	TRUNCATE TABLE aies.ecs_query_produced_document;
	TRUNCATE TABLE aies.ecs_query_previous_document;
	TRUNCATE TABLE aies.ecs_query_package;
	TRUNCATE TABLE aies.ecs_query_exporter_of_item;
	TRUNCATE TABLE aies.ecs_query_container;
	TRUNCATE TABLE aies.ecs_query_consignee_of_item;
	/* Osmy kontener */
	
	TRUNCATE TABLE aies.ecs_zwp_declcopresent;
	TRUNCATE TABLE aies.ecs_zwp_trader_at_present;
	TRUNCATE TABLE aies.ecs_zwp_seal;
	TRUNCATE TABLE aies.ecs_zwp_risk_analysis;
	TRUNCATE TABLE aies.ecs_zwp_itinerary;
	TRUNCATE TABLE aies.ecs_zwp_exporter;
	TRUNCATE TABLE aies.ecs_zwp_decl_pt_c;
	TRUNCATE TABLE aies.ecs_zwp_consignee;
	TRUNCATE TABLE aies.ecs_zwp_goods_item;
	TRUNCATE TABLE aies.ecs_zwp_previous_document;
	TRUNCATE TABLE aies.ecs_zwp_exporter_of_item;
	TRUNCATE TABLE aies.ecs_zwp_produced_document;
	TRUNCATE TABLE aies.ecs_zwp_container;
	TRUNCATE TABLE aies.ecs_zwp_package;
	TRUNCATE TABLE aies.ecs_zwp_consignee_of_item;
	TRUNCATE TABLE aies.ecs_zwp_item_pt_c;
	TRUNCATE TABLE aies.ecs_zwp_special_mention;
	/* Dziewiaty kontener */
	
	
	TRUNCATE TABLE aies.sec_applications;
	TRUNCATE TABLE aies.sec_users_groups;
	TRUNCATE TABLE aies.sec_user_history;
	TRUNCATE TABLE aies.sec_groups_history;
	TRUNCATE TABLE aies.sec_groups_actions;
	TRUNCATE TABLE aies.sec_groups;
	TRUNCATE TABLE aies.sec_users;
	TRUNCATE TABLE aies.sec_actions;
	/* Dziesiaty kontener */
	
	TRUNCATE TABLE aies.ref_slw;
	TRUNCATE TABLE aies.ref_work_time_exception;
	TRUNCATE TABLE aies.ref_work_calendar_sp;
	TRUNCATE TABLE aies.ref_work_season_sp;
	TRUNCATE TABLE aies.ref_work_position_sp;
	TRUNCATE TABLE aies.ref_sp_authorisation;
	TRUNCATE TABLE aies.ref_slw_item;
	TRUNCATE TABLE aies.ref_place;
	TRUNCATE TABLE aies.ref_holiday;
	TRUNCATE TABLE aies.ref_exit_acceptance;
	TRUNCATE TABLE aies.ref_sp_authorisation_co;
	TRUNCATE TABLE aies.ref_sp_authorisation_location;
	TRUNCATE TABLE aies.ref_sp_authorisation_procedure;
	TRUNCATE TABLE aies.ref_custom_office;
	TRUNCATE TABLE aies.ref_customer;
	TRUNCATE TABLE aies.ref_work_calendar;
	TRUNCATE TABLE aies.ref_work_role;
	TRUNCATE TABLE aies.ref_work_position;
	TRUNCATE TABLE aies.ref_work_season;
	/* Jedenesty kontener */
	
	TRUNCATE TABLE aies.s_jobs_ics;
	TRUNCATE TABLE aies.s_jobs_parms_ics;
	TRUNCATE TABLE aies.s_jobs_dataparts_ics;
	TRUNCATE TABLE aies.s_logs;
	TRUNCATE TABLE aies.s_logs_details;
	TRUNCATE TABLE aies.s_logs_error_codes;
	TRUNCATE TABLE aies.s_jobs;
	TRUNCATE TABLE aies.s_jobs_dataparts;
	TRUNCATE TABLE aies.s_jobs_parms;
	TRUNCATE TABLE aies.ref_data_package;
	TRUNCATE TABLE aies.ref_data_class;
	TRUNCATE TABLE aies.ref_data_src;
	TRUNCATE TABLE aies.RS_TEST;
	TRUNCATE TABLE aies.ICS_DSK_OPERACJA_DECYZJA_OPLAT;
	TRUNCATE TABLE aies.ICS_DSK_OPERACJA_DECYZJA;
	TRUNCATE TABLE aies.RS_TEST12;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR_INFORMACJA;
	TRUNCATE TABLE aies.ICS_DSK_OPERACJA_KOREKTA;
	TRUNCATE TABLE aies.ecs_exp_prev_doc_proc_gosp;
	TRUNCATE TABLE aies.ecs_exp_provisional_document;
	TRUNCATE TABLE aies.ICS_DISREPANCY;
	TRUNCATE TABLE aies.customs_disrepancy;

	/* Dwunasty kontener */
	
	TRUNCATE TABLE aies.ICS_DIRT;
	TRUNCATE TABLE aies.ICS_DIRT_CHANGE;
	TRUNCATE TABLE aies.ICS_DIRT_POINTER;
	TRUNCATE TABLE aies.ICS_DIRT_INTR;
	TRUNCATE TABLE aies.ICS_BALANCE_REQ_POS;
	TRUNCATE TABLE aies.ICS_ENS_ITEM_CUST
	TRUNCATE TABLE aies.ICS_ENS_ITEM_CONT;
	TRUNCATE TABLE aies.ICS_ENS_ITEM_PACK;
	TRUNCATE TABLE aies.ICS_ENS_ITEM_ADD_INFO
	TRUNCATE TABLE aies.ICS_ENS_ITEM_TRANS;
	TRUNCATE TABLE aies.ICS_ENS_SPEC_MENT;
	TRUNCATE TABLE aies.ICS_ENS_PROD_DOCU;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR_ZABEZPIECZENIE;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR_ODMOWA_SKLAD;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR_OPAKOWANIE;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR_WNIOSK_PRZEDL_TE;
	TRUNCATE TABLE aies.ICS_DSK_WSP_MIEJSCE_ZALADUNKU;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR_DOKUMENT_WYMAG;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR_DOKUMENT_POPRZ;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR_PROCEDURA;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR_KONTENER;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR_UPLYNIECIE_TERM;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR_PRZEZN_CELNE;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR_WNIOSKOWANE_UNIE;
	/* Trzynasty kontener */
	
	TRUNCATE TABLE aies.ICS_DECL;
	TRUNCATE TABLE aies.ICS_OPER;
	TRUNCATE TABLE aies.ICS_CHANG;
	TRUNCATE TABLE aies.ICS_GAN;
	TRUNCATE TABLE aies.ICS_MESS;
	TRUNCATE TABLE aies.ICS_GAN_CUST;
	TRUNCATE TABLE aies.ICS_GAN_ITEMS;
	TRUNCATE TABLE aies.ICS_GAN_CUST_DATA;
	TRUNCATE TABLE aies.ICS_ZCP_ADDRESS;
	TRUNCATE TABLE aies.ICS_ZCP_BUSINESS_ENTITY;
	TRUNCATE TABLE aies.ICS_ZCP_NATURAL_PERSON;
	TRUNCATE TABLE aies.ICS_ZCP_DOC_SIGNER;
	TRUNCATE TABLE aies.ICS_DSK_WSP_PODMIOT_GOSP;
	TRUNCATE TABLE aies.ICS_DSK_WSP_ADRES;
	TRUNCATE TABLE aies.ICS_DSK_WSP_PODPISUJACY_DOK;
	TRUNCATE TABLE aies.ICS_DSK_WSP_OSOBA_FIZYCZNA;
	TRUNCATE TABLE aies.ICS_DSK;
	TRUNCATE TABLE aies.ICS_DSK_TOWAR;
	TRUNCATE TABLE aies.ICS_DSK_WSP_INFORMACJA_DOD;
	TRUNCATE TABLE aies.ICS_DSK_WSP_MIEJSCE_WYLADUNKU;
	TRUNCATE TABLE aies.ICS_DSK_NIESKUTECZNE_ZAB;
	TRUNCATE TABLE aies.ICS_DSK_TRANSPORT_NA_GRANICY;
	TRUNCATE TABLE aies.ICS_DSK_OPERACJA;
	TRUNCATE TABLE aies.ICS_DSK_LOKALIZACJA;
	TRUNCATE TABLE aies.ICS_DSK_LOKALIZACJA_ADRES;
	TRUNCATE TABLE aies.ICS_DSK_TRANSPORT_WEWN;
	TRUNCATE TABLE aies.ICS_DSK_ZABEZPIECZENIE;
	TRUNCATE TABLE aies.ICS_DSK_POW_O_KONTROLI;
	TRUNCATE TABLE aies.ICS_DSK_ZAMK_CELNE;
	TRUNCATE TABLE aies.ICS_DSK_ZAMK_CELNE_NUMERY;
	TRUNCATE TABLE aies.ICS_GAN_CUST_DATA_DETL;
	TRUNCATE TABLE aies.ICS_BALANCE_REQ;
	TRUNCATE TABLE aies.ICS_CANCEL_BALANCE_REQ;
	TRUNCATE TABLE aies.ICS_ENS;
	TRUNCATE TABLE aies.ICS_ENS_ITI;
	TRUNCATE TABLE aies.ICS_ENS_SEALS;
	TRUNCATE TABLE aies.ICS_ENS_SUBS_ENTR;
	TRUNCATE TABLE aies.ICS_ENS_ITEMS;
	TRUNCATE TABLE aies.ICS_ENS_CUST;
	TRUNCATE TABLE aies.ICS_ZCP;
	TRUNCATE TABLE aies.ICS_ZCP_LOCATION;
	TRUNCATE TABLE aies.ICS_ZCP_CONTROL_CO;
	TRUNCATE TABLE aies.ICS_ZCP_NOTIF_ABOUT_CONTROL;
	TRUNCATE TABLE aies.ICS_ZCP_BONDED_WAREHOUSE;
	TRUNCATE TABLE aies.ICS_ZCP_PODZ;
	TRUNCATE TABLE aies.ICS_ZCP_PAYMENT;
	TRUNCATE TABLE aies.ICS_ZCP_DIRECTIVES;
	TRUNCATE TABLE aies.ICS_ZCP_TRANSACTION;
	TRUNCATE TABLE aies.ICS_ZCP_OPERATION;
	TRUNCATE TABLE aies.ICS_ZCP_DECISION;
	TRUNCATE TABLE aies.ICS_ZCP_PAYMENT;
	TRUNCATE TABLE aies.ICS_ZCP_TRANSPORT_INTERNAL;
	TRUNCATE TABLE aies.ICS_ZCP_GUARANT;
	TRUNCATE TABLE aies.ICS_ZCP_TRANSPORT_AT_BORDER;
	TRUNCATE TABLE aies.ICS_ZCP_CONTRACT;
	TRUNCATE TABLE aies.ICS_ZCP_DV1_VALUATION_RATIOS;
	TRUNCATE TABLE aies.ICS_ZCP_INEFFECTIVE_GUARANT;
	TRUNCATE TABLE aies.ICS_ZCP_DV1_INCREM_DEDUCTION;
	TRUNCATE TABLE aies.ICS_ZCP_CANCEL_REQUEST;
	TRUNCATE TABLE aies.ICS_ZCP_ADDITIONAL_INFO;
	TRUNCATE TABLE aies.ICS_ZCP_WARNINGS;
	TRUNCATE TABLE aies.ICS_ZCP_TRANSPORT_DOCUMENT;
	TRUNCATE TABLE aies.ICS_ZCP_DELIVERY_REQS;
	TRUNCATE TABLE aies.ICS_ZCP_WDZ; 
	/* Czternasty kontener */
	
	TRUNCATE TABLE aies.ICS_ZCP_ITEM;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_TARIFF_MEASURE;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_REQ_DOC;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_VALUE_INFO;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_VALUE_DETAILS;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_OSOZ2_GUARANTEE;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_QUOTA_GRANTED;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_CONTAINER;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_PACK;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_ERROR;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_ADD_INFO;
	TRUNCATE TABLE aies.ICS_ZCP_NAT_ADD_CODES;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_PODZ;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_PAYMENT;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_PREV_DOC;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_VEHICLE;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_RETROSPECTIVE_REQ;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_VALUE_CORRECTION;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_WDZ;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_CONTRACT;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_CANCEL_REQUEST;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_CUSTOM_DEST;
	TRUNCATE TABLE aies.ICS_ZCP_TARIC_ADD_CODES;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_TARIC_QUANTITY;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_ARR_DATA;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_ARR_STATUS;
	TRUNCATE TABLE aies.ICS_ZCP_ITEM_QUOTA;
	/* Pietnasy kontener */
END