






-- =============================================
-- Author:		Michał Błędowski
-- Create date: 2015-12-09
-- Description:	Procedura czyści wszystkie tabele przygotowując je do zasilenia (przyrostowego).
-- =============================================
CREATE PROCEDURE [aes2].[TruncateAES2]


AS
BEGIN
	SET NOCOUNT ON;



TRUNCATE TABLE aes2.ariadna_dokument
TRUNCATE TABLE aes2.customs_decl
TRUNCATE TABLE aes2.customs_disrepancy
TRUNCATE TABLE aes2.customs_message_x
TRUNCATE TABLE aes2.ecs_country_phase
TRUNCATE TABLE aes2.ecs_exp_prev_doc_proc_gosp
TRUNCATE TABLE aes2.ecs_exp_provisional_document
TRUNCATE TABLE aes2.ecs_trs_declco
TRUNCATE TABLE aes2.MESSAGE
TRUNCATE TABLE aes2.MESSAGE_ECS
TRUNCATE TABLE aes2.MESSAGE_LOG
TRUNCATE TABLE aes2.MESSAGE_LOG_ECS
TRUNCATE TABLE aes2.MESSAGE_METADATA
TRUNCATE TABLE aes2.MESSAGE_METADATA_ECS
TRUNCATE TABLE aes2.ariadna_owk
TRUNCATE TABLE aes2.customs_directive
TRUNCATE TABLE aes2.customs_message
TRUNCATE TABLE aes2.customs_operation
TRUNCATE TABLE aes2.customs_verification_item
TRUNCATE TABLE aes2.ecs_exp_declcoexport
TRUNCATE TABLE aes2.ecs_ext_declcoexit
TRUNCATE TABLE aes2.ecs_los_declcoexit
TRUNCATE TABLE aes2.ecs_mft_manifest
TRUNCATE TABLE aes2.ecs_spp_declcoexpsuppl
TRUNCATE TABLE aes2.ecs_sum_declcoexit
TRUNCATE TABLE aes2.ecs_trs_goods_item
TRUNCATE TABLE aes2.ecs_zwp_declcopresent
TRUNCATE TABLE aes2.ariadna_metody_kontroli
TRUNCATE TABLE aes2.ariadna_owk_podsumowanie
TRUNCATE TABLE aes2.ariadna_owk_pozycje
TRUNCATE TABLE aes2.ariadna_zespol_kontroli
TRUNCATE TABLE aes2.customs_change
TRUNCATE TABLE aes2.customs_directive_change
TRUNCATE TABLE aes2.customs_directive_cm
TRUNCATE TABLE aes2.customs_directive_indicator
TRUNCATE TABLE aes2.customs_directive_intr
TRUNCATE TABLE aes2.customs_directive_pointer
TRUNCATE TABLE aes2.customs_directive_position
TRUNCATE TABLE aes2.customs_information
TRUNCATE TABLE aes2.customs_message_kanal
TRUNCATE TABLE aes2.ecs_exp_cancellation_request
TRUNCATE TABLE aes2.ecs_exp_card3_receipient
TRUNCATE TABLE aes2.ecs_exp_consignee
TRUNCATE TABLE aes2.ecs_exp_decl_br_c
TRUNCATE TABLE aes2.ecs_exp_declarant
TRUNCATE TABLE aes2.ecs_exp_deferred_payment
TRUNCATE TABLE aes2.ecs_exp_exporter
TRUNCATE TABLE aes2.ecs_exp_goods_item
TRUNCATE TABLE aes2.ecs_exp_itinerary
TRUNCATE TABLE aes2.ecs_exp_seal
TRUNCATE TABLE aes2.ecs_exp_stat_requ
TRUNCATE TABLE aes2.ecs_exp_trader_at_present
TRUNCATE TABLE aes2.ecs_ext_additional_info
TRUNCATE TABLE aes2.ecs_ext_consignee
TRUNCATE TABLE aes2.ecs_ext_decl_br_c
TRUNCATE TABLE aes2.ecs_ext_exporter
TRUNCATE TABLE aes2.ecs_ext_goods_item
TRUNCATE TABLE aes2.ecs_ext_itinerary
TRUNCATE TABLE aes2.ecs_ext_risk_analysis
TRUNCATE TABLE aes2.ecs_ext_seal
TRUNCATE TABLE aes2.ecs_ext_trader_at_exit
TRUNCATE TABLE aes2.ecs_followup
TRUNCATE TABLE aes2.ecs_los_consignee
TRUNCATE TABLE aes2.ecs_los_declarant
TRUNCATE TABLE aes2.ecs_los_exporter
TRUNCATE TABLE aes2.ecs_los_goods_item
TRUNCATE TABLE aes2.ecs_los_itinerary
TRUNCATE TABLE aes2.ecs_los_risk_analysis
TRUNCATE TABLE aes2.ecs_los_seal
TRUNCATE TABLE aes2.ecs_los_submitter
TRUNCATE TABLE aes2.ecs_mft_goodsitem
TRUNCATE TABLE aes2.ecs_mft_trader_at_exit
TRUNCATE TABLE aes2.ecs_query_exportquery
TRUNCATE TABLE aes2.ecs_spp_consignee
TRUNCATE TABLE aes2.ecs_spp_declarant
TRUNCATE TABLE aes2.ecs_spp_deferred_payment
TRUNCATE TABLE aes2.ecs_spp_exporter
TRUNCATE TABLE aes2.ecs_spp_goods_item
TRUNCATE TABLE aes2.ecs_spp_itinerary
TRUNCATE TABLE aes2.ecs_spp_seal
TRUNCATE TABLE aes2.ecs_spp_seal_suppl
TRUNCATE TABLE aes2.ecs_sum_consignee
TRUNCATE TABLE aes2.ecs_sum_declarant
TRUNCATE TABLE aes2.ecs_sum_exporter
TRUNCATE TABLE aes2.ecs_sum_goods_item
TRUNCATE TABLE aes2.ecs_sum_itinerary
TRUNCATE TABLE aes2.ecs_sum_seal
TRUNCATE TABLE aes2.ecs_sum_submitter
TRUNCATE TABLE aes2.ecs_sum_trader_at_exit
TRUNCATE TABLE aes2.ecs_trs_req_doc
TRUNCATE TABLE aes2.ecs_trs_reservation
TRUNCATE TABLE aes2.ecs_zwp_consignee
TRUNCATE TABLE aes2.ecs_zwp_decl_pt_c
TRUNCATE TABLE aes2.ecs_zwp_exporter
TRUNCATE TABLE aes2.ecs_zwp_goods_item
TRUNCATE TABLE aes2.ecs_zwp_itinerary
TRUNCATE TABLE aes2.ecs_zwp_seal
TRUNCATE TABLE aes2.ecs_zwp_trader_at_present
TRUNCATE TABLE aes2.ecs_exp_consignee_of_item
TRUNCATE TABLE aes2.ecs_exp_container
TRUNCATE TABLE aes2.ecs_exp_correction
TRUNCATE TABLE aes2.ecs_exp_exporter_of_item
TRUNCATE TABLE aes2.ecs_exp_item_br_c
TRUNCATE TABLE aes2.ecs_exp_national_add_code
TRUNCATE TABLE aes2.ecs_exp_package
TRUNCATE TABLE aes2.ecs_exp_previous_document
TRUNCATE TABLE aes2.ecs_exp_produced_document
TRUNCATE TABLE aes2.ecs_exp_quantity_of_goods
TRUNCATE TABLE aes2.ecs_exp_special_mention
TRUNCATE TABLE aes2.ecs_exp_taric_add_code
TRUNCATE TABLE aes2.ecs_exp_tariff_measure
TRUNCATE TABLE aes2.ecs_exp_tax
TRUNCATE TABLE aes2.ecs_ext_consignee_of_item
TRUNCATE TABLE aes2.ecs_ext_container
TRUNCATE TABLE aes2.ecs_ext_exporter_of_item
TRUNCATE TABLE aes2.ecs_ext_item_br_c
TRUNCATE TABLE aes2.ecs_ext_package
TRUNCATE TABLE aes2.ecs_ext_previous_document
TRUNCATE TABLE aes2.ecs_ext_produced_document
TRUNCATE TABLE aes2.ecs_ext_special_mention
TRUNCATE TABLE aes2.ecs_los_consignee_of_item
TRUNCATE TABLE aes2.ecs_los_container
TRUNCATE TABLE aes2.ecs_los_exporter_of_item
TRUNCATE TABLE aes2.ecs_los_package
TRUNCATE TABLE aes2.ecs_los_produced_document
TRUNCATE TABLE aes2.ecs_mft_customsdata
TRUNCATE TABLE aes2.ecs_query_consignee
TRUNCATE TABLE aes2.ecs_query_exporter
TRUNCATE TABLE aes2.ecs_query_goods_item
TRUNCATE TABLE aes2.ecs_query_itinerary
TRUNCATE TABLE aes2.ecs_query_risk_analysis
TRUNCATE TABLE aes2.ecs_query_seal
TRUNCATE TABLE aes2.ecs_spp_consignee_of_item
TRUNCATE TABLE aes2.ecs_spp_container
TRUNCATE TABLE aes2.ecs_spp_exporter_of_item
TRUNCATE TABLE aes2.ecs_spp_nat_add_code_suppl
TRUNCATE TABLE aes2.ecs_spp_national_add_code
TRUNCATE TABLE aes2.ecs_spp_package
TRUNCATE TABLE aes2.ecs_spp_prev_doc_proc_gosp
TRUNCATE TABLE aes2.ecs_spp_previous_document
TRUNCATE TABLE aes2.ecs_spp_produced_document
TRUNCATE TABLE aes2.ecs_spp_quantity_of_goods
TRUNCATE TABLE aes2.ecs_spp_special_mention
TRUNCATE TABLE aes2.ecs_spp_tar_add_cod_spp
TRUNCATE TABLE aes2.ecs_spp_taric_add_code
TRUNCATE TABLE aes2.ecs_spp_tariff_measure
TRUNCATE TABLE aes2.ecs_spp_tax
TRUNCATE TABLE aes2.ecs_sum_consignee_of_item
TRUNCATE TABLE aes2.ecs_sum_container
TRUNCATE TABLE aes2.ecs_sum_exporter_of_item
TRUNCATE TABLE aes2.ecs_sum_package
TRUNCATE TABLE aes2.ecs_sum_produced_document
TRUNCATE TABLE aes2.ecs_sum_tariff_measure
TRUNCATE TABLE aes2.ecs_zwp_consignee_of_item
TRUNCATE TABLE aes2.ecs_zwp_container
TRUNCATE TABLE aes2.ecs_zwp_exporter_of_item
TRUNCATE TABLE aes2.ecs_zwp_item_pt_c
TRUNCATE TABLE aes2.ecs_zwp_package
TRUNCATE TABLE aes2.ecs_zwp_previous_document
TRUNCATE TABLE aes2.ecs_zwp_produced_document
TRUNCATE TABLE aes2.ecs_zwp_special_mention
TRUNCATE TABLE aes2.ecs_query_consignee_of_item
TRUNCATE TABLE aes2.ecs_query_container
TRUNCATE TABLE aes2.ecs_query_exporter_of_item
TRUNCATE TABLE aes2.ecs_query_package
TRUNCATE TABLE aes2.ecs_query_previous_document
TRUNCATE TABLE aes2.ecs_query_produced_document
TRUNCATE TABLE aes2.ecs_query_special_mention
TRUNCATE TABLE aes2.AEO_CERTIFICATE_GROUP

TRUNCATE TABLE aes2.aes_other
TRUNCATE TABLE aes2.aes_other_trader
TRUNCATE TABLE aes2.aes_other_destination

TRUNCATE TABLE aes2.aes_psw_natural_pers_add_info
TRUNCATE TABLE aes2.aes_psw_business_entity
TRUNCATE TABLE aes2.aes_psw_item_add_info
TRUNCATE TABLE aes2.AES_PSW_ITEM_CONTAINER
TRUNCATE TABLE aes2.aes_psw_item_pack
TRUNCATE TABLE aes2.aes_psw_item_prev_doc
TRUNCATE TABLE aes2.aes_psw_item_req_doc
TRUNCATE TABLE aes2.aes_psw_natural_person
TRUNCATE TABLE aes2.aes_psw
TRUNCATE TABLE aes2.aes_psw_additional_info
TRUNCATE TABLE aes2.aes_psw_address
TRUNCATE TABLE aes2.aes_psw_business_entity_ai
TRUNCATE TABLE aes2.aes_psw_doc_signer
TRUNCATE TABLE aes2.aes_psw_item


END