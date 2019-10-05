	-- =============================================
-- Author:		Aleksander ?u?ny
-- Create date: 2014-07-14
-- Description:	Procedura Merge
-- =============================================
CREATE PROCEDURE [aies].[MergeTableFromStageODS] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END
	IF @TableName = 'customs_decl' BEGIN
		MERGE INTO aies.customs_decl AS tgt
		USING [WI_StageODS].aies.customs_decl AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.version=src.version, tgt.return_email=src.return_email, tgt.self_ref=src.self_ref, tgt.ref_no=src.ref_no, tgt.flag=src.flag, tgt.decl_type=src.decl_type, tgt.dts=src.dts, tgt.emergency=src.emergency, tgt.return_post=src.return_post, tgt.phase=src.phase
		WHEN NOT MATCHED
		THEN INSERT (id, version, return_email, self_ref, ref_no, flag, decl_type, dts, emergency, return_post, phase)
		VALUES (src.id, src.version, src.return_email, src.self_ref, src.ref_no, src.flag, src.decl_type, src.dts, src.emergency, src.return_post, src.phase);
        SET @Merged = 1;
	END
	IF @TableName = 'customs_directive' BEGIN
		MERGE INTO aies.customs_directive AS tgt
		USING [WI_StageODS].aies.customs_directive AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.addressee=src.addressee, tgt.author=src.author, tgt.dir_for_next_co=src.dir_for_next_co, tgt.dir_dispatcher=src.dir_dispatcher, tgt.information=src.information, tgt.warue=src.warue, tgt.war1=src.war1, tgt.war234=src.war234, tgt.war5=src.war5, tgt.COMMENT=src.COMMENT, tgt.control_method=src.control_method, tgt.mrn=src.mrn, tgt.control_tool=src.control_tool, tgt.item_number=src.item_number, tgt.algorithm_number=src.algorithm_number, tgt.objection_number=src.objection_number, tgt.risk_area=src.risk_area, tgt.risk_level=src.risk_level, tgt.samples=src.samples, tgt.profile=src.profile, tgt.segment=src.segment, tgt.status=src.status, tgt.text=src.text, tgt.control_type=src.control_type, tgt.pointer=src.pointer, tgt.result=src.result, tgt.source=src.source, tgt.decl_id=src.decl_id, tgt.item_type=src.item_type, tgt.method_risk_level=src.method_risk_level, tgt.realisation_date=src.realisation_date, tgt.id_verification_item=src.id_verification_item, tgt.dirtype=src.dirtype, tgt.intro=src.intro, tgt.origin=src.origin, tgt.verification_required=src.verification_required, tgt.MODIFIED_BY=src.MODIFIED_BY
		WHEN NOT MATCHED
		THEN INSERT (id, addressee, author, dir_for_next_co, dir_dispatcher, information, warue, war1, war234, war5, COMMENT, control_method, mrn, control_tool, item_number, algorithm_number, objection_number, risk_area, risk_level, samples, profile, segment, status, text, control_type, pointer, result, source, decl_id, item_type, method_risk_level, realisation_date, id_verification_item, dirtype, intro, origin, verification_required, MODIFIED_BY)
		VALUES (src.id, src.addressee, src.author, src.dir_for_next_co, src.dir_dispatcher, src.information, src.warue, src.war1, src.war234, src.war5, src.COMMENT, src.control_method, src.mrn, src.control_tool, src.item_number, src.algorithm_number, src.objection_number, src.risk_area, src.risk_level, src.samples, src.profile, src.segment, src.status, src.text, src.control_type, src.pointer, src.result, src.source, src.decl_id, src.item_type, src.method_risk_level, src.realisation_date, src.id_verification_item, src.dirtype, src.intro, src.origin, src.verification_required, src.MODIFIED_BY);
        SET @Merged = 1;
	END
	IF @TableName = 'customs_change' BEGIN
		MERGE INTO aies.customs_change AS tgt
		USING [WI_StageODS].aies.customs_change AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.before_change=src.before_change, tgt.after_change=src.after_change, tgt.item=src.item, tgt.operation_id=src.operation_id
		WHEN NOT MATCHED
		THEN INSERT (id, before_change, after_change, item, operation_id)
		VALUES (src.id, src.before_change, src.after_change, src.item, src.operation_id);
        SET @Merged = 1;
	END
	IF @TableName = 'customs_operation' BEGIN
		MERGE INTO aies.customs_operation AS tgt
		USING [WI_StageODS].aies.customs_operation AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.operator=src.operator, tgt.annotation=src.annotation, tgt.time_op=src.time_op, tgt.decl_id=src.decl_id, tgt.kind_of_annotation=src.kind_of_annotation
		WHEN NOT MATCHED
		THEN INSERT (id, code, operator, annotation, time_op, decl_id, kind_of_annotation)
		VALUES (src.id, src.code, src.operator, src.annotation, src.time_op, src.decl_id, src.kind_of_annotation);
        SET @Merged = 1;
	END
	IF @TableName = 'customs_verification_item' BEGIN
		MERGE INTO aies.customs_verification_item AS tgt
		USING [WI_StageODS].aies.customs_verification_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.author=src.author, tgt.decl_id=src.decl_id, tgt.executor=src.executor, tgt.item_type=src.item_type, tgt.item_number=src.item_number, tgt.status=src.status, tgt.war_code=src.war_code, tgt.war_ue_code=src.war_ue_code, tgt.origin=src.origin, tgt.profile=src.profile, tgt.pointer=src.pointer, tgt.version=src.version
		WHEN NOT MATCHED
		THEN INSERT (id, author, decl_id, executor, item_type, item_number, status, war_code, war_ue_code, origin, profile, pointer, version)
		VALUES (src.id, src.author, src.decl_id, src.executor, src.item_type, src.item_number, src.status, src.war_code, src.war_ue_code, src.origin, src.profile, src.pointer, src.version);
        SET @Merged = 1;
	END
	IF @TableName = 'customs_information' BEGIN
		MERGE INTO aies.customs_information AS tgt
		USING [WI_StageODS].aies.customs_information AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.information=src.information
		WHEN NOT MATCHED
		THEN INSERT (id, information)
		VALUES (src.id, src.information);
        SET @Merged = 1;
	END
	IF @TableName = 'customs_directive_change' BEGIN
		MERGE INTO aies.customs_directive_change AS tgt
		USING [WI_StageODS].aies.customs_directive_change AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.diid=src.diid, tgt.affects=src.affects, tgt.AFTER=src.AFTER, tgt.justification=src.justification, tgt.initial_value=src.initial_value
		WHEN NOT MATCHED
		THEN INSERT (id, code, diid, affects, AFTER, justification, initial_value)
		VALUES (src.id, src.code, src.diid, src.affects, src.AFTER, src.justification, src.initial_value);
        SET @Merged = 1;
	END
	IF @TableName ='customs_directive_intr' BEGIN
		MERGE INTO aies.customs_directive_intr AS tgt
		USING [WI_StageODS].aies.customs_directive_intr AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.diid=src.diid
		WHEN NOT MATCHED
		THEN INSERT (id, code, diid)
		VALUES (src.id, src.code, src.diid);
        SET @Merged = 1;
	END
	IF @TableName = 'customs_directive_pointer' BEGIN
		MERGE INTO aies.customs_directive_pointer AS tgt
		USING [WI_StageODS].aies.customs_directive_pointer AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.diid=src.diid, tgt.name=src.name, tgt.type=src.type, tgt.value=src.value
		WHEN NOT MATCHED
		THEN INSERT (id, code, diid, name, type, value)
		VALUES (src.id, src.code, src.diid, src.name, src.type, src.value);
        SET @Merged = 1;
	END
	/* Pierwszy kontener */
	IF @TableName = 'ecs_exp_declcoexport' BEGIN
		MERGE INTO aies.ecs_exp_declcoexport AS tgt
		USING [WI_StageODS].aies.ecs_exp_declcoexport AS src
		ON (tgt.decl_id=src.decl_id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.exp_gross_mass=src.exp_gross_mass, tgt.exp_gross_mass_br_c=src.exp_gross_mass_br_c, tgt.exp_no_of_items_br_c=src.exp_no_of_items_br_c, tgt.crb_code=src.crb_code, tgt.crb_state_of_seals=src.crb_state_of_seals, tgt.pad_place=src.pad_place, tgt.pad_capacity=src.pad_capacity, tgt.pad_phone=src.pad_phone, tgt.pad_name=src.pad_name, tgt.pad_date=src.pad_date, tgt.si_quantity=src.si_quantity, tgt.cr_code=src.cr_code, tgt.lof_co=src.lof_co, tgt.lof_location_desc=src.lof_location_desc, tgt.lof_location_code=src.lof_location_code, tgt.pos_location_desc=src.pos_location_desc, tgt.pos_location_code=src.pos_location_code, tgt.it_identity_br=src.it_identity_br, tgt.it_identity_br_c=src.it_identity_br_c, tgt.it_identity=src.it_identity, tgt.it_mode=src.it_mode, tgt.exp_co_of_exit=src.exp_co_of_exit, tgt.exp_co_of_exit_changed_to=src.exp_co_of_exit_changed_to, tgt.exp_storing=src.exp_storing, tgt.exp_co_of_export=src.exp_co_of_export, tgt.exp_decl_type_1a=src.exp_decl_type_1a, tgt.exp_no_of_items=src.exp_no_of_items, tgt.exp_no_of_items_br=src.exp_no_of_items_br, tgt.exp_no_of_packages=src.exp_no_of_packages, tgt.exp_no_of_packages_br=src.exp_no_of_packages_br, tgt.exp_no_of_packages_br_c=src.exp_no_of_packages_br_c, tgt.exp_country_of_export=src.exp_country_of_export, tgt.exp_country_of_destinatnion=src.exp_country_of_destinatnion, tgt.exp_containers=src.exp_containers, tgt.exp_gross_mass_br=src.exp_gross_mass_br, tgt.exp_acceptance_date=src.exp_acceptance_date, tgt.exp_time_to_border_arrival=src.exp_time_to_border_arrival, tgt.dt_code=src.dt_code, tgt.dt_place=src.dt_place, tgt.dt_place_code=src.dt_place_code, tgt.w_location_code=src.w_location_code, tgt.w_type=src.w_type, tgt.w_country=src.w_country, tgt.tab_country=src.tab_country, tgt.tab_identity=src.tab_identity, tgt.tab_mode=src.tab_mode, tgt.sc_street_and_number=src.sc_street_and_number, tgt.sc_post_code=src.sc_post_code, tgt.sc_city=src.sc_city, tgt.sc_co=src.sc_co, tgt.sc_name=src.sc_name, tgt.sc_country=src.sc_country, tgt.td_amount=src.td_amount, tgt.td_exchange_rate=src.td_exchange_rate, tgt.td_nature_of_transation=src.td_nature_of_transation, tgt.td_currency=src.td_currency, tgt.exp_decl_type_1b=src.exp_decl_type_1b, tgt.exp_crn=src.exp_crn, tgt.exp_un_dangerous_goods=src.exp_un_dangerous_goods, tgt.exp_taxes_amount=src.exp_taxes_amount, tgt.exp_specific_circumstance=src.exp_specific_circumstance, tgt.exp_digital_signature=src.exp_digital_signature, tgt.exp_time_to_release_decision=src.exp_time_to_release_decision, tgt.exp_time_to_exit_results=src.exp_time_to_exit_results, tgt.exp_time_to_send_exp_confirm=src.exp_time_to_send_exp_confirm, tgt.exp_sp=src.exp_sp, tgt.exp_exit_date=src.exp_exit_date, tgt.exp_exit_stopped_date=src.exp_exit_stopped_date, tgt.exp_release_date=src.exp_release_date, tgt.exp_status=src.exp_status, tgt.exp_time_to_auto_acceptance=src.exp_time_to_auto_acceptance, tgt.exp_transport_charges_mp=src.exp_transport_charges_mp, tgt.exp_tran_char_mp_di=src.exp_tran_char_mp_di, tgt.exp_tran_char_mp_di_c=src.exp_tran_char_mp_di_c, tgt.exp_crn_di=src.exp_crn_di, tgt.exp_crn_di_c=src.exp_crn_di_c, tgt.exp_supp_decl_delivery_date=src.exp_supp_decl_delivery_date, tgt.exp_co_of_supplement=src.exp_co_of_supplement, tgt.exp_time_to_delivery_suppl=src.exp_time_to_delivery_suppl, tgt.exp_supplement_decl=src.exp_supplement_decl, tgt.printead=src.printead, tgt.from_emcs=src.from_emcs, tgt.exp_co_of_present=src.exp_co_of_present, tgt.transit=src.transit, tgt.presentation_goods_co=src.presentation_goods_co, tgt.centralised_customs=src.centralised_customs
		WHEN NOT MATCHED
		THEN INSERT (decl_id, exp_gross_mass, exp_gross_mass_br_c, exp_no_of_items_br_c, crb_code, crb_state_of_seals, pad_place, pad_capacity, pad_phone, pad_name, pad_date, si_quantity, cr_code, lof_co, lof_location_desc, lof_location_code, pos_location_desc, pos_location_code, it_identity_br, it_identity_br_c, it_identity, it_mode, exp_co_of_exit, exp_co_of_exit_changed_to, exp_storing, exp_co_of_export, exp_decl_type_1a, exp_no_of_items, exp_no_of_items_br, exp_no_of_packages, exp_no_of_packages_br, exp_no_of_packages_br_c, exp_country_of_export, exp_country_of_destinatnion, exp_containers, exp_gross_mass_br, exp_acceptance_date, exp_time_to_border_arrival, dt_code, dt_place, dt_place_code, w_location_code, w_type, w_country, tab_country, tab_identity, tab_mode, sc_street_and_number, sc_post_code, sc_city, sc_co, sc_name, sc_country, td_amount, td_exchange_rate, td_nature_of_transation, td_currency, exp_decl_type_1b, exp_crn, exp_un_dangerous_goods, exp_taxes_amount, exp_specific_circumstance, exp_digital_signature, exp_time_to_release_decision, exp_time_to_exit_results, exp_time_to_send_exp_confirm, exp_sp, exp_exit_date, exp_exit_stopped_date, exp_release_date, exp_status, exp_time_to_auto_acceptance, exp_transport_charges_mp, exp_tran_char_mp_di, exp_tran_char_mp_di_c, exp_crn_di, exp_crn_di_c, exp_supp_decl_delivery_date, exp_co_of_supplement, exp_time_to_delivery_suppl, exp_supplement_decl, printead, from_emcs, exp_co_of_present, transit, presentation_goods_co, centralised_customs)
		VALUES (src.decl_id, src.exp_gross_mass, src.exp_gross_mass_br_c, src.exp_no_of_items_br_c, src.crb_code, src.crb_state_of_seals, src.pad_place, src.pad_capacity, src.pad_phone, src.pad_name, src.pad_date, src.si_quantity, src.cr_code, src.lof_co, src.lof_location_desc, src.lof_location_code, src.pos_location_desc, src.pos_location_code, src.it_identity_br, src.it_identity_br_c, src.it_identity, src.it_mode, src.exp_co_of_exit, src.exp_co_of_exit_changed_to, src.exp_storing, src.exp_co_of_export, src.exp_decl_type_1a, src.exp_no_of_items, src.exp_no_of_items_br, src.exp_no_of_packages, src.exp_no_of_packages_br, src.exp_no_of_packages_br_c, src.exp_country_of_export, src.exp_country_of_destinatnion, src.exp_containers, src.exp_gross_mass_br, src.exp_acceptance_date, src.exp_time_to_border_arrival, src.dt_code, src.dt_place, src.dt_place_code, src.w_location_code, src.w_type, src.w_country, src.tab_country, src.tab_identity, src.tab_mode, src.sc_street_and_number, src.sc_post_code, src.sc_city, src.sc_co, src.sc_name, src.sc_country, src.td_amount, src.td_exchange_rate, src.td_nature_of_transation, src.td_currency, src.exp_decl_type_1b, src.exp_crn, src.exp_un_dangerous_goods, src.exp_taxes_amount, src.exp_specific_circumstance, src.exp_digital_signature, src.exp_time_to_release_decision, src.exp_time_to_exit_results, src.exp_time_to_send_exp_confirm, src.exp_sp, src.exp_exit_date, src.exp_exit_stopped_date, src.exp_release_date, src.exp_status, src.exp_time_to_auto_acceptance, src.exp_transport_charges_mp, src.exp_tran_char_mp_di, src.exp_tran_char_mp_di_c, src.exp_crn_di, src.exp_crn_di_c, src.exp_supp_decl_delivery_date, src.exp_co_of_supplement, src.exp_time_to_delivery_suppl, src.exp_supplement_decl, src.printead, src.from_emcs, src.exp_co_of_present, src.transit, src.presentation_goods_co, src.centralised_customs);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_card3_receipient' BEGIN
		MERGE INTO aies.ecs_exp_card3_receipient AS tgt
		USING [WI_StageODS].aies.ecs_exp_card3_receipient AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.declcoexport_decl_id=src.declcoexport_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, declcoexport_decl_id)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.declcoexport_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_deferred_payment' BEGIN
		MERGE INTO aies.ecs_exp_deferred_payment AS tgt
		USING [WI_StageODS].aies.ecs_exp_deferred_payment AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ref=src.ref, tgt.declcoexport_decl_id=src.declcoexport_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, ref, declcoexport_decl_id)
		VALUES (src.id, src.ref, src.declcoexport_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_itinerary' BEGIN
		MERGE INTO aies.ecs_exp_deferred_payment AS tgt
		USING [WI_StageODS].aies.ecs_exp_deferred_payment AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ref=src.ref, tgt.declcoexport_decl_id=src.declcoexport_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, ref, declcoexport_decl_id)
		VALUES (src.id, src.ref, src.declcoexport_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_cancellation_request' BEGIN
		MERGE INTO aies.ecs_exp_cancellation_request AS tgt
		USING [WI_StageODS].aies.ecs_exp_cancellation_request AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.msg_id=src.msg_id, tgt.return_mail=src.return_mail, tgt.reason_of_request=src.reason_of_request, tgt.date_of_request=src.date_of_request, tgt.date_of_cancellation_decision=src.date_of_cancellation_decision, tgt.justification_of_decision=src.justification_of_decision, tgt.status=src.status, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.return_post=src.return_post
		WHEN NOT MATCHED
		THEN INSERT (id, msg_id, return_mail, reason_of_request, date_of_request, date_of_cancellation_decision, justification_of_decision, status, declcoexport_decl_id, return_post)
		VALUES (src.id, src.msg_id, src.return_mail, src.reason_of_request, src.date_of_request, src.date_of_cancellation_decision, src.justification_of_decision, src.status, src.declcoexport_decl_id, src.return_post);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_seal' BEGIN
		MERGE INTO aies.ecs_exp_seal AS tgt
		USING [WI_StageODS].aies.ecs_exp_seal AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ident=src.ident, tgt.declcoexport_decl_id=src.declcoexport_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, ident, declcoexport_decl_id)
		VALUES (src.id, src.ident, src.declcoexport_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_exporter' BEGIN
		MERGE INTO aies.ecs_exp_exporter AS tgt
		USING [WI_StageODS].aies.ecs_exp_exporter AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, declcoexport_decl_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.declcoexport_decl_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_decl_br_c' BEGIN
		MERGE INTO aies.ecs_exp_decl_br_c AS tgt
		USING [WI_StageODS].aies.ecs_exp_decl_br_c AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.comment_f=src.comment_f, tgt.declcoexport_decl_id=src.declcoexport_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, comment_f, declcoexport_decl_id)
		VALUES (src.id, src.comment_f, src.declcoexport_decl_id);
        SET @Merged = 1;		
	END
	IF @TableName = 'ecs_exp_declarant' BEGIN
		MERGE INTO aies.ecs_exp_declarant AS tgt
		USING [WI_StageODS].aies.ecs_exp_declarant AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.representative_status=src.representative_status, tgt.indication=src.indication, tgt.no_of_entry_agents_list=src.no_of_entry_agents_list, tgt.date_of_entry_agent_list=src.date_of_entry_agent_list, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, representative_status, indication, no_of_entry_agents_list, date_of_entry_agent_list, declcoexport_decl_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.representative_status, src.indication, src.no_of_entry_agents_list, src.date_of_entry_agent_list, src.declcoexport_decl_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_consignee' BEGIN
		MERGE INTO aies.ecs_exp_consignee AS tgt
		USING [WI_StageODS].aies.ecs_exp_consignee AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, declcoexport_decl_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.declcoexport_decl_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_stat_requ' BEGIN
		MERGE INTO aies.ecs_exp_stat_requ AS tgt
		USING [WI_StageODS].aies.ecs_exp_stat_requ AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.requ_date=src.requ_date, tgt.requ_sref=src.requ_sref, tgt.resp_date=src.resp_date, tgt.resp_resu=src.resp_resu, tgt.resp_sref=src.resp_sref, tgt.decl_id=src.decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, requ_date, requ_sref, resp_date, resp_resu, resp_sref, decl_id)
		VALUES (src.id, src.requ_date, src.requ_sref, src.resp_date, src.resp_resu, src.resp_sref, src.decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_trader_at_present' BEGIN
		MERGE INTO aies.ecs_exp_trader_at_present AS tgt
		USING [WI_StageODS].aies.ecs_exp_trader_at_present AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcoexport_decl_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcoexport_decl_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_goods_item' BEGIN
		MERGE INTO aies.ecs_exp_goods_item AS tgt
		USING [WI_StageODS].aies.ecs_exp_goods_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_country_of_export=src.gi_country_of_export, tgt.gi_country_of_destination=src.gi_country_of_destination, tgt.gi_gross_mass_br=src.gi_gross_mass_br, tgt.gi_crn=src.gi_crn, tgt.gi_un_dangerous_goods=src.gi_un_dangerous_goods, tgt.gi_taxes_amount=src.gi_taxes_amount, tgt.gi_item_no=src.gi_item_no, tgt.gi_state_br=src.gi_state_br, tgt.vog_statistical_value=src.vog_statistical_value, tgt.vog_statistical_currency=src.vog_statistical_currency, tgt.gi_desc_br=src.gi_desc_br, tgt.gi_cn_code=src.gi_cn_code, tgt.gi_taric_code=src.gi_taric_code, tgt.gi_commodity_code_br=src.gi_commodity_code_br, tgt.gi_country_of_origin=src.gi_country_of_origin, tgt.gi_proc_requested=src.gi_proc_requested, tgt.gi_proc_previous=src.gi_proc_previous, tgt.gi_proc_detail=src.gi_proc_detail, tgt.gi_net_mass=src.gi_net_mass, tgt.gi_net_mass_br=src.gi_net_mass_br, tgt.gi_quantity_suppl_unit=src.gi_quantity_suppl_unit, tgt.gi_desc=src.gi_desc, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.gi_transport_charges_mp=src.gi_transport_charges_mp, tgt.gi_crn_di=src.gi_crn_di, tgt.gi_tar_fir_cod_di=src.gi_tar_fir_cod_di, tgt.gi_tar_sec_cod_di=src.gi_tar_sec_cod_di, tgt.gi_transport_charges_mp_di=src.gi_transport_charges_mp_di, tgt.gi_un_dangerous_goods_di=src.gi_un_dangerous_goods_di, tgt.vog_statistical_currency_di=src.vog_statistical_currency_di, tgt.vog_statistical_value_di=src.vog_statistical_value_di
		WHEN NOT MATCHED
		THEN INSERT (id, gi_gross_mass, gi_country_of_export, gi_country_of_destination, gi_gross_mass_br, gi_crn, gi_un_dangerous_goods, gi_taxes_amount, gi_item_no, gi_state_br, vog_statistical_value, vog_statistical_currency, gi_desc_br, gi_cn_code, gi_taric_code, gi_commodity_code_br, gi_country_of_origin, gi_proc_requested, gi_proc_previous, gi_proc_detail, gi_net_mass, gi_net_mass_br, gi_quantity_suppl_unit, gi_desc, declcoexport_decl_id, gi_transport_charges_mp, gi_crn_di, gi_tar_fir_cod_di, gi_tar_sec_cod_di, gi_transport_charges_mp_di, gi_un_dangerous_goods_di, vog_statistical_currency_di, vog_statistical_value_di)
		VALUES (src.id, src.gi_gross_mass, src.gi_country_of_export, src.gi_country_of_destination, src.gi_gross_mass_br, src.gi_crn, src.gi_un_dangerous_goods, src.gi_taxes_amount, src.gi_item_no, src.gi_state_br, src.vog_statistical_value, src.vog_statistical_currency, src.gi_desc_br, src.gi_cn_code, src.gi_taric_code, src.gi_commodity_code_br, src.gi_country_of_origin, src.gi_proc_requested, src.gi_proc_previous, src.gi_proc_detail, src.gi_net_mass, src.gi_net_mass_br, src.gi_quantity_suppl_unit, src.gi_desc, src.declcoexport_decl_id, src.gi_transport_charges_mp, src.gi_crn_di, src.gi_tar_fir_cod_di, src.gi_tar_sec_cod_di, src.gi_transport_charges_mp_di, src.gi_un_dangerous_goods_di, src.vog_statistical_currency_di, src.vog_statistical_value_di);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_tax' BEGIN
		MERGE INTO aies.ecs_exp_tax AS tgt
		USING [WI_StageODS].aies.ecs_exp_tax AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.base=src.base, tgt.rate=src.rate, tgt.amount=src.amount, tgt.method_of_payment=src.method_of_payment, tgt.type=src.type, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, base, rate, amount, method_of_payment, type, goods_item_id)
		VALUES (src.id, src.base, src.rate, src.amount, src.method_of_payment, src.type, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_tariff_measure' BEGIN
		MERGE INTO aies.ecs_exp_tariff_measure AS tgt
		USING [WI_StageODS].aies.ecs_exp_tariff_measure AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.taric_sid=src.taric_sid, tgt.series=src.series, tgt.geographical_area=src.geographical_area, tgt.order_no=src.order_no, tgt.suppl_unit=src.suppl_unit, tgt.suppl_unit_qualifier=src.suppl_unit_qualifier, tgt.type=src.type, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, taric_sid, series, geographical_area, order_no, suppl_unit, suppl_unit_qualifier, type, goods_item_id)
		VALUES (src.id, src.taric_sid, src.series, src.geographical_area, src.order_no, src.suppl_unit, src.suppl_unit_qualifier, src.type, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_taric_add_code' BEGIN
		MERGE INTO aies.ecs_exp_taric_add_code AS tgt
		USING [WI_StageODS].aies.ecs_exp_taric_add_code AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, code, goods_item_id)
		VALUES (src.id, src.code, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_special_mention' BEGIN
		MERGE INTO aies.ecs_exp_special_mention AS tgt
		USING [WI_StageODS].aies.ecs_exp_special_mention AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.text=src.text, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, code, text, goods_item_id)
		VALUES (src.id, src.code, src.text, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_quantity_of_goods' BEGIN
		MERGE INTO aies.ecs_exp_quantity_of_goods AS tgt
		USING [WI_StageODS].aies.ecs_exp_quantity_of_goods AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.unit=src.unit, tgt.qualifier_of_unit=src.qualifier_of_unit, tgt.quantity=src.quantity, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, unit, qualifier_of_unit, quantity, goods_item_id)
		VALUES (src.id, src.unit, src.qualifier_of_unit, src.quantity, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_produced_document' BEGIN
		MERGE INTO aies.ecs_exp_produced_document AS tgt
		USING [WI_StageODS].aies.ecs_exp_produced_document AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.state_br=src.state_br, tgt.state_br_c=src.state_br_c, tgt.type=src.type, tgt.ref=src.ref, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, state_br, state_br_c, type, ref, goods_item_id)
		VALUES (src.id, src.state_br, src.state_br_c, src.type, src.ref, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_package' BEGIN
		MERGE INTO aies.ecs_exp_package AS tgt
		USING [WI_StageODS].aies.ecs_exp_package AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.no_of_packages=src.no_of_packages, tgt.kind=src.kind, tgt.no_of_pieces=src.no_of_pieces, tgt.state_br=src.state_br, tgt.marks=src.marks, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, no_of_packages, kind, no_of_pieces, state_br, marks, goods_item_id)
		VALUES (src.id, src.no_of_packages, src.kind, src.no_of_pieces, src.state_br, src.marks, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_national_add_code' BEGIN
		MERGE INTO aies.ecs_exp_national_add_code AS tgt
		USING [WI_StageODS].aies.ecs_exp_national_add_code AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, code, goods_item_id)
		VALUES (src.id, src.code, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_exporter_of_item' BEGIN
		MERGE INTO aies.ecs_exp_exporter_of_item AS tgt
		USING [WI_StageODS].aies.ecs_exp_exporter_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.goods_item_id=src.goods_item_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, goods_item_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.goods_item_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_item_br_c' BEGIN
		MERGE INTO aies.ecs_exp_item_br_c AS tgt
		USING [WI_StageODS].aies.ecs_exp_item_br_c AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.comment_f=src.comment_f, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, comment_f, goods_item_id)
		VALUES (src.id, src.comment_f, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_correction' BEGIN
		MERGE INTO aies.ecs_exp_correction AS tgt
		USING [WI_StageODS].aies.ecs_exp_correction AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.value=src.value, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, code, value, goods_item_id)
		VALUES (src.id, src.code, src.value, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_container' BEGIN
		MERGE INTO aies.ecs_exp_container AS tgt
		USING [WI_StageODS].aies.ecs_exp_container AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.state_br=src.state_br, tgt.identity_f=src.identity_f, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, state_br, identity_f, goods_item_id)
		VALUES (src.id, src.state_br, src.identity_f, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_consignee_of_item' BEGIN
		MERGE INTO aies.ecs_exp_consignee_of_item AS tgt
		USING [WI_StageODS].aies.ecs_exp_consignee_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.goods_item_id=src.goods_item_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, goods_item_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.goods_item_id, src.eori, src.email);
        SET @Merged = 1;
	END
	/* Drugi kontener */
	IF @TableName = 'ecs_ext_declcoexit' BEGIN 
		MERGE INTO aies.ecs_ext_declcoexit AS tgt
		USING [WI_StageODS].aies.ecs_ext_declcoexit AS src
		ON (tgt.decl_id=src.decl_id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ext_gross_mass=src.ext_gross_mass, tgt.ext_gross_mass_br_c=src.ext_gross_mass_br_c, tgt.ext_no_of_items_br_c=src.ext_no_of_items_br_c, tgt.crb_code=src.crb_code, tgt.crb_state_of_seals=src.crb_state_of_seals, tgt.pad_place=src.pad_place, tgt.pad_date=src.pad_date, tgt.s_quantity=src.s_quantity, tgt.cr_code=src.cr_code, tgt.log_co=src.log_co, tgt.log_location_desc=src.log_location_desc, tgt.log_location_code=src.log_location_code, tgt.pos_location_desc=src.pos_location_desc, tgt.pos_location_code=src.pos_location_code, tgt.it_identity_br=src.it_identity_br, tgt.it_identity_br_c=src.it_identity_br_c, tgt.it_identity=src.it_identity, tgt.ext_ecs_decl=src.ext_ecs_decl, tgt.ext_co_of_exit=src.ext_co_of_exit, tgt.ext_co_of_exit_declared=src.ext_co_of_exit_declared, tgt.ext_co_of_exit_changed_to=src.ext_co_of_exit_changed_to, tgt.ext_storing=src.ext_storing, tgt.ext_co_of_export=src.ext_co_of_export, tgt.ext_decl_type_1a=src.ext_decl_type_1a, tgt.ext_no_of_items=src.ext_no_of_items, tgt.ext_no_of_items_br=src.ext_no_of_items_br, tgt.ext_no_of_package=src.ext_no_of_package, tgt.ext_no_of_packages_br=src.ext_no_of_packages_br, tgt.ext_no_of_packages_br_c=src.ext_no_of_packages_br_c, tgt.ext_country_of_export=src.ext_country_of_export, tgt.ext_country_of_dest=src.ext_country_of_dest, tgt.ext_containers=src.ext_containers, tgt.ext_gross_mass_br=src.ext_gross_mass_br, tgt.ext_acceptance_date=src.ext_acceptance_date, tgt.ext_issuing_date=src.ext_issuing_date, tgt.ext_ead_language=src.ext_ead_language, tgt.ext_time_to_send_exit_result=src.ext_time_to_send_exit_result, tgt.ext_time_to_border_arrival=src.ext_time_to_border_arrival, tgt.ext_presentation_date=src.ext_presentation_date, tgt.ext_notification_date=src.ext_notification_date, tgt.ext_status=src.ext_status, tgt.ext_exit_date=src.ext_exit_date, tgt.ext_exit_stopped_date=src.ext_exit_stopped_date, tgt.ext_com_ref_num=src.ext_com_ref_num, tgt.ext_com_ref_num_di=src.ext_com_ref_num_di, tgt.ext_com_ref_num_di_c=src.ext_com_ref_num_di_c, tgt.ext_dec_sub_tim=src.ext_dec_sub_tim, tgt.ext_tra_cha_met=src.ext_tra_cha_met, tgt.ext_tra_cha_met_di=src.ext_tra_cha_met_di, tgt.ext_tra_cha_met_di_c=src.ext_tra_cha_met_di_c, tgt.ext_spe_cir_ind=src.ext_spe_cir_ind, tgt.pad_realDate=src.pad_realDate, tgt.crb_code_before_transit=src.crb_code_before_transit, tgt.transit=src.transit
		WHEN NOT MATCHED
		THEN INSERT (decl_id, ext_gross_mass, ext_gross_mass_br_c, ext_no_of_items_br_c, crb_code, crb_state_of_seals, pad_place, pad_date, s_quantity, cr_code, log_co, log_location_desc, log_location_code, pos_location_desc, pos_location_code, it_identity_br, it_identity_br_c, it_identity, ext_ecs_decl, ext_co_of_exit, ext_co_of_exit_declared, ext_co_of_exit_changed_to, ext_storing, ext_co_of_export, ext_decl_type_1a, ext_no_of_items, ext_no_of_items_br, ext_no_of_package, ext_no_of_packages_br, ext_no_of_packages_br_c, ext_country_of_export, ext_country_of_dest, ext_containers, ext_gross_mass_br, ext_acceptance_date, ext_issuing_date, ext_ead_language, ext_time_to_send_exit_result, ext_time_to_border_arrival, ext_presentation_date, ext_notification_date, ext_status, ext_exit_date, ext_exit_stopped_date, ext_com_ref_num, ext_com_ref_num_di, ext_com_ref_num_di_c, ext_dec_sub_tim, ext_tra_cha_met, ext_tra_cha_met_di, ext_tra_cha_met_di_c, ext_spe_cir_ind, pad_realDate, crb_code_before_transit, transit)
		VALUES (src.decl_id, src.ext_gross_mass, src.ext_gross_mass_br_c, src.ext_no_of_items_br_c, src.crb_code, src.crb_state_of_seals, src.pad_place, src.pad_date, src.s_quantity, src.cr_code, src.log_co, src.log_location_desc, src.log_location_code, src.pos_location_desc, src.pos_location_code, src.it_identity_br, src.it_identity_br_c, src.it_identity, src.ext_ecs_decl, src.ext_co_of_exit, src.ext_co_of_exit_declared, src.ext_co_of_exit_changed_to, src.ext_storing, src.ext_co_of_export, src.ext_decl_type_1a, src.ext_no_of_items, src.ext_no_of_items_br, src.ext_no_of_package, src.ext_no_of_packages_br, src.ext_no_of_packages_br_c, src.ext_country_of_export, src.ext_country_of_dest, src.ext_containers, src.ext_gross_mass_br, src.ext_acceptance_date, src.ext_issuing_date, src.ext_ead_language, src.ext_time_to_send_exit_result, src.ext_time_to_border_arrival, src.ext_presentation_date, src.ext_notification_date, src.ext_status, src.ext_exit_date, src.ext_exit_stopped_date, src.ext_com_ref_num, src.ext_com_ref_num_di, src.ext_com_ref_num_di_c, src.ext_dec_sub_tim, src.ext_tra_cha_met, src.ext_tra_cha_met_di, src.ext_tra_cha_met_di_c, src.ext_spe_cir_ind, src.pad_realDate, src.crb_code_before_transit, src.transit);
        SET @Merged = 1;	
	END
	IF @TableName = 'ecs_ext_seal' BEGIN
		MERGE INTO aies.ecs_ext_seal AS tgt
		USING [WI_StageODS].aies.ecs_ext_seal AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.identity_f=src.identity_f, tgt.decl_id=src.decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, identity_f, decl_id)
		VALUES (src.id, src.identity_f, src.decl_id);
        SET @Merged = 1;
	END
	IF @TableName ='ecs_ext_exporter' BEGIN
		MERGE INTO aies.ecs_ext_exporter AS tgt
		USING [WI_StageODS].aies.ecs_ext_exporter AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcoexit_decl_id=src.declcoexit_decl_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcoexit_decl_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcoexit_decl_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_decl_br_c' BEGIN
		MERGE INTO aies.ecs_ext_decl_br_c AS tgt
		USING [WI_StageODS].aies.ecs_ext_decl_br_c AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.comment_f=src.comment_f, tgt.declcoexit_decl_id=src.declcoexit_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, comment_f, declcoexit_decl_id)
		VALUES (src.id, src.comment_f, src.declcoexit_decl_id);
        SET @Merged = 1;
	END
	IF @TableName ='ecs_ext_consignee' BEGIN
		MERGE INTO aies.ecs_ext_consignee AS tgt
		USING [WI_StageODS].aies.ecs_ext_consignee AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcoexit_decl_id=src.declcoexit_decl_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcoexit_decl_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcoexit_decl_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_trader_at_exit' BEGIN
		MERGE INTO aies.ecs_ext_trader_at_exit AS tgt
		USING [WI_StageODS].aies.ecs_ext_trader_at_exit AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcoexit_decl_id=src.declcoexit_decl_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcoexit_decl_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcoexit_decl_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_risk_analysis' BEGIN
		MERGE INTO aies.ecs_ext_risk_analysis AS tgt
		USING [WI_StageODS].aies.ecs_ext_risk_analysis AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ra_desc=src.ra_desc, tgt.ra_desc_lng=src.ra_desc_lng, tgt.ra_item_no=src.ra_item_no, tgt.war_code=src.war_code, tgt.declcoexit_decl_id=src.declcoexit_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, ra_desc, ra_desc_lng, ra_item_no, war_code, declcoexit_decl_id)
		VALUES (src.id, src.ra_desc, src.ra_desc_lng, src.ra_item_no, src.war_code, src.declcoexit_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_additional_info' BEGIN
		MERGE INTO aies.ecs_ext_additional_info AS tgt
		USING [WI_StageODS].aies.ecs_ext_additional_info AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.declcoexit_decl_id=src.declcoexit_decl_id, tgt.code=src.code, tgt.text=src.text
		WHEN NOT MATCHED
		THEN INSERT (id, declcoexit_decl_id, code, text)
		VALUES (src.id, src.declcoexit_decl_id, src.code, src.text);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_itinerary' BEGIN
		MERGE INTO aies.ecs_ext_itinerary AS tgt
		USING [WI_StageODS].aies.ecs_ext_itinerary AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.country=src.country, tgt.declcoexit_decl_id=src.declcoexit_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, country, declcoexit_decl_id)
		VALUES (src.id, src.country, src.declcoexit_decl_id);
        SET @Merged = 1;		
	END
	IF @TableName ='ecs_ext_goods_item' BEGIN
		MERGE INTO aies.ecs_ext_goods_item AS tgt
		USING [WI_StageODS].aies.ecs_ext_goods_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_country_of_export=src.gi_country_of_export, tgt.gi_country_of_destination=src.gi_country_of_destination, tgt.gi_gross_mass_br=src.gi_gross_mass_br, tgt.gi_item_no=src.gi_item_no, tgt.gi_commodity_code=src.gi_commodity_code, tgt.gi_state_br=src.gi_state_br, tgt.gi_desc_br=src.gi_desc_br, tgt.gi_commodity_code_br=src.gi_commodity_code_br, tgt.gi_net_mass=src.gi_net_mass, tgt.gi_net_mass_br=src.gi_net_mass_br, tgt.gi_desc=src.gi_desc, tgt.declcoexit_decl_id=src.declcoexit_decl_id, tgt.gi_pro_req=src.gi_pro_req, tgt.gi_pre_pro=src.gi_pre_pro, tgt.gi_com_nom_di=src.gi_com_nom_di, tgt.gi_tar_cod_di=src.gi_tar_cod_di, tgt.gi_met_of_pay=src.gi_met_of_pay, tgt.gi_com_nat_pro=src.gi_com_nat_pro, tgt.gi_sta_val_cur=src.gi_sta_val_cur, tgt.gi_sta_val_amo=src.gi_sta_val_amo, tgt.gi_com_ref_num=src.gi_com_ref_num, tgt.gi_un_dan_goo_cod=src.gi_un_dan_goo_cod, tgt.gi_com_nom=src.gi_com_nom, tgt.gi_tar_cod=src.gi_tar_cod, tgt.gi_tar_fir_add_cod=src.gi_tar_fir_add_cod, tgt.gi_tar_sec_add_cod=src.gi_tar_sec_add_cod, tgt.gi_nat_dd_cod=src.gi_nat_dd_cod, tgt.gi_com_nat_pro_di=src.gi_com_nat_pro_di, tgt.gi_com_ref_num_di=src.gi_com_ref_num_di, tgt.gi_met_of_pay_di=src.gi_met_of_pay_di, tgt.gi_sta_val_amo_di=src.gi_sta_val_amo_di, tgt.gi_sta_val_cur_di=src.gi_sta_val_cur_di, tgt.gi_tar_fir_add_cod_di=src.gi_tar_fir_add_cod_di, tgt.gi_tar_sec_add_cod_di=src.gi_tar_sec_add_cod_di, tgt.gi_un_dan_goo_cod_di=src.gi_un_dan_goo_cod_di
		WHEN NOT MATCHED
		THEN INSERT (id, gi_gross_mass, gi_country_of_export, gi_country_of_destination, gi_gross_mass_br, gi_item_no, gi_commodity_code, gi_state_br, gi_desc_br, gi_commodity_code_br, gi_net_mass, gi_net_mass_br, gi_desc, declcoexit_decl_id, gi_pro_req, gi_pre_pro, gi_com_nom_di, gi_tar_cod_di, gi_met_of_pay, gi_com_nat_pro, gi_sta_val_cur, gi_sta_val_amo, gi_com_ref_num, gi_un_dan_goo_cod, gi_com_nom, gi_tar_cod, gi_tar_fir_add_cod, gi_tar_sec_add_cod, gi_nat_dd_cod, gi_com_nat_pro_di, gi_com_ref_num_di, gi_met_of_pay_di, gi_sta_val_amo_di, gi_sta_val_cur_di, gi_tar_fir_add_cod_di, gi_tar_sec_add_cod_di, gi_un_dan_goo_cod_di)
		VALUES (src.id, src.gi_gross_mass, src.gi_country_of_export, src.gi_country_of_destination, src.gi_gross_mass_br, src.gi_item_no, src.gi_commodity_code, src.gi_state_br, src.gi_desc_br, src.gi_commodity_code_br, src.gi_net_mass, src.gi_net_mass_br, src.gi_desc, src.declcoexit_decl_id, src.gi_pro_req, src.gi_pre_pro, src.gi_com_nom_di, src.gi_tar_cod_di, src.gi_met_of_pay, src.gi_com_nat_pro, src.gi_sta_val_cur, src.gi_sta_val_amo, src.gi_com_ref_num, src.gi_un_dan_goo_cod, src.gi_com_nom, src.gi_tar_cod, src.gi_tar_fir_add_cod, src.gi_tar_sec_add_cod, src.gi_nat_dd_cod, src.gi_com_nat_pro_di, src.gi_com_ref_num_di, src.gi_met_of_pay_di, src.gi_sta_val_amo_di, src.gi_sta_val_cur_di, src.gi_tar_fir_add_cod_di, src.gi_tar_sec_add_cod_di, src.gi_un_dan_goo_cod_di);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_special_mention' BEGIN
		MERGE INTO aies.ecs_ext_special_mention AS tgt
		USING [WI_StageODS].aies.ecs_ext_special_mention AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.goods_item_id=src.goods_item_id, tgt.text=src.text, tgt.textlng=src.textlng
		WHEN NOT MATCHED
		THEN INSERT (id, code, goods_item_id, text, textlng)
		VALUES (src.id, src.code, src.goods_item_id, src.text, src.textlng);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_produced_document' BEGIN
		MERGE INTO aies.ecs_ext_produced_document AS tgt
		USING [WI_StageODS].aies.ecs_ext_produced_document AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.state_br=src.state_br, tgt.state_br_c=src.state_br_c, tgt.type_f=src.type_f, tgt.ref_t=src.ref_t, tgt.goods_item_id=src.goods_item_id, tgt.transit=src.transit
		WHEN NOT MATCHED
		THEN INSERT (id, state_br, state_br_c, type_f, ref_t, goods_item_id, transit)
		VALUES (src.id, src.state_br, src.state_br_c, src.type_f, src.ref_t, src.goods_item_id, src.transit);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_previous_document' BEGIN
		MERGE INTO aies.ecs_ext_previous_document AS tgt
		USING [WI_StageODS].aies.ecs_ext_previous_document AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.type_f=src.type_f, tgt.ref_f=src.ref_f, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, type_f, ref_f, goods_item_id)
		VALUES (src.id, src.type_f, src.ref_f, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_package' BEGIN
		MERGE INTO aies.ecs_ext_package AS tgt
		USING [WI_StageODS].aies.ecs_ext_package AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.no_of_packages=src.no_of_packages, tgt.kind=src.kind, tgt.no_of_pieces=src.no_of_pieces, tgt.state_br=src.state_br, tgt.marks=src.marks, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, no_of_packages, kind, no_of_pieces, state_br, marks, goods_item_id)
		VALUES (src.id, src.no_of_packages, src.kind, src.no_of_pieces, src.state_br, src.marks, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_consignee_of_item' BEGIN
		MERGE INTO aies.ecs_ext_consignee_of_item AS tgt
		USING [WI_StageODS].aies.ecs_ext_consignee_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.goods_item_id=src.goods_item_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, goods_item_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.goods_item_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_exporter_of_item' BEGIN
		MERGE INTO aies.ecs_ext_exporter_of_item AS tgt
		USING [WI_StageODS].aies.ecs_ext_exporter_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.goods_item_id=src.goods_item_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, goods_item_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.goods_item_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_item_br_c' BEGIN
		MERGE INTO aies.ecs_ext_item_br_c AS tgt
		USING [WI_StageODS].aies.ecs_ext_item_br_c AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.comment_f=src.comment_f, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, comment_f, goods_item_id)
		VALUES (src.id, src.comment_f, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_ext_container' BEGIN
		MERGE INTO aies.ecs_ext_container AS tgt
		USING [WI_StageODS].aies.ecs_ext_container AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.state_br=src.state_br, tgt.identity_f=src.identity_f, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, state_br, identity_f, goods_item_id)
		VALUES (src.id, src.state_br, src.identity_f, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_los_declcoexit' BEGIN
		MERGE INTO aies.ecs_los_declcoexit AS tgt
		USING [WI_StageODS].aies.ecs_los_declcoexit AS src
		ON (tgt.decl_id=src.decl_id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.exp_acceptance_date=src.exp_acceptance_date, tgt.exp_exit_agreementDate=src.exp_exit_agreementDate, tgt.exp_co_of_exit=src.exp_co_of_exit, tgt.los_co_of_lodg=src.los_co_of_lodg, tgt.crn=src.crn, tgt.exp_digital_signature=src.exp_digital_signature, tgt.gross_mass=src.gross_mass, tgt.exp_no_of_items=src.exp_no_of_items, tgt.exp_no_of_packages=src.exp_no_of_packages, tgt.peculiar_circumstances=src.peculiar_circumstances, tgt.pad_date=src.pad_date, tgt.pad_phone=src.pad_phone, tgt.pad_place=src.pad_place, tgt.exp_status=src.exp_status, tgt.transport_fee_pay_type=src.transport_fee_pay_type, tgt.exp_agreement_date=src.exp_agreement_date, tgt.log_co=src.log_co, tgt.log_location_desc=src.log_location_desc, tgt.log_location_code=src.log_location_code
		WHEN NOT MATCHED
		THEN INSERT (exp_acceptance_date, exp_exit_agreementDate, exp_co_of_exit, los_co_of_lodg, crn, exp_digital_signature, gross_mass, exp_no_of_items, exp_no_of_packages, peculiar_circumstances, pad_date, pad_phone, pad_place, exp_status, transport_fee_pay_type, decl_id, exp_agreement_date, log_co, log_location_desc, log_location_code)
		VALUES (src.exp_acceptance_date, src.exp_exit_agreementDate, src.exp_co_of_exit, src.los_co_of_lodg, src.crn, src.exp_digital_signature, src.gross_mass, src.exp_no_of_items, src.exp_no_of_packages, src.peculiar_circumstances, src.pad_date, src.pad_phone, src.pad_place, src.exp_status, src.transport_fee_pay_type, src.decl_id, src.exp_agreement_date, src.log_co, src.log_location_desc, src.log_location_code);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_los_declarant' BEGIN
		MERGE INTO aies.ecs_los_declarant AS tgt
		USING [WI_StageODS].aies.ecs_los_declarant AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, losdeclcoexit_decl_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.losdeclcoexit_decl_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_los_risk_analysis' BEGIN
		MERGE INTO aies.ecs_los_risk_analysis AS tgt
		USING [WI_StageODS].aies.ecs_los_risk_analysis AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ra_desc=src.ra_desc, tgt.ra_desc_lng=src.ra_desc_lng, tgt.ra_item_no=src.ra_item_no, tgt.war_code=src.war_code, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, ra_desc, ra_desc_lng, ra_item_no, war_code, losdeclcoexit_decl_id)
		VALUES (src.id, src.ra_desc, src.ra_desc_lng, src.ra_item_no, src.war_code, src.losdeclcoexit_decl_id);
        SET @Merged = 1;	
	END
	IF @TableName = 'ecs_los_seal' BEGIN
		MERGE INTO aies.ecs_los_seal AS tgt
		USING [WI_StageODS].aies.ecs_los_seal AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ident=src.ident, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, ident, losdeclcoexit_decl_id)
		VALUES (src.id, src.ident, src.losdeclcoexit_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_los_consignee' BEGIN
		MERGE INTO aies.ecs_los_consignee AS tgt
		USING [WI_StageODS].aies.ecs_los_consignee AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, losdeclcoexit_decl_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.losdeclcoexit_decl_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_los_exporter' BEGIN
		MERGE INTO aies.ecs_los_exporter AS tgt
		USING [WI_StageODS].aies.ecs_los_exporter AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, losdeclcoexit_decl_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.losdeclcoexit_decl_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_los_itinerary' BEGIN
		MERGE INTO aies.ecs_los_itinerary AS tgt
		USING [WI_StageODS].aies.ecs_los_itinerary AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.country=src.country, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, country, losdeclcoexit_decl_id)
		VALUES (src.id, src.country, src.losdeclcoexit_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_los_submitter' BEGIN
		MERGE INTO aies.ecs_los_submitter AS tgt
		USING [WI_StageODS].aies.ecs_los_submitter AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, losdeclcoexit_decl_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.losdeclcoexit_decl_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_los_goods_item' BEGIN
		MERGE INTO aies.ecs_los_goods_item AS tgt
		USING [WI_StageODS].aies.ecs_los_goods_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.gi_cn_code=src.gi_cn_code, tgt.gi_crn=src.gi_crn, tgt.gi_desc=src.gi_desc, tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_item_no=src.gi_item_no, tgt.transport_fee_pay_type=src.transport_fee_pay_type, tgt.gi_un_dangerous_goods=src.gi_un_dangerous_goods, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, gi_cn_code, gi_crn, gi_desc, gi_gross_mass, gi_item_no, transport_fee_pay_type, gi_un_dangerous_goods, losdeclcoexit_decl_id)
		VALUES (src.id, src.gi_cn_code, src.gi_crn, src.gi_desc, src.gi_gross_mass, src.gi_item_no, src.transport_fee_pay_type, src.gi_un_dangerous_goods, src.losdeclcoexit_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_los_exporter_of_item' BEGIN
		MERGE INTO aies.ecs_los_exporter_of_item AS tgt
		USING [WI_StageODS].aies.ecs_los_exporter_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.goods_item_id=src.goods_item_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, goods_item_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.goods_item_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_los_package' BEGIN
		MERGE INTO aies.ecs_los_package AS tgt
		USING [WI_StageODS].aies.ecs_los_package AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.kind=src.kind, tgt.marks=src.marks, tgt.no_of_packages=src.no_of_packages, tgt.no_of_pieces=src.no_of_pieces, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, kind, marks, no_of_packages, no_of_pieces, goods_item_id)
		VALUES (src.id, src.kind, src.marks, src.no_of_packages, src.no_of_pieces, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_los_produced_document' BEGIN	
		MERGE INTO aies.ecs_los_produced_document AS tgt
		USING [WI_StageODS].aies.ecs_los_produced_document AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ref=src.ref, tgt.type=src.type, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, ref, type, goods_item_id)
		VALUES (src.id, src.ref, src.type, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName ='ecs_los_consignee_of_item' BEGIN
		MERGE INTO aies.ecs_los_consignee_of_item AS tgt
		USING [WI_StageODS].aies.ecs_los_consignee_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.goods_item_id=src.goods_item_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, goods_item_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.goods_item_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_los_container' BEGIN
		MERGE INTO aies.ecs_los_container AS tgt
		USING [WI_StageODS].aies.ecs_los_container AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.identity_f=src.identity_f, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, identity_f, goods_item_id)
		VALUES (src.id, src.identity_f, src.goods_item_id);
        SET @Merged = 1;
	END
	/* Trzeci kontener */
	IF @TableName = 'ecs_mft_manifest' BEGIN
		MERGE INTO aies.ecs_mft_manifest AS tgt
		USING [WI_StageODS].aies.ecs_mft_manifest AS src
		ON (tgt.decl_id=src.decl_id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.mf_gross_mass=src.mf_gross_mass, tgt.cr_code=src.cr_code, tgt.mf_co_of_exit=src.mf_co_of_exit, tgt.mf_no_of_items=src.mf_no_of_items, tgt.mf_no_of_packages=src.mf_no_of_packages, tgt.mf_date_of_presentation=src.mf_date_of_presentation, tgt.mf_status=src.mf_status, tgt.pad_place=src.pad_place, tgt.pad_date=src.pad_date, tgt.mf_acceptance_date=src.mf_acceptance_date
		WHEN NOT MATCHED
		THEN INSERT (decl_id, mf_gross_mass, cr_code, mf_co_of_exit, mf_no_of_items, mf_no_of_packages, mf_date_of_presentation, mf_status, pad_place, pad_date, mf_acceptance_date)
		VALUES (src.decl_id, src.mf_gross_mass, src.cr_code, src.mf_co_of_exit, src.mf_no_of_items, src.mf_no_of_packages, src.mf_date_of_presentation, src.mf_status, src.pad_place, src.pad_date, src.mf_acceptance_date);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_mft_trader_at_exit' BEGIN
		MERGE INTO aies.ecs_mft_trader_at_exit AS tgt
		USING [WI_StageODS].aies.ecs_mft_trader_at_exit AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.manifest_decl_id=src.manifest_decl_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, manifest_decl_id, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.manifest_decl_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_mft_goodsitem' BEGIN
		MERGE INTO aies.ecs_mft_goodsitem AS tgt
		USING [WI_StageODS].aies.ecs_mft_goodsitem AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.gi_gross_mass=src.gi_gross_mass, tgt.gino_of_packages=src.gino_of_packages, tgt.gi_item_no=src.gi_item_no, tgt.gi_transport_document=src.gi_transport_document, tgt.gi_kind_of_packages=src.gi_kind_of_packages, tgt.gi_marks_of_packages=src.gi_marks_of_packages, tgt.gi_no_of_pieces=src.gi_no_of_pieces, tgt.gi_commodity_code=src.gi_commodity_code, tgt.gi_item_desc=src.gi_item_desc, tgt.manifest_decl_id=src.manifest_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, gi_gross_mass, gino_of_packages, gi_item_no, gi_transport_document, gi_kind_of_packages, gi_marks_of_packages, gi_no_of_pieces, gi_commodity_code, gi_item_desc, manifest_decl_id)
		VALUES (src.id, src.gi_gross_mass, src.gino_of_packages, src.gi_item_no, src.gi_transport_document, src.gi_kind_of_packages, src.gi_marks_of_packages, src.gi_no_of_pieces, src.gi_commodity_code, src.gi_item_desc, src.manifest_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_mft_customsdata' BEGIN
		MERGE INTO aies.ecs_mft_customsdata AS tgt
		USING [WI_StageODS].aies.ecs_mft_customsdata AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.gross_mass=src.gross_mass, tgt.mrn=src.mrn, tgt.no_of_packages=src.no_of_packages, tgt.item_no=src.item_no, tgt.no_of_pieces=src.no_of_pieces, tgt.partial_shipment=src.partial_shipment, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, gross_mass, mrn, no_of_packages, item_no, no_of_pieces, partial_shipment, goods_item_id)
		VALUES (src.id, src.gross_mass, src.mrn, src.no_of_packages, src.item_no, src.no_of_pieces, src.partial_shipment, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_declcoexpsuppl' BEGIN
		MERGE INTO aies.ecs_spp_declcoexpsuppl AS tgt
		USING [WI_StageODS].aies.ecs_spp_declcoexpsuppl AS src
		ON (tgt.decl_id=src.decl_id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.spp_co_of_exit=src.spp_co_of_exit, tgt.spp_co_of_exit_spp=src.spp_co_of_exit_spp, tgt.spp_co_of_export=src.spp_co_of_export, tgt.spp_co_of_export_spp=src.spp_co_of_export_spp, tgt.spp_co_of_suppl=src.spp_co_of_suppl, tgt.spp_co_of_suppl_spp=src.spp_co_of_suppl_spp, tgt.spp_containers=src.spp_containers, tgt.spp_containers_spp=src.spp_containers_spp, tgt.spp_country_of_dest=src.spp_country_of_dest, tgt.spp_country_of_dest_spp=src.spp_country_of_dest_spp, tgt.spp_country_of_export=src.spp_country_of_export, tgt.spp_country_of_export_spp=src.spp_country_of_export_spp, tgt.spp_crn=src.spp_crn, tgt.spp_crn_spp=src.spp_crn_spp, tgt.spp_decl_type_1a=src.spp_decl_type_1a, tgt.spp_decl_type_1b=src.spp_decl_type_1b, tgt.dt_code=src.dt_code, tgt.dt_code_spp=src.dt_code_spp, tgt.dt_place=src.dt_place, tgt.dt_place_code=src.dt_place_code, tgt.dt_place_code_spp=src.dt_place_code_spp, tgt.spp_digital_signature=src.spp_digital_signature, tgt.spp_gross_mass=src.spp_gross_mass, tgt.spp_gross_mass_spp=src.spp_gross_mass_spp, tgt.it_identity=src.it_identity, tgt.it_identity_spp=src.it_identity_spp, tgt.it_mode=src.it_mode, tgt.it_mode_spp=src.it_mode_spp, tgt.lof_co=src.lof_co, tgt.lof_co_spp=src.lof_co_spp, tgt.lof_location_code=src.lof_location_code, tgt.lof_location_code_spp=src.lof_location_code_spp, tgt.lof_location_desc=src.lof_location_desc, tgt.spp_no_of_items=src.spp_no_of_items, tgt.spp_no_of_items_spp=src.spp_no_of_items_spp, tgt.spp_no_of_packages=src.spp_no_of_packages, tgt.spp_no_of_packages_spp=src.spp_no_of_packages_spp, tgt.pad_capacity=src.pad_capacity, tgt.pad_date=src.pad_date, tgt.pad_name=src.pad_name, tgt.pad_phone=src.pad_phone, tgt.pad_place=src.pad_place, tgt.pos_location_code=src.pos_location_code, tgt.pos_location_code_spp=src.pos_location_code_spp, tgt.pos_location_desc=src.pos_location_desc, tgt.si_quantity=src.si_quantity, tgt.si_quantity_spp=src.si_quantity_spp, tgt.spp_specific_circumstance=src.spp_specific_circumstance, tgt.spp_specific_circumstance_spp=src.spp_specific_circumstance_spp, tgt.exp_status=src.exp_status, tgt.spp_storing=src.spp_storing, tgt.spp_storing_spp=src.spp_storing_spp, tgt.exp_taxes_amount=src.exp_taxes_amount, tgt.spp_taxes_amount_spp=src.spp_taxes_amount_spp, tgt.td_amount=src.td_amount, tgt.td_amount_spp=src.td_amount_spp, tgt.td_currency=src.td_currency, tgt.td_currency_spp=src.td_currency_spp, tgt.td_exchange_rate=src.td_exchange_rate, tgt.td_exchange_rate_spp=src.td_exchange_rate_spp, tgt.td_nature_of_transation=src.td_nature_of_transation, tgt.td_nature_of_transation_spp=src.td_nature_of_transation_spp, tgt.tab_country=src.tab_country, tgt.tab_country_spp=src.tab_country_spp, tgt.tab_identity=src.tab_identity, tgt.tab_identity_spp=src.tab_identity_spp, tgt.tab_mode=src.tab_mode, tgt.tab_mode_spp=src.tab_mode_spp, tgt.spp_transport_charges_mp=src.spp_transport_charges_mp, tgt.spp_transport_charges_mp_spp=src.spp_transport_charges_mp_spp, tgt.spp_un_dangerous_goods=src.spp_un_dangerous_goods, tgt.spp_un_dangerous_goods_spp=src.spp_un_dangerous_goods_spp, tgt.w_country=src.w_country, tgt.w_country_spp=src.w_country_spp, tgt.w_location_code=src.w_location_code, tgt.w_location_code_spp=src.w_location_code_spp, tgt.w_type=src.w_type, tgt.w_type_spp=src.w_type_spp, tgt.spp_link_date=src.spp_link_date, tgt.spp_co_of_fold=src.spp_co_of_fold
		WHEN NOT MATCHED
		THEN INSERT (spp_co_of_exit, spp_co_of_exit_spp, spp_co_of_export, spp_co_of_export_spp, spp_co_of_suppl, spp_co_of_suppl_spp, spp_containers, spp_containers_spp, spp_country_of_dest, spp_country_of_dest_spp, spp_country_of_export, spp_country_of_export_spp, spp_crn, spp_crn_spp, spp_decl_type_1a, spp_decl_type_1b, dt_code, dt_code_spp, dt_place, dt_place_code, dt_place_code_spp, spp_digital_signature, spp_gross_mass, spp_gross_mass_spp, it_identity, it_identity_spp, it_mode, it_mode_spp, lof_co, lof_co_spp, lof_location_code, lof_location_code_spp, lof_location_desc, spp_no_of_items, spp_no_of_items_spp, spp_no_of_packages, spp_no_of_packages_spp, pad_capacity, pad_date, pad_name, pad_phone, pad_place, pos_location_code, pos_location_code_spp, pos_location_desc, si_quantity, si_quantity_spp, spp_specific_circumstance, spp_specific_circumstance_spp, exp_status, spp_storing, spp_storing_spp, exp_taxes_amount, spp_taxes_amount_spp, td_amount, td_amount_spp, td_currency, td_currency_spp, td_exchange_rate, td_exchange_rate_spp, td_nature_of_transation, td_nature_of_transation_spp, tab_country, tab_country_spp, tab_identity, tab_identity_spp, tab_mode, tab_mode_spp, spp_transport_charges_mp, spp_transport_charges_mp_spp, spp_un_dangerous_goods, spp_un_dangerous_goods_spp, w_country, w_country_spp, w_location_code, w_location_code_spp, w_type, w_type_spp, decl_id, spp_link_date, spp_co_of_fold)
		VALUES (src.spp_co_of_exit, src.spp_co_of_exit_spp, src.spp_co_of_export, src.spp_co_of_export_spp, src.spp_co_of_suppl, src.spp_co_of_suppl_spp, src.spp_containers, src.spp_containers_spp, src.spp_country_of_dest, src.spp_country_of_dest_spp, src.spp_country_of_export, src.spp_country_of_export_spp, src.spp_crn, src.spp_crn_spp, src.spp_decl_type_1a, src.spp_decl_type_1b, src.dt_code, src.dt_code_spp, src.dt_place, src.dt_place_code, src.dt_place_code_spp, src.spp_digital_signature, src.spp_gross_mass, src.spp_gross_mass_spp, src.it_identity, src.it_identity_spp, src.it_mode, src.it_mode_spp, src.lof_co, src.lof_co_spp, src.lof_location_code, src.lof_location_code_spp, src.lof_location_desc, src.spp_no_of_items, src.spp_no_of_items_spp, src.spp_no_of_packages, src.spp_no_of_packages_spp, src.pad_capacity, src.pad_date, src.pad_name, src.pad_phone, src.pad_place, src.pos_location_code, src.pos_location_code_spp, src.pos_location_desc, src.si_quantity, src.si_quantity_spp, src.spp_specific_circumstance, src.spp_specific_circumstance_spp, src.exp_status, src.spp_storing, src.spp_storing_spp, src.exp_taxes_amount, src.spp_taxes_amount_spp, src.td_amount, src.td_amount_spp, src.td_currency, src.td_currency_spp, src.td_exchange_rate, src.td_exchange_rate_spp, src.td_nature_of_transation, src.td_nature_of_transation_spp, src.tab_country, src.tab_country_spp, src.tab_identity, src.tab_identity_spp, src.tab_mode, src.tab_mode_spp, src.spp_transport_charges_mp, src.spp_transport_charges_mp_spp, src.spp_un_dangerous_goods, src.spp_un_dangerous_goods_spp, src.w_country, src.w_country_spp, src.w_location_code, src.w_location_code_spp, src.w_type, src.w_type_spp, src.decl_id, src.spp_link_date, src.spp_co_of_fold);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_exporter' BEGIN
		MERGE INTO aies.ecs_spp_exporter AS tgt
		USING [WI_StageODS].aies.ecs_spp_exporter AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.eori_spp=src.eori_spp, tgt.tin_spp=src.tin_spp, tgt.declcoexportsuppl_decl_id=src.declcoexportsuppl_decl_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, eori_spp, tin_spp, declcoexportsuppl_decl_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.eori_spp, src.tin_spp, src.declcoexportsuppl_decl_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName ='ecs_spp_itinerary' BEGIN
		MERGE INTO aies.ecs_spp_itinerary AS tgt
		USING [WI_StageODS].aies.ecs_spp_itinerary AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.country=src.country, tgt.declcoexpsuppl_decl_id=src.declcoexpsuppl_decl_id, tgt.countrySpp=src.countrySpp
		WHEN NOT MATCHED
		THEN INSERT (id, country, declcoexpsuppl_decl_id, countrySpp)
		VALUES (src.id, src.country, src.declcoexpsuppl_decl_id, src.countrySpp);
        SET @Merged = 1;
	END
	IF @TableName ='ecs_spp_seal' BEGIN
		MERGE INTO aies.ecs_spp_seal AS tgt
		USING [WI_StageODS].aies.ecs_spp_seal AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ident=src.ident, tgt.declcoexpsuppl_decl_id=src.declcoexpsuppl_decl_id, tgt.ident_spp=src.ident_spp
		WHEN NOT MATCHED
		THEN INSERT (id, ident, declcoexpsuppl_decl_id, ident_spp)
		VALUES (src.id, src.ident, src.declcoexpsuppl_decl_id, src.ident_spp);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_seal_suppl' BEGIN
		MERGE INTO aies.ecs_spp_seal_suppl AS tgt
		USING [WI_StageODS].aies.ecs_spp_seal_suppl AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ident=src.ident, tgt.declcoexp_spp_decl_id=src.declcoexp_spp_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, ident, declcoexp_spp_decl_id)
		VALUES (src.id, src.ident, src.declcoexp_spp_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_consignee' BEGIN
		MERGE INTO aies.ecs_spp_consignee AS tgt
		USING [WI_StageODS].aies.ecs_spp_consignee AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.declcosuppl_decl_id=src.declcosuppl_decl_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, declcosuppl_decl_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.declcosuppl_decl_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_declarant' BEGIN
		MERGE INTO aies.ecs_spp_declarant AS tgt
		USING [WI_StageODS].aies.ecs_spp_declarant AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.date_of_entry_agent_list=src.date_of_entry_agent_list, tgt.indication=src.indication, tgt.no_of_entry_agents_list=src.no_of_entry_agents_list, tgt.representative_status=src.representative_status, tgt.declcoexpsuppl_decl_id=src.declcoexpsuppl_decl_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, date_of_entry_agent_list, indication, no_of_entry_agents_list, representative_status, declcoexpsuppl_decl_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.date_of_entry_agent_list, src.indication, src.no_of_entry_agents_list, src.representative_status, src.declcoexpsuppl_decl_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_deferred_payment' BEGIN
		MERGE INTO aies.ecs_spp_deferred_payment AS tgt
		USING [WI_StageODS].aies.ecs_spp_deferred_payment AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ref=src.ref, tgt.ref_spp=src.ref_spp, tgt.declcoexpsuppl_decl_id=src.declcoexpsuppl_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, ref, ref_spp, declcoexpsuppl_decl_id)
		VALUES (src.id, src.ref, src.ref_spp, src.declcoexpsuppl_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_goods_item' BEGIN
		MERGE INTO aies.ecs_spp_goods_item AS tgt
		USING [WI_StageODS].aies.ecs_spp_goods_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.gi_cn_code=src.gi_cn_code, tgt.gi_cn_code_spp=src.gi_cn_code_spp, tgt.gi_commodity_code_br=src.gi_commodity_code_br, tgt.gi_country_of_destination=src.gi_country_of_destination, tgt.gi_country_of_destination_spp=src.gi_country_of_destination_spp, tgt.gi_country_of_export=src.gi_country_of_export, tgt.gi_country_of_export_spp=src.gi_country_of_export_spp, tgt.gi_country_of_origin=src.gi_country_of_origin, tgt.gi_country_of_origin_spp=src.gi_country_of_origin_spp, tgt.gi_crn=src.gi_crn, tgt.gi_crn_spp=src.gi_crn_spp, tgt.gi_desc=src.gi_desc, tgt.gi_desc_br=src.gi_desc_br, tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_gross_mass_br=src.gi_gross_mass_br, tgt.gi_gross_mass_spp=src.gi_gross_mass_spp, tgt.gi_item_no=src.gi_item_no, tgt.gi_net_mass=src.gi_net_mass, tgt.gi_net_mass_spp=src.gi_net_mass_spp, tgt.gi_proc_detail=src.gi_proc_detail, tgt.gi_proc_detail_spp=src.gi_proc_detail_spp, tgt.gi_proc_previous=src.gi_proc_previous, tgt.gi_proc_previous_spp=src.gi_proc_previous_spp, tgt.gi_proc_requested=src.gi_proc_requested, tgt.gi_proc_requested_spp=src.gi_proc_requested_spp, tgt.gi_quantity_suppl_unit=src.gi_quantity_suppl_unit, tgt.gi_quantity_suppl_unit_spp=src.gi_quantity_suppl_unit_spp, tgt.gi_taric_code=src.gi_taric_code, tgt.gi_taric_code_spp=src.gi_taric_code_spp, tgt.gi_taxes_amount=src.gi_taxes_amount, tgt.gi_taxes_amount_spp=src.gi_taxes_amount_spp, tgt.gi_transport_charges_mp=src.gi_transport_charges_mp, tgt.gi_un_dangerous_goods=src.gi_un_dangerous_goods, tgt.gi_un_dangerous_goods_spp=src.gi_un_dangerous_goods_spp, tgt.vog_statistical_currency=src.vog_statistical_currency, tgt.vog_statistical_value=src.vog_statistical_value, tgt.vog_statistical_value_spp=src.vog_statistical_value_spp, tgt.declcoexpsuppl_decl_id=src.declcoexpsuppl_decl_id, tgt.gi_transport_charges_mp_spp=src.gi_transport_charges_mp_spp
		WHEN NOT MATCHED
		THEN INSERT (id, gi_cn_code, gi_cn_code_spp, gi_commodity_code_br, gi_country_of_destination, gi_country_of_destination_spp, gi_country_of_export, gi_country_of_export_spp, gi_country_of_origin, gi_country_of_origin_spp, gi_crn, gi_crn_spp, gi_desc, gi_desc_br, gi_gross_mass, gi_gross_mass_br, gi_gross_mass_spp, gi_item_no, gi_net_mass, gi_net_mass_spp, gi_proc_detail, gi_proc_detail_spp, gi_proc_previous, gi_proc_previous_spp, gi_proc_requested, gi_proc_requested_spp, gi_quantity_suppl_unit, gi_quantity_suppl_unit_spp, gi_taric_code, gi_taric_code_spp, gi_taxes_amount, gi_taxes_amount_spp, gi_transport_charges_mp, gi_un_dangerous_goods, gi_un_dangerous_goods_spp, vog_statistical_currency, vog_statistical_value, vog_statistical_value_spp, declcoexpsuppl_decl_id, gi_transport_charges_mp_spp)
		VALUES (src.id, src.gi_cn_code, src.gi_cn_code_spp, src.gi_commodity_code_br, src.gi_country_of_destination, src.gi_country_of_destination_spp, src.gi_country_of_export, src.gi_country_of_export_spp, src.gi_country_of_origin, src.gi_country_of_origin_spp, src.gi_crn, src.gi_crn_spp, src.gi_desc, src.gi_desc_br, src.gi_gross_mass, src.gi_gross_mass_br, src.gi_gross_mass_spp, src.gi_item_no, src.gi_net_mass, src.gi_net_mass_spp, src.gi_proc_detail, src.gi_proc_detail_spp, src.gi_proc_previous, src.gi_proc_previous_spp, src.gi_proc_requested, src.gi_proc_requested_spp, src.gi_quantity_suppl_unit, src.gi_quantity_suppl_unit_spp, src.gi_taric_code, src.gi_taric_code_spp, src.gi_taxes_amount, src.gi_taxes_amount_spp, src.gi_transport_charges_mp, src.gi_un_dangerous_goods, src.gi_un_dangerous_goods_spp, src.vog_statistical_currency, src.vog_statistical_value, src.vog_statistical_value_spp, src.declcoexpsuppl_decl_id, src.gi_transport_charges_mp_spp);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_special_mention' BEGIN
		MERGE INTO aies.ecs_spp_special_mention AS tgt
		USING [WI_StageODS].aies.ecs_spp_special_mention AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.text=src.text, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, code, text, goods_item_id)
		VALUES (src.id, src.code, src.text, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_tar_add_cod_spp' BEGIN
		MERGE INTO aies.ecs_spp_tar_add_cod_spp AS tgt
		USING [WI_StageODS].aies.ecs_spp_tar_add_cod_spp AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, code, goods_item_id)
		VALUES (src.id, src.code, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_taric_add_code' BEGIN
		MERGE INTO aies.ecs_spp_taric_add_code AS tgt
		USING [WI_StageODS].aies.ecs_spp_taric_add_code AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.goods_item_id=src.goods_item_id, tgt.codeSpp=src.codeSpp
		WHEN NOT MATCHED
		THEN INSERT (id, code, goods_item_id, codeSpp)
		VALUES (src.id, src.code, src.goods_item_id, src.codeSpp);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_tariff_measure' BEGIN
		MERGE INTO aies.ecs_spp_tariff_measure AS tgt
		USING [WI_StageODS].aies.ecs_spp_tariff_measure AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.geographical_area=src.geographical_area, tgt.geographical_area_spp=src.geographical_area_spp, tgt.order_no=src.order_no, tgt.order_no_spp=src.order_no_spp, tgt.series=src.series, tgt.series_spp=src.series_spp, tgt.suppl_unit=src.suppl_unit, tgt.suppl_unit_qualifier=src.suppl_unit_qualifier, tgt.suppl_unit_qualifier_spp=src.suppl_unit_qualifier_spp, tgt.suppl_unit_spp=src.suppl_unit_spp, tgt.taric_sid=src.taric_sid, tgt.taric_sid_spp=src.taric_sid_spp, tgt.type=src.type, tgt.type_spp=src.type_spp, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, geographical_area, geographical_area_spp, order_no, order_no_spp, series, series_spp, suppl_unit, suppl_unit_qualifier, suppl_unit_qualifier_spp, suppl_unit_spp, taric_sid, taric_sid_spp, type, type_spp, goods_item_id)
		VALUES (src.id, src.geographical_area, src.geographical_area_spp, src.order_no, src.order_no_spp, src.series, src.series_spp, src.suppl_unit, src.suppl_unit_qualifier, src.suppl_unit_qualifier_spp, src.suppl_unit_spp, src.taric_sid, src.taric_sid_spp, src.type, src.type_spp, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName ='ecs_spp_prev_doc_proc_gosp' BEGIN
		DELETE aies.ecs_spp_prev_doc_proc_gosp
		MERGE INTO aies.ecs_spp_prev_doc_proc_gosp AS tgt
		USING [WI_StageODS].aies.ecs_spp_prev_doc_proc_gosp AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id=src.id, tgt.ref=src.ref, tgt.ref_spp=src.ref_spp, tgt.type=src.type, tgt.type_spp=src.type_spp, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, ref, ref_spp, type, type_spp, goods_item_id)
		VALUES (src.id, src.ref, src.ref_spp, src.type, src.type_spp, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_previous_document' BEGIN
		MERGE INTO aies.ecs_spp_previous_document AS tgt
		USING [WI_StageODS].aies.ecs_spp_previous_document AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ref=src.ref, tgt.ref_spp=src.ref_spp, tgt.type=src.type, tgt.type_spp=src.type_spp, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, ref, ref_spp, type, type_spp, goods_item_id)
		VALUES (src.id, src.ref, src.ref_spp, src.type, src.type_spp, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_produced_document' BEGIN
		MERGE INTO aies.ecs_spp_produced_document AS tgt
		USING [WI_StageODS].aies.ecs_spp_produced_document AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ref=src.ref, tgt.ref_spp=src.ref_spp, tgt.type=src.type, tgt.type_spp=src.type_spp, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, ref, ref_spp, type, type_spp, goods_item_id)
		VALUES (src.id, src.ref, src.ref_spp, src.type, src.type_spp, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_quantity_of_goods' BEGIN
		MERGE INTO aies.ecs_spp_quantity_of_goods AS tgt
		USING [WI_StageODS].aies.ecs_spp_quantity_of_goods AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.qualifier_of_unit=src.qualifier_of_unit, tgt.qualifier_of_unit_spp=src.qualifier_of_unit_spp, tgt.quantity=src.quantity, tgt.quantity_spp=src.quantity_spp, tgt.unit=src.unit, tgt.unit_spp=src.unit_spp, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, qualifier_of_unit, qualifier_of_unit_spp, quantity, quantity_spp, unit, unit_spp, goods_item_id)
		VALUES (src.id, src.qualifier_of_unit, src.qualifier_of_unit_spp, src.quantity, src.quantity_spp, src.unit, src.unit_spp, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_consignee_of_item' BEGIN
		MERGE INTO aies.ecs_spp_consignee_of_item AS tgt
		USING [WI_StageODS].aies.ecs_spp_consignee_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.goods_item_id=src.goods_item_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, goods_item_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.goods_item_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_nat_add_code_suppl' BEGIN
		MERGE INTO aies.ecs_spp_nat_add_code_suppl AS tgt
		USING [WI_StageODS].aies.ecs_spp_nat_add_code_suppl AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, code, goods_item_id)
		VALUES (src.id, src.code, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_national_add_code' BEGIN
		MERGE INTO aies.ecs_spp_national_add_code AS tgt
		USING [WI_StageODS].aies.ecs_spp_national_add_code AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.goods_item_id=src.goods_item_id, tgt.codeSpp=src.codeSpp
		WHEN NOT MATCHED
		THEN INSERT (id, code, goods_item_id, codeSpp)
		VALUES (src.id, src.code, src.goods_item_id, src.codeSpp);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_package' BEGIN
		MERGE INTO aies.ecs_spp_package AS tgt
		USING [WI_StageODS].aies.ecs_spp_package AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.kind=src.kind, tgt.kind_spp=src.kind_spp, tgt.marks=src.marks, tgt.no_of_packages=src.no_of_packages, tgt.no_of_packages_spp=src.no_of_packages_spp, tgt.no_of_pieces=src.no_of_pieces, tgt.no_of_pieces_spp=src.no_of_pieces_spp, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, kind, kind_spp, marks, no_of_packages, no_of_packages_spp, no_of_pieces, no_of_pieces_spp, goods_item_id)
		VALUES (src.id, src.kind, src.kind_spp, src.marks, src.no_of_packages, src.no_of_packages_spp, src.no_of_pieces, src.no_of_pieces_spp, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_tax' BEGIN
		MERGE INTO aies.ecs_spp_tax AS tgt
		USING [WI_StageODS].aies.ecs_spp_tax AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.amount=src.amount, tgt.amount_spp=src.amount_spp, tgt.base=src.base, tgt.base_spp=src.base_spp, tgt.method_of_payment=src.method_of_payment, tgt.method_of_payment_spp=src.method_of_payment_spp, tgt.rate=src.rate, tgt.rate_spp=src.rate_spp, tgt.type=src.type, tgt.type_spp=src.type_spp, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, amount, amount_spp, base, base_spp, method_of_payment, method_of_payment_spp, rate, rate_spp, type, type_spp, goods_item_id)
		VALUES (src.id, src.amount, src.amount_spp, src.base, src.base_spp, src.method_of_payment, src.method_of_payment_spp, src.rate, src.rate_spp, src.type, src.type_spp, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_spp_container' BEGIN
		MERGE INTO aies.ecs_spp_container AS tgt
		USING [WI_StageODS].aies.ecs_spp_container AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.identity_f=src.identity_f, tgt.identity_f_spp=src.identity_f_spp, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, identity_f, identity_f_spp, goods_item_id)
		VALUES (src.id, src.identity_f, src.identity_f_spp, src.goods_item_id);
        SET @Merged = 1;
	END
	/* Czwarty kontener */
	IF @TableName = 'ecs_sum_declcoexit' BEGIN
		MERGE INTO aies.ecs_sum_declcoexit AS tgt
		USING [WI_StageODS].aies.ecs_sum_declcoexit AS src
		ON (tgt.decl_id=src.decl_id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.pad_place=src.pad_place, tgt.pad_phone=src.pad_phone, tgt.pad_date=src.pad_date, tgt.exp_no_of_items=src.exp_no_of_items, tgt.exp_co_of_exit=src.exp_co_of_exit, tgt.exp_no_of_packages=src.exp_no_of_packages, tgt.gross_mass=src.gross_mass, tgt.cr_code=src.cr_code, tgt.exp_acceptance_date=src.exp_acceptance_date, tgt.crn=src.crn, tgt.gross_mass_br=src.gross_mass_br, tgt.log_co=src.log_co, tgt.log_location_desc=src.log_location_desc, tgt.log_location_code=src.log_location_code, tgt.exp_co_of_exit_chto=src.exp_co_of_exit_chto, tgt.exp_no_of_items_br=src.exp_no_of_items_br, tgt.exp_no_of_items_brc=src.exp_no_of_items_brc, tgt.exp_no_of_packages_br=src.exp_no_of_packages_br, tgt.exp_no_of_packages_brc=src.exp_no_of_packages_brc, tgt.gross_mass_brc=src.gross_mass_brc, tgt.exp_storing=src.exp_storing, tgt.exp_digital_signature=src.exp_digital_signature, tgt.exp_time_to_release_decision=src.exp_time_to_release_decision, tgt.exp_time_to_auto_acceptance=src.exp_time_to_auto_acceptance, tgt.exp_exit_date=src.exp_exit_date, tgt.exp_exit_stopped_date=src.exp_exit_stopped_date, tgt.exp_release_date=src.exp_release_date, tgt.pres_date=src.pres_date, tgt.transport_fee_pay_type=src.transport_fee_pay_type, tgt.exp_co_of_trader=src.exp_co_of_trader, tgt.sum_co_of_lodg=src.sum_co_of_lodg, tgt.peculiar_circumstances=src.peculiar_circumstances, tgt.exp_exit_agreementDate=src.exp_exit_agreementDate, tgt.regi_date=src.regi_date, tgt.exp_status=src.exp_status, tgt.exp_notification_date=src.exp_notification_date
		WHEN NOT MATCHED
		THEN INSERT (decl_id, pad_place, pad_phone, pad_date, exp_no_of_items, exp_co_of_exit, exp_no_of_packages, gross_mass, cr_code, exp_acceptance_date, crn, gross_mass_br, log_co, log_location_desc, log_location_code, exp_co_of_exit_chto, exp_no_of_items_br, exp_no_of_items_brc, exp_no_of_packages_br, exp_no_of_packages_brc, gross_mass_brc, exp_storing, exp_digital_signature, exp_time_to_release_decision, exp_time_to_auto_acceptance, exp_exit_date, exp_exit_stopped_date, exp_release_date, pres_date, transport_fee_pay_type, exp_co_of_trader, sum_co_of_lodg, peculiar_circumstances, exp_exit_agreementDate, regi_date, exp_status, exp_notification_date)
		VALUES (src.decl_id, src.pad_place, src.pad_phone, src.pad_date, src.exp_no_of_items, src.exp_co_of_exit, src.exp_no_of_packages, src.gross_mass, src.cr_code, src.exp_acceptance_date, src.crn, src.gross_mass_br, src.log_co, src.log_location_desc, src.log_location_code, src.exp_co_of_exit_chto, src.exp_no_of_items_br, src.exp_no_of_items_brc, src.exp_no_of_packages_br, src.exp_no_of_packages_brc, src.gross_mass_brc, src.exp_storing, src.exp_digital_signature, src.exp_time_to_release_decision, src.exp_time_to_auto_acceptance, src.exp_exit_date, src.exp_exit_stopped_date, src.exp_release_date, src.pres_date, src.transport_fee_pay_type, src.exp_co_of_trader, src.sum_co_of_lodg, src.peculiar_circumstances, src.exp_exit_agreementDate, src.regi_date, src.exp_status, src.exp_notification_date);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_goods_item' BEGIN
		MERGE INTO aies.ecs_sum_goods_item AS tgt
		USING [WI_StageODS].aies.ecs_sum_goods_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_item_no=src.gi_item_no, tgt.state_br=src.state_br, tgt.gi_crn=src.gi_crn, tgt.gi_desc_br=src.gi_desc_br, tgt.gi_cn_code=src.gi_cn_code, tgt.gi_gross_mass_br=src.gi_gross_mass_br, tgt.gi_un_dangerous_goods=src.gi_un_dangerous_goods, tgt.transport_fee_pay_type=src.transport_fee_pay_type, tgt.gi_crn_br=src.gi_crn_br, tgt.gi_cn_code_br=src.gi_cn_code_br, tgt.gi_un_dangerous_goods_br=src.gi_un_dangerous_goods_br, tgt.transport_fee_pay_type_br=src.transport_fee_pay_type_br, tgt.gi_desc=src.gi_desc, tgt.sumdeclcoexit_decl_id=src.sumdeclcoexit_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, gi_gross_mass, gi_item_no, state_br, gi_crn, gi_desc_br, gi_cn_code, gi_gross_mass_br, gi_un_dangerous_goods, transport_fee_pay_type, gi_crn_br, gi_cn_code_br, gi_un_dangerous_goods_br, transport_fee_pay_type_br, gi_desc, sumdeclcoexit_decl_id)
		VALUES (src.id, src.gi_gross_mass, src.gi_item_no, src.state_br, src.gi_crn, src.gi_desc_br, src.gi_cn_code, src.gi_gross_mass_br, src.gi_un_dangerous_goods, src.transport_fee_pay_type, src.gi_crn_br, src.gi_cn_code_br, src.gi_un_dangerous_goods_br, src.transport_fee_pay_type_br, src.gi_desc, src.sumdeclcoexit_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_produced_document' BEGIN
		MERGE INTO aies.ecs_sum_produced_document AS tgt
		USING [WI_StageODS].aies.ecs_sum_produced_document AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.state_br=src.state_br, tgt.state_br_c=src.state_br_c, tgt.type=src.type, tgt.ref=src.ref, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, state_br, state_br_c, type, ref, goods_item_id)
		VALUES (src.id, src.state_br, src.state_br_c, src.type, src.ref, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_package' BEGIN
		MERGE INTO aies.ecs_sum_package AS tgt
		USING [WI_StageODS].aies.ecs_sum_package AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.no_of_packages=src.no_of_packages, tgt.no_of_pieces=src.no_of_pieces, tgt.state_br=src.state_br, tgt.kind=src.kind, tgt.marks=src.marks, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, no_of_packages, no_of_pieces, state_br, kind, marks, goods_item_id)
		VALUES (src.id, src.no_of_packages, src.no_of_pieces, src.state_br, src.kind, src.marks, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_tariff_measure' BEGIN
		MERGE INTO aies.ecs_sum_tariff_measure AS tgt
		USING [WI_StageODS].aies.ecs_sum_tariff_measure AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.taric_sid=src.taric_sid, tgt.series=src.series, tgt.geographical_area=src.geographical_area, tgt.order_no=src.order_no, tgt.suppl_unit=src.suppl_unit, tgt.suppl_unit_qualifier=src.suppl_unit_qualifier, tgt.type=src.type, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, taric_sid, series, geographical_area, order_no, suppl_unit, suppl_unit_qualifier, type, goods_item_id)
		VALUES (src.id, src.taric_sid, src.series, src.geographical_area, src.order_no, src.suppl_unit, src.suppl_unit_qualifier, src.type, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_container' BEGIN
		MERGE INTO aies.ecs_sum_container AS tgt
		USING [WI_StageODS].aies.ecs_sum_container AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.state_br=src.state_br, tgt.identity_f=src.identity_f, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, state_br, identity_f, goods_item_id)
		VALUES (src.id, src.state_br, src.identity_f, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_consignee_of_item' BEGIN
		MERGE INTO aies.ecs_sum_consignee_of_item AS tgt
		USING [WI_StageODS].aies.ecs_sum_consignee_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.eori=src.eori, tgt.goods_item_id=src.goods_item_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, eori, goods_item_id, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.eori, src.goods_item_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_exporter_of_item' BEGIN
		MERGE INTO aies.ecs_sum_exporter_of_item AS tgt
		USING [WI_StageODS].aies.ecs_sum_exporter_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.eori=src.eori, tgt.goods_item_id=src.goods_item_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, eori, goods_item_id, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.eori, src.goods_item_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_submitter' BEGIN
		MERGE INTO aies.ecs_sum_submitter AS tgt
		USING [WI_StageODS].aies.ecs_sum_submitter AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.eori=src.eori, tgt.sumdeclcoexit_decl_id=src.sumdeclcoexit_decl_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, eori, sumdeclcoexit_decl_id, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.eori, src.sumdeclcoexit_decl_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_seal' BEGIN
		MERGE INTO aies.ecs_sum_seal AS tgt
		USING [WI_StageODS].aies.ecs_sum_seal AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ident=src.ident, tgt.sumdeclcoexit_decl_id=src.sumdeclcoexit_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, ident, sumdeclcoexit_decl_id)
		VALUES (src.id, src.ident, src.sumdeclcoexit_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_itinerary' BEGIN
		MERGE INTO aies.ecs_sum_itinerary AS tgt
		USING [WI_StageODS].aies.ecs_sum_itinerary AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.country=src.country, tgt.declcoexport_decl_id=src.declcoexport_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, country, declcoexport_decl_id)
		VALUES (src.id, src.country, src.declcoexport_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_exporter' BEGIN
		MERGE INTO aies.ecs_sum_exporter AS tgt
		USING [WI_StageODS].aies.ecs_sum_exporter AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.eori=src.eori, tgt.sumdeclcoexit_decl_id=src.sumdeclcoexit_decl_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, eori, sumdeclcoexit_decl_id, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.eori, src.sumdeclcoexit_decl_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_declarant' BEGIN
		MERGE INTO aies.ecs_sum_declarant AS tgt
		USING [WI_StageODS].aies.ecs_sum_declarant AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.representative_status=src.representative_status, tgt.indication=src.indication, tgt.no_of_entry_agents_list=src.no_of_entry_agents_list, tgt.date_of_entry_agent_list=src.date_of_entry_agent_list, tgt.sumdeclcoexit_decl_id=src.sumdeclcoexit_decl_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, representative_status, indication, no_of_entry_agents_list, date_of_entry_agent_list, sumdeclcoexit_decl_id, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.representative_status, src.indication, src.no_of_entry_agents_list, src.date_of_entry_agent_list, src.sumdeclcoexit_decl_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_consignee' BEGIN
		MERGE INTO aies.ecs_sum_consignee AS tgt
		USING [WI_StageODS].aies.ecs_sum_consignee AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.eori=src.eori, tgt.sumdeclcoexit_decl_id=src.sumdeclcoexit_decl_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, eori, sumdeclcoexit_decl_id, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.eori, src.sumdeclcoexit_decl_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_sum_trader_at_exit' BEGIN
		MERGE INTO aies.ecs_sum_trader_at_exit AS tgt
		USING [WI_StageODS].aies.ecs_sum_trader_at_exit AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.eori=src.eori, tgt.exs_id=src.exs_id, tgt.return_email=src.return_email, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, eori, exs_id, return_email, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.eori, src.exs_id, src.return_email, src.email);
        SET @Merged = 1;
	END
	/* Pi?ty kontener */
	IF @TableName = 'customs_message' BEGIN
		MERGE INTO aies.customs_message AS tgt
		USING [WI_StageODS].aies.customs_message AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.doc_id=src.doc_id, tgt.namespace=src.namespace, tgt.xml_name=src.xml_name, tgt.self_ref=src.self_ref, tgt.sender=src.sender, tgt.recipient=src.recipient, tgt.doc_time=src.doc_time, tgt.version=src.version, tgt.mime_type=src.mime_type, tgt.response_to_id=src.response_to_id, tgt.decl_id=src.decl_id, tgt.attachment_to_id=src.attachment_to_id, tgt.description=src.description, tgt.ref_no=src.ref_no, tgt.direction=src.direction, tgt.doc_time_diff_mi=src.doc_time_diff_mi, tgt.doc_time_diff_dd=src.doc_time_diff_dd
		WHEN NOT MATCHED
		THEN INSERT (id, doc_id, namespace, xml_name, self_ref, sender, recipient, doc_time, version, mime_type, response_to_id, decl_id, attachment_to_id, description, ref_no, direction, doc_time_diff_mi, doc_time_diff_dd)
		VALUES (src.id, src.doc_id, src.namespace, src.xml_name, src.self_ref, src.sender, src.recipient, src.doc_time, src.version, src.mime_type, src.response_to_id, src.decl_id, src.attachment_to_id, src.description, src.ref_no, src.direction, src.doc_time_diff_mi, src.doc_time_diff_dd);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_itinerary' BEGIN
		MERGE INTO aies.ecs_query_itinerary AS tgt
		USING [WI_StageODS].aies.ecs_query_itinerary AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.country=src.country, tgt.exportquery_id=src.exportquery_id
		WHEN NOT MATCHED
		THEN INSERT (id, country, exportquery_id)
		VALUES (src.id, src.country, src.exportquery_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_consignee' BEGIN
		MERGE INTO aies.ecs_query_consignee AS tgt
		USING [WI_StageODS].aies.ecs_query_consignee AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.exportquery_id=src.exportquery_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, exportquery_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.exportquery_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_risk_analysis' BEGIN
		MERGE INTO aies.ecs_query_risk_analysis AS tgt
		USING [WI_StageODS].aies.ecs_query_risk_analysis AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.item_number=src.item_number, tgt.risk_analysis_lang=src.risk_analysis_lang, tgt.risk_analysis_result_code=src.risk_analysis_result_code, tgt.risk_analysis_text=src.risk_analysis_text, tgt.exportquery_id=src.exportquery_id
		WHEN NOT MATCHED
		THEN INSERT (id, item_number, risk_analysis_lang, risk_analysis_result_code, risk_analysis_text, exportquery_id)
		VALUES (src.id, src.item_number, src.risk_analysis_lang, src.risk_analysis_result_code, src.risk_analysis_text, src.exportquery_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_seal' BEGIN
		MERGE INTO aies.ecs_query_seal AS tgt
		USING [WI_StageODS].aies.ecs_query_seal AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ident=src.ident, tgt.identityLang=src.identityLang, tgt.exportquery_id=src.exportquery_id
		WHEN NOT MATCHED
		THEN INSERT (id, ident, identityLang, exportquery_id)
		VALUES (src.id, src.ident, src.identityLang, src.exportquery_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_exportquery' BEGIN
		MERGE INTO aies.ecs_query_exportquery AS tgt
		USING [WI_StageODS].aies.ecs_query_exportquery AS src
		ON (tgt.q_query_decl_id=src.q_query_decl_id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.q_acceptance_date=src.q_acceptance_date, tgt.q_co_exit=src.q_co_exit, tgt.q_co_export=src.q_co_export, tgt.q_co_request=src.q_co_request, tgt.q_container_indicator=src.q_container_indicator, tgt.q_control_date_limit=src.q_control_date_limit, tgt.q_control_result_code=src.q_control_result_code, tgt.q_country_dep_code=src.q_country_dep_code, tgt.q_dest_country_code=src.q_dest_country_code, tgt.q_dispatch_country_code=src.q_dispatch_country_code, tgt.q_crn=src.q_crn, tgt.q_request_date=src.q_request_date, tgt.q_decl_type=src.q_decl_type, tgt.q_decl_submit_time=src.q_decl_submit_time, tgt.q_ead_lang_code=src.q_ead_lang_code, tgt.q_exp_oper_state_type=src.q_exp_oper_state_type, tgt.q_gross_mass=src.q_gross_mass, tgt.q_identity_of_transport=src.q_identity_of_transport, tgt.q_id_of_tran_lang=src.q_id_of_tran_lang, tgt.q_issue_date=src.q_issue_date, tgt.q_mrn=src.q_mrn, tgt.q_number_of_items=src.q_number_of_items, tgt.q_num_of_packages=src.q_num_of_packages, tgt.q_oth_mov_info_reqest=src.q_oth_mov_info_reqest, tgt.q_oth_mov_info_req_lang=src.q_oth_mov_info_req_lang, tgt.q_oth_mov_info_response=src.q_oth_mov_info_response, tgt.q_oth_mov_info_resp_lang=src.q_oth_mov_info_resp_lang, tgt.q_query_reason_code=src.q_query_reason_code, tgt.s_seals_number=src.s_seals_number, tgt.q_spec_circum_indicator=src.q_spec_circum_indicator, tgt.q_status=src.q_status, tgt.q_tran_method_of_payment=src.q_tran_method_of_payment, tgt.request_msg_id=src.request_msg_id, tgt.dts=src.dts
		WHEN NOT MATCHED
		THEN INSERT (q_query_decl_id, q_acceptance_date, q_co_exit, q_co_export, q_co_request, q_container_indicator, q_control_date_limit, q_control_result_code, q_country_dep_code, q_dest_country_code, q_dispatch_country_code, q_crn, q_request_date, q_decl_type, q_decl_submit_time, q_ead_lang_code, q_exp_oper_state_type, q_gross_mass, q_identity_of_transport, q_id_of_tran_lang, q_issue_date, q_mrn, q_number_of_items, q_num_of_packages, q_oth_mov_info_reqest, q_oth_mov_info_req_lang, q_oth_mov_info_response, q_oth_mov_info_resp_lang, q_query_reason_code, s_seals_number, q_spec_circum_indicator, q_status, q_tran_method_of_payment, request_msg_id, dts)
		VALUES (src.q_query_decl_id, src.q_acceptance_date, src.q_co_exit, src.q_co_export, src.q_co_request, src.q_container_indicator, src.q_control_date_limit, src.q_control_result_code, src.q_country_dep_code, src.q_dest_country_code, src.q_dispatch_country_code, src.q_crn, src.q_request_date, src.q_decl_type, src.q_decl_submit_time, src.q_ead_lang_code, src.q_exp_oper_state_type, src.q_gross_mass, src.q_identity_of_transport, src.q_id_of_tran_lang, src.q_issue_date, src.q_mrn, src.q_number_of_items, src.q_num_of_packages, src.q_oth_mov_info_reqest, src.q_oth_mov_info_req_lang, src.q_oth_mov_info_response, src.q_oth_mov_info_resp_lang, src.q_query_reason_code, src.s_seals_number, src.q_spec_circum_indicator, src.q_status, src.q_tran_method_of_payment, src.request_msg_id, src.dts);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_exporter' BEGIN
		MERGE INTO aies.ecs_query_exporter AS tgt
		USING [WI_StageODS].aies.ecs_query_exporter AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.exportquery_id=src.exportquery_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, exportquery_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.exportquery_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_goods_item' BEGIN
		MERGE INTO aies.ecs_query_goods_item AS tgt
		USING [WI_StageODS].aies.ecs_query_goods_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.cc_combined_nomenclature=src.cc_combined_nomenclature, tgt.cc_national_add_code=src.cc_national_add_code, tgt.cc_taric_code=src.cc_taric_code, tgt.cc_taric_1st_add_code=src.cc_taric_1st_add_code, tgt.cc_taric_2nd_add_code=src.cc_taric_2nd_add_code, tgt.gi_country_of_destination=src.gi_country_of_destination, tgt.gi_country_of_export=src.gi_country_of_export, tgt.gi_crn=src.gi_crn, tgt.gi_desc=src.gi_desc, tgt.gi_desc_lang=src.gi_desc_lang, tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_item_no=src.gi_item_no, tgt.gi_national_procedure=src.gi_national_procedure, tgt.gi_net_mass=src.gi_net_mass, tgt.gi_proc_previous=src.gi_proc_previous, tgt.gi_proc_requested=src.gi_proc_requested, tgt.gi_statistical_value=src.gi_statistical_value, tgt.gi_statistical_val_currency=src.gi_statistical_val_currency, tgt.gi_transport_fee_pay_type=src.gi_transport_fee_pay_type, tgt.gi_un_dangerous_goods=src.gi_un_dangerous_goods, tgt.exportquery_id=src.exportquery_id
		WHEN NOT MATCHED
		THEN INSERT (id, cc_combined_nomenclature, cc_national_add_code, cc_taric_code, cc_taric_1st_add_code, cc_taric_2nd_add_code, gi_country_of_destination, gi_country_of_export, gi_crn, gi_desc, gi_desc_lang, gi_gross_mass, gi_item_no, gi_national_procedure, gi_net_mass, gi_proc_previous, gi_proc_requested, gi_statistical_value, gi_statistical_val_currency, gi_transport_fee_pay_type, gi_un_dangerous_goods, exportquery_id)
		VALUES (src.id, src.cc_combined_nomenclature, src.cc_national_add_code, src.cc_taric_code, src.cc_taric_1st_add_code, 
		src.cc_taric_2nd_add_code, src.gi_country_of_destination, src.gi_country_of_export,
		 src.gi_crn, src.gi_desc, src.gi_desc_lang, src.gi_gross_mass, 
		src.gi_item_no, src.gi_national_procedure, src.gi_net_mass,
		 src.gi_proc_previous, src.gi_proc_requested, src.gi_statistical_value, src.gi_statistical_val_currency,
		 src.gi_transport_fee_pay_type, src.gi_un_dangerous_goods, src.exportquery_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_package' BEGIN
		MERGE INTO aies.ecs_query_package AS tgt
		USING [WI_StageODS].aies.ecs_query_package AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.kind=src.kind, tgt.marks=src.marks, tgt.marks_lang=src.marks_lang, tgt.no_of_packages=src.no_of_packages, tgt.no_of_pieces=src.no_of_pieces, tgt.gi_id=src.gi_id
		WHEN NOT MATCHED
		THEN INSERT (id, kind, marks, marks_lang, no_of_packages, no_of_pieces, gi_id)
		VALUES (src.id, src.kind, src.marks, src.marks_lang, src.no_of_packages, src.no_of_pieces, src.gi_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_previous_document' BEGIN
		MERGE INTO aies.ecs_query_previous_document AS tgt
		USING [WI_StageODS].aies.ecs_query_previous_document AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ref=src.ref, tgt.ref_lang=src.ref_lang, tgt.type=src.type, tgt.gi_id=src.gi_id
		WHEN NOT MATCHED
		THEN INSERT (id, ref, ref_lang, type, gi_id)
		VALUES (src.id, src.ref, src.ref_lang, src.type, src.gi_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_produced_document' BEGIN
		MERGE INTO aies.ecs_query_produced_document AS tgt
		USING [WI_StageODS].aies.ecs_query_produced_document AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ref=src.ref, tgt.ref_lang=src.ref_lang, tgt.type=src.type, tgt.gi_id=src.gi_id
		WHEN NOT MATCHED
		THEN INSERT (id, ref, ref_lang, type, gi_id)
		VALUES (src.id, src.ref, src.ref_lang, src.type, src.gi_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_special_mention' BEGIN
		MERGE INTO aies.ecs_query_special_mention AS tgt
		USING [WI_StageODS].aies.ecs_query_special_mention AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.text=src.text, tgt.text_lang=src.text_lang, tgt.gi_id=src.gi_id
		WHEN NOT MATCHED
		THEN INSERT (id, code, text, text_lang, gi_id)
		VALUES (src.id, src.code, src.text, src.text_lang, src.gi_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_consignee_of_item' BEGIN
		MERGE INTO aies.ecs_query_consignee_of_item AS tgt
		USING [WI_StageODS].aies.ecs_query_consignee_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.gi_id=src.gi_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, gi_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.gi_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_container' BEGIN
		MERGE INTO aies.ecs_query_container AS tgt
		USING [WI_StageODS].aies.ecs_query_container AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.identity_f=src.identity_f, tgt.gi_id=src.gi_id
		WHEN NOT MATCHED
		THEN INSERT (id, identity_f, gi_id)
		VALUES (src.id, src.identity_f, src.gi_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_query_exporter_of_item' BEGIN
		MERGE INTO aies.ecs_query_exporter_of_item AS tgt
		USING [WI_StageODS].aies.ecs_query_exporter_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.gi_id=src.gi_id, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, gi_id, email)
		VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.gi_id, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_declcopresent' BEGIN
		MERGE INTO aies.ecs_zwp_declcopresent AS tgt
		USING [WI_StageODS].aies.ecs_zwp_declcopresent AS src
		ON (tgt.decl_id=src.decl_id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.zwp_gross_mass=src.zwp_gross_mass, tgt.zwp_gross_mass_pt_c=src.zwp_gross_mass_pt_c, tgt.zwp_no_of_items_pt_c=src.zwp_no_of_items_pt_c, tgt.crb_code=src.crb_code, tgt.crb_state_of_seals=src.crb_state_of_seals, tgt.pad_place=src.pad_place, tgt.pad_date=src.pad_date, tgt.s_quantity=src.s_quantity, tgt.cr_code=src.cr_code, tgt.log_co=src.log_co, tgt.log_location_desc=src.log_location_desc, tgt.log_location_code=src.log_location_code, tgt.pos_location_desc=src.pos_location_desc, tgt.pos_location_code=src.pos_location_code, tgt.it_identity_pt=src.it_identity_pt, tgt.it_identity_pt_c=src.it_identity_pt_c, tgt.it_identity=src.it_identity, tgt.zwp_ecs_decl=src.zwp_ecs_decl, tgt.zwp_co_of_exit=src.zwp_co_of_exit, tgt.zwp_co_of_exit_declared=src.zwp_co_of_exit_declared, tgt.zwp_co_of_exit_changed_to=src.zwp_co_of_exit_changed_to, tgt.zwp_storing=src.zwp_storing, tgt.zwp_co_of_export=src.zwp_co_of_export, tgt.zwp_decl_type_1a=src.zwp_decl_type_1a, tgt.zwp_no_of_items=src.zwp_no_of_items, tgt.zwp_no_of_items_pt=src.zwp_no_of_items_pt, tgt.zwp_no_of_package=src.zwp_no_of_package, tgt.zwp_no_of_packages_pt=src.zwp_no_of_packages_pt, tgt.zwp_no_of_packages_pt_c=src.zwp_no_of_packages_pt_c, tgt.zwp_country_of_export=src.zwp_country_of_export, tgt.zwp_country_of_dest=src.zwp_country_of_dest, tgt.zwp_containers=src.zwp_containers, tgt.zwp_gross_mass_pt=src.zwp_gross_mass_pt, tgt.zwp_acceptance_date=src.zwp_acceptance_date, tgt.zwp_issuing_date=src.zwp_issuing_date, tgt.zwp_ead_language=src.zwp_ead_language, tgt.zwp_time_to_send_exit_result=src.zwp_time_to_send_exit_result, tgt.zwp_time_to_border_arrival=src.zwp_time_to_border_arrival, tgt.zwp_presentation_date=src.zwp_presentation_date, tgt.zwp_notification_date=src.zwp_notification_date, tgt.zwp_status=src.zwp_status, tgt.zwp_exit_date=src.zwp_exit_date, tgt.zwp_present_stopped_date=src.zwp_present_stopped_date, tgt.zwp_com_ref_num=src.zwp_com_ref_num, tgt.zwp_com_ref_num_di=src.zwp_com_ref_num_di, tgt.zwp_com_ref_num_di_c=src.zwp_com_ref_num_di_c, tgt.zwp_dec_sub_tim=src.zwp_dec_sub_tim, tgt.zwp_tra_cha_met=src.zwp_tra_cha_met, tgt.zwp_tra_cha_met_di=src.zwp_tra_cha_met_di, tgt.zwp_tra_cha_met_di_c=src.zwp_tra_cha_met_di_c, tgt.zwp_spe_cir_ind=src.zwp_spe_cir_ind, tgt.pad_realDate=src.pad_realDate, tgt.crb_code_before_transit=src.crb_code_before_transit, tgt.transit=src.transit
		WHEN NOT MATCHED
		THEN INSERT (decl_id, zwp_gross_mass, zwp_gross_mass_pt_c, zwp_no_of_items_pt_c, crb_code, crb_state_of_seals, pad_place, pad_date, s_quantity, cr_code, log_co, log_location_desc, log_location_code, pos_location_desc, pos_location_code, it_identity_pt, it_identity_pt_c, it_identity, zwp_ecs_decl, zwp_co_of_exit, zwp_co_of_exit_declared, zwp_co_of_exit_changed_to, zwp_storing, zwp_co_of_export, zwp_decl_type_1a, zwp_no_of_items, zwp_no_of_items_pt, zwp_no_of_package, zwp_no_of_packages_pt, zwp_no_of_packages_pt_c, zwp_country_of_export, zwp_country_of_dest, zwp_containers, zwp_gross_mass_pt, zwp_acceptance_date, zwp_issuing_date, zwp_ead_language, zwp_time_to_send_exit_result, zwp_time_to_border_arrival, zwp_presentation_date, zwp_notification_date, zwp_status, zwp_exit_date, zwp_present_stopped_date, zwp_com_ref_num, zwp_com_ref_num_di, zwp_com_ref_num_di_c, zwp_dec_sub_tim, zwp_tra_cha_met, zwp_tra_cha_met_di, zwp_tra_cha_met_di_c, zwp_spe_cir_ind, pad_realDate, crb_code_before_transit, transit)
		VALUES (src.decl_id, src.zwp_gross_mass, src.zwp_gross_mass_pt_c, src.zwp_no_of_items_pt_c, src.crb_code, src.crb_state_of_seals, src.pad_place, src.pad_date, src.s_quantity, src.cr_code, src.log_co, src.log_location_desc, src.log_location_code, src.pos_location_desc, src.pos_location_code, src.it_identity_pt, src.it_identity_pt_c, src.it_identity, src.zwp_ecs_decl, src.zwp_co_of_exit, src.zwp_co_of_exit_declared, src.zwp_co_of_exit_changed_to, src.zwp_storing, src.zwp_co_of_export, src.zwp_decl_type_1a, src.zwp_no_of_items, src.zwp_no_of_items_pt, src.zwp_no_of_package, src.zwp_no_of_packages_pt, src.zwp_no_of_packages_pt_c, src.zwp_country_of_export, src.zwp_country_of_dest, src.zwp_containers, src.zwp_gross_mass_pt, src.zwp_acceptance_date, src.zwp_issuing_date, src.zwp_ead_language, src.zwp_time_to_send_exit_result, src.zwp_time_to_border_arrival, src.zwp_presentation_date, src.zwp_notification_date, src.zwp_status, src.zwp_exit_date, src.zwp_present_stopped_date, src.zwp_com_ref_num, src.zwp_com_ref_num_di, src.zwp_com_ref_num_di_c, src.zwp_dec_sub_tim, src.zwp_tra_cha_met, src.zwp_tra_cha_met_di, src.zwp_tra_cha_met_di_c, src.zwp_spe_cir_ind, src.pad_realDate, src.crb_code_before_transit, src.transit);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_itinerary' BEGIN
		MERGE INTO aies.ecs_zwp_itinerary AS tgt
		USING [WI_StageODS].aies.ecs_zwp_itinerary AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.country=src.country, tgt.declcopresent_decl_id=src.declcopresent_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, country, declcopresent_decl_id)
		VALUES (src.id, src.country, src.declcopresent_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_risk_analysis' BEGIN
		MERGE INTO aies.ecs_zwp_risk_analysis AS tgt
		USING [WI_StageODS].aies.ecs_zwp_risk_analysis AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ra_desc=src.ra_desc, tgt.ra_desc_lng=src.ra_desc_lng, tgt.ra_item_no=src.ra_item_no, tgt.war_code=src.war_code, tgt.declcopresent_decl_id=src.declcopresent_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, ra_desc, ra_desc_lng, ra_item_no, war_code, declcopresent_decl_id)
		VALUES (src.id, src.ra_desc, src.ra_desc_lng, src.ra_item_no, src.war_code, src.declcopresent_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_seal' BEGIN
		MERGE INTO aies.ecs_zwp_seal AS tgt
		USING [WI_StageODS].aies.ecs_zwp_seal AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.identity_f=src.identity_f, tgt.declcopresent_decl_id=src.declcopresent_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, identity_f, declcopresent_decl_id)
		VALUES (src.id, src.identity_f, src.declcopresent_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_trader_at_present' BEGIN
		MERGE INTO aies.ecs_zwp_trader_at_present AS tgt
		USING [WI_StageODS].aies.ecs_zwp_trader_at_present AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcopresent_decl_id=src.declcopresent_decl_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcopresent_decl_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcopresent_decl_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_consignee' BEGIN
		MERGE INTO aies.ecs_zwp_consignee AS tgt
		USING [WI_StageODS].aies.ecs_zwp_consignee AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcopresent_decl_id=src.declcopresent_decl_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcopresent_decl_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcopresent_decl_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_decl_pt_c' BEGIN
		MERGE INTO aies.ecs_zwp_decl_pt_c AS tgt
		USING [WI_StageODS].aies.ecs_zwp_decl_pt_c AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.comment_f=src.comment_f, tgt.declcopresent_decl_id=src.declcopresent_decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, comment_f, declcopresent_decl_id)
		VALUES (src.id, src.comment_f, src.declcopresent_decl_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_exporter' BEGIN
		MERGE INTO aies.ecs_zwp_exporter AS tgt
		USING [WI_StageODS].aies.ecs_zwp_exporter AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcopresent_decl_id=src.declcopresent_decl_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcopresent_decl_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcopresent_decl_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_goods_item' BEGIN
		MERGE INTO aies.ecs_zwp_goods_item AS tgt
		USING [WI_StageODS].aies.ecs_zwp_goods_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_country_of_export=src.gi_country_of_export, tgt.gi_country_of_destination=src.gi_country_of_destination, tgt.gi_gross_mass_br=src.gi_gross_mass_br, tgt.gi_item_no=src.gi_item_no, tgt.gi_commodity_code=src.gi_commodity_code, tgt.gi_state_br=src.gi_state_br, tgt.gi_desc_br=src.gi_desc_br, tgt.gi_commodity_code_br=src.gi_commodity_code_br, tgt.gi_net_mass=src.gi_net_mass, tgt.gi_net_mass_br=src.gi_net_mass_br, tgt.gi_desc=src.gi_desc, tgt.declcopresent_decl_id=src.declcopresent_decl_id, tgt.gi_pro_req=src.gi_pro_req, tgt.gi_pre_pro=src.gi_pre_pro, tgt.gi_com_nom_di=src.gi_com_nom_di, tgt.gi_tar_cod_di=src.gi_tar_cod_di, tgt.gi_met_of_pay=src.gi_met_of_pay, tgt.gi_com_nat_pro=src.gi_com_nat_pro, tgt.gi_sta_val_cur=src.gi_sta_val_cur, tgt.gi_sta_val_amo=src.gi_sta_val_amo, tgt.gi_com_ref_num=src.gi_com_ref_num, tgt.gi_un_dan_goo_cod=src.gi_un_dan_goo_cod, tgt.gi_com_nom=src.gi_com_nom, tgt.gi_tar_cod=src.gi_tar_cod, tgt.gi_tar_fir_add_cod=src.gi_tar_fir_add_cod, tgt.gi_tar_sec_add_cod=src.gi_tar_sec_add_cod, tgt.gi_nat_dd_cod=src.gi_nat_dd_cod, tgt.gi_com_nat_pro_di=src.gi_com_nat_pro_di, tgt.gi_com_ref_num_di=src.gi_com_ref_num_di, tgt.gi_met_of_pay_di=src.gi_met_of_pay_di, tgt.gi_sta_val_amo_di=src.gi_sta_val_amo_di, tgt.gi_sta_val_cur_di=src.gi_sta_val_cur_di, tgt.gi_tar_fir_add_cod_di=src.gi_tar_fir_add_cod_di, tgt.gi_tar_sec_add_cod_di=src.gi_tar_sec_add_cod_di, tgt.gi_un_dan_goo_cod_di=src.gi_un_dan_goo_cod_di
		WHEN NOT MATCHED
		THEN INSERT (id, gi_gross_mass, gi_country_of_export, gi_country_of_destination, gi_gross_mass_br, gi_item_no, gi_commodity_code, gi_state_br, gi_desc_br, gi_commodity_code_br, gi_net_mass, gi_net_mass_br, gi_desc, declcopresent_decl_id, gi_pro_req, gi_pre_pro, gi_com_nom_di, gi_tar_cod_di, gi_met_of_pay, gi_com_nat_pro, gi_sta_val_cur, gi_sta_val_amo, gi_com_ref_num, gi_un_dan_goo_cod, gi_com_nom, gi_tar_cod, gi_tar_fir_add_cod, gi_tar_sec_add_cod, gi_nat_dd_cod, gi_com_nat_pro_di, gi_com_ref_num_di, gi_met_of_pay_di, gi_sta_val_amo_di, gi_sta_val_cur_di, gi_tar_fir_add_cod_di, gi_tar_sec_add_cod_di, gi_un_dan_goo_cod_di)
		VALUES (src.id, src.gi_gross_mass, src.gi_country_of_export, src.gi_country_of_destination, src.gi_gross_mass_br, src.gi_item_no, src.gi_commodity_code, src.gi_state_br, src.gi_desc_br, src.gi_commodity_code_br, src.gi_net_mass, src.gi_net_mass_br, src.gi_desc, src.declcopresent_decl_id, src.gi_pro_req, src.gi_pre_pro, src.gi_com_nom_di, src.gi_tar_cod_di, src.gi_met_of_pay, src.gi_com_nat_pro, src.gi_sta_val_cur, src.gi_sta_val_amo, src.gi_com_ref_num, src.gi_un_dan_goo_cod, src.gi_com_nom, src.gi_tar_cod, src.gi_tar_fir_add_cod, src.gi_tar_sec_add_cod, src.gi_nat_dd_cod, src.gi_com_nat_pro_di, src.gi_com_ref_num_di, src.gi_met_of_pay_di, src.gi_sta_val_amo_di, src.gi_sta_val_cur_di, src.gi_tar_fir_add_cod_di, src.gi_tar_sec_add_cod_di, src.gi_un_dan_goo_cod_di);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_item_pt_c' BEGIN
		MERGE INTO aies.ecs_zwp_item_pt_c AS tgt
		USING [WI_StageODS].aies.ecs_zwp_item_pt_c AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.comment_f=src.comment_f, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, comment_f, goods_item_id)
		VALUES (src.id, src.comment_f, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_package' BEGIN
		MERGE INTO aies.ecs_zwp_package AS tgt
		USING [WI_StageODS].aies.ecs_zwp_package AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.no_of_packages=src.no_of_packages, tgt.kind=src.kind, tgt.no_of_pieces=src.no_of_pieces, tgt.state_br=src.state_br, tgt.marks=src.marks, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, no_of_packages, kind, no_of_pieces, state_br, marks, goods_item_id)
		VALUES (src.id, src.no_of_packages, src.kind, src.no_of_pieces, src.state_br, src.marks, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_produced_document' BEGIN
		MERGE INTO aies.ecs_zwp_produced_document AS tgt
		USING [WI_StageODS].aies.ecs_zwp_produced_document AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.state_br=src.state_br, tgt.state_br_c=src.state_br_c, tgt.type_f=src.type_f, tgt.ref_t=src.ref_t, tgt.goods_item_id=src.goods_item_id, tgt.transit=src.transit
		WHEN NOT MATCHED
		THEN INSERT (id, state_br, state_br_c, type_f, ref_t, goods_item_id, transit)
		VALUES (src.id, src.state_br, src.state_br_c, src.type_f, src.ref_t, src.goods_item_id, src.transit);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_previous_document' BEGIN
		MERGE INTO aies.ecs_zwp_previous_document AS tgt
		USING [WI_StageODS].aies.ecs_zwp_previous_document AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.type_f=src.type_f, tgt.ref_f=src.ref_f, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, type_f, ref_f, goods_item_id)
		VALUES (src.id, src.type_f, src.ref_f, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_special_mention' BEGIN
		MERGE INTO aies.ecs_zwp_special_mention AS tgt
		USING [WI_StageODS].aies.ecs_zwp_special_mention AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.goods_item_id=src.goods_item_id, tgt.text=src.text, tgt.textlng=src.textlng
		WHEN NOT MATCHED
		THEN INSERT (id, code, goods_item_id, text, textlng)
		VALUES (src.id, src.code, src.goods_item_id, src.text, src.textlng);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_consignee_of_item' BEGIN
		MERGE INTO aies.ecs_zwp_consignee_of_item AS tgt
		USING [WI_StageODS].aies.ecs_zwp_consignee_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.goods_item_id=src.goods_item_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, goods_item_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.goods_item_id, src.eori, src.email);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_container' BEGIN
		MERGE INTO aies.ecs_zwp_container AS tgt
		USING [WI_StageODS].aies.ecs_zwp_container AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.state_br=src.state_br, tgt.identity_f=src.identity_f, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, state_br, identity_f, goods_item_id)
		VALUES (src.id, src.state_br, src.identity_f, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_zwp_exporter_of_item' BEGIN
		MERGE INTO aies.ecs_zwp_exporter_of_item AS tgt
		USING [WI_StageODS].aies.ecs_zwp_exporter_of_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.goods_item_id=src.goods_item_id, tgt.eori=src.eori, tgt.email=src.email
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, goods_item_id, eori, email)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.goods_item_id, src.eori, src.email);
        SET @Merged = 1;
	END
	/* N-ty kontener */
	IF @TableName = 'sec_applications' BEGIN
		MERGE INTO aies.sec_applications AS tgt
		USING [WI_StageODS].aies.sec_applications AS src
		ON (tgt.app_code=src.app_code)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.app_name=src.app_name
		WHEN NOT MATCHED
		THEN INSERT (app_code, app_name)
		VALUES (src.app_code, src.app_name);
        SET @Merged = 1;
	END
	IF @TableName = 'sec_users_groups' BEGIN
		MERGE INTO aies.sec_users_groups AS tgt
		USING [WI_StageODS].aies.sec_users_groups AS src
		ON (tgt.user_id=src.user_id AND tgt.group_id=src.group_id)
		WHEN NOT MATCHED
		THEN INSERT (user_id, group_id)
		VALUES (src.user_id, src.group_id);
        SET @Merged = 1;
	END
	IF @TableName = 'sec_user_history' BEGIN
		MERGE INTO aies.sec_user_history AS tgt
		USING [WI_StageODS].aies.sec_user_history AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.user_id=src.user_id, tgt.group_id=src.group_id, tgt.group_name=src.group_name, tgt.department=src.department, tgt.startdate=src.startdate, tgt.enddate=src.enddate, tgt.user_status=src.user_status
		WHEN NOT MATCHED
		THEN INSERT (id, user_id, group_id, group_name, department, startdate, enddate, user_status)
		VALUES (src.id, src.user_id, src.group_id, src.group_name, src.department, src.startdate, src.enddate, src.user_status);
        SET @Merged = 1;
	END
	IF @TableName = 'sec_groups_history' BEGIN
		MERGE INTO aies.sec_groups_history AS tgt
		USING [WI_StageODS].aies.sec_groups_history AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.action_id=src.action_id, tgt.group_id=src.group_id, tgt.group_name=src.group_name, tgt.startdate=src.startdate, tgt.enddate=src.enddate
		WHEN NOT MATCHED
		THEN INSERT (id, action_id, group_id, group_name, startdate, enddate)
		VALUES (src.id, src.action_id, src.group_id, src.group_name, src.startdate, src.enddate);
        SET @Merged = 1;
	END
	IF @TableName = 'sec_groups_actions' BEGIN
		DELETE aies.sec_groups_actions
		MERGE INTO aies.sec_groups_actions AS tgt
		USING [WI_StageODS].aies.sec_groups_actions AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.group_id=src.group_id, tgt.action_id=src.action_id
		WHEN NOT MATCHED
		THEN INSERT (group_id, action_id)
		VALUES (src.group_id, src.action_id);
        SET @Merged = 1;
	END
	IF @TableName = 'sec_groups' BEGIN
		MERGE INTO aies.sec_groups AS tgt
		USING [WI_StageODS].aies.sec_groups AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.grp_code=src.grp_code, tgt.app_code=src.app_code, tgt.grp_name=src.grp_name, tgt.profil=src.profil
		WHEN NOT MATCHED
		THEN INSERT (id, grp_code, app_code, grp_name, profil)
		VALUES (src.id, src.grp_code, src.app_code, src.grp_name, src.profil);
        SET @Merged = 1;
	END
	IF @TableName = 'sec_users' BEGIN
		MERGE INTO aies.sec_users AS tgt
		USING [WI_StageODS].aies.sec_users AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.login=src.login, tgt.department=src.department, tgt.usr_name=src.usr_name, tgt.version=src.version, tgt.status=src.status
		WHEN NOT MATCHED
		THEN INSERT (id, login, department, usr_name, version, status)
		VALUES (src.id, src.login, src.department, src.usr_name, src.version, src.status);
        SET @Merged = 1;
	END
	IF @TableName = 'sec_actions' BEGIN
		MERGE INTO aies.sec_actions AS tgt
		USING [WI_StageODS].aies.sec_actions AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.action_code=src.action_code, tgt.action_description=src.action_description, tgt.action_visibility=src.action_visibility
		WHEN NOT MATCHED
		THEN INSERT (id, action_code, action_description, action_visibility)
		VALUES (src.id, src.action_code, src.action_description, src.action_visibility);
        SET @Merged = 1;
	END
	/* N-ty kontener */
	IF @TableName = 'ref_slw' BEGIN
		MERGE INTO aies.ref_slw AS tgt
		USING [WI_StageODS].aies.ref_slw AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.version=src.version, tgt.code=src.code, tgt.type=src.type, tgt.dts=src.dts
		WHEN NOT MATCHED
		THEN INSERT (id, version, code, type, dts)
		VALUES (src.id, src.version, src.code, src.type, src.dts);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_work_time_exception' BEGIN
		MERGE INTO aies.ref_work_time_exception AS tgt
		USING [WI_StageODS].aies.ref_work_time_exception AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.slw_id=src.slw_id, tgt.co_code=src.co_code, tgt.date_s=src.date_s, tgt.hour_from=src.hour_from, tgt.hour_to=src.hour_to
		WHEN NOT MATCHED
		THEN INSERT (id, slw_id, co_code, date_s, hour_from, hour_to)
		VALUES (src.id, src.slw_id, src.co_code, src.date_s, src.hour_from, src.hour_to);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_work_calendar_sp' BEGIN
		MERGE INTO aies.ref_work_calendar_sp AS tgt
		USING [WI_StageODS].aies.ref_work_calendar_sp AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.slw_id=src.slw_id, tgt.co_code=src.co_code, tgt.YEAR=src.YEAR
		WHEN NOT MATCHED
		THEN INSERT (id, slw_id, co_code, YEAR)
		VALUES (src.id, src.slw_id, src.co_code, src.YEAR);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_work_season_sp' BEGIN
		MERGE INTO aies.ref_work_season_sp AS tgt
		USING [WI_StageODS].aies.ref_work_season_sp AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.work_calendar_id=src.work_calendar_id, tgt.season_no=src.season_no, tgt.name_f=src.name_f, tgt.from_date=src.from_date, tgt.to_date=src.to_date
		WHEN NOT MATCHED
		THEN INSERT (id, work_calendar_id, season_no, name_f, from_date, to_date)
		VALUES (src.id, src.work_calendar_id, src.season_no, src.name_f, src.from_date, src.to_date);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_work_position_sp' BEGIN
		MERGE INTO aies.ref_work_position_sp AS tgt
		USING [WI_StageODS].aies.ref_work_position_sp AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.work_season_id=src.work_season_id, tgt.day_from=src.day_from, tgt.day_to=src.day_to, tgt.hour_from=src.hour_from, tgt.hour_to=src.hour_to, tgt.hour_from2=src.hour_from2, tgt.hour_to2=src.hour_to2
		WHEN NOT MATCHED
		THEN INSERT (id, work_season_id, day_from, day_to, hour_from, hour_to, hour_from2, hour_to2)
		VALUES (src.id, src.work_season_id, src.day_from, src.day_to, src.hour_from, src.hour_to, src.hour_from2, src.hour_to2);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_sp_authorisation' BEGIN
		MERGE INTO aies.ref_sp_authorisation AS tgt
		USING [WI_StageODS].aies.ref_sp_authorisation AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.slw_id=src.slw_id, tgt.no=src.no, tgt.active=src.active, tgt.export_off_duty=src.export_off_duty, tgt.from_date=src.from_date, tgt.to_date=src.to_date, tgt.tin=src.tin
		WHEN NOT MATCHED
		THEN INSERT (id, slw_id, no, active, export_off_duty, from_date, to_date, tin)
		VALUES (src.id, src.slw_id, src.no, src.active, src.export_off_duty, src.from_date, src.to_date, src.tin);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_sp_authorisation_co' BEGIN
		MERGE INTO aies.ref_sp_authorisation_co AS tgt
		USING [WI_StageODS].aies.ref_sp_authorisation_co AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.sp_authorisation_id=src.sp_authorisation_id, tgt.response_time=src.response_time, tgt.co_code=src.co_code, tgt.before_end_time=src.before_end_time
		WHEN NOT MATCHED
		THEN INSERT (id, sp_authorisation_id, response_time, co_code, before_end_time)
		VALUES (src.id, src.sp_authorisation_id, src.response_time, src.co_code, src.before_end_time);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_sp_authorisation_location' BEGIN
		MERGE INTO aies.ref_sp_authorisation_location AS tgt
		USING [WI_StageODS].aies.ref_sp_authorisation_location AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.sp_authorisation_id=src.sp_authorisation_id, tgt.code=src.code
		WHEN NOT MATCHED
		THEN INSERT (id, sp_authorisation_id, code)
		VALUES (src.id, src.sp_authorisation_id, src.code);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_sp_authorisation_procedure' BEGIN
		MERGE INTO aies.ref_sp_authorisation_procedure AS tgt
		USING [WI_StageODS].aies.ref_sp_authorisation_procedure AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.sp_authorisation_id=src.sp_authorisation_id, tgt.code=src.code
		WHEN NOT MATCHED
		THEN INSERT (id, sp_authorisation_id, code)
		VALUES (src.id, src.sp_authorisation_id, src.code);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_slw_item' BEGIN
		MERGE INTO aies.ref_slw_item AS tgt
		USING [WI_StageODS].aies.ref_slw_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.code=src.code, tgt.from_date=src.from_date, tgt.to_date=src.to_date, tgt.slw_id=src.slw_id, tgt.description=src.description
		WHEN NOT MATCHED
		THEN INSERT (id, code, from_date, to_date, slw_id, description)
		VALUES (src.id, src.code, src.from_date, src.to_date, src.slw_id, src.description);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_place' BEGIN
		MERGE INTO aies.ref_place AS tgt
		USING [WI_StageODS].aies.ref_place AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.slw_id=src.slw_id, tgt.code=src.code, tgt.short_name=src.short_name, tgt.from_date=src.from_date, tgt.to_date=src.to_date
		WHEN NOT MATCHED
		THEN INSERT (id, slw_id, code, short_name, from_date, to_date)
		VALUES (src.id, src.slw_id, src.code, src.short_name, src.from_date, src.to_date);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_holiday' BEGIN
		MERGE INTO aies.ref_holiday AS tgt
		USING [WI_StageODS].aies.ref_holiday AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.slw_id=src.slw_id, tgt.moving=src.moving, tgt.YEAR=src.YEAR, tgt.MONTH=src.MONTH, tgt.DAY=src.DAY, tgt.from_date=src.from_date, tgt.to_date=src.to_date
		WHEN NOT MATCHED
		THEN INSERT (id, slw_id, moving, YEAR, MONTH, DAY, from_date, to_date)
		VALUES (src.id, src.slw_id, src.moving, src.YEAR, src.MONTH, src.DAY, src.from_date, src.to_date);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_exit_acceptance' BEGIN
		MERGE INTO aies.ref_exit_acceptance AS tgt
		USING [WI_StageODS].aies.ref_exit_acceptance AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.slw_id=src.slw_id, tgt.code=src.code, tgt.short_name=src.short_name, tgt.from_date=src.from_date, tgt.to_date=src.to_date
		WHEN NOT MATCHED
		THEN INSERT (id, slw_id, code, short_name, from_date, to_date)
		VALUES (src.id, src.slw_id, src.code, src.short_name, src.from_date, src.to_date);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_custom_office' BEGIN
		MERGE INTO aies.ref_custom_office AS tgt
		USING [WI_StageODS].aies.ref_custom_office AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.slw_id=src.slw_id, tgt.code=src.code, tgt.short_name=src.short_name, tgt.from_date=src.from_date, tgt.to_date=src.to_date, tgt.overriding_code=src.overriding_code, tgt.full_name=src.full_name, tgt.street_and_number=src.street_and_number, tgt.post_code=src.post_code, tgt.city=src.city, tgt.country=src.country
		WHEN NOT MATCHED
		THEN INSERT (id, slw_id, code, short_name, from_date, to_date, overriding_code, full_name, street_and_number, post_code, city, country)
		VALUES (src.id, src.slw_id, src.code, src.short_name, src.from_date, src.to_date, src.overriding_code, src.full_name, src.street_and_number, src.post_code, src.city, src.country);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_customer' BEGIN
		MERGE INTO aies.ref_customer AS tgt
		USING [WI_StageODS].aies.ref_customer AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.slw_id=src.slw_id, tgt.short_name=src.short_name, tgt.tin=src.tin, tgt.regon=src.regon, tgt.from_date=src.from_date, tgt.to_date=src.to_date, tgt.post_code=src.post_code, tgt.city=src.city, tgt.street_and_number=src.street_and_number, tgt.country=src.country, tgt.full_name=src.full_name, tgt.eori=src.eori
		WHEN NOT MATCHED
		THEN INSERT (id, slw_id, short_name, tin, regon, from_date, to_date, post_code, city, street_and_number, country, full_name, eori)
		VALUES (src.id, src.slw_id, src.short_name, src.tin, src.regon, src.from_date, src.to_date, src.post_code, src.city, src.street_and_number, src.country, src.full_name, src.eori);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_work_calendar' BEGIN
		MERGE INTO aies.ref_work_calendar AS tgt
		USING [WI_StageODS].aies.ref_work_calendar AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.slw_id=src.slw_id, tgt.co_code=src.co_code, tgt.YEAR=src.YEAR
		WHEN NOT MATCHED
		THEN INSERT (id, slw_id, co_code, YEAR)
		VALUES (src.id, src.slw_id, src.co_code, src.YEAR);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_work_season' BEGIN
		MERGE INTO aies.ref_work_season AS tgt
		USING [WI_StageODS].aies.ref_work_season AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.work_calendar_id=src.work_calendar_id, tgt.season_no=src.season_no, tgt.name_f=src.name_f, tgt.from_date=src.from_date, tgt.to_date=src.to_date
		WHEN NOT MATCHED
		THEN INSERT (id, work_calendar_id, season_no, name_f, from_date, to_date)
		VALUES (src.id, src.work_calendar_id, src.season_no, src.name_f, src.from_date, src.to_date);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_work_position' BEGIN
		MERGE INTO aies.ref_work_position AS tgt
		USING [WI_StageODS].aies.ref_work_position AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.work_season_id=src.work_season_id, tgt.day_from=src.day_from, tgt.day_to=src.day_to, tgt.hour_from=src.hour_from, tgt.hour_to=src.hour_to, tgt.hour_from2=src.hour_from2, tgt.hour_to2=src.hour_to2
		WHEN NOT MATCHED
		THEN INSERT (id, work_season_id, day_from, day_to, hour_from, hour_to, hour_from2, hour_to2)
		VALUES (src.id, src.work_season_id, src.day_from, src.day_to, src.hour_from, src.hour_to, src.hour_from2, src.hour_to2);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_work_role' BEGIN
		MERGE INTO aies.ref_work_role AS tgt
		USING [WI_StageODS].aies.ref_work_role AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.work_position_id=src.work_position_id, tgt.role_f=src.role_f, tgt.transport=src.transport
		WHEN NOT MATCHED
		THEN INSERT (id, work_position_id, role_f, transport)
		VALUES (src.id, src.work_position_id, src.role_f, src.transport);
        SET @Merged = 1;
	END
	/* N-ty kontener */

	IF @TableName = 'ICS_DISREPANCY' BEGIN
		MERGE INTO aies.ICS_DISREPANCY AS tgt
		USING [WI_StageODS].aies.ICS_DISREPANCY AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.dirt_id=src.dirt_id, tgt.pointer=src.pointer, tgt.was_value=src.was_value, tgt.is_value=src.is_value
		WHEN NOT MATCHED
		THEN INSERT (id, dirt_id, pointer, was_value, is_value)
		VALUES (src.id, src.dirt_id, src.pointer, src.was_value, src.is_value);
        SET @Merged = 1;
	END
	IF @TableName = 'customs_disrepancy' BEGIN
		MERGE INTO aies.ICS_DISREPANCY AS tgt
		USING [WI_StageODS].aies.ICS_DISREPANCY AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.dirt_id=src.dirt_id, tgt.pointer=src.pointer, tgt.was_value=src.was_value, tgt.is_value=src.is_value
		WHEN NOT MATCHED
		THEN INSERT (id, dirt_id, pointer, was_value, is_value)
		VALUES (src.id, src.dirt_id, src.pointer, src.was_value, src.is_value);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_OPERACJA_DECYZJA_OPLAT' BEGIN
		MERGE INTO aies.ICS_DSK_OPERACJA_DECYZJA_OPLAT AS tgt
		USING [WI_StageODS].aies.ICS_DSK_OPERACJA_DECYZJA_OPLAT AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_OPERACJA_DECYZJA_ID=src.ICS_DSK_OPERACJA_DECYZJA_ID, tgt.DATA_POWIADOMIENIA_O_DLUGU=src.DATA_POWIADOMIENIA_O_DLUGU, tgt.DATA_ZAPOZNANIA_SIE_Z_DLUGIEM=src.DATA_ZAPOZNANIA_SIE_Z_DLUGIEM, tgt.KWOTA=src.KWOTA, tgt.KWOTA_DO_ZABEZPIECZENIA=src.KWOTA_DO_ZABEZPIECZENIA, tgt.KWOTA_ZABEZPIECZONA=src.KWOTA_ZABEZPIECZONA, tgt.KWOTA_ZAPLACONA=src.KWOTA_ZAPLACONA, tgt.METODA_PLATNOSCI=src.METODA_PLATNOSCI, tgt.PODSTAWA_OPLATY=src.PODSTAWA_OPLATY, tgt.STAWKA=src.STAWKA, tgt.TYP_OPLATY=src.TYP_OPLATY
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_OPERACJA_DECYZJA_ID, DATA_POWIADOMIENIA_O_DLUGU, DATA_ZAPOZNANIA_SIE_Z_DLUGIEM, KWOTA, KWOTA_DO_ZABEZPIECZENIA, KWOTA_ZABEZPIECZONA, KWOTA_ZAPLACONA, METODA_PLATNOSCI, PODSTAWA_OPLATY, STAWKA, TYP_OPLATY)
		VALUES (src.ID, src.ICS_DSK_OPERACJA_DECYZJA_ID, src.DATA_POWIADOMIENIA_O_DLUGU, src.DATA_ZAPOZNANIA_SIE_Z_DLUGIEM, src.KWOTA, src.KWOTA_DO_ZABEZPIECZENIA, src.KWOTA_ZABEZPIECZONA, src.KWOTA_ZAPLACONA, src.METODA_PLATNOSCI, src.PODSTAWA_OPLATY, src.STAWKA, src.TYP_OPLATY);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_OPERACJA_DECYZJA' BEGIN
		MERGE INTO aies.ICS_DSK_OPERACJA_DECYZJA AS tgt
		USING [WI_StageODS].aies.ICS_DSK_OPERACJA_DECYZJA AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_OPERACJA_ID=src.ICS_DSK_OPERACJA_ID, tgt.DATA_DECYZJI=src.DATA_DECYZJI, tgt.MRN=src.MRN, tgt.NR_DECYZJI=src.NR_DECYZJI, tgt.NR_POZYCJI=src.NR_POZYCJI, tgt.RODZAJ_DECYZJI=src.RODZAJ_DECYZJI
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_OPERACJA_ID, DATA_DECYZJI, MRN, NR_DECYZJI, NR_POZYCJI, RODZAJ_DECYZJI)
		VALUES (src.ID, src.ICS_DSK_OPERACJA_ID, src.DATA_DECYZJI, src.MRN, src.NR_DECYZJI, src.NR_POZYCJI, src.RODZAJ_DECYZJI);
        SET @Merged = 1;
	END
	IF @TableName = 's_jobs_ics' BEGIN
		MERGE INTO aies.s_jobs_ics AS tgt
		USING [WI_StageODS].aies.s_jobs_ics AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.no_tries=src.no_tries, tgt.order_id=src.order_id, tgt.queue=src.queue, tgt.status=src.status, tgt.system_name=src.system_name, tgt.tm_end=src.tm_end, tgt.tm_restart=src.tm_restart, tgt.tm_start=src.tm_start, tgt.version=src.version, tgt.error_info=src.error_info
		WHEN NOT MATCHED
		THEN INSERT (id, no_tries, order_id, queue, status, system_name, tm_end, tm_restart, tm_start, version, error_info)
		VALUES (src.id, src.no_tries, src.order_id, src.queue, src.status, src.system_name, src.tm_end, src.tm_restart, src.tm_start, src.version, src.error_info);
        SET @Merged = 1;
	END
	IF @TableName = 's_jobs_parms_ics' BEGIN
		MERGE INTO aies.s_jobs_parms_ics AS tgt
		USING [WI_StageODS].aies.s_jobs_parms_ics AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.job_id=src.job_id, tgt.parm_name=src.parm_name, tgt.parm_value=src.parm_value
		WHEN NOT MATCHED
		THEN INSERT (id, job_id, parm_name, parm_value)
		VALUES (src.id, src.job_id, src.parm_name, src.parm_value);
        SET @Merged = 1;
	END
	IF @TableName = 's_jobs_dataparts_ics' BEGIN
		MERGE INTO aies.s_jobs_dataparts_ics AS tgt
		USING [WI_StageODS].aies.s_jobs_dataparts_ics AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.datapart_name=src.datapart_name, tgt.datapart_value=src.datapart_value, tgt.job_id=src.job_id
		WHEN NOT MATCHED
		THEN INSERT (id, datapart_name, datapart_value, job_id)
		VALUES (src.id, src.datapart_name, src.datapart_value, src.job_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_data_package' BEGIN
		MERGE INTO aies.ref_data_package AS tgt
		USING [WI_StageODS].aies.ref_data_package AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.guid=src.guid, tgt.package_name=src.package_name
		WHEN NOT MATCHED
		THEN INSERT (id, guid, package_name)
		VALUES (src.id, src.guid, src.package_name);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_data_class' BEGIN
		MERGE INTO aies.ref_data_class AS tgt
		USING [WI_StageODS].aies.ref_data_class AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ref_data_id=src.ref_data_id, tgt.guid=src.guid, tgt.class_name=src.class_name, tgt.ref_data_package_id=src.ref_data_package_id, tgt.bytecode=src.bytecode
		WHEN NOT MATCHED
		THEN INSERT (id, ref_data_id, guid, class_name, ref_data_package_id, bytecode)
		VALUES (src.id, src.ref_data_id, src.guid, src.class_name, src.ref_data_package_id, src.bytecode);
        SET @Merged = 1;
	END
	IF @TableName = 'ref_data_src' BEGIN
		MERGE INTO aies.ref_data_src AS tgt
		USING [WI_StageODS].aies.ref_data_src AS src
		ON (tgt.ref_data_class_id=src.ref_data_class_id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.source=src.source
		WHEN NOT MATCHED
		THEN INSERT (ref_data_class_id, source)
		VALUES (src.ref_data_class_id, src.source);
        SET @Merged = 1;
	END
	IF @TableName = 's_logs' BEGIN
		MERGE INTO aies.s_logs AS tgt
		USING [WI_StageODS].aies.s_logs AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.system_name=src.system_name, tgt.weight=src.weight, tgt.log_date=src.log_date, tgt.kind=src.kind, tgt.log_text=src.log_text, tgt.direction=src.direction, tgt.self_ref=src.self_ref
		WHEN NOT MATCHED
		THEN INSERT (id, system_name, weight, log_date, kind, log_text, direction, self_ref)
		VALUES (src.id, src.system_name, src.weight, src.log_date, src.kind, src.log_text, src.direction, src.self_ref);
        SET @Merged = 1;
	END
	IF @TableName = 's_logs_details' BEGIN
		MERGE INTO aies.s_logs_details AS tgt
		USING [WI_StageODS].aies.s_logs_details AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.log_id=src.log_id, tgt.name=src.name, tgt.value=src.value
		WHEN NOT MATCHED
		THEN INSERT (id, log_id, name, value)
		VALUES (src.id, src.log_id, src.name, src.value);
        SET @Merged = 1;
	END
	IF @TableName = 's_logs_error_codes' BEGIN
		MERGE INTO aies.s_logs_error_codes AS tgt
		USING [WI_StageODS].aies.s_logs_error_codes AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.log_id=src.log_id, tgt.error_code=src.error_code
		WHEN NOT MATCHED
		THEN INSERT (id, log_id, error_code)
		VALUES (src.id, src.log_id, src.error_code);
        SET @Merged = 1;
	END
	IF @TableName = 's_jobs' BEGIN
		MERGE INTO aies.s_jobs AS tgt
		USING [WI_StageODS].aies.s_jobs AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.version=src.version, tgt.status=src.status, tgt.order_id=src.order_id, tgt.system_name=src.system_name, tgt.queue=src.queue, tgt.no_tries=src.no_tries, tgt.tm_start=src.tm_start, tgt.tm_end=src.tm_end, tgt.tm_restart=src.tm_restart, tgt.error_info=src.error_info
		WHEN NOT MATCHED
		THEN INSERT (id, version, status, order_id, system_name, queue, no_tries, tm_start, tm_end, tm_restart, error_info)
		VALUES (src.id, src.version, src.status, src.order_id, src.system_name, src.queue, src.no_tries, src.tm_start, src.tm_end, src.tm_restart, src.error_info);
        SET @Merged = 1;
	END
	IF @TableName = 's_jobs_dataparts' BEGIN
		MERGE INTO aies.s_jobs_dataparts AS tgt
		USING [WI_StageODS].aies.s_jobs_dataparts AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.job_id=src.job_id, tgt.datapart_name=src.datapart_name, tgt.datapart_value=src.datapart_value
		WHEN NOT MATCHED
		THEN INSERT (id, job_id, datapart_name, datapart_value)
		VALUES (src.id, src.job_id, src.datapart_name, src.datapart_value);
        SET @Merged = 1;
	END
	IF @TableName = 's_jobs_parms' BEGIN
		MERGE INTO aies.s_jobs_parms AS tgt
		USING [WI_StageODS].aies.s_jobs_parms AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.job_id=src.job_id, tgt.parm_name=src.parm_name, tgt.parm_value=src.parm_value
		WHEN NOT MATCHED
		THEN INSERT (id, job_id, parm_name, parm_value)
		VALUES (src.id, src.job_id, src.parm_name, src.parm_value);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR_INFORMACJA' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR_INFORMACJA AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR_INFORMACJA AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.ILOSC_TOWARU=src.ILOSC_TOWARU, tgt.MASA_BRUTTO=src.MASA_BRUTTO, tgt.MASA_NETTO=src.MASA_NETTO, tgt.OPIS_TOWARU=src.OPIS_TOWARU, tgt.UWAGI=src.UWAGI, tgt.ICS_DSK_JEDNOSTKA_MIARY_ID=src.ICS_DSK_JEDNOSTKA_MIARY_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_TOWAR_ID, ILOSC_TOWARU, MASA_BRUTTO, MASA_NETTO, OPIS_TOWARU, UWAGI, ICS_DSK_JEDNOSTKA_MIARY_ID)
		VALUES (src.ID, src.ICS_DSK_TOWAR_ID, src.ILOSC_TOWARU, src.MASA_BRUTTO, src.MASA_NETTO, src.OPIS_TOWARU, src.UWAGI, src.ICS_DSK_JEDNOSTKA_MIARY_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_OPERACJA_KOREKTA' BEGIN
		MERGE INTO aies.ICS_DSK_OPERACJA_KOREKTA AS tgt
		USING [WI_StageODS].aies.ICS_DSK_OPERACJA_KOREKTA AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_OPERACJA_ID=src.ICS_DSK_OPERACJA_ID, tgt.XQLPATH=src.XQLPATH, tgt.WARTOSC_PO_KOREKCIE=src.WARTOSC_PO_KOREKCIE, tgt.WARTOSC_PRZED_KOREKTA=src.WARTOSC_PRZED_KOREKTA
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_OPERACJA_ID, XQLPATH, WARTOSC_PO_KOREKCIE, WARTOSC_PRZED_KOREKTA)
		VALUES (src.ID, src.ICS_DSK_OPERACJA_ID, src.XQLPATH, src.WARTOSC_PO_KOREKCIE, src.WARTOSC_PRZED_KOREKTA);
        SET @Merged = 1;
	END
	ELSE IF @TableName= 'ecs_exp_prev_doc_proc_gosp' BEGIN
		MERGE INTO aies.ecs_exp_prev_doc_proc_gosp AS tgt
		USING [WI_StageODS].aies.ecs_exp_prev_doc_proc_gosp AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ref=src.ref, tgt.type=src.type, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, ref, type, goods_item_id)
		VALUES (src.id, src.ref, src.type, src.goods_item_id);
        SET @Merged = 1;
	END
	IF @TableName = 'ecs_exp_provisional_document' BEGIN
		DELETE aies.ecs_exp_provisional_document
		MERGE INTO aies.ecs_exp_provisional_document AS tgt
		USING [WI_StageODS].aies.ecs_exp_provisional_document AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id=src.id, tgt.ref=src.ref, tgt.type=src.type, tgt.goods_item_id=src.goods_item_id
		WHEN NOT MATCHED
		THEN INSERT (id, ref, type, goods_item_id)
		VALUES (src.id, src.ref, src.type, src.goods_item_id);
        SET @Merged = 1;
	END

	/* kontener z "pozosta?ymi" tabelami */

	IF @TableName = 'ICS_DIRT' BEGIN
		MERGE INTO aies.ICS_DIRT AS tgt
		USING [WI_StageODS].aies.ICS_DIRT AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ADDRESSEE=src.ADDRESSEE, tgt.AUTHOR=src.AUTHOR, tgt.DIR_FOR_NEXT_CO=src.DIR_FOR_NEXT_CO, tgt.DIR_DISPATCHER=src.DIR_DISPATCHER, tgt.INFORMATION=src.INFORMATION, tgt.WARUE=src.WARUE, tgt.WAR1=src.WAR1, tgt.WAR234=src.WAR234, tgt.WAR5=src.WAR5, tgt.COMMENT=src.COMMENT, tgt.CONTROL_METHOD=src.CONTROL_METHOD, tgt.MRN=src.MRN, tgt.CONTROL_TOOL=src.CONTROL_TOOL, tgt.ITEM_NUMBER=src.ITEM_NUMBER, tgt.ALGORITHM_NUMBER=src.ALGORITHM_NUMBER, tgt.OBJECTION_NUMBER=src.OBJECTION_NUMBER, tgt.RISK_AREA=src.RISK_AREA, tgt.RISK_LEVEL=src.RISK_LEVEL, tgt.samples=src.samples, tgt.PROFILE=src.PROFILE, tgt.SEGMENT=src.SEGMENT, tgt.STATUS=src.STATUS, tgt.TEXT=src.TEXT, tgt.CONTROL_TYPE=src.CONTROL_TYPE, tgt.POINTER=src.POINTER, tgt.RESULT=src.RESULT, tgt.SOURCE=src.SOURCE, tgt.DECL_ID=src.DECL_ID, tgt.ITEM_TYPE=src.ITEM_TYPE, tgt.METHOD_RISK_LEVEL=src.METHOD_RISK_LEVEL, tgt.REALISATION_DATE=src.REALISATION_DATE, tgt.ID_VERIFICATION_ITEM=src.ID_VERIFICATION_ITEM, tgt.DIRTYPE=src.DIRTYPE, tgt.INTRO=src.INTRO, tgt.ORIGIN=src.ORIGIN, tgt.VERIFICATION_REQUIRED=src.VERIFICATION_REQUIRED, tgt.MODIFIED_BY=src.MODIFIED_BY
		WHEN NOT MATCHED
		THEN INSERT (ID, ADDRESSEE, AUTHOR, DIR_FOR_NEXT_CO, DIR_DISPATCHER, INFORMATION, WARUE, WAR1, WAR234, WAR5, COMMENT, CONTROL_METHOD, MRN, CONTROL_TOOL, ITEM_NUMBER, ALGORITHM_NUMBER, OBJECTION_NUMBER, RISK_AREA, RISK_LEVEL, samples, PROFILE, SEGMENT, STATUS, TEXT, CONTROL_TYPE, POINTER, RESULT, SOURCE, DECL_ID, ITEM_TYPE, METHOD_RISK_LEVEL, REALISATION_DATE, ID_VERIFICATION_ITEM, DIRTYPE, INTRO, ORIGIN, VERIFICATION_REQUIRED, MODIFIED_BY)
		VALUES (src.ID, src.ADDRESSEE, src.AUTHOR, src.DIR_FOR_NEXT_CO, src.DIR_DISPATCHER, src.INFORMATION, src.WARUE, src.WAR1, src.WAR234, src.WAR5, src.COMMENT, src.CONTROL_METHOD, src.MRN, src.CONTROL_TOOL, src.ITEM_NUMBER, src.ALGORITHM_NUMBER, src.OBJECTION_NUMBER, src.RISK_AREA, src.RISK_LEVEL, src.samples, src.PROFILE, src.SEGMENT, src.STATUS, src.TEXT, src.CONTROL_TYPE, src.POINTER, src.RESULT, src.SOURCE, src.DECL_ID, src.ITEM_TYPE, src.METHOD_RISK_LEVEL, src.REALISATION_DATE, src.ID_VERIFICATION_ITEM, src.DIRTYPE, src.INTRO, src.ORIGIN, src.VERIFICATION_REQUIRED, src.MODIFIED_BY);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DIRT_CHANGE' BEGIN
		MERGE INTO aies.ICS_DIRT_CHANGE AS tgt
		USING [WI_StageODS].aies.ICS_DIRT_CHANGE AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DIRT_ID=src.DIRT_ID, tgt.AFFECTS=src.AFFECTS, tgt.AFTER=src.AFTER, tgt.JUSTIFICATION=src.JUSTIFICATION, tgt.INITIAL_VALUE=src.INITIAL_VALUE
		WHEN NOT MATCHED
		THEN INSERT (ID, DIRT_ID, AFFECTS, AFTER, JUSTIFICATION, INITIAL_VALUE)
		VALUES (src.ID, src.DIRT_ID, src.AFFECTS, src.AFTER, src.JUSTIFICATION, src.INITIAL_VALUE);
        SET @Merged = 1;	
	END
	IF @TableName = 'ICS_DIRT_POINTER' BEGIN
		MERGE INTO aies.ICS_DIRT_POINTER AS tgt
		USING [WI_StageODS].aies.ICS_DIRT_POINTER AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DIRT_ID=src.DIRT_ID, tgt.NAME=src.NAME, tgt.TYPE=src.TYPE, tgt.VALUE=src.VALUE
		WHEN NOT MATCHED
		THEN INSERT (ID, DIRT_ID, NAME, TYPE, VALUE)
		VALUES (src.ID, src.DIRT_ID, src.NAME, src.TYPE, src.VALUE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DIRT_INTR' BEGIN
		MERGE INTO aies.ICS_DIRT_INTR AS tgt
		USING [WI_StageODS].aies.ICS_DIRT_INTR AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.CODE=src.CODE, tgt.DIRT_ID=src.DIRT_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, CODE, DIRT_ID)
		VALUES (src.ID, src.CODE, src.DIRT_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_BALANCE_REQ_POS' BEGIN
		MERGE INTO aies.ICS_BALANCE_REQ_POS AS tgt
		USING [WI_StageODS].aies.ICS_BALANCE_REQ_POS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.GROSS_MASS=src.GROSS_MASS, tgt.PACKAGES=src.PACKAGES, tgt.POSITION_NUMBER=src.POSITION_NUMBER, tgt.STATUS=src.STATUS, tgt.ENS_ITEM_ID=src.ENS_ITEM_ID, tgt.REQUEST_ID=src.REQUEST_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, GROSS_MASS, PACKAGES, POSITION_NUMBER, STATUS, ENS_ITEM_ID, REQUEST_ID)
		VALUES (src.ID, src.GROSS_MASS, src.PACKAGES, src.POSITION_NUMBER, src.STATUS, src.ENS_ITEM_ID, src.REQUEST_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ENS_ITEM_CUST' BEGIN
		MERGE INTO aies.ICS_ENS_ITEM_CUST AS tgt
		USING [WI_StageODS].aies.ICS_ENS_ITEM_CUST AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.CITY=src.CITY, tgt.COUNTRY=src.COUNTRY, tgt.POST_CODE=src.POST_CODE, tgt.STREET=src.STREET, tgt.EMAIL=src.EMAIL, tgt.NAME=src.NAME, tgt.TIN=src.TIN, tgt.CUST_TYPE=src.CUST_TYPE, tgt.ENS_ITEM_ID=src.ENS_ITEM_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, CITY, COUNTRY, POST_CODE, STREET, EMAIL, NAME, TIN, CUST_TYPE, ENS_ITEM_ID)
		VALUES (src.ID, src.CITY, src.COUNTRY, src.POST_CODE, src.STREET, src.EMAIL, src.NAME, src.TIN, src.CUST_TYPE, src.ENS_ITEM_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ENS_ITEM_CONT' BEGIN
		MERGE INTO aies.ICS_ENS_ITEM_CONT AS tgt
		USING [WI_StageODS].aies.ICS_ENS_ITEM_CONT AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NUMBER=src.NUMBER, tgt.STATE_BR=src.STATE_BR, tgt.ENS_ITEM_ID=src.ENS_ITEM_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, NUMBER, STATE_BR, ENS_ITEM_ID)
		VALUES (src.ID, src.NUMBER, src.STATE_BR, src.ENS_ITEM_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ENS_ITEM_PACK' BEGIN
		MERGE INTO aies.ICS_ENS_ITEM_PACK AS tgt
		USING [WI_StageODS].aies.ICS_ENS_ITEM_PACK AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ITEM_COUNT=src.ITEM_COUNT, tgt.ITEM_COUNT_BR=src.ITEM_COUNT_BR, tgt.PACK_KIND=src.PACK_KIND, tgt.PACK_KIND_BR=src.PACK_KIND_BR, tgt.PACK_MARKS=src.PACK_MARKS, tgt.PACK_MARKS_BR=src.PACK_MARKS_BR, tgt.PACKAGE_COUNT=src.PACKAGE_COUNT, tgt.PACKAGE_COUNT_BR=src.PACKAGE_COUNT_BR, tgt.STATE_BR=src.STATE_BR, tgt.ENS_ITEM_ID=src.ENS_ITEM_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, ITEM_COUNT, ITEM_COUNT_BR, PACK_KIND, PACK_KIND_BR, PACK_MARKS, PACK_MARKS_BR, PACKAGE_COUNT, PACKAGE_COUNT_BR, STATE_BR, ENS_ITEM_ID)
		VALUES (src.ID, src.ITEM_COUNT, src.ITEM_COUNT_BR, src.PACK_KIND, src.PACK_KIND_BR, src.PACK_MARKS, src.PACK_MARKS_BR, src.PACKAGE_COUNT, src.PACKAGE_COUNT_BR, src.STATE_BR, src.ENS_ITEM_ID);
	END
	IF @TableName = 'ICS_ENS_ITEM_ADD_INFO' BEGIN
		MERGE INTO aies.ICS_ENS_ITEM_ADD_INFO AS tgt
		USING [WI_StageODS].aies.ICS_ENS_ITEM_ADD_INFO AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.CODE=src.CODE, tgt.ENS_ITEM_ID=src.ENS_ITEM_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, CODE, ENS_ITEM_ID)
		VALUES (src.ID, src.CODE, src.ENS_ITEM_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ENS_ITEM_TRANS' BEGIN
		MERGE INTO aies.ICS_ENS_ITEM_TRANS AS tgt
		USING [WI_StageODS].aies.ICS_ENS_ITEM_TRANS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.COMM_BR=src.COMM_BR, tgt.NATION=src.NATION, tgt.NATION_BR=src.NATION_BR, tgt.SINGS=src.SINGS, tgt.STATE_BR=src.STATE_BR, tgt.TAB_TYPE=src.TAB_TYPE, tgt.ENS_ITEM_ID=src.ENS_ITEM_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, COMM_BR, NATION, NATION_BR, SINGS, STATE_BR, TAB_TYPE, ENS_ITEM_ID)
		VALUES (src.ID, src.COMM_BR, src.NATION, src.NATION_BR, src.SINGS, src.STATE_BR, src.TAB_TYPE, src.ENS_ITEM_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ENS_SPEC_MENT' BEGIN
		MERGE INTO aies.ICS_ENS_SPEC_MENT AS tgt
		USING [WI_StageODS].aies.ICS_ENS_SPEC_MENT AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.CODE=src.CODE, tgt.TEXT=src.TEXT, tgt.ENS_ITEM_ID=src.ENS_ITEM_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, CODE, TEXT, ENS_ITEM_ID)
		VALUES (src.ID, src.CODE, src.TEXT, src.ENS_ITEM_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ENS_PROD_DOCU' BEGIN
		MERGE INTO aies.ICS_ENS_PROD_DOCU AS tgt
		USING [WI_StageODS].aies.ICS_ENS_PROD_DOCU AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.CODE=src.CODE, tgt.COMM_BR=src.COMM_BR, tgt.NUMB=src.NUMB, tgt.STATE_BR=src.STATE_BR, tgt.ENS_ITEM_ID=src.ENS_ITEM_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, CODE, COMM_BR, NUMB, STATE_BR, ENS_ITEM_ID)
		VALUES (src.ID, src.CODE, src.COMM_BR, src.NUMB, src.STATE_BR, src.ENS_ITEM_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR_ZABEZPIECZENIE' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR_ZABEZPIECZENIE AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR_ZABEZPIECZENIE AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.GRN=src.GRN, tgt.INNY_RODZAJ_OPAKOWANIA_KOD=src.INNY_RODZAJ_OPAKOWANIA_KOD, tgt.KOD_DOSTEPU=src.KOD_DOSTEPU, tgt.KWOTA_ZABEZPIECZENIA=src.KWOTA_ZABEZPIECZENIA, tgt.RODZAJ_ZABEZPIECZENIA=src.RODZAJ_ZABEZPIECZENIA, tgt.TIN=src.TIN
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_TOWAR_ID, GRN, INNY_RODZAJ_OPAKOWANIA_KOD, KOD_DOSTEPU, KWOTA_ZABEZPIECZENIA, RODZAJ_ZABEZPIECZENIA, TIN)
		VALUES (src.ID, src.ICS_DSK_TOWAR_ID, src.GRN, src.INNY_RODZAJ_OPAKOWANIA_KOD, src.KOD_DOSTEPU, src.KWOTA_ZABEZPIECZENIA, src.RODZAJ_ZABEZPIECZENIA, src.TIN);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR_ODMOWA_SKLAD' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR_ODMOWA_SKLAD AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR_ODMOWA_SKLAD AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.OPIS_NIEPRAWIDLOWOSCI=src.OPIS_NIEPRAWIDLOWOSCI, tgt.UZASADNIENIE=src.UZASADNIENIE
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_TOWAR_ID, OPIS_NIEPRAWIDLOWOSCI, UZASADNIENIE)
		VALUES (src.ID, src.ICS_DSK_TOWAR_ID, src.OPIS_NIEPRAWIDLOWOSCI, src.UZASADNIENIE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR_OPAKOWANIE' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR_OPAKOWANIE AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR_OPAKOWANIE AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.LICZBA_OPAKOWAN=src.LICZBA_OPAKOWAN, tgt.NUMERY_I_ZNAKI_OPAKOWAN=src.NUMERY_I_ZNAKI_OPAKOWAN, tgt.RODZAJ_OPAKOWANIA=src.RODZAJ_OPAKOWANIA
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_TOWAR_ID, LICZBA_OPAKOWAN, NUMERY_I_ZNAKI_OPAKOWAN, RODZAJ_OPAKOWANIA)
		VALUES (src.ID, src.ICS_DSK_TOWAR_ID, src.LICZBA_OPAKOWAN, src.NUMERY_I_ZNAKI_OPAKOWAN, src.RODZAJ_OPAKOWANIA);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR_WNIOSK_PRZEDL_TE' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR_WNIOSK_PRZEDL_TE AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR_WNIOSK_PRZEDL_TE AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.NR_POZYCJI=src.NR_POZYCJI, tgt.STATUS=src.STATUS, tgt.TERMIN=src.TERMIN, tgt.UZASADNIENIE=src.UZASADNIENIE, tgt.NR_WLASNY_LRN=src.NR_WLASNY_LRN, tgt.UZASADNIENIE_ODRZUCENIA=src.UZASADNIENIE_ODRZUCENIA
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_TOWAR_ID, NR_POZYCJI, STATUS, TERMIN, UZASADNIENIE, NR_WLASNY_LRN, UZASADNIENIE_ODRZUCENIA)
		VALUES (src.ID, src.ICS_DSK_TOWAR_ID, src.NR_POZYCJI, src.STATUS, src.TERMIN, src.UZASADNIENIE, src.NR_WLASNY_LRN, src.UZASADNIENIE_ODRZUCENIA);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_WSP_MIEJSCE_ZALADUNKU' BEGIN
		MERGE INTO aies.ICS_DSK_WSP_MIEJSCE_ZALADUNKU AS tgt
		USING [WI_StageODS].aies.ICS_DSK_WSP_MIEJSCE_ZALADUNKU AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_ID=src.ICS_DSK_ID, tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.KOD=src.KOD, tgt.KRAJ=src.KRAJ, tgt.OPIS_MIEJSCA_ZALADUNKU=src.OPIS_MIEJSCA_ZALADUNKU
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_ID, ICS_DSK_TOWAR_ID, KOD, KRAJ, OPIS_MIEJSCA_ZALADUNKU)
		VALUES (src.ID, src.ICS_DSK_ID, src.ICS_DSK_TOWAR_ID, src.KOD, src.KRAJ, src.OPIS_MIEJSCA_ZALADUNKU);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR_DOKUMENT_WYMAG' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR_DOKUMENT_WYMAG AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR_DOKUMENT_WYMAG AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.KOD=src.KOD, tgt.NUMER=src.NUMER, tgt.UWAGI=src.UWAGI
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_TOWAR_ID, KOD, NUMER, UWAGI)
		VALUES (src.ID, src.ICS_DSK_TOWAR_ID, src.KOD, src.NUMER, src.UWAGI);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR_DOKUMENT_POPRZ' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR_DOKUMENT_POPRZ AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR_DOKUMENT_POPRZ AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.KATEGORIA=src.KATEGORIA, tgt.KOD=src.KOD, tgt.NR_POZYCJI=src.NR_POZYCJI, tgt.NUMER=src.NUMER
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_TOWAR_ID, KATEGORIA, KOD, NR_POZYCJI, NUMER)
		VALUES (src.ID, src.ICS_DSK_TOWAR_ID, src.KATEGORIA, src.KOD, src.NR_POZYCJI, src.NUMER);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR_PROCEDURA' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR_PROCEDURA AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR_PROCEDURA AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.PROCEDURA=src.PROCEDURA, tgt.USZCZEGOLOWIENIE_PROCEDURY=src.USZCZEGOLOWIENIE_PROCEDURY
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_TOWAR_ID, PROCEDURA, USZCZEGOLOWIENIE_PROCEDURY)
		VALUES (src.ID, src.ICS_DSK_TOWAR_ID, src.PROCEDURA, src.USZCZEGOLOWIENIE_PROCEDURY);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR_KONTENER' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR_KONTENER AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR_KONTENER AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.NUMER_KONTENERA=src.NUMER_KONTENERA
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_TOWAR_ID, NUMER_KONTENERA)
		VALUES (src.ID, src.ICS_DSK_TOWAR_ID, src.NUMER_KONTENERA);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR_UPLYNIECIE_TERM' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR_UPLYNIECIE_TERM AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR_UPLYNIECIE_TERM AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.NR_POZYCJI=src.NR_POZYCJI, tgt.PRZYCZYNA=src.PRZYCZYNA
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_TOWAR_ID, NR_POZYCJI, PRZYCZYNA)
		VALUES (src.ID, src.ICS_DSK_TOWAR_ID, src.NR_POZYCJI, src.PRZYCZYNA);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR_PRZEZN_CELNE' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR_PRZEZN_CELNE AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR_PRZEZN_CELNE AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.NAZWA=src.NAZWA, tgt.NR_DOKUMENTU=src.NR_DOKUMENTU, tgt.DATA=src.DATA, tgt.ILOSC=src.ILOSC
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_TOWAR_ID, NAZWA, NR_DOKUMENTU, DATA, ILOSC)
		VALUES (src.ID, src.ICS_DSK_TOWAR_ID, src.NAZWA, src.NR_DOKUMENTU, src.DATA, src.ILOSC);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR_WNIOSKOWANE_UNIE' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR_WNIOSKOWANE_UNIE AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR_WNIOSKOWANE_UNIE AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.MRN=src.MRN, tgt.NR_POZYCJI=src.NR_POZYCJI, tgt.STATUS=src.STATUS, tgt.UZASADNIENIE=src.UZASADNIENIE
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_TOWAR_ID, MRN, NR_POZYCJI, STATUS, UZASADNIENIE)
		VALUES (src.ID, src.ICS_DSK_TOWAR_ID, src.MRN, src.NR_POZYCJI, src.STATUS, src.UZASADNIENIE);
        SET @Merged = 1;
	END
	/* Kontener ICS */
	IF @TableName = 'ICS_ZCP' BEGIN
		MERGE INTO aies.ICS_ZCP AS tgt
		USING [WI_StageODS].aies.ICS_ZCP AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.LEGAL_ANNOTATIONS=src.LEGAL_ANNOTATIONS, tgt.CALC_DATE=src.CALC_DATE, tgt.REJECT_DATE=src.REJECT_DATE, tgt.REGI_DATE=src.REGI_DATE, tgt.CANCEL_DATE=src.CANCEL_DATE, tgt.PREV_DOC_NR=src.PREV_DOC_NR, tgt.NUMB_FORMS=src.NUMB_FORMS, tgt.TOTAL_ITEM_VALUE=src.TOTAL_ITEM_VALUE, tgt.ADDITIONAL_DECL_TYPE=src.ADDITIONAL_DECL_TYPE, tgt.EXPENDERS_EMAIL=src.EXPENDERS_EMAIL, tgt.CONTAINERS=src.CONTAINERS, tgt.COUNTRY_OF_DESTINATION=src.COUNTRY_OF_DESTINATION, tgt.COUNTRY_OF_DESTINATION_REGION=src.COUNTRY_OF_DESTINATION_REGION, tgt.COUNTRY_OF_EXPORT=src.COUNTRY_OF_EXPORT, tgt.NUMBER_OF_PACKAGES=src.NUMBER_OF_PACKAGES, tgt.NO_OF_ITEMS=src.NO_OF_ITEMS, tgt.GROSS_MASS=src.GROSS_MASS, tgt.NO_OF_PERMISSION=src.NO_OF_PERMISSION, tgt.ZCP_SYSTEM_NUMBER=src.ZCP_SYSTEM_NUMBER, tgt.DEFERRED_PAYMENT=src.DEFERRED_PAYMENT, tgt.ELECTR_SIGNATURE=src.ELECTR_SIGNATURE, tgt.ZCP_STATE=src.ZCP_STATE, tgt.KIND_OF_DECLARATION=src.KIND_OF_DECLARATION, tgt.PRESENTATION_GOODS_CO=src.PRESENTATION_GOODS_CO, tgt.DECLARATION_CO=src.DECLARATION_CO, tgt.XMLNS=src.XMLNS, tgt.NP_SENDER_ID=src.NP_SENDER_ID, tgt.BE_SENDER_ID=src.BE_SENDER_ID, tgt.NP_RECEIVER_ID=src.NP_RECEIVER_ID, tgt.BE_RECEIVER_ID=src.BE_RECEIVER_ID, tgt.NP_BUYER_ID=src.NP_BUYER_ID, tgt.BE_BUYER_ID=src.BE_BUYER_ID, tgt.NP_REPRESENTATIVE_ID=src.NP_REPRESENTATIVE_ID, tgt.BE_REPRESENTATIVE_ID=src.BE_REPRESENTATIVE_ID, tgt.NP_DECLARANT_ID=src.NP_DECLARANT_ID, tgt.BE_DECLARANT_ID=src.BE_DECLARANT_ID, tgt.NP_ITEM_DECLARANT_ID=src.NP_ITEM_DECLARANT_ID, tgt.BE_ITEM_DECLARANT_ID=src.BE_ITEM_DECLARANT_ID, tgt.NP_SELLER_ID=src.NP_SELLER_ID, tgt.BE_SELLER_ID=src.BE_SELLER_ID, tgt.PRESENTATION_GOODS=src.PRESENTATION_GOODS, tgt.ICS_GAN_CUST_DATA_ID=src.ICS_GAN_CUST_DATA_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, LEGAL_ANNOTATIONS, CALC_DATE, REJECT_DATE, REGI_DATE, CANCEL_DATE, PREV_DOC_NR, NUMB_FORMS, TOTAL_ITEM_VALUE, ADDITIONAL_DECL_TYPE, EXPENDERS_EMAIL, CONTAINERS, COUNTRY_OF_DESTINATION, COUNTRY_OF_DESTINATION_REGION, COUNTRY_OF_EXPORT, NUMBER_OF_PACKAGES, NO_OF_ITEMS, GROSS_MASS, NO_OF_PERMISSION, ZCP_SYSTEM_NUMBER, DEFERRED_PAYMENT, ELECTR_SIGNATURE, ZCP_STATE, KIND_OF_DECLARATION, PRESENTATION_GOODS_CO, DECLARATION_CO, XMLNS, NP_SENDER_ID, BE_SENDER_ID, NP_RECEIVER_ID, BE_RECEIVER_ID, NP_BUYER_ID, BE_BUYER_ID, NP_REPRESENTATIVE_ID, BE_REPRESENTATIVE_ID, NP_DECLARANT_ID, BE_DECLARANT_ID, NP_ITEM_DECLARANT_ID, BE_ITEM_DECLARANT_ID, NP_SELLER_ID, BE_SELLER_ID, PRESENTATION_GOODS, ICS_GAN_CUST_DATA_ID)
		VALUES (src.ID, src.LEGAL_ANNOTATIONS, src.CALC_DATE, src.REJECT_DATE, src.REGI_DATE, src.CANCEL_DATE, src.PREV_DOC_NR, src.NUMB_FORMS, src.TOTAL_ITEM_VALUE, src.ADDITIONAL_DECL_TYPE, src.EXPENDERS_EMAIL, src.CONTAINERS, src.COUNTRY_OF_DESTINATION, src.COUNTRY_OF_DESTINATION_REGION, src.COUNTRY_OF_EXPORT, src.NUMBER_OF_PACKAGES, src.NO_OF_ITEMS, src.GROSS_MASS, src.NO_OF_PERMISSION, src.ZCP_SYSTEM_NUMBER, src.DEFERRED_PAYMENT, src.ELECTR_SIGNATURE, src.ZCP_STATE, src.KIND_OF_DECLARATION, src.PRESENTATION_GOODS_CO, src.DECLARATION_CO, src.XMLNS, src.NP_SENDER_ID, src.BE_SENDER_ID, src.NP_RECEIVER_ID, src.BE_RECEIVER_ID, src.NP_BUYER_ID, src.BE_BUYER_ID, src.NP_REPRESENTATIVE_ID, src.BE_REPRESENTATIVE_ID, src.NP_DECLARANT_ID, src.BE_DECLARANT_ID, src.NP_ITEM_DECLARANT_ID, src.BE_ITEM_DECLARANT_ID, src.NP_SELLER_ID, src.BE_SELLER_ID, src.PRESENTATION_GOODS, src.ICS_GAN_CUST_DATA_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_LOCATION' BEGIN
		MERGE INTO aies.ICS_ZCP_LOCATION AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_LOCATION AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.ZCP_ADDRESS_ID=src.ZCP_ADDRESS_ID, tgt.CODE=src.CODE, tgt.COUNTRY=src.COUNTRY, tgt.QUALIFIER=src.QUALIFIER, tgt.LOCATION_CO=src.LOCATION_CO, tgt.DESCRIPTION=src.DESCRIPTION, tgt.TYPE=src.TYPE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, ZCP_ADDRESS_ID, CODE, COUNTRY, QUALIFIER, LOCATION_CO, DESCRIPTION, TYPE)
		VALUES (src.ID, src.ZCP_ID, src.ZCP_ADDRESS_ID, src.CODE, src.COUNTRY, src.QUALIFIER, src.LOCATION_CO, src.DESCRIPTION, src.TYPE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_CONTROL_CO' BEGIN
		MERGE INTO aies.ICS_ZCP_CONTROL_CO AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_CONTROL_CO AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.CODE=src.CODE, tgt.NAME=src.NAME, tgt.ZCP_ADDRESS_ID=src.ZCP_ADDRESS_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, CODE, NAME, ZCP_ADDRESS_ID)
		VALUES (src.ID, src.ZCP_ID, src.CODE, src.NAME, src.ZCP_ADDRESS_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_NOTIF_ABOUT_CONTROL' BEGIN
		MERGE INTO aies.ICS_ZCP_NOTIF_ABOUT_CONTROL AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_NOTIF_ABOUT_CONTROL AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.TIME=src.TIME, tgt.REMARKS=src.REMARKS
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, TIME, REMARKS)
		VALUES (src.ID, src.ZCP_ID, src.TIME, src.REMARKS);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_BONDED_WAREHOUSE' BEGIN
		MERGE INTO aies.ICS_ZCP_BONDED_WAREHOUSE AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_BONDED_WAREHOUSE AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.COUNTRY_OF_PERMISSION=src.COUNTRY_OF_PERMISSION, tgt.ID_NO=src.ID_NO, tgt.TYPE=src.TYPE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, COUNTRY_OF_PERMISSION, ID_NO, TYPE)
		VALUES (src.ID, src.ZCP_ID, src.COUNTRY_OF_PERMISSION, src.ID_NO, src.TYPE);
        SET @Merged = 1;
	END
	IF @TableName ='ICS_ZCP_PODZ' BEGIN
		MERGE INTO aies.ICS_ZCP_PODZ AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_PODZ AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.MRN=src.MRN, tgt.PODZ_NO=src.PODZ_NO, tgt.PROPRIETARY_PODZ_NO=src.PROPRIETARY_PODZ_NO
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, MRN, PODZ_NO, PROPRIETARY_PODZ_NO)
		VALUES (src.ID, src.ZCP_ID, src.MRN, src.PODZ_NO, src.PROPRIETARY_PODZ_NO);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_PAYMENT' BEGIN
		MERGE INTO aies.ICS_ZCP_PAYMENT AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_PAYMENT AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DEBT_NOTIFICATION_DATE=src.DEBT_NOTIFICATION_DATE, tgt.DEBT_ACQUAINTED_DATE=src.DEBT_ACQUAINTED_DATE, tgt.AMOUNT=src.AMOUNT, tgt.AMOUNT_TO_GUARANTEE=src.AMOUNT_TO_GUARANTEE, tgt.IS_AMOUNT_GUARANTEED=src.IS_AMOUNT_GUARANTEED, tgt.IS_AMOUNT_PAID=src.IS_AMOUNT_PAID, tgt.PAYMENT_METHOD=src.PAYMENT_METHOD, tgt.BASE=src.BASE, tgt.RATE=src.RATE, tgt.TYPE=src.TYPE, tgt.ZCP_PODZ_ID=src.ZCP_PODZ_ID, tgt.ZCP_DECISION_ID=src.ZCP_DECISION_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, DEBT_NOTIFICATION_DATE, DEBT_ACQUAINTED_DATE, AMOUNT, AMOUNT_TO_GUARANTEE, IS_AMOUNT_GUARANTEED, IS_AMOUNT_PAID, PAYMENT_METHOD, BASE, RATE, TYPE, ZCP_PODZ_ID, ZCP_DECISION_ID)
		VALUES (src.ID, src.DEBT_NOTIFICATION_DATE, src.DEBT_ACQUAINTED_DATE, src.AMOUNT, src.AMOUNT_TO_GUARANTEE, src.IS_AMOUNT_GUARANTEED, src.IS_AMOUNT_PAID, src.PAYMENT_METHOD, src.BASE, src.RATE, src.TYPE, src.ZCP_PODZ_ID, src.ZCP_DECISION_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_CORRECTION' BEGIN
		MERGE INTO aies.ICS_ZCP_CORRECTION AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_CORRECTION AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_OPERATION_ID=src.ZCP_OPERATION_ID, tgt.XQLPATH=src.XQLPATH, tgt.VALUE_BEFORE=src.VALUE_BEFORE, tgt.VALUE_AFTER=src.VALUE_AFTER
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_OPERATION_ID, XQLPATH, VALUE_BEFORE, VALUE_AFTER)
		VALUES (src.ID, src.ZCP_OPERATION_ID, src.XQLPATH, src.VALUE_BEFORE, src.VALUE_AFTER);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_DECISION' BEGIN
		MERGE INTO aies.ICS_ZCP_DECISION AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_DECISION AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DEC_DATE=src.DEC_DATE, tgt.MRN=src.MRN, tgt.DEC_NO=src.DEC_NO, tgt.POS_NO=src.POS_NO, tgt.TYPE=src.TYPE, tgt.ZCP_OPERATION_ID=src.ZCP_OPERATION_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, DEC_DATE, MRN, DEC_NO, POS_NO, TYPE, ZCP_OPERATION_ID)
		VALUES (src.ID, src.DEC_DATE, src.MRN, src.DEC_NO, src.POS_NO, src.TYPE, src.ZCP_OPERATION_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_OPERATION' BEGIN
		MERGE INTO aies.ICS_ZCP_OPERATION AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_OPERATION AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.ANNOTATION=src.ANNOTATION, tgt.DATE=src.DATE, tgt.NAME=src.NAME, tgt.NOTES=src.NOTES, tgt.MADE_BY=src.MADE_BY
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, ANNOTATION, DATE, NAME, NOTES, MADE_BY)
		VALUES (src.ID, src.ZCP_ID, src.ANNOTATION, src.DATE, src.NAME, src.NOTES, src.MADE_BY);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_DIRECTIVES' BEGIN
		MERGE INTO aies.ICS_ZCP_DIRECTIVES AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_DIRECTIVES AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.DIRECTIVE=src.DIRECTIVE, tgt.ID_UNIQUE=src.ID_UNIQUE, tgt.POS_NO=src.POS_NO, tgt.POINTER=src.POINTER, tgt.VALUE=src.VALUE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, DIRECTIVE, ID_UNIQUE, POS_NO, POINTER, VALUE)
		VALUES (src.ID, src.ZCP_ID, src.DIRECTIVE, src.ID_UNIQUE, src.POS_NO, src.POINTER, src.VALUE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_TRANSACTION' BEGIN
		MERGE INTO aies.ICS_ZCP_TRANSACTION AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_TRANSACTION AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.CURRENCY=src.CURRENCY, tgt.TYPE=src.TYPE, tgt.CURRENCY_OF_INVOICE=src.CURRENCY_OF_INVOICE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, CURRENCY, TYPE, CURRENCY_OF_INVOICE)
		VALUES (src.ID, src.ZCP_ID, src.CURRENCY, src.TYPE, src.CURRENCY_OF_INVOICE);
        SET @Merged = 1;		
	END
	IF @TableName = 'ICS_ZCP_TRANSPORT_INTERNAL' BEGIN
		MERGE INTO aies.ICS_ZCP_TRANSPORT_INTERNAL AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_TRANSPORT_INTERNAL AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.CODE=src.CODE, tgt.MARKINGS=src.MARKINGS, tgt.TRANSPORT_AFFIL_ACTIVE_MEANS=src.TRANSPORT_AFFIL_ACTIVE_MEANS
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, CODE, MARKINGS, TRANSPORT_AFFIL_ACTIVE_MEANS)
		VALUES (src.ID, src.ZCP_ID, src.CODE, src.MARKINGS, src.TRANSPORT_AFFIL_ACTIVE_MEANS);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_GUARANT' BEGIN
		MERGE INTO aies.ICS_ZCP_GUARANT AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_GUARANT AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.GRN=src.GRN, tgt.ZCP_ID=src.ZCP_ID, tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.OTHER_GUARANTEE_TYPE_CODE=src.OTHER_GUARANTEE_TYPE_CODE, tgt.ACCESS_CODE=src.ACCESS_CODE, tgt.AMOUNT=src.AMOUNT, tgt.TYPE=src.TYPE, tgt.TIN=src.TIN
		WHEN NOT MATCHED
		THEN INSERT (ID, GRN, ZCP_ID, ZCP_ITEM_ID, OTHER_GUARANTEE_TYPE_CODE, ACCESS_CODE, AMOUNT, TYPE, TIN)
		VALUES (src.ID, src.GRN, src.ZCP_ID, src.ZCP_ITEM_ID, src.OTHER_GUARANTEE_TYPE_CODE, src.ACCESS_CODE, src.AMOUNT, src.TYPE, src.TIN);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_TRANSPORT_AT_BORDER' BEGIN
		MERGE INTO aies.ICS_ZCP_TRANSPORT_AT_BORDER AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_TRANSPORT_AT_BORDER AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.TRANSPORT_AFFIL_ACTIVE_MEANS=src.TRANSPORT_AFFIL_ACTIVE_MEANS, tgt.KIND_OF_TRANSPORT=src.KIND_OF_TRANSPORT, tgt.MARKINGS=src.MARKINGS
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, TRANSPORT_AFFIL_ACTIVE_MEANS, KIND_OF_TRANSPORT, MARKINGS)
		VALUES (src.ID, src.ZCP_ID, src.TRANSPORT_AFFIL_ACTIVE_MEANS, src.KIND_OF_TRANSPORT, src.MARKINGS);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_CONTRACT' BEGIN
		MERGE INTO aies.ICS_ZCP_CONTRACT AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_CONTRACT AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.CONTR_DATE=src.CONTR_DATE, tgt.CONTR_NO=src.CONTR_NO
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, CONTR_DATE, CONTR_NO)
		VALUES (src.ID, src.ZCP_ID, src.CONTR_DATE, src.CONTR_NO);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_DV1_VALUATION_RATIOS' BEGIN
		MERGE INTO aies.ICS_ZCP_DV1_VALUATION_RATIOS AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_DV1_VALUATION_RATIOS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.USE_RESTRICTIONS=src.USE_RESTRICTIONS, tgt.BUYER_SELLER_CONNECT=src.BUYER_SELLER_CONNECT, tgt.SALE_PRICE_DEPEND=src.SALE_PRICE_DEPEND, tgt.SALE_IS_SUBJECT_TO_AGREEMENT=src.SALE_IS_SUBJECT_TO_AGREEMENT
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, ZCP_ITEM_ID, USE_RESTRICTIONS, BUYER_SELLER_CONNECT, SALE_PRICE_DEPEND, SALE_IS_SUBJECT_TO_AGREEMENT)
		VALUES (src.ID, src.ZCP_ID, src.ZCP_ITEM_ID, src.USE_RESTRICTIONS, src.BUYER_SELLER_CONNECT, src.SALE_PRICE_DEPEND, src.SALE_IS_SUBJECT_TO_AGREEMENT);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_INEFFECTIVE_GUARANT' BEGIN
		MERGE INTO aies.ICS_ZCP_INEFFECTIVE_GUARANT AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_INEFFECTIVE_GUARANT AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.POS_NO=src.POS_NO, tgt.REASON=src.REASON
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, POS_NO, REASON)
		VALUES (src.ID, src.ZCP_ID, src.POS_NO, src.REASON);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_DV1_INCREM_DEDUCTION' BEGIN
		MERGE INTO aies.ICS_ZCP_DV1_INCREM_DEDUCTION AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_DV1_INCREM_DEDUCTION AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.INCREM_DEDUCTION=src.INCREM_DEDUCTION, tgt.AMOUNT=src.AMOUNT
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, ZCP_ITEM_ID, INCREM_DEDUCTION, AMOUNT)
		VALUES (src.ID, src.ZCP_ID, src.ZCP_ITEM_ID, src.INCREM_DEDUCTION, src.AMOUNT);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_CANCEL_REQUEST' BEGIN
		MERGE INTO aies.ICS_ZCP_CANCEL_REQUEST AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_CANCEL_REQUEST AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.MRN=src.MRN, tgt.ITEM_NO=src.ITEM_NO, tgt.STATE=src.STATE, tgt.REASON=src.REASON
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, MRN, ITEM_NO, STATE, REASON)
		VALUES (src.ID, src.ZCP_ID, src.MRN, src.ITEM_NO, src.STATE, src.REASON);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ADDITIONAL_INFO' BEGIN
		MERGE INTO aies.ICS_ZCP_ADDITIONAL_INFO AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ADDITIONAL_INFO AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.CODE=src.CODE, tgt.DESCRIPTION=src.DESCRIPTION
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, CODE, DESCRIPTION)
		VALUES (src.ID, src.ZCP_ID, src.CODE, src.DESCRIPTION);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_WARNINGS' BEGIN
		MERGE INTO aies.ICS_ZCP_WARNINGS AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_WARNINGS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.DIRECTIVE=src.DIRECTIVE, tgt.TEXT=src.TEXT, tgt.TEXTEN=src.TEXTEN, tgt.TOTRADER=src.TOTRADER
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, DIRECTIVE, TEXT, TEXTEN, TOTRADER)
		VALUES (src.ID, src.ZCP_ID, src.DIRECTIVE, src.TEXT, src.TEXTEN, src.TOTRADER);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_TRANSPORT_DOCUMENT' BEGIN
		MERGE INTO aies.ICS_ZCP_TRANSPORT_DOCUMENT AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_TRANSPORT_DOCUMENT AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.CODE=src.CODE, tgt.DOC_NO=src.DOC_NO
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, CODE, DOC_NO)
		VALUES (src.ID, src.ZCP_ID, src.CODE, src.DOC_NO);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_DELIVERY_REQS' BEGIN
		MERGE INTO aies.ICS_ZCP_DELIVERY_REQS AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_DELIVERY_REQS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.CODE=src.CODE, tgt.DESTINATION_CODE=src.DESTINATION_CODE, tgt.DESTINATION=src.DESTINATION
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, CODE, DESTINATION_CODE, DESTINATION)
		VALUES (src.ID, src.ZCP_ID, src.CODE, src.DESTINATION_CODE, src.DESTINATION);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_WDZ' BEGIN
		MERGE INTO aies.ICS_ZCP_WDZ AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_WDZ AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.MRN=src.MRN, tgt.WDZ_NO=src.WDZ_NO, tgt.PROPRIETARY_WDZ_NO=src.PROPRIETARY_WDZ_NO
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, MRN, WDZ_NO, PROPRIETARY_WDZ_NO)
		VALUES (src.ID, src.ZCP_ID, src.MRN, src.WDZ_NO, src.PROPRIETARY_WDZ_NO);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_MESS' BEGIN
		MERGE INTO aies.ICS_MESS AS tgt
		USING [WI_StageODS].aies.ICS_MESS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DESCRIPTION=src.DESCRIPTION, tgt.DIRECTION=src.DIRECTION, tgt.DOC_ID=src.DOC_ID, tgt.DOC_TIME=src.DOC_TIME, tgt.MIME_TYPE=src.MIME_TYPE, tgt.NAMESPACE=src.NAMESPACE, tgt.RECIPIENT=src.RECIPIENT, tgt.REF_NO=src.REF_NO, tgt.SELF_REF=src.SELF_REF, tgt.SENDER=src.SENDER, tgt.VERSION=src.VERSION, tgt.XML_NAME=src.XML_NAME, tgt.ATTACH_ID=src.ATTACH_ID, tgt.DECL_ID=src.DECL_ID, tgt.RESP_TO=src.RESP_TO
		WHEN NOT MATCHED
		THEN INSERT (ID, DESCRIPTION, DIRECTION, DOC_ID, DOC_TIME, MIME_TYPE, NAMESPACE, RECIPIENT, REF_NO, SELF_REF, SENDER, VERSION, XML_NAME, ATTACH_ID, DECL_ID, RESP_TO)
		VALUES (src.ID, src.DESCRIPTION, src.DIRECTION, src.DOC_ID, src.DOC_TIME, src.MIME_TYPE, src.NAMESPACE, src.RECIPIENT, src.REF_NO, src.SELF_REF, src.SENDER, src.VERSION, src.XML_NAME, src.ATTACH_ID, src.DECL_ID, src.RESP_TO);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DECL' BEGIN
		MERGE INTO aies.ICS_DECL AS tgt
		USING [WI_StageODS].aies.ICS_DECL AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TYPE=src.TYPE, tgt.FLAG=src.FLAG, tgt.MANUAL=src.MANUAL, tgt.REF_NO=src.REF_NO, tgt.RETR_EMAIL=src.RETR_EMAIL, tgt.RETR_POST=src.RETR_POST, tgt.SELF_REF=src.SELF_REF, tgt.SIGN=src.SIGN, tgt.VERSION=src.VERSION, tgt.dts=src.dts
		WHEN NOT MATCHED
		THEN INSERT (ID, TYPE, FLAG, MANUAL, REF_NO, RETR_EMAIL, RETR_POST, SELF_REF, SIGN, VERSION, dts)
		VALUES (src.ID, src.TYPE, src.FLAG, src.MANUAL, src.REF_NO, src.RETR_EMAIL, src.RETR_POST, src.SELF_REF, src.SIGN, src.VERSION, src.dts);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_OPER' BEGIN
		MERGE INTO aies.ICS_OPER AS tgt
		USING [WI_StageODS].aies.ICS_OPER AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ANNO=src.ANNO, tgt.CODE=src.CODE, tgt.OPER=src.OPER, tgt.TIME=src.TIME, tgt.DECL_ID=src.DECL_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, ANNO, CODE, OPER, TIME, DECL_ID)
		VALUES (src.ID, src.ANNO, src.CODE, src.OPER, src.TIME, src.DECL_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_CHANG' BEGIN
		MERGE INTO aies.ICS_CHANG AS tgt
		USING [WI_StageODS].aies.ICS_CHANG AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.AFTER=src.AFTER, tgt.BEFORE=src.BEFORE, tgt.ITEM=src.ITEM, tgt.OPER_ID=src.OPER_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, AFTER, BEFORE, ITEM, OPER_ID)
		VALUES (src.ID, src.AFTER, src.BEFORE, src.ITEM, src.OPER_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_GAN' BEGIN
		MERGE INTO aies.ICS_GAN AS tgt
		USING [WI_StageODS].aies.ICS_GAN AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ACCP_DATE=src.ACCP_DATE, tgt.CONT=src.CONT, tgt.ARRV_DATE=src.ARRV_DATE, tgt.DECL_COUT=src.DECL_COUT, tgt.FACT_ENTRY=src.FACT_ENTRY, tgt.GROSS_MASS=src.GROSS_MASS, tgt.GROSS_MASS_BR=src.GROSS_MASS_BR, tgt.GROSS_MASS_BRC=src.GROSS_MASS_BRC, tgt.INTRO_DATE=src.INTRO_DATE, tgt.ITEM_NUMB=src.ITEM_NUMB, tgt.ITEM_NUMB_BR=src.ITEM_NUMB_BR, tgt.ITEM_NUMB_BRC=src.ITEM_NUMB_BRC, tgt.PACK_NUMB=src.PACK_NUMB, tgt.PACK_NUMB_BR=src.PACK_NUMB_BR, tgt.PACK_NUMB_BRC=src.PACK_NUMB_BRC, tgt.PRES_DATE=src.PRES_DATE, tgt.REGI_CUST_EMAIL=src.REGI_CUST_EMAIL, tgt.REGI_DATE=src.REGI_DATE, tgt.STATUS=src.STATUS, tgt.TAB_SINGS=src.TAB_SINGS, tgt.TAB_TYPE=src.TAB_TYPE, tgt.TRANS_DOC_CODE=src.TRANS_DOC_CODE, tgt.TRANS_DOC_NUMB=src.TRANS_DOC_NUMB, tgt.PLDT_DATE=src.PLDT_DATE, tgt.PLDT_PLACE=src.PLDT_PLACE, tgt.TAB_COUN=src.TAB_COUN, tgt.SEND_302_TIME=src.SEND_302_TIME, tgt.FIRST_FACT_ENTRY=src.FIRST_FACT_ENTRY
		WHEN NOT MATCHED
		THEN INSERT (ACCP_DATE, CONT, ARRV_DATE, DECL_COUT, FACT_ENTRY, GROSS_MASS, GROSS_MASS_BR, GROSS_MASS_BRC, INTRO_DATE, ITEM_NUMB, ITEM_NUMB_BR, ITEM_NUMB_BRC, PACK_NUMB, PACK_NUMB_BR, PACK_NUMB_BRC, PRES_DATE, REGI_CUST_EMAIL, REGI_DATE, STATUS, TAB_SINGS, TAB_TYPE, TRANS_DOC_CODE, TRANS_DOC_NUMB, ID, PLDT_DATE, PLDT_PLACE, TAB_COUN, SEND_302_TIME, FIRST_FACT_ENTRY)
		VALUES (src.ACCP_DATE, src.CONT, src.ARRV_DATE, src.DECL_COUT, src.FACT_ENTRY, src.GROSS_MASS, src.GROSS_MASS_BR, src.GROSS_MASS_BRC, src.INTRO_DATE, src.ITEM_NUMB, src.ITEM_NUMB_BR, src.ITEM_NUMB_BRC, src.PACK_NUMB, src.PACK_NUMB_BR, src.PACK_NUMB_BRC, src.PRES_DATE, src.REGI_CUST_EMAIL, src.REGI_DATE, src.STATUS, src.TAB_SINGS, src.TAB_TYPE, src.TRANS_DOC_CODE, src.TRANS_DOC_NUMB, src.ID, src.PLDT_DATE, src.PLDT_PLACE, src.TAB_COUN, src.SEND_302_TIME, src.FIRST_FACT_ENTRY);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_GAN_CUST' BEGIN
		MERGE INTO aies.ICS_GAN_CUST AS tgt
		USING [WI_StageODS].aies.ICS_GAN_CUST AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.EMAIL=src.EMAIL, tgt.NAME=src.NAME, tgt.TIN=src.TIN, tgt.CITY=src.CITY, tgt.COUNTRY=src.COUNTRY, tgt.POST_CODE=src.POST_CODE, tgt.STREET=src.STREET, tgt.CUST_TYPE=src.CUST_TYPE, tgt.GAN_ID=src.GAN_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, EMAIL, NAME, TIN, CITY, COUNTRY, POST_CODE, STREET, CUST_TYPE, GAN_ID)
		VALUES (src.ID, src.EMAIL, src.NAME, src.TIN, src.CITY, src.COUNTRY, src.POST_CODE, src.STREET, src.CUST_TYPE, src.GAN_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_GAN_ITEMS' BEGIN
		MERGE INTO aies.ICS_GAN_ITEMS AS tgt
		USING [WI_StageODS].aies.ICS_GAN_ITEMS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NUMB=src.NUMB, tgt.TRAN_DOCU_CODE=src.TRAN_DOCU_CODE, tgt.TRAN_DOCU_NUMB=src.TRAN_DOCU_NUMB, tgt.GAN_ID=src.GAN_ID, tgt.INTRO=src.INTRO
		WHEN NOT MATCHED
		THEN INSERT (ID, NUMB, TRAN_DOCU_CODE, TRAN_DOCU_NUMB, GAN_ID, INTRO)
		VALUES (src.ID, src.NUMB, src.TRAN_DOCU_CODE, src.TRAN_DOCU_NUMB, src.GAN_ID, src.INTRO);
        SET @Merged = 1;
	END
	IF @TableName ='ICS_GAN_CUST_DATA' BEGIN
		MERGE INTO aies.ICS_GAN_CUST_DATA AS tgt
		USING [WI_StageODS].aies.ICS_GAN_CUST_DATA AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.COUNTRY=src.COUNTRY, tgt.MRN=src.MRN, tgt.GAN_ITEM_ID=src.GAN_ITEM_ID, tgt.DETAIL_XML=src.DETAIL_XML, tgt.MODIFY_FLAG=src.MODIFY_FLAG, tgt.ENS_ID=src.ENS_ID, tgt.FROM_303=src.FROM_303, tgt.REJECT_STATUS=src.REJECT_STATUS, tgt.REJECTED=src.REJECTED, tgt.REJECT_REASON=src.REJECT_REASON, tgt.INTRO=src.INTRO
		WHEN NOT MATCHED
		THEN INSERT (ID, COUNTRY, MRN, GAN_ITEM_ID, DETAIL_XML, MODIFY_FLAG, ENS_ID, FROM_303, REJECT_STATUS, REJECTED, REJECT_REASON, INTRO)
		VALUES (src.ID, src.COUNTRY, src.MRN, src.GAN_ITEM_ID, src.DETAIL_XML, src.MODIFY_FLAG, src.ENS_ID, src.FROM_303, src.REJECT_STATUS, src.REJECTED, src.REJECT_REASON, src.INTRO);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_NATURAL_PERSON' BEGIN
		MERGE INTO aies.ICS_ZCP_NATURAL_PERSON AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_NATURAL_PERSON AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ADDRESS_ID=src.ZCP_ADDRESS_ID, tgt.ZCP_DOC_SIGNER_ID=src.ZCP_DOC_SIGNER_ID, tgt.IDENTIFIER=src.IDENTIFIER, tgt.NAME=src.NAME, tgt.SURNAME=src.SURNAME, tgt.ID_NO=src.ID_NO, tgt.PESEL=src.PESEL, tgt.REPRESENTATIVE_TYPE=src.REPRESENTATIVE_TYPE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ADDRESS_ID, ZCP_DOC_SIGNER_ID, IDENTIFIER, NAME, SURNAME, ID_NO, PESEL, REPRESENTATIVE_TYPE)
		VALUES (src.ID, src.ZCP_ADDRESS_ID, src.ZCP_DOC_SIGNER_ID, src.IDENTIFIER, src.NAME, src.SURNAME, src.ID_NO, src.PESEL, src.REPRESENTATIVE_TYPE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ADDRESS' BEGIN
		MERGE INTO aies.ICS_ZCP_ADDRESS AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ADDRESS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZIP_CODE=src.ZIP_CODE, tgt.COUNTRY=src.COUNTRY, tgt.CITY=src.CITY, tgt.STREET_AND_NO=src.STREET_AND_NO
		WHEN NOT MATCHED
		THEN INSERT (ID, ZIP_CODE, COUNTRY, CITY, STREET_AND_NO)
		VALUES (src.ID, src.ZIP_CODE, src.COUNTRY, src.CITY, src.STREET_AND_NO);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_BUSINESS_ENTITY' BEGIN
		MERGE INTO aies.ICS_ZCP_BUSINESS_ENTITY AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_BUSINESS_ENTITY AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ADDRESS_ID=src.ZCP_ADDRESS_ID, tgt.ZCP_DOC_SIGNER_ID=src.ZCP_DOC_SIGNER_ID, tgt.EMAIL=src.EMAIL, tgt.EORI=src.EORI, tgt.IDENTIFIER=src.IDENTIFIER, tgt.NAME=src.NAME, tgt.REGON=src.REGON, tgt.TIN=src.TIN, tgt.BE_OUTPOST=src.BE_OUTPOST, tgt.REPRESENTATIVE_TYPE=src.REPRESENTATIVE_TYPE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ADDRESS_ID, ZCP_DOC_SIGNER_ID, EMAIL, EORI, IDENTIFIER, NAME, REGON, TIN, BE_OUTPOST, REPRESENTATIVE_TYPE)
		VALUES (src.ID, src.ZCP_ADDRESS_ID, src.ZCP_DOC_SIGNER_ID, src.EMAIL, src.EORI, src.IDENTIFIER, src.NAME, src.REGON, src.TIN, src.BE_OUTPOST, src.REPRESENTATIVE_TYPE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_DOC_SIGNER' BEGIN
		MERGE INTO aies.ICS_ZCP_DOC_SIGNER AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_DOC_SIGNER AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.EMAIL=src.EMAIL, tgt.NAME=src.NAME, tgt.SURNAME=src.SURNAME, tgt.CRIMINAL_LIABILITY_CERTIFICATE=src.CRIMINAL_LIABILITY_CERTIFICATE, tgt.PHONE=src.PHONE, tgt.CUSTOMS_AGENT_ENTRY_DATE=src.CUSTOMS_AGENT_ENTRY_DATE, tgt.CUSTOMS_AGENT_ENTRY_NO=src.CUSTOMS_AGENT_ENTRY_NO
		WHEN NOT MATCHED
		THEN INSERT (ID, EMAIL, NAME, SURNAME, CRIMINAL_LIABILITY_CERTIFICATE, PHONE, CUSTOMS_AGENT_ENTRY_DATE, CUSTOMS_AGENT_ENTRY_NO)
		VALUES (src.ID, src.EMAIL, src.NAME, src.SURNAME, src.CRIMINAL_LIABILITY_CERTIFICATE, src.PHONE, src.CUSTOMS_AGENT_ENTRY_DATE, src.CUSTOMS_AGENT_ENTRY_NO);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_WSP_PODMIOT_GOSP' BEGIN
		MERGE INTO aies.ICS_DSK_WSP_PODMIOT_GOSP AS tgt
		USING [WI_StageODS].aies.ICS_DSK_WSP_PODMIOT_GOSP AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DSK_WSP_ADRES_ID=src.DSK_WSP_ADRES_ID, tgt.DSK_WSP_PODP_DOK_ID=src.DSK_WSP_PODP_DOK_ID, tgt.EMAIL=src.EMAIL, tgt.EORI=src.EORI, tgt.IDENTYFIKATOR=src.IDENTYFIKATOR, tgt.NAZWA=src.NAZWA, tgt.REGON=src.REGON, tgt.TIN=src.TIN, tgt.PLACOWKA_PODMIOTU=src.PLACOWKA_PODMIOTU, tgt.RODZAJ_PRZEDSTAWICIELSTWA=src.RODZAJ_PRZEDSTAWICIELSTWA
		WHEN NOT MATCHED
		THEN INSERT (ID, DSK_WSP_ADRES_ID, DSK_WSP_PODP_DOK_ID, EMAIL, EORI, IDENTYFIKATOR, NAZWA, REGON, TIN, PLACOWKA_PODMIOTU, RODZAJ_PRZEDSTAWICIELSTWA)
		VALUES (src.ID, src.DSK_WSP_ADRES_ID, src.DSK_WSP_PODP_DOK_ID, src.EMAIL, src.EORI, src.IDENTYFIKATOR, src.NAZWA, src.REGON, src.TIN, src.PLACOWKA_PODMIOTU, src.RODZAJ_PRZEDSTAWICIELSTWA);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_WSP_ADRES' BEGIN
		MERGE INTO aies.ICS_DSK_WSP_ADRES AS tgt
		USING [WI_StageODS].aies.ICS_DSK_WSP_ADRES AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KOD_POCZTOWY=src.KOD_POCZTOWY, tgt.KRAJ=src.KRAJ, tgt.MIEJSCOWOSC=src.MIEJSCOWOSC, tgt.ULICA_NR=src.ULICA_NR
		WHEN NOT MATCHED
		THEN INSERT (ID, KOD_POCZTOWY, KRAJ, MIEJSCOWOSC, ULICA_NR)
		VALUES (src.ID, src.KOD_POCZTOWY, src.KRAJ, src.MIEJSCOWOSC, src.ULICA_NR);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_WSP_PODPISUJACY_DOK' BEGIN
		MERGE INTO aies.ICS_DSK_WSP_PODPISUJACY_DOK AS tgt
		USING [WI_StageODS].aies.ICS_DSK_WSP_PODPISUJACY_DOK AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.EMAIL=src.EMAIL, tgt.IMIE=src.IMIE, tgt.NAZWISKO=src.NAZWISKO, tgt.SWIAD_ODP_KARNEJ=src.SWIAD_ODP_KARNEJ, tgt.TELEFON=src.TELEFON, tgt.AGENT_CELNY_DATA_WPISU=src.AGENT_CELNY_DATA_WPISU, tgt.AGENT_CELNY_NR_WPISU=src.AGENT_CELNY_NR_WPISU
		WHEN NOT MATCHED
		THEN INSERT (ID, EMAIL, IMIE, NAZWISKO, SWIAD_ODP_KARNEJ, TELEFON, AGENT_CELNY_DATA_WPISU, AGENT_CELNY_NR_WPISU)
		VALUES (src.ID, src.EMAIL, src.IMIE, src.NAZWISKO, src.SWIAD_ODP_KARNEJ, src.TELEFON, src.AGENT_CELNY_DATA_WPISU, src.AGENT_CELNY_NR_WPISU);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_WSP_OSOBA_FIZYCZNA' BEGIN
		MERGE INTO aies.ICS_DSK_WSP_OSOBA_FIZYCZNA AS tgt
		USING [WI_StageODS].aies.ICS_DSK_WSP_OSOBA_FIZYCZNA AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DSK_WSP_ADRES_ID=src.DSK_WSP_ADRES_ID, tgt.DSK_WSP_PODP_DOK_ID=src.DSK_WSP_PODP_DOK_ID, tgt.IDENTYFIKATOR=src.IDENTYFIKATOR, tgt.IMIE=src.IMIE, tgt.NAZWISKO=src.NAZWISKO, tgt.NR_IDENTYFIKACYJNY=src.NR_IDENTYFIKACYJNY, tgt.PESEL=src.PESEL, tgt.PLACOWKA=src.PLACOWKA, tgt.RODZAJ_PRZEDSTAWICIELSTWA=src.RODZAJ_PRZEDSTAWICIELSTWA
		WHEN NOT MATCHED
		THEN INSERT (ID, DSK_WSP_ADRES_ID, DSK_WSP_PODP_DOK_ID, IDENTYFIKATOR, IMIE, NAZWISKO, NR_IDENTYFIKACYJNY, PESEL, PLACOWKA, RODZAJ_PRZEDSTAWICIELSTWA)
		VALUES (src.ID, src.DSK_WSP_ADRES_ID, src.DSK_WSP_PODP_DOK_ID, src.IDENTYFIKATOR, src.IMIE, src.NAZWISKO, src.NR_IDENTYFIKACYJNY, src.PESEL, src.PLACOWKA, src.RODZAJ_PRZEDSTAWICIELSTWA);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK' BEGIN
		MERGE INTO aies.ICS_DSK AS tgt
		USING [WI_StageODS].aies.ICS_DSK AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DATA_PRZYJECIA=src.DATA_PRZYJECIA, tgt.DODATKOWY_EMAIL1=src.DODATKOWY_EMAIL1, tgt.MASA_BRUTTO=src.MASA_BRUTTO, tgt.NUMER_REFERENCYJNY_PRZESYLKI=src.NUMER_REFERENCYJNY_PRZESYLKI, tgt.PLACOWKA_PODMIOTU=src.PLACOWKA_PODMIOTU, tgt.PODPIS_ELEKTRONICZNY=src.PODPIS_ELEKTRONICZNY, tgt.RODZAJ_TRANSPORTU_NA_GRANICY=src.RODZAJ_TRANSPORTU_NA_GRANICY, tgt.STATUS=src.STATUS, tgt.TYP_ZGLOSZENIA=src.TYP_ZGLOSZENIA, tgt.UC_DEKLARACJI=src.UC_DEKLARACJI, tgt.XMLNS=src.XMLNS, tgt.OF_ODBIORCA_ID=src.OF_ODBIORCA_ID, tgt.PG_ODBIORCA_ID=src.PG_ODBIORCA_ID, tgt.OF_PODM_DO_KONTAKTU_ID=src.OF_PODM_DO_KONTAKTU_ID, tgt.PG_PODM_DO_KONTAKTU_ID=src.PG_PODM_DO_KONTAKTU_ID, tgt.OF_PRZEDSTAWICIEL_ID=src.OF_PRZEDSTAWICIEL_ID, tgt.PG_PRZEDSTAWICIEL_ID=src.PG_PRZEDSTAWICIEL_ID, tgt.OF_SKLAD_DEKL_ID=src.OF_SKLAD_DEKL_ID, tgt.PG_SKLAD_DEKL_ID=src.PG_SKLAD_DEKL_ID, tgt.REFERENCJE_DO_ZT=src.REFERENCJE_DO_ZT
		WHEN NOT MATCHED
		THEN INSERT (ID, DATA_PRZYJECIA, DODATKOWY_EMAIL1, MASA_BRUTTO, NUMER_REFERENCYJNY_PRZESYLKI, PLACOWKA_PODMIOTU, PODPIS_ELEKTRONICZNY, RODZAJ_TRANSPORTU_NA_GRANICY, STATUS, TYP_ZGLOSZENIA, UC_DEKLARACJI, XMLNS, OF_ODBIORCA_ID, PG_ODBIORCA_ID, OF_PODM_DO_KONTAKTU_ID, PG_PODM_DO_KONTAKTU_ID, OF_PRZEDSTAWICIEL_ID, PG_PRZEDSTAWICIEL_ID, OF_SKLAD_DEKL_ID, PG_SKLAD_DEKL_ID, REFERENCJE_DO_ZT)
		VALUES (src.ID, src.DATA_PRZYJECIA, src.DODATKOWY_EMAIL1, src.MASA_BRUTTO, src.NUMER_REFERENCYJNY_PRZESYLKI, src.PLACOWKA_PODMIOTU, src.PODPIS_ELEKTRONICZNY, src.RODZAJ_TRANSPORTU_NA_GRANICY, src.STATUS, src.TYP_ZGLOSZENIA, src.UC_DEKLARACJI, src.XMLNS, src.OF_ODBIORCA_ID, src.PG_ODBIORCA_ID, src.OF_PODM_DO_KONTAKTU_ID, src.PG_PODM_DO_KONTAKTU_ID, src.OF_PRZEDSTAWICIEL_ID, src.PG_PRZEDSTAWICIEL_ID, src.OF_SKLAD_DEKL_ID, src.PG_SKLAD_DEKL_ID, src.REFERENCJE_DO_ZT);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TOWAR' BEGIN
		MERGE INTO aies.ICS_DSK_TOWAR AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TOWAR AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_ID=src.ICS_DSK_ID, tgt.ILOSC_TOWARU=src.ILOSC_TOWARU, tgt.JEDNOSTKA_MIARY=src.JEDNOSTKA_MIARY, tgt.KWOTA=src.KWOTA, tgt.NR_POZYCJI=src.NR_POZYCJI, tgt.NUMER_REFERENCYJNY_PRZESYLKI=src.NUMER_REFERENCYJNY_PRZESYLKI, tgt.STATUS_POZYCJI_DSK=src.STATUS_POZYCJI_DSK, tgt.TERMIN=src.TERMIN, tgt.OPIS_NIEPRAWIDL=src.OPIS_NIEPRAWIDL, tgt.ICS_ENS_ITEMS_ID=src.ICS_ENS_ITEMS_ID, tgt.OF_ODBIORCA_ID=src.OF_ODBIORCA_ID, tgt.PG_ODBIORCA_ID=src.PG_ODBIORCA_ID, tgt.OF_PODM_DO_KONTAKTU_ID=src.OF_PODM_DO_KONTAKTU_ID, tgt.PG_PODM_DO_KONTAKTU_ID=src.PG_PODM_DO_KONTAKTU_ID, tgt.ICS_DSK_JEDNOSTKA_MIARY_ID=src.ICS_DSK_JEDNOSTKA_MIARY_ID, tgt.MASA_BRUTTO=src.MASA_BRUTTO, tgt.MASA_NETTO=src.MASA_NETTO, tgt.OPIS_TOWARU=src.OPIS_TOWARU, tgt.UWAGI=src.UWAGI, tgt.REFERENCJE_DO_ZT=src.REFERENCJE_DO_ZT, tgt.WYNIK_KONTROLI=src.WYNIK_KONTROLI, tgt.PRZETERMINOWANY=src.PRZETERMINOWANY
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_ID, ILOSC_TOWARU, JEDNOSTKA_MIARY, KWOTA, NR_POZYCJI, NUMER_REFERENCYJNY_PRZESYLKI, STATUS_POZYCJI_DSK, TERMIN, OPIS_NIEPRAWIDL, ICS_ENS_ITEMS_ID, OF_ODBIORCA_ID, PG_ODBIORCA_ID, OF_PODM_DO_KONTAKTU_ID, PG_PODM_DO_KONTAKTU_ID, ICS_DSK_JEDNOSTKA_MIARY_ID, MASA_BRUTTO, MASA_NETTO, OPIS_TOWARU, UWAGI, REFERENCJE_DO_ZT, WYNIK_KONTROLI, PRZETERMINOWANY)
		VALUES (src.ID, src.ICS_DSK_ID, src.ILOSC_TOWARU, src.JEDNOSTKA_MIARY, src.KWOTA, src.NR_POZYCJI, src.NUMER_REFERENCYJNY_PRZESYLKI, src.STATUS_POZYCJI_DSK, src.TERMIN, src.OPIS_NIEPRAWIDL, src.ICS_ENS_ITEMS_ID, src.OF_ODBIORCA_ID, src.PG_ODBIORCA_ID, src.OF_PODM_DO_KONTAKTU_ID, src.PG_PODM_DO_KONTAKTU_ID, src.ICS_DSK_JEDNOSTKA_MIARY_ID, src.MASA_BRUTTO, src.MASA_NETTO, src.OPIS_TOWARU, src.UWAGI, src.REFERENCJE_DO_ZT, src.WYNIK_KONTROLI, src.PRZETERMINOWANY);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_WSP_INFORMACJA_DOD' BEGIN
		MERGE INTO aies.ICS_DSK_WSP_INFORMACJA_DOD AS tgt
		USING [WI_StageODS].aies.ICS_DSK_WSP_INFORMACJA_DOD AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK=src.ICS_DSK, tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.KOD=src.KOD, tgt.OPIS=src.OPIS
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK, ICS_DSK_TOWAR_ID, KOD, OPIS)
		VALUES (src.ID, src.ICS_DSK, src.ICS_DSK_TOWAR_ID, src.KOD, src.OPIS);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_WSP_MIEJSCE_WYLADUNKU' BEGIN
		MERGE INTO aies.ICS_DSK_WSP_MIEJSCE_WYLADUNKU AS tgt
		USING [WI_StageODS].aies.ICS_DSK_WSP_MIEJSCE_WYLADUNKU AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_ID=src.ICS_DSK_ID, tgt.ICS_DSK_TOWAR_ID=src.ICS_DSK_TOWAR_ID, tgt.KOD=src.KOD, tgt.KRAJ=src.KRAJ, tgt.OPIS_MIEJSCA_WYLADUNKU=src.OPIS_MIEJSCA_WYLADUNKU
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_ID, ICS_DSK_TOWAR_ID, KOD, KRAJ, OPIS_MIEJSCA_WYLADUNKU)
		VALUES (src.ID, src.ICS_DSK_ID, src.ICS_DSK_TOWAR_ID, src.KOD, src.KRAJ, src.OPIS_MIEJSCA_WYLADUNKU);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_NIESKUTECZNE_ZAB' BEGIN
		DELETE aies.ICS_DSK_NIESKUTECZNE_ZAB
		MERGE INTO aies.ICS_DSK_NIESKUTECZNE_ZAB AS tgt
		USING [WI_StageODS].aies.ICS_DSK_NIESKUTECZNE_ZAB AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ID=src.ID, tgt.ICS_DSK_ID=src.ICS_DSK_ID, tgt.NR_POZYCJI=src.NR_POZYCJI, tgt.UZASADNIENIE=src.UZASADNIENIE
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_ID, NR_POZYCJI, UZASADNIENIE)
		VALUES (src.ID, src.ICS_DSK_ID, src.NR_POZYCJI, src.UZASADNIENIE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TRANSPORT_NA_GRANICY' BEGIN
		MERGE INTO aies.ICS_DSK_TRANSPORT_NA_GRANICY AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TRANSPORT_NA_GRANICY AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_ID=src.ICS_DSK_ID, tgt.PANSTWO_AKTYWNEGO_SR_TRANSP=src.PANSTWO_AKTYWNEGO_SR_TRANSP, tgt.RODZAJ_TRANSPORTU_NA_GRANICY=src.RODZAJ_TRANSPORTU_NA_GRANICY, tgt.ZNAKI_SRODKA_TRANSPORTU=src.ZNAKI_SRODKA_TRANSPORTU
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_ID, PANSTWO_AKTYWNEGO_SR_TRANSP, RODZAJ_TRANSPORTU_NA_GRANICY, ZNAKI_SRODKA_TRANSPORTU)
		VALUES (src.ID, src.ICS_DSK_ID, src.PANSTWO_AKTYWNEGO_SR_TRANSP, src.RODZAJ_TRANSPORTU_NA_GRANICY, src.ZNAKI_SRODKA_TRANSPORTU);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_OPERACJA' BEGIN
		MERGE INTO aies.ICS_DSK_OPERACJA AS tgt
		USING [WI_StageODS].aies.ICS_DSK_OPERACJA AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_ID=src.ICS_DSK_ID, tgt.ADNOTACJA=src.ADNOTACJA, tgt.DATA=src.DATA, tgt.NAZWA=src.NAZWA, tgt.UWAGI=src.UWAGI, tgt.WYKONAL=src.WYKONAL
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_ID, ADNOTACJA, DATA, NAZWA, UWAGI, WYKONAL)
		VALUES (src.ID, src.ICS_DSK_ID, src.ADNOTACJA, src.DATA, src.NAZWA, src.UWAGI, src.WYKONAL);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_LOKALIZACJA' BEGIN
		MERGE INTO aies.ICS_DSK_LOKALIZACJA AS tgt
		USING [WI_StageODS].aies.ICS_DSK_LOKALIZACJA AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_ID=src.ICS_DSK_ID, tgt.KOD_MIEJSCA_LOKALIZACJI_TOW=src.KOD_MIEJSCA_LOKALIZACJI_TOW, tgt.KRAJ=src.KRAJ, tgt.KWALIFIKATOR_LOKALIZACJI=src.KWALIFIKATOR_LOKALIZACJI, tgt.MIEJSCE_LOKALIZACJI_TOWAROW_UC=src.MIEJSCE_LOKALIZACJI_TOWAROW_UC, tgt.OPIS_MIEJSCA_LOKALIZACJI_TOW=src.OPIS_MIEJSCA_LOKALIZACJI_TOW, tgt.TYP_LOKALIZACJI=src.TYP_LOKALIZACJI
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_ID, KOD_MIEJSCA_LOKALIZACJI_TOW, KRAJ, KWALIFIKATOR_LOKALIZACJI, MIEJSCE_LOKALIZACJI_TOWAROW_UC, OPIS_MIEJSCA_LOKALIZACJI_TOW, TYP_LOKALIZACJI)
		VALUES (src.ID, src.ICS_DSK_ID, src.KOD_MIEJSCA_LOKALIZACJI_TOW, src.KRAJ, src.KWALIFIKATOR_LOKALIZACJI, src.MIEJSCE_LOKALIZACJI_TOWAROW_UC, src.OPIS_MIEJSCA_LOKALIZACJI_TOW, src.TYP_LOKALIZACJI);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_LOKALIZACJA_ADRES' BEGIN
		MERGE INTO aies.ICS_DSK_LOKALIZACJA_ADRES AS tgt
		USING [WI_StageODS].aies.ICS_DSK_LOKALIZACJA_ADRES AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_LOKALIZACJA_ID=src.ICS_DSK_LOKALIZACJA_ID, tgt.KOD_POCZTOWY=src.KOD_POCZTOWY, tgt.KRAJ=src.KRAJ, tgt.MIEJSCOWOSC=src.MIEJSCOWOSC, tgt.ULICA_I_NR=src.ULICA_I_NR
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_LOKALIZACJA_ID, KOD_POCZTOWY, KRAJ, MIEJSCOWOSC, ULICA_I_NR)
		VALUES (src.ID, src.ICS_DSK_LOKALIZACJA_ID, src.KOD_POCZTOWY, src.KRAJ, src.MIEJSCOWOSC, src.ULICA_I_NR);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_TRANSPORT_WEWN' BEGIN
		MERGE INTO aies.ICS_DSK_TRANSPORT_WEWN AS tgt
		USING [WI_StageODS].aies.ICS_DSK_TRANSPORT_WEWN AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_ID=src.ICS_DSK_ID, tgt.RODZAJ_TRANSPORTU=src.RODZAJ_TRANSPORTU, tgt.ZNAKI_SRODKA_TRANSPORTU=src.ZNAKI_SRODKA_TRANSPORTU, tgt.PANSTWO_AKTYWNEGO_SR_TRANSP=src.PANSTWO_AKTYWNEGO_SR_TRANSP
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_ID, RODZAJ_TRANSPORTU, ZNAKI_SRODKA_TRANSPORTU, PANSTWO_AKTYWNEGO_SR_TRANSP)
		VALUES (src.ID, src.ICS_DSK_ID, src.RODZAJ_TRANSPORTU, src.ZNAKI_SRODKA_TRANSPORTU, src.PANSTWO_AKTYWNEGO_SR_TRANSP);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_ZABEZPIECZENIE' BEGIN
		MERGE INTO aies.ICS_DSK_ZABEZPIECZENIE AS tgt
		USING [WI_StageODS].aies.ICS_DSK_ZABEZPIECZENIE AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_ID=src.ICS_DSK_ID, tgt.GRN=src.GRN, tgt.INNY_RODZAJ_ZABEZP_KOD=src.INNY_RODZAJ_ZABEZP_KOD, tgt.KOD_DOSTEPU=src.KOD_DOSTEPU, tgt.KWOTA_ZABEZPIECZENIA=src.KWOTA_ZABEZPIECZENIA, tgt.RODZAJ_ZABEZPIECZENIA=src.RODZAJ_ZABEZPIECZENIA, tgt.TIN=src.TIN
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_ID, GRN, INNY_RODZAJ_ZABEZP_KOD, KOD_DOSTEPU, KWOTA_ZABEZPIECZENIA, RODZAJ_ZABEZPIECZENIA, TIN)
		VALUES (src.ID, src.ICS_DSK_ID, src.GRN, src.INNY_RODZAJ_ZABEZP_KOD, src.KOD_DOSTEPU, src.KWOTA_ZABEZPIECZENIA, src.RODZAJ_ZABEZPIECZENIA, src.TIN);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_POW_O_KONTROLI' BEGIN
		MERGE INTO aies.ICS_DSK_POW_O_KONTROLI AS tgt
		USING [WI_StageODS].aies.ICS_DSK_POW_O_KONTROLI AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_ID=src.ICS_DSK_ID, tgt.CZAS_KONTROLI=src.CZAS_KONTROLI, tgt.UWAGI=src.UWAGI
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_ID, CZAS_KONTROLI, UWAGI)
		VALUES (src.ID, src.ICS_DSK_ID, src.CZAS_KONTROLI, src.UWAGI);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_ZAMK_CELNE' BEGIN
		MERGE INTO aies.ICS_DSK_ZAMK_CELNE AS tgt
		USING [WI_StageODS].aies.ICS_DSK_ZAMK_CELNE AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_ID=src.ICS_DSK_ID, tgt.ILOSC=src.ILOSC, tgt.RODZAJ=src.RODZAJ
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_ID, ILOSC, RODZAJ)
		VALUES (src.ID, src.ICS_DSK_ID, src.ILOSC, src.RODZAJ);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_DSK_ZAMK_CELNE_NUMERY' BEGIN
		MERGE INTO aies.ICS_DSK_ZAMK_CELNE_NUMERY AS tgt
		USING [WI_StageODS].aies.ICS_DSK_ZAMK_CELNE_NUMERY AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ICS_DSK_ZAMK_CELNE_ID=src.ICS_DSK_ZAMK_CELNE_ID, tgt.NUMER=src.NUMER
		WHEN NOT MATCHED
		THEN INSERT (ID, ICS_DSK_ZAMK_CELNE_ID, NUMER)
		VALUES (src.ID, src.ICS_DSK_ZAMK_CELNE_ID, src.NUMER);
        SET @Merged = 1;	
	END
	IF @TableName = 'ICS_GAN_CUST_DATA_DETL' BEGIN
		MERGE INTO aies.ICS_GAN_CUST_DATA_DETL AS tgt
		USING [WI_StageODS].aies.ICS_GAN_CUST_DATA_DETL AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NUMBER=src.NUMBER, tgt.STATUS=src.STATUS, tgt.GAN_CUST_DATA_ID=src.GAN_CUST_DATA_ID, tgt.ENS_ITEM_ID=src.ENS_ITEM_ID, tgt.DISC_STATE=src.DISC_STATE, tgt.SEND_330=src.SEND_330, tgt.INTRO=src.INTRO, tgt.REJECT_REASON=src.REJECT_REASON, tgt.SEND_349=src.SEND_349
		WHEN NOT MATCHED
		THEN INSERT (ID, NUMBER, STATUS, GAN_CUST_DATA_ID, ENS_ITEM_ID, DISC_STATE, SEND_330, INTRO, REJECT_REASON, SEND_349)
		VALUES (src.ID, src.NUMBER, src.STATUS, src.GAN_CUST_DATA_ID, src.ENS_ITEM_ID, src.DISC_STATE, src.SEND_330, src.INTRO, src.REJECT_REASON, src.SEND_349);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_BALANCE_REQ' BEGIN
		MERGE INTO aies.ICS_BALANCE_REQ AS tgt
		USING [WI_StageODS].aies.ICS_BALANCE_REQ AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.CREATOR=src.CREATOR, tgt.MRN=src.MRN, tgt.STATUS=src.STATUS
		WHEN NOT MATCHED
		THEN INSERT (ID, CREATOR, MRN, STATUS)
		VALUES (src.ID, src.CREATOR, src.MRN, src.STATUS);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_CANCEL_BALANCE_REQ' BEGIN
		MERGE INTO aies.ICS_CANCEL_BALANCE_REQ AS tgt
		USING [WI_StageODS].aies.ICS_CANCEL_BALANCE_REQ AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.REQUEST_ID=src.REQUEST_ID, tgt.STATUS=src.STATUS, tgt.BALANCE_REQUEST_ID=src.BALANCE_REQUEST_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, REQUEST_ID, STATUS, BALANCE_REQUEST_ID)
		VALUES (src.ID, src.REQUEST_ID, src.STATUS, src.BALANCE_REQUEST_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ENS' BEGIN
		MERGE INTO aies.ICS_ENS AS tgt
		USING [WI_StageODS].aies.ICS_ENS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ACCP_DATE=src.ACCP_DATE, tgt.CHANG_FIRS_ENTR=src.CHANG_FIRS_ENTR, tgt.COMM_REFE_NUMB=src.COMM_REFE_NUMB, tgt.CONTAINERS=src.CONTAINERS, tgt.CONV_REFE_NUMB=src.CONV_REFE_NUMB, tgt.CUST_OFFI=src.CUST_OFFI, tgt.DATE_OF_ARRIVING=src.DATE_OF_ARRIVING, tgt.FIRS_ENTR=src.FIRS_ENTR, tgt.FIRS_ENTR_BR=src.FIRS_ENTR_BR, tgt.GOODS_PRES=src.GOODS_PRES, tgt.ICS_DECL=src.ICS_DECL, tgt.LODGMENT=src.LODGMENT, tgt.MRN=src.MRN, tgt.NUMB_ITEMS=src.NUMB_ITEMS, tgt.NUMB_PACK=src.NUMB_PACK, tgt.PLDT_DATE=src.PLDT_DATE, tgt.PLDT_PLACE=src.PLDT_PLACE, tgt.PLACE_OF_LOAD=src.PLACE_OF_LOAD, tgt.PLACE_OF_UNLOAD=src.PLACE_OF_UNLOAD, tgt.REGI_CUST_EMAIL=src.REGI_CUST_EMAIL, tgt.REGI_DATE=src.REGI_DATE, tgt.REPR_CUST_EMAIL=src.REPR_CUST_EMAIL, tgt.SPEC_CIRC_INDI=src.SPEC_CIRC_INDI, tgt.STATUS=src.STATUS, tgt.TIME_TO_RESULT=src.TIME_TO_RESULT, tgt.TOTAL_GROSS_MASS=src.TOTAL_GROSS_MASS, tgt.TRAN_METH_PAYM=src.TRAN_METH_PAYM, tgt.TAB_NATION=src.TAB_NATION, tgt.TAB_SINGS=src.TAB_SINGS, tgt.TAB_TYPE=src.TAB_TYPE, tgt.WAR_DATE=src.WAR_DATE, tgt.AEO_CTRL_BTN=src.AEO_CTRL_BTN, tgt.SEND_319_FLAG=src.SEND_319_FLAG, tgt.SEND_351_FLAG=src.SEND_351_FLAG, tgt.INTRO=src.INTRO
		WHEN NOT MATCHED
		THEN INSERT (ACCP_DATE, CHANG_FIRS_ENTR, COMM_REFE_NUMB, CONTAINERS, CONV_REFE_NUMB, CUST_OFFI, DATE_OF_ARRIVING, FIRS_ENTR, FIRS_ENTR_BR, GOODS_PRES, ICS_DECL, LODGMENT, MRN, NUMB_ITEMS, NUMB_PACK, PLDT_DATE, PLDT_PLACE, PLACE_OF_LOAD, PLACE_OF_UNLOAD, REGI_CUST_EMAIL, REGI_DATE, REPR_CUST_EMAIL, SPEC_CIRC_INDI, STATUS, TIME_TO_RESULT, TOTAL_GROSS_MASS, TRAN_METH_PAYM, TAB_NATION, TAB_SINGS, TAB_TYPE, WAR_DATE, ID, AEO_CTRL_BTN, SEND_319_FLAG, SEND_351_FLAG, INTRO)
		VALUES (src.ACCP_DATE, src.CHANG_FIRS_ENTR, src.COMM_REFE_NUMB, src.CONTAINERS, src.CONV_REFE_NUMB, src.CUST_OFFI, src.DATE_OF_ARRIVING, src.FIRS_ENTR, src.FIRS_ENTR_BR, src.GOODS_PRES, src.ICS_DECL, src.LODGMENT, src.MRN, src.NUMB_ITEMS, src.NUMB_PACK, src.PLDT_DATE, src.PLDT_PLACE, src.PLACE_OF_LOAD, src.PLACE_OF_UNLOAD, src.REGI_CUST_EMAIL, src.REGI_DATE, src.REPR_CUST_EMAIL, src.SPEC_CIRC_INDI, src.STATUS, src.TIME_TO_RESULT, src.TOTAL_GROSS_MASS, src.TRAN_METH_PAYM, src.TAB_NATION, src.TAB_SINGS, src.TAB_TYPE, src.WAR_DATE, src.ID, src.AEO_CTRL_BTN, src.SEND_319_FLAG, src.SEND_351_FLAG, src.INTRO);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ENS_ITI' BEGIN
		MERGE INTO aies.ICS_ENS_ITI AS tgt
		USING [WI_StageODS].aies.ICS_ENS_ITI AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.COUNTRY=src.COUNTRY, tgt.ENS_ID=src.ENS_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, COUNTRY, ENS_ID)
		VALUES (src.ID, src.COUNTRY, src.ENS_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ENS_SEALS' BEGIN
		MERGE INTO aies.ICS_ENS_SEALS AS tgt
		USING [WI_StageODS].aies.ICS_ENS_SEALS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NUMB=src.NUMB, tgt.ENS_ID=src.ENS_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, NUMB, ENS_ID)
		VALUES (src.ID, src.NUMB, src.ENS_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ENS_SUBS_ENTR' BEGIN
		MERGE INTO aies.ICS_ENS_SUBS_ENTR AS tgt
		USING [WI_StageODS].aies.ICS_ENS_SUBS_ENTR AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.CITY=src.CITY, tgt.COUNTRY=src.COUNTRY, tgt.POST_CODE=src.POST_CODE, tgt.STREET=src.STREET, tgt.CODE=src.CODE, tgt.NAME=src.NAME, tgt.ENS_ID=src.ENS_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, CITY, COUNTRY, POST_CODE, STREET, CODE, NAME, ENS_ID)
		VALUES (src.ID, src.CITY, src.COUNTRY, src.POST_CODE, src.STREET, src.CODE, src.NAME, src.ENS_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ENS_ITEMS' BEGIN
		MERGE INTO aies.ICS_ENS_ITEMS AS tgt
		USING [WI_StageODS].aies.ICS_ENS_ITEMS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.BALANCE_GROSS_MASS=src.BALANCE_GROSS_MASS, tgt.BALANCE_PACKAGES=src.BALANCE_PACKAGES, tgt.BALN=src.BALN, tgt.CHARG_TYPE=src.CHARG_TYPE, tgt.CHARG_TYPE_BR=src.CHARG_TYPE_BR, tgt.CHARG_TYPE_BRC=src.CHARG_TYPE_BRC, tgt.CODE=src.CODE, tgt.CODE_BR=src.CODE_BR, tgt.CRN=src.CRN, tgt.CRN_BR=src.CRN_BR, tgt.DANG_CODE=src.DANG_CODE, tgt.DANG_CODE_BR=src.DANG_CODE_BR, tgt.DANG_CODE_BRC=src.DANG_CODE_BRC, tgt.ITEM_DESC=src.ITEM_DESC, tgt.ITEM_DESC_BR=src.ITEM_DESC_BR, tgt.GROSS_MASS=src.GROSS_MASS, tgt.GROSS_MASS_BR=src.GROSS_MASS_BR, tgt.NUMB=src.NUMB, tgt.PLACE_OF_LOAD=src.PLACE_OF_LOAD, tgt.PLACE_OF_LOAD_BR=src.PLACE_OF_LOAD_BR, tgt.PLACE_OF_LOAD_BRC=src.PLACE_OF_LOAD_BRC, tgt.PLACE_OF_UNLOAD=src.PLACE_OF_UNLOAD, tgt.PLACE_OF_UNLOAD_BR=src.PLACE_OF_UNLOAD_BR, tgt.PLACE_OF_UNLOAD_BRC=src.PLACE_OF_UNLOAD_BRC, tgt.STATE_BR=src.STATE_BR, tgt.STATE_BRC=src.STATE_BRC, tgt.STATUS=src.STATUS, tgt.ENS_ID=src.ENS_ID, tgt.FACT_ENTRY=src.FACT_ENTRY, tgt.FAKE=src.FAKE, tgt.INTRO=src.INTRO, tgt.REF_NO=src.REF_NO, tgt.REF_COMPLETED=src.REF_COMPLETED
		WHEN NOT MATCHED
		THEN INSERT (ID, BALANCE_GROSS_MASS, BALANCE_PACKAGES, BALN, CHARG_TYPE, CHARG_TYPE_BR, CHARG_TYPE_BRC, CODE, CODE_BR, CRN, CRN_BR, DANG_CODE, DANG_CODE_BR, DANG_CODE_BRC, ITEM_DESC, ITEM_DESC_BR, GROSS_MASS, GROSS_MASS_BR, NUMB, PLACE_OF_LOAD, PLACE_OF_LOAD_BR, PLACE_OF_LOAD_BRC, PLACE_OF_UNLOAD, PLACE_OF_UNLOAD_BR, PLACE_OF_UNLOAD_BRC, STATE_BR, STATE_BRC, STATUS, ENS_ID, FACT_ENTRY, FAKE, INTRO, REF_NO, REF_COMPLETED)
		VALUES (src.ID, src.BALANCE_GROSS_MASS, src.BALANCE_PACKAGES, src.BALN, src.CHARG_TYPE, src.CHARG_TYPE_BR, src.CHARG_TYPE_BRC, src.CODE, src.CODE_BR, src.CRN, src.CRN_BR, src.DANG_CODE, src.DANG_CODE_BR, src.DANG_CODE_BRC, src.ITEM_DESC, src.ITEM_DESC_BR, src.GROSS_MASS, src.GROSS_MASS_BR, src.NUMB, src.PLACE_OF_LOAD, src.PLACE_OF_LOAD_BR, src.PLACE_OF_LOAD_BRC, src.PLACE_OF_UNLOAD, src.PLACE_OF_UNLOAD_BR, src.PLACE_OF_UNLOAD_BRC, src.STATE_BR, src.STATE_BRC, src.STATUS, src.ENS_ID, src.FACT_ENTRY, src.FAKE, src.INTRO, src.REF_NO, src.REF_COMPLETED);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ENS_CUST' BEGIN
		MERGE INTO aies.ICS_ENS_CUST AS tgt
		USING [WI_StageODS].aies.ICS_ENS_CUST AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.EMAIL=src.EMAIL, tgt.NAME=src.NAME, tgt.TIN=src.TIN, tgt.CITY=src.CITY, tgt.COUNTRY=src.COUNTRY, tgt.POST_CODE=src.POST_CODE, tgt.STREET=src.STREET, tgt.CUST_TYPE=src.CUST_TYPE, tgt.ENS_ID=src.ENS_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, EMAIL, NAME, TIN, CITY, COUNTRY, POST_CODE, STREET, CUST_TYPE, ENS_ID)
		VALUES (src.ID, src.EMAIL, src.NAME, src.TIN, src.CITY, src.COUNTRY, src.POST_CODE, src.STREET, src.CUST_TYPE, src.ENS_ID);
        SET @Merged = 1;
	END
	/* Kontener ICS_ENS... */
	IF @TableName = 'ICS_ZCP_ITEM' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ID=src.ZCP_ID, tgt.LEGAL_ANNOTATIONS=src.LEGAL_ANNOTATIONS, tgt.CALC_DATE=src.CALC_DATE, tgt.RELEASE_OF_GOODS_DATE=src.RELEASE_OF_GOODS_DATE, tgt.QUANTITY_SUPPL_UNIT=src.QUANTITY_SUPPL_UNIT, tgt.CN_CODE=src.CN_CODE, tgt.CUS_CODE=src.CUS_CODE, tgt.TARIC_CODE=src.TARIC_CODE, tgt.ITEM_CODE=src.ITEM_CODE, tgt.COUNTRY_OF_ORIGIN=src.COUNTRY_OF_ORIGIN, tgt.COUNTRY_OF_DESTINATION=src.COUNTRY_OF_DESTINATION, tgt.COUNTRY_OF_DESTINATION_REGION=src.COUNTRY_OF_DESTINATION_REGION, tgt.COUNTRY_OF_EXPORT=src.COUNTRY_OF_EXPORT, tgt.MEASURE_NO=src.MEASURE_NO, tgt.ITEM_NO=src.ITEM_NO, tgt.PARCEL_REFERENCE_NUMBER=src.PARCEL_REFERENCE_NUMBER, tgt.DEFFERED_PAYMENT=src.DEFFERED_PAYMENT, tgt.PREFERENCE_CODE=src.PREFERENCE_CODE, tgt.ZCP_ITEM_STATUS=src.ZCP_ITEM_STATUS, tgt.ARR_STATUS=src.ARR_STATUS, tgt.EMCS_STATUS=src.EMCS_STATUS, tgt.SUSPENSION_OF_RELEASE=src.SUSPENSION_OF_RELEASE, tgt.MEASURE_TYPE_CODE=src.MEASURE_TYPE_CODE, tgt.TRANS_RATE_OF_EXCHANGE=src.TRANS_RATE_OF_EXCHANGE, tgt.TRANS_TYPE=src.TRANS_TYPE, tgt.TRANS_CURRENCY=src.TRANS_CURRENCY, tgt.EMCS_CN_CODE=src.EMCS_CN_CODE, tgt.EMCS_NET_MASS=src.EMCS_NET_MASS, tgt.EMCS_ARC_NO=src.EMCS_ARC_NO, tgt.PROCEDURE_CODE=src.PROCEDURE_CODE, tgt.PROCEDURE_DETAILS=src.PROCEDURE_DETAILS, tgt.DESCR_OF_IRREGULARITY=src.DESCR_OF_IRREGULARITY, tgt.ICS_ENS_ITEMS_ID=src.ICS_ENS_ITEMS_ID, tgt.NP_SENDER_ID=src.NP_SENDER_ID, tgt.BE_SENDER_ID=src.BE_SENDER_ID, tgt.NP_RECEIVER_ID=src.NP_RECEIVER_ID, tgt.BE_RECEIVER_ID=src.BE_RECEIVER_ID, tgt.NP_CONTACT_ID=src.NP_CONTACT_ID, tgt.BE_CONTACT_ID=src.BE_CONTACT_ID, tgt.ITEM_DESCRIPTION=src.ITEM_DESCRIPTION, tgt.NOTES=src.NOTES, tgt.GROSS_MASS_KG=src.GROSS_MASS_KG, tgt.NET_MASS_KG=src.NET_MASS_KG, tgt.QUANTITY=src.QUANTITY, tgt.ICS_GAN_CUST_DATA_DETL_ID=src.ICS_GAN_CUST_DATA_DETL_ID, tgt.AGRIM=src.AGRIM, tgt.E_AD=src.E_AD, tgt.PAYMENT_DONE=src.PAYMENT_DONE, tgt.NP_SELLER_ID=src.NP_SELLER_ID, tgt.BE_SELLER_ID=src.BE_SELLER_ID, tgt.BE_BUYER_ID=src.BE_BUYER_ID, tgt.NP_BUYER_ID=src.NP_BUYER_ID, tgt.CONTINUE_PROCESSING=src.CONTINUE_PROCESSING, tgt.VERIF_RESULT=src.VERIF_RESULT, tgt.NET_MASS_REAL=src.NET_MASS_REAL, tgt.CN_CODE_REAL=src.CN_CODE_REAL
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ID, LEGAL_ANNOTATIONS, CALC_DATE, RELEASE_OF_GOODS_DATE, QUANTITY_SUPPL_UNIT, CN_CODE, CUS_CODE, TARIC_CODE, ITEM_CODE, COUNTRY_OF_ORIGIN, COUNTRY_OF_DESTINATION, COUNTRY_OF_DESTINATION_REGION, COUNTRY_OF_EXPORT, MEASURE_NO, ITEM_NO, PARCEL_REFERENCE_NUMBER, DEFFERED_PAYMENT, PREFERENCE_CODE, ZCP_ITEM_STATUS, ARR_STATUS, EMCS_STATUS, SUSPENSION_OF_RELEASE, MEASURE_TYPE_CODE, TRANS_RATE_OF_EXCHANGE, TRANS_TYPE, TRANS_CURRENCY, EMCS_CN_CODE, EMCS_NET_MASS, EMCS_ARC_NO, PROCEDURE_CODE, PROCEDURE_DETAILS, DESCR_OF_IRREGULARITY, ICS_ENS_ITEMS_ID, NP_SENDER_ID, BE_SENDER_ID, NP_RECEIVER_ID, BE_RECEIVER_ID, NP_CONTACT_ID, BE_CONTACT_ID, ITEM_DESCRIPTION, NOTES, GROSS_MASS_KG, NET_MASS_KG, QUANTITY, ICS_GAN_CUST_DATA_DETL_ID, AGRIM, E_AD, PAYMENT_DONE, NP_SELLER_ID, BE_SELLER_ID, BE_BUYER_ID, NP_BUYER_ID, CONTINUE_PROCESSING, VERIF_RESULT, NET_MASS_REAL, CN_CODE_REAL)
		VALUES (src.ID, src.ZCP_ID, src.LEGAL_ANNOTATIONS, src.CALC_DATE, src.RELEASE_OF_GOODS_DATE, src.QUANTITY_SUPPL_UNIT, src.CN_CODE, src.CUS_CODE, src.TARIC_CODE, src.ITEM_CODE, src.COUNTRY_OF_ORIGIN, src.COUNTRY_OF_DESTINATION, src.COUNTRY_OF_DESTINATION_REGION, src.COUNTRY_OF_EXPORT, src.MEASURE_NO, src.ITEM_NO, src.PARCEL_REFERENCE_NUMBER, src.DEFFERED_PAYMENT, src.PREFERENCE_CODE, src.ZCP_ITEM_STATUS, src.ARR_STATUS, src.EMCS_STATUS, src.SUSPENSION_OF_RELEASE, src.MEASURE_TYPE_CODE, src.TRANS_RATE_OF_EXCHANGE, src.TRANS_TYPE, src.TRANS_CURRENCY, src.EMCS_CN_CODE, src.EMCS_NET_MASS, src.EMCS_ARC_NO, src.PROCEDURE_CODE, src.PROCEDURE_DETAILS, src.DESCR_OF_IRREGULARITY, src.ICS_ENS_ITEMS_ID, src.NP_SENDER_ID, src.BE_SENDER_ID, src.NP_RECEIVER_ID, src.BE_RECEIVER_ID, src.NP_CONTACT_ID, src.BE_CONTACT_ID, src.ITEM_DESCRIPTION, src.NOTES, src.GROSS_MASS_KG, src.NET_MASS_KG, src.QUANTITY, src.ICS_GAN_CUST_DATA_DETL_ID, src.AGRIM, src.E_AD, src.PAYMENT_DONE, src.NP_SELLER_ID, src.BE_SELLER_ID, src.BE_BUYER_ID, src.NP_BUYER_ID, src.CONTINUE_PROCESSING, src.VERIF_RESULT, src.NET_MASS_REAL, src.CN_CODE_REAL);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_TARIFF_MEASURE' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_TARIFF_MEASURE AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_TARIFF_MEASURE AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.UAM_QUALIFIER=src.UAM_QUALIFIER, tgt.RECORD_NUMBER=src.RECORD_NUMBER, tgt.GEOGRAPHICAL_AREA_CODE=src.GEOGRAPHICAL_AREA_CODE, tgt.SERIES=src.SERIES, tgt.SID=src.SID, tgt.TYPE=src.TYPE, tgt.UAM_CODE=src.UAM_CODE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, UAM_QUALIFIER, RECORD_NUMBER, GEOGRAPHICAL_AREA_CODE, SERIES, SID, TYPE, UAM_CODE)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.UAM_QUALIFIER, src.RECORD_NUMBER, src.GEOGRAPHICAL_AREA_CODE, src.SERIES, src.SID, src.TYPE, src.UAM_CODE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_REQ_DOC' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_REQ_DOC AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_REQ_DOC AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.DOC_CODE=src.DOC_CODE, tgt.DOC_NUMBER=src.DOC_NUMBER, tgt.DOC_NOTES=src.DOC_NOTES
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, DOC_CODE, DOC_NUMBER, DOC_NOTES)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.DOC_CODE, src.DOC_NUMBER, src.DOC_NOTES);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_VALUE_INFO' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_VALUE_INFO AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_VALUE_INFO AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.VALUATION_METHOD=src.VALUATION_METHOD, tgt.STATISTICAL_VALUE=src.STATISTICAL_VALUE, tgt.ITEM_VALUE=src.ITEM_VALUE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, VALUATION_METHOD, STATISTICAL_VALUE, ITEM_VALUE)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.VALUATION_METHOD, src.STATISTICAL_VALUE, src.ITEM_VALUE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_VALUE_DETAILS' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_VALUE_DETAILS AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_VALUE_DETAILS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_VALUE_INFO_ID=src.ZCP_ITEM_VALUE_INFO_ID, tgt.POSITION_ID=src.POSITION_ID, tgt.CODE=src.CODE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_VALUE_INFO_ID, POSITION_ID, CODE)
		VALUES (src.ID, src.ZCP_ITEM_VALUE_INFO_ID, src.POSITION_ID, src.CODE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_OSOZ2_GUARANTEE' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_OSOZ2_GUARANTEE AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_OSOZ2_GUARANTEE AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.AMOUNT=src.AMOUNT, tgt.OPERATION_NO=src.OPERATION_NO, tgt.USE_DATE=src.USE_DATE, tgt.RELIEF_BALANCE=src.RELIEF_BALANCE, tgt.RELIEF_DATE=src.RELIEF_DATE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, AMOUNT, OPERATION_NO, USE_DATE, RELIEF_BALANCE, RELIEF_DATE)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.AMOUNT, src.OPERATION_NO, src.USE_DATE, src.RELIEF_BALANCE, src.RELIEF_DATE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_QUOTA_GRANTED' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_QUOTA_GRANTED AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_QUOTA_GRANTED AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.ISSUED_QUANTITY_UNIT=src.ISSUED_QUANTITY_UNIT, tgt.QUALIFIER_OF_UNIT=src.QUALIFIER_OF_UNIT, tgt.QUOTA_NO=src.QUOTA_NO, tgt.ISSUED_QUOTA_QUANTITY=src.ISSUED_QUOTA_QUANTITY, tgt.STATUS=src.STATUS, tgt.TYPE=src.TYPE, tgt.POS_ID=src.POS_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, ISSUED_QUANTITY_UNIT, QUALIFIER_OF_UNIT, QUOTA_NO, ISSUED_QUOTA_QUANTITY, STATUS, TYPE, POS_ID)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.ISSUED_QUANTITY_UNIT, src.QUALIFIER_OF_UNIT, src.QUOTA_NO, src.ISSUED_QUOTA_QUANTITY, src.STATUS, src.TYPE, src.POS_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_CONTAINER' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_CONTAINER AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_CONTAINER AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.CONTAINER_NUMBER=src.CONTAINER_NUMBER
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, CONTAINER_NUMBER)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.CONTAINER_NUMBER);
        SET @Merged = 1;	
	END
	IF @TableName = 'ICS_ZCP_ITEM_PACK' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_PACK AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_PACK AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.PACK_QUANTITY=src.PACK_QUANTITY, tgt.PACK_NUMBER_SIGN=src.PACK_NUMBER_SIGN, tgt.PACK_TYPE=src.PACK_TYPE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, PACK_QUANTITY, PACK_NUMBER_SIGN, PACK_TYPE)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.PACK_QUANTITY, src.PACK_NUMBER_SIGN, src.PACK_TYPE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_ERROR' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_ERROR AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_ERROR AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.CODE=src.CODE, tgt.MESSAGE=src.MESSAGE, tgt.ORIGIN=src.ORIGIN, tgt.DATE=src.DATE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, CODE, MESSAGE, ORIGIN, DATE)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.CODE, src.MESSAGE, src.ORIGIN, src.DATE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_ADD_INFO' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_ADD_INFO AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_ADD_INFO AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.CODE=src.CODE, tgt.DESCRIPTION=src.DESCRIPTION
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, CODE, DESCRIPTION)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.CODE, src.DESCRIPTION);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_NAT_ADD_CODES' BEGIN
		MERGE INTO aies.ICS_ZCP_NAT_ADD_CODES AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_NAT_ADD_CODES AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.NATIONAL_CODE=src.NATIONAL_CODE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, NATIONAL_CODE)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.NATIONAL_CODE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_PODZ' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_PODZ AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_PODZ AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.MRN=src.MRN, tgt.PODZ_NO=src.PODZ_NO, tgt.PROPRIETARY_PODZ_NO=src.PROPRIETARY_PODZ_NO
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, MRN, PODZ_NO, PROPRIETARY_PODZ_NO)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.MRN, src.PODZ_NO, src.PROPRIETARY_PODZ_NO);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_PAYMENT' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_PAYMENT AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_PAYMENT AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.DEBT_NOTIFICATION_DATE=src.DEBT_NOTIFICATION_DATE, tgt.DEBT_ACQUAINTED_DATE=src.DEBT_ACQUAINTED_DATE, tgt.AMOUNT=src.AMOUNT, tgt.AMOUNT_TO_GUARANTEE=src.AMOUNT_TO_GUARANTEE, tgt.IS_AMOUNT_GUARANTEED=src.IS_AMOUNT_GUARANTEED, tgt.IS_AMOUNT_PAID=src.IS_AMOUNT_PAID, tgt.PAYMENT_METHOD=src.PAYMENT_METHOD, tgt.BASE=src.BASE, tgt.RATE=src.RATE, tgt.TYPE=src.TYPE, tgt.ICS_ZCP_ITEM_PODZ_ID=src.ICS_ZCP_ITEM_PODZ_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, DEBT_NOTIFICATION_DATE, DEBT_ACQUAINTED_DATE, AMOUNT, AMOUNT_TO_GUARANTEE, IS_AMOUNT_GUARANTEED, IS_AMOUNT_PAID, PAYMENT_METHOD, BASE, RATE, TYPE, ICS_ZCP_ITEM_PODZ_ID)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.DEBT_NOTIFICATION_DATE, src.DEBT_ACQUAINTED_DATE, src.AMOUNT, src.AMOUNT_TO_GUARANTEE, src.IS_AMOUNT_GUARANTEED, src.IS_AMOUNT_PAID, src.PAYMENT_METHOD, src.BASE, src.RATE, src.TYPE, src.ICS_ZCP_ITEM_PODZ_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_PREV_DOC' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_PREV_DOC AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_PREV_DOC AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.CATEGORY=src.CATEGORY, tgt.CODE=src.CODE, tgt.PREV_DOC_NO=src.PREV_DOC_NO, tgt.NUMBER=src.NUMBER
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, CATEGORY, CODE, PREV_DOC_NO, NUMBER)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.CATEGORY, src.CODE, src.PREV_DOC_NO, src.NUMBER);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_VEHICLE' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_VEHICLE AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_VEHICLE AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.MAKE=src.MAKE, tgt.BODYWORK_NO=src.BODYWORK_NO, tgt.ENGINE_NO=src.ENGINE_NO, tgt.ENGINE_CAPACITY=src.ENGINE_CAPACITY, tgt.FUEL_TYPE=src.FUEL_TYPE, tgt.PROD_YEAR=src.PROD_YEAR
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, MAKE, BODYWORK_NO, ENGINE_NO, ENGINE_CAPACITY, FUEL_TYPE, PROD_YEAR)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.MAKE, src.BODYWORK_NO, src.ENGINE_NO, src.ENGINE_CAPACITY, src.FUEL_TYPE, src.PROD_YEAR);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_RETROSPECTIVE_REQ' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_RETROSPECTIVE_REQ AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_RETROSPECTIVE_REQ AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.DATE=src.DATE, tgt.LRN=src.LRN, tgt.PREFERENCES=src.PREFERENCES
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, DATE, LRN, PREFERENCES)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.DATE, src.LRN, src.PREFERENCES);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_VALUE_CORRECTION' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_VALUE_CORRECTION AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_VALUE_CORRECTION AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_VALUE_DETAILS_ID=src.ZCP_ITEM_VALUE_DETAILS_ID, tgt.POSITION_ID=src.POSITION_ID, tgt.CODE=src.CODE, tgt.VALUE=src.VALUE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_VALUE_DETAILS_ID, POSITION_ID, CODE, VALUE)
		VALUES (src.ID, src.ZCP_ITEM_VALUE_DETAILS_ID, src.POSITION_ID, src.CODE, src.VALUE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_WDZ' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_WDZ AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_WDZ AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.MRN=src.MRN, tgt.WDZ_NO=src.WDZ_NO, tgt.PROPRIETARY_WDZ_NO=src.PROPRIETARY_WDZ_NO
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, MRN, WDZ_NO, PROPRIETARY_WDZ_NO)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.MRN, src.WDZ_NO, src.PROPRIETARY_WDZ_NO);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_CONTRACT' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_CONTRACT AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_CONTRACT AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.CONTR_DATE=src.CONTR_DATE, tgt.CONTR_NO=src.CONTR_NO
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, CONTR_DATE, CONTR_NO)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.CONTR_DATE, src.CONTR_NO);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_CANCEL_REQUEST' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_CANCEL_REQUEST AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_CANCEL_REQUEST AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.MRN=src.MRN, tgt.ITEM_NO=src.ITEM_NO, tgt.STATE=src.STATE, tgt.REASON=src.REASON
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, MRN, ITEM_NO, STATE, REASON)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.MRN, src.ITEM_NO, src.STATE, src.REASON);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_CUSTOM_DEST' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_CUSTOM_DEST AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_CUSTOM_DEST AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.NAME=src.NAME, tgt.DOCUMENT_NO=src.DOCUMENT_NO, tgt.DATE=src.DATE, tgt.QUANTITY=src.QUANTITY
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, NAME, DOCUMENT_NO, DATE, QUANTITY)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.NAME, src.DOCUMENT_NO, src.DATE, src.QUANTITY);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_TARIC_ADD_CODES' BEGIN
		MERGE INTO aies.ICS_ZCP_TARIC_ADD_CODES AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_TARIC_ADD_CODES AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.TARIC_CODE=src.TARIC_CODE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, TARIC_CODE)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.TARIC_CODE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_TARIC_QUANTITY' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_TARIC_QUANTITY AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_TARIC_QUANTITY AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.UNIT=src.UNIT, tgt.QUALIFIER_OF_UNIT=src.QUALIFIER_OF_UNIT, tgt.QUANTITY=src.QUANTITY
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, UNIT, QUALIFIER_OF_UNIT, QUANTITY)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.UNIT, src.QUALIFIER_OF_UNIT, src.QUANTITY);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_ARR_DATA' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_ARR_DATA AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_ARR_DATA AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.CHK_DATE=src.CHK_DATE, tgt.REQUEST_ID=src.REQUEST_ID, tgt.ADD_QUANTITY=src.ADD_QUANTITY, tgt.QUANTITY_SUPPL_UNIT=src.QUANTITY_SUPPL_UNIT, tgt.PERMISSION_NO=src.PERMISSION_NO, tgt.DISCREPANCY_INFO=src.DISCREPANCY_INFO, tgt.AGRIM_VALID_TO=src.AGRIM_VALID_TO, tgt.ZCP_ITEM_TARIC_QUANTITY_ID=src.ZCP_ITEM_TARIC_QUANTITY_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, CHK_DATE, REQUEST_ID, ADD_QUANTITY, QUANTITY_SUPPL_UNIT, PERMISSION_NO, DISCREPANCY_INFO, AGRIM_VALID_TO, ZCP_ITEM_TARIC_QUANTITY_ID)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.CHK_DATE, src.REQUEST_ID, src.ADD_QUANTITY, src.QUANTITY_SUPPL_UNIT, src.PERMISSION_NO, src.DISCREPANCY_INFO, src.AGRIM_VALID_TO, src.ZCP_ITEM_TARIC_QUANTITY_ID);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_ARR_STATUS' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_ARR_STATUS AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_ARR_STATUS AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ARR_DATA_ID=src.ZCP_ITEM_ARR_DATA_ID, tgt.DATE=src.DATE, tgt.STATE=src.STATE
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ARR_DATA_ID, DATE, STATE)
		VALUES (src.ID, src.ZCP_ITEM_ARR_DATA_ID, src.DATE, src.STATE);
        SET @Merged = 1;
	END
	IF @TableName = 'ICS_ZCP_ITEM_QUOTA' BEGIN
		MERGE INTO aies.ICS_ZCP_ITEM_QUOTA AS tgt
		USING [WI_StageODS].aies.ICS_ZCP_ITEM_QUOTA AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZCP_ITEM_ID=src.ZCP_ITEM_ID, tgt.APPLIED_QUANTITY_UNIT=src.APPLIED_QUANTITY_UNIT, tgt.QUALIFIER_OF_UNIT=src.QUALIFIER_OF_UNIT, tgt.QUOTA_NO=src.QUOTA_NO, tgt.STATUS=src.STATUS, tgt.TYPE=src.TYPE, tgt.APPLIED_QUOTA_QUANTITY=src.APPLIED_QUOTA_QUANTITY, tgt.POS_ID=src.POS_ID, tgt.ZCP_ITEM_QUOTA_DEF_ID=src.ZCP_ITEM_QUOTA_DEF_ID
		WHEN NOT MATCHED
		THEN INSERT (ID, ZCP_ITEM_ID, APPLIED_QUANTITY_UNIT, QUALIFIER_OF_UNIT, QUOTA_NO, STATUS, TYPE, APPLIED_QUOTA_QUANTITY, POS_ID, ZCP_ITEM_QUOTA_DEF_ID)
		VALUES (src.ID, src.ZCP_ITEM_ID, src.APPLIED_QUANTITY_UNIT, src.QUALIFIER_OF_UNIT, src.QUOTA_NO, src.STATUS, src.TYPE, src.APPLIED_QUOTA_QUANTITY, src.POS_ID, src.ZCP_ITEM_QUOTA_DEF_ID);
        SET @Merged = 1;
	END
	/* Kontener ICS_ZCP */









	IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadaj?cego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END

END
;