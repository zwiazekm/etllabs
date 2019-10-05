





-- =============================================
-- Author:		Michał Błędowski
-- Create date: 2015-12-09
-- Description:	Procedura merge'ująca w schemacie aes2.
-- =============================================

CREATE PROCEDURE [aes2].[MergeAllAES2FromStageODS]
AS
BEGIN
	SET NOCOUNT ON;

EXEC [aes2].[MergeTableFromStageODS] 'AEO_CERTIFICATE_GROUP';
EXEC [aes2].[MergeTableFromStageODS] 'ariadna_dokument';								
EXEC [aes2].[MergeTableFromStageODS] 'customs_decl';
EXEC [aes2].[MergeTableFromStageODS] 'customs_disrepancy';
EXEC [aes2].[MergeTableFromStageODS] 'customs_message_x';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_country_phase';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_prev_doc_proc_gosp';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_provisional_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_trs_declco';
EXEC [aes2].[MergeTableFromStageODS] 'MESSAGE';
EXEC [aes2].[MergeTableFromStageODS] 'MESSAGE_ECS';
EXEC [aes2].[MergeTableFromStageODS] 'MESSAGE_LOG';
EXEC [aes2].[MergeTableFromStageODS] 'MESSAGE_LOG_ECS';
--EXEC [aes2].[MergeTableFromStageODS] 'MESSAGE_METADATA'; --ładowana w całości do ods, brak PK na źródle, dublują się id
EXEC [aes2].[MergeTableFromStageODS] 'MESSAGE_METADATA_ECS';
EXEC [aes2].[MergeTableFromStageODS] 'aes_other'
EXEC [aes2].[MergeTableFromStageODS] 'ariadna_owk';
EXEC [aes2].[MergeTableFromStageODS] 'customs_directive';
EXEC [aes2].[MergeTableFromStageODS] 'customs_message';
EXEC [aes2].[MergeTableFromStageODS] 'customs_message_kanal';
EXEC [aes2].[MergeTableFromStageODS] 'customs_operation';
EXEC [aes2].[MergeTableFromStageODS] 'customs_verification_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_declcoexport';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_declcoexit';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_declcoexit';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_mft_manifest';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_declcoexpsuppl';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_declcoexit';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_trs_goods_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_declcopresent';
EXEC [aes2].[MergeTableFromStageODS] 'aes_other_destination'
EXEC [aes2].[MergeTableFromStageODS] 'aes_other_trader'
EXEC [aes2].[MergeTableFromStageODS] 'ariadna_metody_kontroli';
EXEC [aes2].[MergeTableFromStageODS] 'ariadna_owk_podsumowanie';
EXEC [aes2].[MergeTableFromStageODS] 'ariadna_owk_pozycje';
EXEC [aes2].[MergeTableFromStageODS] 'ariadna_zespol_kontroli';
EXEC [aes2].[MergeTableFromStageODS] 'customs_change';
EXEC [aes2].[MergeTableFromStageODS] 'customs_directive_change';
EXEC [aes2].[MergeTableFromStageODS] 'customs_directive_cm';
EXEC [aes2].[MergeTableFromStageODS] 'customs_directive_indicator';
EXEC [aes2].[MergeTableFromStageODS] 'customs_directive_intr';
EXEC [aes2].[MergeTableFromStageODS] 'customs_directive_pointer';
EXEC [aes2].[MergeTableFromStageODS] 'customs_directive_position';
EXEC [aes2].[MergeTableFromStageODS] 'customs_information';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_cancellation_request';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_card3_receipient';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_consignee';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_decl_br_c';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_declarant';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_deferred_payment';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_exporter';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_goods_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_itinerary';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_seal';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_stat_requ';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_trader_at_present';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_additional_info';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_consignee';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_decl_br_c';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_exporter';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_goods_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_itinerary';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_risk_analysis';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_seal';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_trader_at_exit';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_followup';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_consignee';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_declarant';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_exporter';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_goods_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_itinerary';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_risk_analysis';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_seal';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_submitter';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_mft_goodsitem';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_mft_trader_at_exit';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_exportquery';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_consignee';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_declarant';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_deferred_payment';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_exporter';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_goods_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_itinerary';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_seal';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_seal_suppl';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_consignee';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_declarant';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_exporter';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_goods_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_itinerary';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_seal';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_submitter';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_trader_at_exit';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_trs_req_doc';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_trs_reservation';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_consignee';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_decl_pt_c';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_exporter';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_goods_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_itinerary';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_seal';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_trader_at_present';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_consignee_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_container';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_correction';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_exporter_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_item_br_c';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_national_add_code';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_package';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_previous_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_produced_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_quantity_of_goods';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_special_mention';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_taric_add_code';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_tariff_measure';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_exp_tax';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_consignee_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_container';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_exporter_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_item_br_c';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_package';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_previous_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_produced_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_ext_special_mention';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_consignee_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_container';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_exporter_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_package';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_los_produced_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_mft_customsdata';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_consignee';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_exporter';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_goods_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_itinerary';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_risk_analysis';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_seal';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_consignee_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_container';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_exporter_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_nat_add_code_suppl';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_national_add_code';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_package';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_prev_doc_proc_gosp';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_previous_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_produced_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_quantity_of_goods';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_special_mention';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_tar_add_cod_spp';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_taric_add_code';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_tariff_measure';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_spp_tax';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_consignee_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_container';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_exporter_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_package';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_produced_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_sum_tariff_measure';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_consignee_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_container';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_exporter_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_item_pt_c';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_package';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_previous_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_produced_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_zwp_special_mention';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_consignee_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_container';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_exporter_of_item';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_package';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_previous_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_produced_document';
EXEC [aes2].[MergeTableFromStageODS] 'ecs_query_special_mention';
--EXEC [aes2].[MergeTableFromStageODS] 'zdarzenia_zamkniecia_celne';


EXEC [aes2].[MergeTableFromStageODS] 'aes_psw';
EXEC [aes2].[MergeTableFromStageODS] 'aes_psw_additional_info';
EXEC [aes2].[MergeTableFromStageODS] 'aes_psw_address';
EXEC [aes2].[MergeTableFromStageODS] 'aes_psw_business_entity_ai';
EXEC [aes2].[MergeTableFromStageODS] 'aes_psw_doc_signer';
EXEC [aes2].[MergeTableFromStageODS] 'aes_psw_item';
EXEC [aes2].[MergeTableFromStageODS] 'aes_psw_business_entity';
EXEC [aes2].[MergeTableFromStageODS] 'aes_psw_item_add_info';
EXEC [aes2].[MergeTableFromStageODS] 'AES_PSW_ITEM_CONTAINER';
EXEC [aes2].[MergeTableFromStageODS] 'aes_psw_item_pack';
EXEC [aes2].[MergeTableFromStageODS] 'aes_psw_item_prev_doc';
EXEC [aes2].[MergeTableFromStageODS] 'aes_psw_item_req_doc';
EXEC [aes2].[MergeTableFromStageODS] 'aes_psw_natural_person';
EXEC [aes2].[MergeTableFromStageODS] 'aes_psw_natural_pers_add_info';

END