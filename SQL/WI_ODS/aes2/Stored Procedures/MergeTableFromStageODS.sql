


-- ==============================================
-- Author:		Michał Błędowski
-- Create date: 2015-12-09
-- Description:	Procedura Merge'ująca w schemacie AES2.
-- ===============================================

CREATE PROCEDURE [aes2].[MergeTableFromStageODS] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
		END

	IF @TableName = 'AEO_CERTIFICATE_GROUP' BEGIN
MERGE INTO aes2.AEO_CERTIFICATE_GROUP AS tgt
USING WI_StageODS.aes2.AEO_CERTIFICATE_GROUP AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.QUERY_DATE=src.QUERY_DATE
WHEN NOT MATCHED
THEN INSERT (id, QUERY_DATE)
VALUES (src.id, src.QUERY_DATE);
		
	SET @Merged = 1;
	END


	IF @TableName = 'ariadna_dokument' BEGIN
		MERGE INTO aes2.ariadna_dokument AS tgt
USING WI_StageODS.aes2.ariadna_dokument AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.numer_dokumentu_ZISAR=src.numer_dokumentu_ZISAR, tgt.numer_dokumentu_SO=src.numer_dokumentu_SO, tgt.system_operacyjny=src.system_operacyjny, tgt.rodzaj_dokumentu=src.rodzaj_dokumentu, tgt.nr_typu_komunikatu=src.nr_typu_komunikatu, tgt.wynik_analizy_ryzyka=src.wynik_analizy_ryzyka, tgt.uc_zglaszajacy_do_AAR=src.uc_zglaszajacy_do_AAR, tgt.uc_kontroli_towarow=src.uc_kontroli_towarow
WHEN NOT MATCHED
THEN INSERT (id, numer_dokumentu_ZISAR, numer_dokumentu_SO, system_operacyjny, rodzaj_dokumentu, nr_typu_komunikatu, wynik_analizy_ryzyka, uc_zglaszajacy_do_AAR, uc_kontroli_towarow)
VALUES (src.id, src.numer_dokumentu_ZISAR, src.numer_dokumentu_SO, src.system_operacyjny, src.rodzaj_dokumentu, src.nr_typu_komunikatu, src.wynik_analizy_ryzyka, src.uc_zglaszajacy_do_AAR, src.uc_kontroli_towarow);
		
	SET @Merged = 1;
	END
		

	IF @TableName = 'customs_decl' BEGIN
		MERGE INTO aes2.customs_decl AS tgt
USING WI_StageODS.aes2.customs_decl AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.version=src.version, tgt.return_email=src.return_email, tgt.self_ref=src.self_ref, tgt.ref_no=src.ref_no, tgt.flag=src.flag, tgt.decl_type=src.decl_type, tgt.dts=src.dts, tgt.emergency=src.emergency, tgt.return_post=src.return_post, tgt.phase=src.phase, tgt.aeo=src.aeo, tgt.segmentation=src.segmentation, tgt.trad_com_system = src.trad_com_system
WHEN NOT MATCHED
THEN INSERT (id, version, return_email, self_ref, ref_no, flag, decl_type, dts, emergency, return_post, phase, aeo, segmentation, trad_com_system)
VALUES (src.id, src.version, src.return_email, src.self_ref, src.ref_no, src.flag, src.decl_type, src.dts, src.emergency, src.return_post, src.phase, src.aeo, src.segmentation, src.trad_com_system);
		
	SET @Merged = 1;
	END


	IF @TableName = 'customs_disrepancy' BEGIN
		MERGE INTO aes2.customs_disrepancy AS tgt
USING WI_StageODS.aes2.customs_disrepancy AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.dirt_id=src.dirt_id, tgt.pointer=src.pointer, tgt.was_value=src.was_value, tgt.is_value=src.is_value
WHEN NOT MATCHED
THEN INSERT (id, dirt_id, pointer, was_value, is_value)
VALUES (src.id, src.dirt_id, src.pointer, src.was_value, src.is_value);
		
	SET @Merged = 1;
	END

	IF @TableName = 'customs_message_x' BEGIN
		MERGE INTO aes2.customs_message_x AS tgt
USING WI_StageODS.aes2.customs_message_x AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.doc_id=src.doc_id, tgt.namespace=src.namespace, tgt.xml_name=src.xml_name, tgt.self_ref=src.self_ref, tgt.sender=src.sender, tgt.recipient=src.recipient, tgt.doc_time=src.doc_time, tgt.version=src.version, tgt.mime_type=src.mime_type, tgt.response_to_id=src.response_to_id, tgt.decl_id=src.decl_id, tgt.attachment_to_id=src.attachment_to_id, tgt.description=src.description, tgt.ref_no=src.ref_no, tgt.direction=src.direction
WHEN NOT MATCHED
THEN INSERT (id, doc_id, namespace, xml_name, self_ref, sender, recipient, doc_time, version, mime_type, response_to_id, decl_id, attachment_to_id, description, ref_no, direction)
VALUES (src.id, src.doc_id, src.namespace, src.xml_name, src.self_ref, src.sender, src.recipient, src.doc_time, src.version, src.mime_type, src.response_to_id, src.decl_id, src.attachment_to_id, src.description, src.ref_no, src.direction);
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_country_phase' BEGIN
		MERGE INTO aes2.ecs_country_phase AS tgt
USING WI_StageODS.aes2.ecs_country_phase AS src
ON (tgt.country_code=src.country_code)
WHEN MATCHED
THEN UPDATE SET
tgt.phase=src.phase
WHEN NOT MATCHED
THEN INSERT (country_code, phase)
VALUES (src.country_code, src.phase);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_prev_doc_proc_gosp' BEGIN
		MERGE INTO aes2.ecs_exp_prev_doc_proc_gosp AS tgt
USING WI_StageODS.aes2.ecs_exp_prev_doc_proc_gosp AS src
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
		MERGE INTO aes2.ecs_exp_provisional_document AS tgt
USING WI_StageODS.aes2.ecs_exp_provisional_document AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.ref=src.ref, tgt.type=src.type, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, ref, type, goods_item_id)
VALUES (src.id, src.ref, src.type, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_trs_declco' BEGIN
		MERGE INTO aes2.ecs_trs_declco AS tgt
USING WI_StageODS.aes2.ecs_trs_declco AS src
ON (tgt.ID=src.ID)
WHEN MATCHED
THEN UPDATE SET
tgt.SELF_ID=src.SELF_ID, tgt.DECL_CREATED_DATE=src.DECL_CREATED_DATE, tgt.VERSION=src.VERSION, tgt.STATUS=src.STATUS, tgt.REF_NO=src.REF_NO, tgt.T_DECL_TYPE=src.T_DECL_TYPE
WHEN NOT MATCHED
THEN INSERT (ID, SELF_ID, DECL_CREATED_DATE, VERSION, STATUS, REF_NO, T_DECL_TYPE)
VALUES (src.ID, src.SELF_ID, src.DECL_CREATED_DATE, src.VERSION, src.STATUS, src.REF_NO, src.T_DECL_TYPE);
		
	SET @Merged = 1;
	END

	IF @TableName = 'MESSAGE' BEGIN
		MERGE INTO aes2.MESSAGE AS tgt
USING WI_StageODS.aes2.MESSAGE AS src
ON (tgt.ID=src.ID)
WHEN MATCHED
THEN UPDATE SET
tgt.MESSAGE_CONTENT=src.MESSAGE_CONTENT, tgt.DIRECTION=src.DIRECTION, tgt.UNIQUE_NAME=src.UNIQUE_NAME, tgt.RETRY_COUNTER=src.RETRY_COUNTER, tgt.NEXT_TRY_TIME=src.NEXT_TRY_TIME
WHEN NOT MATCHED
THEN INSERT (ID, MESSAGE_CONTENT, DIRECTION, UNIQUE_NAME, RETRY_COUNTER, NEXT_TRY_TIME)
VALUES (src.ID, src.MESSAGE_CONTENT, src.DIRECTION, src.UNIQUE_NAME, src.RETRY_COUNTER, src.NEXT_TRY_TIME);
		
	SET @Merged = 1;
	END

	IF @TableName = 'MESSAGE_ECS' BEGIN
		MERGE INTO aes2.MESSAGE_ECS AS tgt
USING WI_StageODS.aes2.MESSAGE_ECS AS src
ON (tgt.ID=src.ID)
WHEN MATCHED
THEN UPDATE SET
tgt.MESSAGE_CONTENT=src.MESSAGE_CONTENT, tgt.DIRECTION=src.DIRECTION, tgt.UNIQUE_NAME=src.UNIQUE_NAME, tgt.RETRY_COUNTER=src.RETRY_COUNTER, tgt.NEXT_TRY_TIME=src.NEXT_TRY_TIME
WHEN NOT MATCHED
THEN INSERT (ID, MESSAGE_CONTENT, DIRECTION, UNIQUE_NAME, RETRY_COUNTER, NEXT_TRY_TIME)
VALUES (src.ID, src.MESSAGE_CONTENT, src.DIRECTION, src.UNIQUE_NAME, src.RETRY_COUNTER, src.NEXT_TRY_TIME);
		
	SET @Merged = 1;
	END

	IF @TableName = 'MESSAGE_LOG' BEGIN
		MERGE INTO aes2.MESSAGE_LOG AS tgt
USING WI_StageODS.aes2.MESSAGE_LOG AS src
ON (tgt.ID=src.ID)
WHEN MATCHED
THEN UPDATE SET
tgt.DIRECTION=src.DIRECTION, tgt.MESSSAGE_TYPE=src.MESSSAGE_TYPE, tgt.MRN=src.MRN, tgt.MSG_TIMESTAMP=src.MSG_TIMESTAMP, tgt.NAME=src.NAME
WHEN NOT MATCHED
THEN INSERT (ID, DIRECTION, MESSSAGE_TYPE, MRN, MSG_TIMESTAMP, NAME)
VALUES (src.ID, src.DIRECTION, src.MESSSAGE_TYPE, src.MRN, src.MSG_TIMESTAMP, src.NAME);
		
	SET @Merged = 1;
	END

	IF @TableName = 'MESSAGE_LOG_ECS' BEGIN
		MERGE INTO aes2.MESSAGE_LOG_ECS AS tgt
USING WI_StageODS.aes2.MESSAGE_LOG_ECS AS src
ON (tgt.ID=src.ID)
WHEN MATCHED
THEN UPDATE SET
tgt.DIRECTION=src.DIRECTION, tgt.MESSSAGE_TYPE=src.MESSSAGE_TYPE, tgt.MRN=src.MRN, tgt.MSG_TIMESTAMP=src.MSG_TIMESTAMP, tgt.NAME=src.NAME
WHEN NOT MATCHED
THEN INSERT (ID, DIRECTION, MESSSAGE_TYPE, MRN, MSG_TIMESTAMP, NAME)
VALUES (src.ID, src.DIRECTION, src.MESSSAGE_TYPE, src.MRN, src.MSG_TIMESTAMP, src.NAME);
		
	SET @Merged = 1;
	END

	IF @TableName = 'MESSAGE_METADATA' BEGIN
		MERGE INTO aes2.MESSAGE_METADATA AS tgt
USING WI_StageODS.aes2.MESSAGE_METADATA AS src
ON (tgt.MESSAGE_ID=src.MESSAGE_ID)
WHEN MATCHED
THEN UPDATE SET
tgt.META_VALUE=src.META_VALUE, tgt.META_KEY=src.META_KEY
WHEN NOT MATCHED
THEN INSERT (MESSAGE_ID, META_VALUE, META_KEY)
VALUES (src.MESSAGE_ID, src.META_VALUE, src.META_KEY);
		
	SET @Merged = 1;
	END

	IF @TableName = 'MESSAGE_METADATA_ECS' BEGIN
		MERGE INTO aes2.MESSAGE_METADATA_ECS AS tgt
USING WI_StageODS.aes2.MESSAGE_METADATA_ECS AS src
ON (tgt.MESSAGE_ID=src.MESSAGE_ID)
WHEN MATCHED
THEN UPDATE SET
tgt.META_VALUE=src.META_VALUE, tgt.META_KEY=src.META_KEY
WHEN NOT MATCHED
THEN INSERT (MESSAGE_ID, META_VALUE, META_KEY)
VALUES (src.MESSAGE_ID, src.META_VALUE, src.META_KEY);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ariadna_owk' BEGIN
		MERGE INTO aes2.ariadna_owk AS tgt
		USING WI_StageODS.aes2.ariadna_owk AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.dokument_id=src.dokument_id, tgt.numer_dokumentu_ZISAR=src.numer_dokumentu_ZISAR, tgt.zrodlo=src.zrodlo, tgt.nr_algorytmu=src.nr_algorytmu, tgt.autor=src.autor, tgt.WAR1=src.WAR1, tgt.WAR1_SO=src.WAR1_SO, tgt.WAR24=src.WAR24, tgt.WAR24_SO=src.WAR24_SO, tgt.WAR5_SO=src.WAR5_SO, tgt.Zmiana_WAR_uzasadnienie_SO=src.Zmiana_WAR_uzasadnienie_SO, tgt.obszar_ryzyka=src.obszar_ryzyka, tgt.Zmiana_mk_uz_SO=src.Zmiana_mk_uz_SO, tgt.tresc_dyrektywy=src.tresc_dyrektywy, tgt.informacja_dla_dyspozytora=src.informacja_dla_dyspozytora, tgt.decyzja_dyspozytora_SO=src.decyzja_dyspozytora_SO, tgt.odst_od_kontroli_uz_SO=src.odst_od_kontroli_uz_SO, tgt.adresaci_dyrektywy_SO=src.adresaci_dyrektywy_SO, tgt.zalecenie_dyspozytora_SO=src.zalecenie_dyspozytora_SO, tgt.ddk_UC_wprowadzenia_SO=src.ddk_UC_wprowadzenia_SO, tgt.zakres_przebieg_kontroli_SO=src.zakres_przebieg_kontroli_SO, tgt.wynik_kontroli_SO=src.wynik_kontroli_SO
		WHEN NOT MATCHED
		THEN INSERT (id, dokument_id, numer_dokumentu_ZISAR, zrodlo, nr_algorytmu, autor, WAR1, WAR1_SO, WAR24, WAR24_SO, WAR5_SO, Zmiana_WAR_uzasadnienie_SO, obszar_ryzyka, Zmiana_mk_uz_SO, tresc_dyrektywy, informacja_dla_dyspozytora, decyzja_dyspozytora_SO, odst_od_kontroli_uz_SO, adresaci_dyrektywy_SO, zalecenie_dyspozytora_SO, ddk_UC_wprowadzenia_SO, zakres_przebieg_kontroli_SO, wynik_kontroli_SO)
		VALUES (src.id, src.dokument_id, src.numer_dokumentu_ZISAR, src.zrodlo, src.nr_algorytmu, src.autor, src.WAR1, src.WAR1_SO, src.WAR24, src.WAR24_SO, src.WAR5_SO, src.Zmiana_WAR_uzasadnienie_SO, src.obszar_ryzyka, src.Zmiana_mk_uz_SO, src.tresc_dyrektywy, src.informacja_dla_dyspozytora, src.decyzja_dyspozytora_SO, src.odst_od_kontroli_uz_SO, src.adresaci_dyrektywy_SO, src.zalecenie_dyspozytora_SO, src.ddk_UC_wprowadzenia_SO, src.zakres_przebieg_kontroli_SO, src.wynik_kontroli_SO);		
	SET @Merged = 1;
	END

	IF @TableName = 'customs_directive' BEGIN
		MERGE INTO aes2.customs_directive AS tgt
USING WI_StageODS.aes2.customs_directive AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.addressee=src.addressee, tgt.author=src.author, tgt.dir_for_next_co=src.dir_for_next_co, tgt.dir_dispatcher=src.dir_dispatcher, tgt.information=src.information, tgt.warue=src.warue, tgt.war1=src.war1, tgt.war234=src.war234, tgt.war5=src.war5, tgt.comment=src.comment, tgt.control_method=src.control_method, tgt.mrn=src.mrn, tgt.algorithm_number=src.algorithm_number, tgt.objection_number=src.objection_number, tgt.risk_area=src.risk_area, tgt.samples=src.samples, tgt.profile=src.profile, tgt.status=src.status, tgt.text=src.text, tgt.control_type=src.control_type, tgt.pointer=src.pointer, tgt.result=src.result, tgt.source=src.source, tgt.decl_id=src.decl_id, tgt.item_type=src.item_type, tgt.realisation_date=src.realisation_date, tgt.id_verification_item=src.id_verification_item, tgt.dirtype=src.dirtype, tgt.intro=src.intro, tgt.origin=src.origin, tgt.verification_required=src.verification_required, tgt.MODIFIED_BY=src.MODIFIED_BY, tgt.RISK_ANALYSIS_RESULT=src.RISK_ANALYSIS_RESULT, tgt.RESERVATION_NUMBER=src.RESERVATION_NUMBER, tgt.INFORMATION_FOR_DISPATCHER=src.INFORMATION_FOR_DISPATCHER, tgt.ADD_TEXT=src.ADD_TEXT, tgt.forced_veri=src.forced_veri, tgt.correct_calc_tsk=src.correct_calc_tsk, tgt.zisar_source=src.zisar_source, tgt.zisar_id=src.zisar_id, tgt.ENTITY_ROLE=src.ENTITY_ROLE, tgt.ADDRESSED_TO_CUSTOMS_OFFICE=src.ADDRESSED_TO_CUSTOMS_OFFICE
WHEN NOT MATCHED
THEN INSERT (id, addressee, author, dir_for_next_co, dir_dispatcher, information, warue, war1, war234, war5, comment, control_method, mrn, algorithm_number, objection_number, risk_area, samples, profile, status, text, control_type, pointer, result, source, decl_id, item_type, realisation_date, id_verification_item, dirtype, intro, origin, verification_required, MODIFIED_BY, RISK_ANALYSIS_RESULT, RESERVATION_NUMBER, INFORMATION_FOR_DISPATCHER, ADD_TEXT, forced_veri, correct_calc_tsk, zisar_source, zisar_id, ENTITY_ROLE, ADDRESSED_TO_CUSTOMS_OFFICE)
VALUES (src.id, src.addressee, src.author, src.dir_for_next_co, src.dir_dispatcher, src.information, src.warue, src.war1, src.war234, src.war5, src.comment, src.control_method, src.mrn, src.algorithm_number, src.objection_number, src.risk_area, src.samples, src.profile, src.status, src.text, src.control_type, src.pointer, src.result, src.source, src.decl_id, src.item_type, src.realisation_date, src.id_verification_item, src.dirtype, src.intro, src.origin, src.verification_required, src.MODIFIED_BY, src.RISK_ANALYSIS_RESULT, src.RESERVATION_NUMBER, src.INFORMATION_FOR_DISPATCHER, src.ADD_TEXT, src.forced_veri, src.correct_calc_tsk, src.zisar_source, src.zisar_id, src.ENTITY_ROLE, src.ADDRESSED_TO_CUSTOMS_OFFICE);
		
	SET @Merged = 1;
	END


	IF @TableName = 'customs_message_kanal' BEGIN
MERGE INTO aes2.customs_message_kanal AS tgt
USING WI_StageODS.aes2.customs_message_kanal AS src
ON (tgt.ID=src.ID)
WHEN MATCHED
THEN UPDATE SET
tgt.MESS_ID=src.MESS_ID, tgt.KTYP=src.KTYP, tgt.KCHOISE=src.KCHOISE, tgt.VAL=src.VAL, tgt.VAL_ADD=src.VAL_ADD
WHEN NOT MATCHED
THEN INSERT (ID, MESS_ID, KTYP, KCHOISE, VAL, VAL_ADD)
VALUES (src.ID, src.MESS_ID, src.KTYP, src.KCHOISE, src.VAL, src.VAL_ADD);		
	SET @Merged = 1;
	END


	IF @TableName = 'customs_message' BEGIN
		MERGE INTO aes2.customs_message AS tgt
USING WI_StageODS.aes2.customs_message AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.doc_id=src.doc_id, tgt.namespace=src.namespace, tgt.xml_name=src.xml_name, tgt.self_ref=src.self_ref, tgt.sender=src.sender, tgt.recipient=src.recipient, tgt.doc_time=src.doc_time, tgt.version=src.version, tgt.mime_type=src.mime_type, tgt.response_to_id=src.response_to_id, tgt.decl_id=src.decl_id, tgt.attachment_to_id=src.attachment_to_id, tgt.description=src.description, tgt.ref_no=src.ref_no, tgt.direction=src.direction, tgt.doc_time_diff_mi=src.doc_time_diff_mi, tgt.doc_time_diff_dd=src.doc_time_diff_dd, tgt.app_trans_id=src.app_trans_id, tgt.arrive_id=src.arrive_id, tgt.arrive_date=src.arrive_date, tgt.unhandled=src.unhandled, tgt.entity_id=src.entity_id, tgt.entity_id_agent=src.entity_id_agent, tgt.person_id_seap=src.person_id_seap, tgt.person_id_sisc=src.person_id_sisc, tgt.case_id=src.case_id, tgt.trad_com_system = src.trad_com_system
WHEN NOT MATCHED
THEN INSERT (id, doc_id, namespace, xml_name, self_ref, sender, recipient, doc_time, version, mime_type, response_to_id, decl_id, attachment_to_id, description, ref_no, direction, doc_time_diff_mi, doc_time_diff_dd, app_trans_id, arrive_id, arrive_date, unhandled, entity_id, entity_id_agent, person_id_seap, person_id_sisc, case_id, trad_com_system)
VALUES (src.id, src.doc_id, src.namespace, src.xml_name, src.self_ref, src.sender, src.recipient, src.doc_time, src.version, src.mime_type, src.response_to_id, src.decl_id, src.attachment_to_id, src.description, src.ref_no, src.direction, src.doc_time_diff_mi, src.doc_time_diff_dd, src.app_trans_id, src.arrive_id, src.arrive_date, src.unhandled, src.entity_id, src.entity_id_agent, src.person_id_seap, src.person_id_sisc, src.case_id, src.trad_com_system);
		
	SET @Merged = 1;
	END

	IF @TableName = 'customs_operation' BEGIN
		MERGE INTO aes2.customs_operation AS tgt
USING WI_StageODS.aes2.customs_operation AS src
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
		MERGE INTO aes2.customs_verification_item AS tgt
USING WI_StageODS.aes2.customs_verification_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.author=src.author, tgt.decl_id=src.decl_id, tgt.executor=src.executor, tgt.item_type=src.item_type, tgt.item_number=src.item_number, tgt.status=src.status, tgt.war_code=src.war_code, tgt.war_ue_code=src.war_ue_code, tgt.origin=src.origin, tgt.profile=src.profile, tgt.pointer=src.pointer, tgt.version=src.version
WHEN NOT MATCHED
THEN INSERT (id, author, decl_id, executor, item_type, item_number, status, war_code, war_ue_code, origin, profile, pointer, version)
VALUES (src.id, src.author, src.decl_id, src.executor, src.item_type, src.item_number, src.status, src.war_code, src.war_ue_code, src.origin, src.profile, src.pointer, src.version);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_declcoexport' BEGIN
		MERGE INTO aes2.ecs_exp_declcoexport AS tgt
USING WI_StageODS.aes2.ecs_exp_declcoexport AS src
ON (tgt.decl_id=src.decl_id)
WHEN MATCHED
THEN UPDATE SET
tgt.exp_gross_mass=src.exp_gross_mass, tgt.exp_gross_mass_br_c=src.exp_gross_mass_br_c, tgt.exp_no_of_items_br_c=src.exp_no_of_items_br_c, tgt.crb_code=src.crb_code, tgt.crb_state_of_seals=src.crb_state_of_seals, tgt.pad_place=src.pad_place, tgt.pad_capacity=src.pad_capacity, tgt.pad_phone=src.pad_phone, tgt.pad_name=src.pad_name, tgt.pad_date=src.pad_date, tgt.si_quantity=src.si_quantity, tgt.cr_code=src.cr_code, tgt.lof_co=src.lof_co, tgt.lof_location_desc=src.lof_location_desc, tgt.lof_location_code=src.lof_location_code, tgt.pos_location_desc=src.pos_location_desc, tgt.pos_location_code=src.pos_location_code, tgt.it_identity_br=src.it_identity_br, tgt.it_identity_br_c=src.it_identity_br_c, tgt.it_identity=src.it_identity, tgt.it_mode=src.it_mode, tgt.exp_co_of_exit=src.exp_co_of_exit, tgt.exp_co_of_exit_changed_to=src.exp_co_of_exit_changed_to, tgt.exp_storing=src.exp_storing, tgt.exp_co_of_export=src.exp_co_of_export, tgt.exp_decl_type_1a=src.exp_decl_type_1a, tgt.exp_no_of_items=src.exp_no_of_items, tgt.exp_no_of_items_br=src.exp_no_of_items_br, tgt.exp_no_of_packages=src.exp_no_of_packages, tgt.exp_no_of_packages_br=src.exp_no_of_packages_br, tgt.exp_no_of_packages_br_c=src.exp_no_of_packages_br_c, tgt.exp_country_of_export=src.exp_country_of_export, tgt.exp_country_of_destinatnion=src.exp_country_of_destinatnion, tgt.exp_containers=src.exp_containers, tgt.exp_gross_mass_br=src.exp_gross_mass_br, tgt.exp_acceptance_date=src.exp_acceptance_date, tgt.exp_time_to_border_arrival=src.exp_time_to_border_arrival, tgt.dt_code=src.dt_code, tgt.dt_place=src.dt_place, tgt.dt_place_code=src.dt_place_code, tgt.w_location_code=src.w_location_code, tgt.w_type=src.w_type, tgt.w_country=src.w_country, tgt.tab_country=src.tab_country, tgt.tab_identity=src.tab_identity, tgt.tab_mode=src.tab_mode, tgt.sc_street_and_number=src.sc_street_and_number, tgt.sc_post_code=src.sc_post_code, tgt.sc_city=src.sc_city, tgt.sc_co=src.sc_co, tgt.sc_name=src.sc_name, tgt.sc_country=src.sc_country, tgt.td_amount=src.td_amount, tgt.td_exchange_rate=src.td_exchange_rate, tgt.td_nature_of_transation=src.td_nature_of_transation, tgt.td_currency=src.td_currency, tgt.exp_decl_type_1b=src.exp_decl_type_1b, tgt.exp_crn=src.exp_crn, tgt.exp_un_dangerous_goods=src.exp_un_dangerous_goods, tgt.exp_taxes_amount=src.exp_taxes_amount, tgt.exp_specific_circumstance=src.exp_specific_circumstance, tgt.exp_digital_signature=src.exp_digital_signature, tgt.exp_time_to_release_decision=src.exp_time_to_release_decision, tgt.exp_time_to_exit_results=src.exp_time_to_exit_results, tgt.exp_time_to_send_exp_confirm=src.exp_time_to_send_exp_confirm, tgt.exp_sp=src.exp_sp, tgt.exp_exit_date=src.exp_exit_date, tgt.exp_exit_stopped_date=src.exp_exit_stopped_date, tgt.exp_release_date=src.exp_release_date, tgt.exp_status=src.exp_status, tgt.exp_time_to_auto_acceptance=src.exp_time_to_auto_acceptance, tgt.exp_transport_charges_mp=src.exp_transport_charges_mp, tgt.exp_tran_char_mp_di=src.exp_tran_char_mp_di, tgt.exp_tran_char_mp_di_c=src.exp_tran_char_mp_di_c, tgt.exp_crn_di=src.exp_crn_di, tgt.exp_crn_di_c=src.exp_crn_di_c, tgt.exp_supp_decl_delivery_date=src.exp_supp_decl_delivery_date, tgt.exp_co_of_supplement=src.exp_co_of_supplement, tgt.exp_time_to_delivery_suppl=src.exp_time_to_delivery_suppl, tgt.exp_supplement_decl=src.exp_supplement_decl, tgt.printead=src.printead, tgt.from_emcs=src.from_emcs, tgt.exp_co_of_present=src.exp_co_of_present, tgt.transit=src.transit, tgt.presentation_goods_co=src.presentation_goods_co, tgt.centralised_customs=src.centralised_customs, tgt.crp_code=src.crp_code, tgt.crp_state_of_seals=src.crp_state_of_seals, tgt.transit_over=src.transit_over, tgt.tqsVersion=src.tqsVersion, tgt.reject_to_date=src.reject_to_date, tgt.tqsSent=src.tqsSent
WHEN NOT MATCHED
THEN INSERT (decl_id, exp_gross_mass, exp_gross_mass_br_c, exp_no_of_items_br_c, crb_code, crb_state_of_seals, pad_place, pad_capacity, pad_phone, pad_name, pad_date, si_quantity, cr_code, lof_co, lof_location_desc, lof_location_code, pos_location_desc, pos_location_code, it_identity_br, it_identity_br_c, it_identity, it_mode, exp_co_of_exit, exp_co_of_exit_changed_to, exp_storing, exp_co_of_export, exp_decl_type_1a, exp_no_of_items, exp_no_of_items_br, exp_no_of_packages, exp_no_of_packages_br, exp_no_of_packages_br_c, exp_country_of_export, exp_country_of_destinatnion, exp_containers, exp_gross_mass_br, exp_acceptance_date, exp_time_to_border_arrival, dt_code, dt_place, dt_place_code, w_location_code, w_type, w_country, tab_country, tab_identity, tab_mode, sc_street_and_number, sc_post_code, sc_city, sc_co, sc_name, sc_country, td_amount, td_exchange_rate, td_nature_of_transation, td_currency, exp_decl_type_1b, exp_crn, exp_un_dangerous_goods, exp_taxes_amount, exp_specific_circumstance, exp_digital_signature, exp_time_to_release_decision, exp_time_to_exit_results, exp_time_to_send_exp_confirm, exp_sp, exp_exit_date, exp_exit_stopped_date, exp_release_date, exp_status, exp_time_to_auto_acceptance, exp_transport_charges_mp, exp_tran_char_mp_di, exp_tran_char_mp_di_c, exp_crn_di, exp_crn_di_c, exp_supp_decl_delivery_date, exp_co_of_supplement, exp_time_to_delivery_suppl, exp_supplement_decl, printead, from_emcs, exp_co_of_present, transit, presentation_goods_co, centralised_customs, crp_code, crp_state_of_seals, transit_over, tqsVersion, reject_to_date, tqsSent)
VALUES (src.decl_id, src.exp_gross_mass, src.exp_gross_mass_br_c, src.exp_no_of_items_br_c, src.crb_code, src.crb_state_of_seals, src.pad_place, src.pad_capacity, src.pad_phone, src.pad_name, src.pad_date, src.si_quantity, src.cr_code, src.lof_co, src.lof_location_desc, src.lof_location_code, src.pos_location_desc, src.pos_location_code, src.it_identity_br, src.it_identity_br_c, src.it_identity, src.it_mode, src.exp_co_of_exit, src.exp_co_of_exit_changed_to, src.exp_storing, src.exp_co_of_export, src.exp_decl_type_1a, src.exp_no_of_items, src.exp_no_of_items_br, src.exp_no_of_packages, src.exp_no_of_packages_br, src.exp_no_of_packages_br_c, src.exp_country_of_export, src.exp_country_of_destinatnion, src.exp_containers, src.exp_gross_mass_br, src.exp_acceptance_date, src.exp_time_to_border_arrival, src.dt_code, src.dt_place, src.dt_place_code, src.w_location_code, src.w_type, src.w_country, src.tab_country, src.tab_identity, src.tab_mode, src.sc_street_and_number, src.sc_post_code, src.sc_city, src.sc_co, src.sc_name, src.sc_country, src.td_amount, src.td_exchange_rate, src.td_nature_of_transation, src.td_currency, src.exp_decl_type_1b, src.exp_crn, src.exp_un_dangerous_goods, src.exp_taxes_amount, src.exp_specific_circumstance, src.exp_digital_signature, src.exp_time_to_release_decision, src.exp_time_to_exit_results, src.exp_time_to_send_exp_confirm, src.exp_sp, src.exp_exit_date, src.exp_exit_stopped_date, src.exp_release_date, src.exp_status, src.exp_time_to_auto_acceptance, src.exp_transport_charges_mp, src.exp_tran_char_mp_di, src.exp_tran_char_mp_di_c, src.exp_crn_di, src.exp_crn_di_c, src.exp_supp_decl_delivery_date, src.exp_co_of_supplement, src.exp_time_to_delivery_suppl, src.exp_supplement_decl, src.printead, src.from_emcs, src.exp_co_of_present, src.transit, src.presentation_goods_co, src.centralised_customs, src.crp_code, src.crp_state_of_seals, src.transit_over, src.tqsVersion, src.reject_to_date, src.tqsSent);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_declcoexit' BEGIN
		MERGE INTO aes2.ecs_ext_declcoexit AS tgt
USING WI_StageODS.aes2.ecs_ext_declcoexit AS src
ON (tgt.decl_id=src.decl_id)
WHEN MATCHED
THEN UPDATE SET
tgt.ext_gross_mass=src.ext_gross_mass, tgt.ext_gross_mass_br_c=src.ext_gross_mass_br_c, tgt.ext_no_of_items_br_c=src.ext_no_of_items_br_c, tgt.crb_code=src.crb_code, tgt.crb_state_of_seals=src.crb_state_of_seals, tgt.pad_place=src.pad_place, tgt.pad_date=src.pad_date, tgt.s_quantity=src.s_quantity, tgt.cr_code=src.cr_code, tgt.log_co=src.log_co, tgt.log_location_desc=src.log_location_desc, tgt.log_location_code=src.log_location_code, tgt.pos_location_desc=src.pos_location_desc, tgt.pos_location_code=src.pos_location_code, tgt.it_identity_br=src.it_identity_br, tgt.it_identity_br_c=src.it_identity_br_c, tgt.it_identity=src.it_identity, tgt.ext_ecs_decl=src.ext_ecs_decl, tgt.ext_co_of_exit=src.ext_co_of_exit, tgt.ext_co_of_exit_declared=src.ext_co_of_exit_declared, tgt.ext_co_of_exit_changed_to=src.ext_co_of_exit_changed_to, tgt.ext_storing=src.ext_storing, tgt.ext_co_of_export=src.ext_co_of_export, tgt.ext_decl_type_1a=src.ext_decl_type_1a, tgt.ext_no_of_items=src.ext_no_of_items, tgt.ext_no_of_items_br=src.ext_no_of_items_br, tgt.ext_no_of_package=src.ext_no_of_package, tgt.ext_no_of_packages_br=src.ext_no_of_packages_br, tgt.ext_no_of_packages_br_c=src.ext_no_of_packages_br_c, tgt.ext_country_of_export=src.ext_country_of_export, tgt.ext_country_of_dest=src.ext_country_of_dest, tgt.ext_containers=src.ext_containers, tgt.ext_gross_mass_br=src.ext_gross_mass_br, tgt.ext_acceptance_date=src.ext_acceptance_date, tgt.ext_issuing_date=src.ext_issuing_date, tgt.ext_ead_language=src.ext_ead_language, tgt.ext_time_to_send_exit_result=src.ext_time_to_send_exit_result, tgt.ext_time_to_border_arrival=src.ext_time_to_border_arrival, tgt.ext_presentation_date=src.ext_presentation_date, tgt.ext_notification_date=src.ext_notification_date, tgt.ext_status=src.ext_status, tgt.ext_exit_date=src.ext_exit_date, tgt.ext_exit_stopped_date=src.ext_exit_stopped_date, tgt.ext_com_ref_num=src.ext_com_ref_num, tgt.ext_com_ref_num_di=src.ext_com_ref_num_di, tgt.ext_com_ref_num_di_c=src.ext_com_ref_num_di_c, tgt.ext_dec_sub_tim=src.ext_dec_sub_tim, tgt.ext_tra_cha_met=src.ext_tra_cha_met, tgt.ext_tra_cha_met_di=src.ext_tra_cha_met_di, tgt.ext_tra_cha_met_di_c=src.ext_tra_cha_met_di_c, tgt.ext_spe_cir_ind=src.ext_spe_cir_ind, tgt.pad_realDate=src.pad_realDate, tgt.crb_code_before_transit=src.crb_code_before_transit, tgt.transit=src.transit, tgt.transit_over=src.transit_over
WHEN NOT MATCHED
THEN INSERT (decl_id, ext_gross_mass, ext_gross_mass_br_c, ext_no_of_items_br_c, crb_code, crb_state_of_seals, pad_place, pad_date, s_quantity, cr_code, log_co, log_location_desc, log_location_code, pos_location_desc, pos_location_code, it_identity_br, it_identity_br_c, it_identity, ext_ecs_decl, ext_co_of_exit, ext_co_of_exit_declared, ext_co_of_exit_changed_to, ext_storing, ext_co_of_export, ext_decl_type_1a, ext_no_of_items, ext_no_of_items_br, ext_no_of_package, ext_no_of_packages_br, ext_no_of_packages_br_c, ext_country_of_export, ext_country_of_dest, ext_containers, ext_gross_mass_br, ext_acceptance_date, ext_issuing_date, ext_ead_language, ext_time_to_send_exit_result, ext_time_to_border_arrival, ext_presentation_date, ext_notification_date, ext_status, ext_exit_date, ext_exit_stopped_date, ext_com_ref_num, ext_com_ref_num_di, ext_com_ref_num_di_c, ext_dec_sub_tim, ext_tra_cha_met, ext_tra_cha_met_di, ext_tra_cha_met_di_c, ext_spe_cir_ind, pad_realDate, crb_code_before_transit, transit, transit_over)
VALUES (src.decl_id, src.ext_gross_mass, src.ext_gross_mass_br_c, src.ext_no_of_items_br_c, src.crb_code, src.crb_state_of_seals, src.pad_place, src.pad_date, src.s_quantity, src.cr_code, src.log_co, src.log_location_desc, src.log_location_code, src.pos_location_desc, src.pos_location_code, src.it_identity_br, src.it_identity_br_c, src.it_identity, src.ext_ecs_decl, src.ext_co_of_exit, src.ext_co_of_exit_declared, src.ext_co_of_exit_changed_to, src.ext_storing, src.ext_co_of_export, src.ext_decl_type_1a, src.ext_no_of_items, src.ext_no_of_items_br, src.ext_no_of_package, src.ext_no_of_packages_br, src.ext_no_of_packages_br_c, src.ext_country_of_export, src.ext_country_of_dest, src.ext_containers, src.ext_gross_mass_br, src.ext_acceptance_date, src.ext_issuing_date, src.ext_ead_language, src.ext_time_to_send_exit_result, src.ext_time_to_border_arrival, src.ext_presentation_date, src.ext_notification_date, src.ext_status, src.ext_exit_date, src.ext_exit_stopped_date, src.ext_com_ref_num, src.ext_com_ref_num_di, src.ext_com_ref_num_di_c, src.ext_dec_sub_tim, src.ext_tra_cha_met, src.ext_tra_cha_met_di, src.ext_tra_cha_met_di_c, src.ext_spe_cir_ind, src.pad_realDate, src.crb_code_before_transit, src.transit, src.transit_over);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_los_declcoexit' BEGIN
		MERGE INTO aes2.ecs_los_declcoexit AS tgt
USING WI_StageODS.aes2.ecs_los_declcoexit AS src
ON (tgt.decl_id=src.decl_id)
WHEN MATCHED
THEN UPDATE SET
tgt.exp_acceptance_date=src.exp_acceptance_date, tgt.exp_exit_agreementDate=src.exp_exit_agreementDate, tgt.exp_co_of_exit=src.exp_co_of_exit, tgt.los_co_of_lodg=src.los_co_of_lodg, tgt.crn=src.crn, tgt.exp_digital_signature=src.exp_digital_signature, tgt.gross_mass=src.gross_mass, tgt.exp_no_of_items=src.exp_no_of_items, tgt.exp_no_of_packages=src.exp_no_of_packages, tgt.peculiar_circumstances=src.peculiar_circumstances, tgt.pad_date=src.pad_date, tgt.pad_phone=src.pad_phone, tgt.pad_place=src.pad_place, tgt.exp_status=src.exp_status, tgt.transport_fee_pay_type=src.transport_fee_pay_type, tgt.exp_agreement_date=src.exp_agreement_date, tgt.log_co=src.log_co, tgt.log_location_desc=src.log_location_desc, tgt.log_location_code=src.log_location_code
WHEN NOT MATCHED
THEN INSERT (exp_acceptance_date, exp_exit_agreementDate, exp_co_of_exit, los_co_of_lodg, crn, exp_digital_signature, gross_mass, exp_no_of_items, exp_no_of_packages, peculiar_circumstances, pad_date, pad_phone, pad_place, exp_status, transport_fee_pay_type, decl_id, exp_agreement_date, log_co, log_location_desc, log_location_code)
VALUES (src.exp_acceptance_date, src.exp_exit_agreementDate, src.exp_co_of_exit, src.los_co_of_lodg, src.crn, src.exp_digital_signature, src.gross_mass, src.exp_no_of_items, src.exp_no_of_packages, src.peculiar_circumstances, src.pad_date, src.pad_phone, src.pad_place, src.exp_status, src.transport_fee_pay_type, src.decl_id, src.exp_agreement_date, src.log_co, src.log_location_desc, src.log_location_code);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_mft_manifest' BEGIN
		MERGE INTO aes2.ecs_mft_manifest AS tgt
USING WI_StageODS.aes2.ecs_mft_manifest AS src
ON (tgt.decl_id=src.decl_id)
WHEN MATCHED
THEN UPDATE SET
tgt.mf_gross_mass=src.mf_gross_mass, tgt.cr_code=src.cr_code, tgt.mf_co_of_exit=src.mf_co_of_exit, tgt.mf_no_of_items=src.mf_no_of_items, tgt.mf_no_of_packages=src.mf_no_of_packages, tgt.mf_date_of_presentation=src.mf_date_of_presentation, tgt.mf_status=src.mf_status, tgt.pad_place=src.pad_place, tgt.pad_date=src.pad_date, tgt.mf_acceptance_date=src.mf_acceptance_date
WHEN NOT MATCHED
THEN INSERT (decl_id, mf_gross_mass, cr_code, mf_co_of_exit, mf_no_of_items, mf_no_of_packages, mf_date_of_presentation, mf_status, pad_place, pad_date, mf_acceptance_date)
VALUES (src.decl_id, src.mf_gross_mass, src.cr_code, src.mf_co_of_exit, src.mf_no_of_items, src.mf_no_of_packages, src.mf_date_of_presentation, src.mf_status, src.pad_place, src.pad_date, src.mf_acceptance_date);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_declcoexpsuppl' BEGIN
		MERGE INTO aes2.ecs_spp_declcoexpsuppl AS tgt
USING WI_StageODS.aes2.ecs_spp_declcoexpsuppl AS src
ON (tgt.decl_id=src.decl_id)
WHEN MATCHED
THEN UPDATE SET
tgt.spp_co_of_exit=src.spp_co_of_exit, tgt.spp_co_of_exit_spp=src.spp_co_of_exit_spp, tgt.spp_co_of_export=src.spp_co_of_export, tgt.spp_co_of_export_spp=src.spp_co_of_export_spp, tgt.spp_co_of_suppl=src.spp_co_of_suppl, tgt.spp_co_of_suppl_spp=src.spp_co_of_suppl_spp, tgt.spp_containers=src.spp_containers, tgt.spp_containers_spp=src.spp_containers_spp, tgt.spp_country_of_dest=src.spp_country_of_dest, tgt.spp_country_of_dest_spp=src.spp_country_of_dest_spp, tgt.spp_country_of_export=src.spp_country_of_export, tgt.spp_country_of_export_spp=src.spp_country_of_export_spp, tgt.spp_crn=src.spp_crn, tgt.spp_crn_spp=src.spp_crn_spp, tgt.spp_decl_type_1a=src.spp_decl_type_1a, tgt.spp_decl_type_1b=src.spp_decl_type_1b, tgt.dt_code=src.dt_code, tgt.dt_code_spp=src.dt_code_spp, tgt.dt_place=src.dt_place, tgt.dt_place_code=src.dt_place_code, tgt.dt_place_code_spp=src.dt_place_code_spp, tgt.spp_digital_signature=src.spp_digital_signature, tgt.spp_gross_mass=src.spp_gross_mass, tgt.spp_gross_mass_spp=src.spp_gross_mass_spp, tgt.it_identity=src.it_identity, tgt.it_identity_spp=src.it_identity_spp, tgt.it_mode=src.it_mode, tgt.it_mode_spp=src.it_mode_spp, tgt.lof_co=src.lof_co, tgt.lof_co_spp=src.lof_co_spp, tgt.lof_location_code=src.lof_location_code, tgt.lof_location_code_spp=src.lof_location_code_spp, tgt.lof_location_desc=src.lof_location_desc, tgt.spp_no_of_items=src.spp_no_of_items, tgt.spp_no_of_items_spp=src.spp_no_of_items_spp, tgt.spp_no_of_packages=src.spp_no_of_packages, tgt.spp_no_of_packages_spp=src.spp_no_of_packages_spp, tgt.pad_capacity=src.pad_capacity, tgt.pad_date=src.pad_date, tgt.pad_name=src.pad_name, tgt.pad_phone=src.pad_phone, tgt.pad_place=src.pad_place, tgt.pos_location_code=src.pos_location_code, tgt.pos_location_code_spp=src.pos_location_code_spp, tgt.pos_location_desc=src.pos_location_desc, tgt.si_quantity=src.si_quantity, tgt.si_quantity_spp=src.si_quantity_spp, tgt.spp_specific_circumstance=src.spp_specific_circumstance, tgt.spp_specific_circumstance_spp=src.spp_specific_circumstance_spp, tgt.exp_status=src.exp_status, tgt.spp_storing=src.spp_storing, tgt.spp_storing_spp=src.spp_storing_spp, tgt.exp_taxes_amount=src.exp_taxes_amount, tgt.spp_taxes_amount_spp=src.spp_taxes_amount_spp, tgt.td_amount=src.td_amount, tgt.td_amount_spp=src.td_amount_spp, tgt.td_currency=src.td_currency, tgt.td_currency_spp=src.td_currency_spp, tgt.td_exchange_rate=src.td_exchange_rate, tgt.td_exchange_rate_spp=src.td_exchange_rate_spp, tgt.td_nature_of_transation=src.td_nature_of_transation, tgt.td_nature_of_transation_spp=src.td_nature_of_transation_spp, tgt.tab_country=src.tab_country, tgt.tab_country_spp=src.tab_country_spp, tgt.tab_identity=src.tab_identity, tgt.tab_identity_spp=src.tab_identity_spp, tgt.tab_mode=src.tab_mode, tgt.tab_mode_spp=src.tab_mode_spp, tgt.spp_transport_charges_mp=src.spp_transport_charges_mp, tgt.spp_transport_charges_mp_spp=src.spp_transport_charges_mp_spp, tgt.spp_un_dangerous_goods=src.spp_un_dangerous_goods, tgt.spp_un_dangerous_goods_spp=src.spp_un_dangerous_goods_spp, tgt.w_country=src.w_country, tgt.w_country_spp=src.w_country_spp, tgt.w_location_code=src.w_location_code, tgt.w_location_code_spp=src.w_location_code_spp, tgt.w_type=src.w_type, tgt.w_type_spp=src.w_type_spp, tgt.spp_link_date=src.spp_link_date, tgt.spp_co_of_fold=src.spp_co_of_fold
WHEN NOT MATCHED
THEN INSERT (spp_co_of_exit, spp_co_of_exit_spp, spp_co_of_export, spp_co_of_export_spp, spp_co_of_suppl, spp_co_of_suppl_spp, spp_containers, spp_containers_spp, spp_country_of_dest, spp_country_of_dest_spp, spp_country_of_export, spp_country_of_export_spp, spp_crn, spp_crn_spp, spp_decl_type_1a, spp_decl_type_1b, dt_code, dt_code_spp, dt_place, dt_place_code, dt_place_code_spp, spp_digital_signature, spp_gross_mass, spp_gross_mass_spp, it_identity, it_identity_spp, it_mode, it_mode_spp, lof_co, lof_co_spp, lof_location_code, lof_location_code_spp, lof_location_desc, spp_no_of_items, spp_no_of_items_spp, spp_no_of_packages, spp_no_of_packages_spp, pad_capacity, pad_date, pad_name, pad_phone, pad_place, pos_location_code, pos_location_code_spp, pos_location_desc, si_quantity, si_quantity_spp, spp_specific_circumstance, spp_specific_circumstance_spp, exp_status, spp_storing, spp_storing_spp, exp_taxes_amount, spp_taxes_amount_spp, td_amount, td_amount_spp, td_currency, td_currency_spp, td_exchange_rate, td_exchange_rate_spp, td_nature_of_transation, td_nature_of_transation_spp, tab_country, tab_country_spp, tab_identity, tab_identity_spp, tab_mode, tab_mode_spp, spp_transport_charges_mp, spp_transport_charges_mp_spp, spp_un_dangerous_goods, spp_un_dangerous_goods_spp, w_country, w_country_spp, w_location_code, w_location_code_spp, w_type, w_type_spp, decl_id, spp_link_date, spp_co_of_fold)
VALUES (src.spp_co_of_exit, src.spp_co_of_exit_spp, src.spp_co_of_export, src.spp_co_of_export_spp, src.spp_co_of_suppl, src.spp_co_of_suppl_spp, src.spp_containers, src.spp_containers_spp, src.spp_country_of_dest, src.spp_country_of_dest_spp, src.spp_country_of_export, src.spp_country_of_export_spp, src.spp_crn, src.spp_crn_spp, src.spp_decl_type_1a, src.spp_decl_type_1b, src.dt_code, src.dt_code_spp, src.dt_place, src.dt_place_code, src.dt_place_code_spp, src.spp_digital_signature, src.spp_gross_mass, src.spp_gross_mass_spp, src.it_identity, src.it_identity_spp, src.it_mode, src.it_mode_spp, src.lof_co, src.lof_co_spp, src.lof_location_code, src.lof_location_code_spp, src.lof_location_desc, src.spp_no_of_items, src.spp_no_of_items_spp, src.spp_no_of_packages, src.spp_no_of_packages_spp, src.pad_capacity, src.pad_date, src.pad_name, src.pad_phone, src.pad_place, src.pos_location_code, src.pos_location_code_spp, src.pos_location_desc, src.si_quantity, src.si_quantity_spp, src.spp_specific_circumstance, src.spp_specific_circumstance_spp, src.exp_status, src.spp_storing, src.spp_storing_spp, src.exp_taxes_amount, src.spp_taxes_amount_spp, src.td_amount, src.td_amount_spp, src.td_currency, src.td_currency_spp, src.td_exchange_rate, src.td_exchange_rate_spp, src.td_nature_of_transation, src.td_nature_of_transation_spp, src.tab_country, src.tab_country_spp, src.tab_identity, src.tab_identity_spp, src.tab_mode, src.tab_mode_spp, src.spp_transport_charges_mp, src.spp_transport_charges_mp_spp, src.spp_un_dangerous_goods, src.spp_un_dangerous_goods_spp, src.w_country, src.w_country_spp, src.w_location_code, src.w_location_code_spp, src.w_type, src.w_type_spp, src.decl_id, src.spp_link_date, src.spp_co_of_fold);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_declcoexit' BEGIN
		MERGE INTO aes2.ecs_sum_declcoexit AS tgt
USING WI_StageODS.aes2.ecs_sum_declcoexit AS src
ON (tgt.decl_id=src.decl_id)
WHEN MATCHED
THEN UPDATE SET
tgt.pad_place=src.pad_place, tgt.pad_phone=src.pad_phone, tgt.pad_date=src.pad_date, tgt.exp_no_of_items=src.exp_no_of_items, tgt.exp_co_of_exit=src.exp_co_of_exit, tgt.exp_no_of_packages=src.exp_no_of_packages, tgt.gross_mass=src.gross_mass, tgt.cr_code=src.cr_code, tgt.exp_acceptance_date=src.exp_acceptance_date, tgt.crn=src.crn, tgt.gross_mass_br=src.gross_mass_br, tgt.log_co=src.log_co, tgt.log_location_desc=src.log_location_desc, tgt.log_location_code=src.log_location_code, tgt.exp_co_of_exit_chto=src.exp_co_of_exit_chto, tgt.exp_no_of_items_br=src.exp_no_of_items_br, tgt.exp_no_of_items_brc=src.exp_no_of_items_brc, tgt.exp_no_of_packages_br=src.exp_no_of_packages_br, tgt.exp_no_of_packages_brc=src.exp_no_of_packages_brc, tgt.gross_mass_brc=src.gross_mass_brc, tgt.exp_storing=src.exp_storing, tgt.exp_digital_signature=src.exp_digital_signature, tgt.exp_time_to_release_decision=src.exp_time_to_release_decision, tgt.exp_time_to_auto_acceptance=src.exp_time_to_auto_acceptance, tgt.exp_exit_date=src.exp_exit_date, tgt.exp_exit_stopped_date=src.exp_exit_stopped_date, tgt.exp_release_date=src.exp_release_date, tgt.pres_date=src.pres_date, tgt.transport_fee_pay_type=src.transport_fee_pay_type, tgt.exp_co_of_trader=src.exp_co_of_trader, tgt.sum_co_of_lodg=src.sum_co_of_lodg, tgt.peculiar_circumstances=src.peculiar_circumstances, tgt.exp_exit_agreementDate=src.exp_exit_agreementDate, tgt.regi_date=src.regi_date, tgt.exp_status=src.exp_status, tgt.exp_notification_date=src.exp_notification_date
WHEN NOT MATCHED
THEN INSERT (decl_id, pad_place, pad_phone, pad_date, exp_no_of_items, exp_co_of_exit, exp_no_of_packages, gross_mass, cr_code, exp_acceptance_date, crn, gross_mass_br, log_co, log_location_desc, log_location_code, exp_co_of_exit_chto, exp_no_of_items_br, exp_no_of_items_brc, exp_no_of_packages_br, exp_no_of_packages_brc, gross_mass_brc, exp_storing, exp_digital_signature, exp_time_to_release_decision, exp_time_to_auto_acceptance, exp_exit_date, exp_exit_stopped_date, exp_release_date, pres_date, transport_fee_pay_type, exp_co_of_trader, sum_co_of_lodg, peculiar_circumstances, exp_exit_agreementDate, regi_date, exp_status, exp_notification_date)
VALUES (src.decl_id, src.pad_place, src.pad_phone, src.pad_date, src.exp_no_of_items, src.exp_co_of_exit, src.exp_no_of_packages, src.gross_mass, src.cr_code, src.exp_acceptance_date, src.crn, src.gross_mass_br, src.log_co, src.log_location_desc, src.log_location_code, src.exp_co_of_exit_chto, src.exp_no_of_items_br, src.exp_no_of_items_brc, src.exp_no_of_packages_br, src.exp_no_of_packages_brc, src.gross_mass_brc, src.exp_storing, src.exp_digital_signature, src.exp_time_to_release_decision, src.exp_time_to_auto_acceptance, src.exp_exit_date, src.exp_exit_stopped_date, src.exp_release_date, src.pres_date, src.transport_fee_pay_type, src.exp_co_of_trader, src.sum_co_of_lodg, src.peculiar_circumstances, src.exp_exit_agreementDate, src.regi_date, src.exp_status, src.exp_notification_date);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_trs_goods_item' BEGIN
		MERGE INTO aes2.ecs_trs_goods_item AS tgt
USING WI_StageODS.aes2.ecs_trs_goods_item AS src
ON (tgt.ID=src.ID)
WHEN MATCHED
THEN UPDATE SET
tgt.DECL_ID=src.DECL_ID, tgt.POSID=src.POSID, tgt.DEKL_TYPE=src.DEKL_TYPE, tgt.COUNTRY_ORIGIN=src.COUNTRY_ORIGIN, tgt.COUNTRY_DESTINATION=src.COUNTRY_DESTINATION, tgt.DESCRIPTION=src.DESCRIPTION, tgt.MASS_NETTO=src.MASS_NETTO, tgt.MASS_GROSS=src.MASS_GROSS, tgt.GOODS_CODE=src.GOODS_CODE, tgt.VERSION=src.VERSION, tgt.EXPORT_MRN=src.EXPORT_MRN
WHEN NOT MATCHED
THEN INSERT (ID, DECL_ID, POSID, DEKL_TYPE, COUNTRY_ORIGIN, COUNTRY_DESTINATION, DESCRIPTION, MASS_NETTO, MASS_GROSS, GOODS_CODE, VERSION, EXPORT_MRN)
VALUES (src.ID, src.DECL_ID, src.POSID, src.DEKL_TYPE, src.COUNTRY_ORIGIN, src.COUNTRY_DESTINATION, src.DESCRIPTION, src.MASS_NETTO, src.MASS_GROSS, src.GOODS_CODE, src.VERSION, src.EXPORT_MRN);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_zwp_declcopresent' BEGIN
	MERGE INTO aes2.ecs_zwp_declcopresent AS tgt
USING WI_StageODS.aes2.ecs_zwp_declcopresent AS src
ON (tgt.decl_id=src.decl_id)
WHEN MATCHED
THEN UPDATE SET
tgt.zwp_gross_mass=src.zwp_gross_mass, tgt.zwp_gross_mass_pt_c=src.zwp_gross_mass_pt_c, tgt.zwp_no_of_items_pt_c=src.zwp_no_of_items_pt_c, tgt.crb_code=src.crb_code, tgt.crb_state_of_seals=src.crb_state_of_seals, tgt.pad_place=src.pad_place, tgt.pad_date=src.pad_date, tgt.s_quantity=src.s_quantity, tgt.cr_code=src.cr_code, tgt.log_co=src.log_co, tgt.log_location_desc=src.log_location_desc, tgt.log_location_code=src.log_location_code, tgt.pos_location_desc=src.pos_location_desc, tgt.pos_location_code=src.pos_location_code, tgt.it_identity_pt=src.it_identity_pt, tgt.it_identity_pt_c=src.it_identity_pt_c, tgt.it_identity=src.it_identity, tgt.zwp_ecs_decl=src.zwp_ecs_decl, tgt.zwp_co_of_exit=src.zwp_co_of_exit, tgt.zwp_co_of_exit_declared=src.zwp_co_of_exit_declared, tgt.zwp_co_of_exit_changed_to=src.zwp_co_of_exit_changed_to, tgt.zwp_storing=src.zwp_storing, tgt.zwp_co_of_export=src.zwp_co_of_export, tgt.zwp_decl_type_1a=src.zwp_decl_type_1a, tgt.zwp_no_of_items=src.zwp_no_of_items, tgt.zwp_no_of_items_pt=src.zwp_no_of_items_pt, tgt.zwp_no_of_package=src.zwp_no_of_package, tgt.zwp_no_of_packages_pt=src.zwp_no_of_packages_pt, tgt.zwp_no_of_packages_pt_c=src.zwp_no_of_packages_pt_c, tgt.zwp_country_of_export=src.zwp_country_of_export, tgt.zwp_country_of_dest=src.zwp_country_of_dest, tgt.zwp_containers=src.zwp_containers, tgt.zwp_gross_mass_pt=src.zwp_gross_mass_pt, tgt.zwp_acceptance_date=src.zwp_acceptance_date, tgt.zwp_issuing_date=src.zwp_issuing_date, tgt.zwp_ead_language=src.zwp_ead_language, tgt.zwp_time_to_send_exit_result=src.zwp_time_to_send_exit_result, tgt.zwp_time_to_border_arrival=src.zwp_time_to_border_arrival, tgt.zwp_presentation_date=src.zwp_presentation_date, tgt.zwp_notification_date=src.zwp_notification_date, tgt.zwp_status=src.zwp_status, tgt.zwp_exit_date=src.zwp_exit_date, tgt.zwp_present_stopped_date=src.zwp_present_stopped_date, tgt.zwp_com_ref_num=src.zwp_com_ref_num, tgt.zwp_com_ref_num_di=src.zwp_com_ref_num_di, tgt.zwp_com_ref_num_di_c=src.zwp_com_ref_num_di_c, tgt.zwp_dec_sub_tim=src.zwp_dec_sub_tim, tgt.zwp_tra_cha_met=src.zwp_tra_cha_met, tgt.zwp_tra_cha_met_di=src.zwp_tra_cha_met_di, tgt.zwp_tra_cha_met_di_c=src.zwp_tra_cha_met_di_c, tgt.zwp_spe_cir_ind=src.zwp_spe_cir_ind, tgt.pad_realDate=src.pad_realDate, tgt.crb_code_before_transit=src.crb_code_before_transit, tgt.transit=src.transit
WHEN NOT MATCHED
THEN INSERT (decl_id, zwp_gross_mass, zwp_gross_mass_pt_c, zwp_no_of_items_pt_c, crb_code, crb_state_of_seals, pad_place, pad_date, s_quantity, cr_code, log_co, log_location_desc, log_location_code, pos_location_desc, pos_location_code, it_identity_pt, it_identity_pt_c, it_identity, zwp_ecs_decl, zwp_co_of_exit, zwp_co_of_exit_declared, zwp_co_of_exit_changed_to, zwp_storing, zwp_co_of_export, zwp_decl_type_1a, zwp_no_of_items, zwp_no_of_items_pt, zwp_no_of_package, zwp_no_of_packages_pt, zwp_no_of_packages_pt_c, zwp_country_of_export, zwp_country_of_dest, zwp_containers, zwp_gross_mass_pt, zwp_acceptance_date, zwp_issuing_date, zwp_ead_language, zwp_time_to_send_exit_result, zwp_time_to_border_arrival, zwp_presentation_date, zwp_notification_date, zwp_status, zwp_exit_date, zwp_present_stopped_date, zwp_com_ref_num, zwp_com_ref_num_di, zwp_com_ref_num_di_c, zwp_dec_sub_tim, zwp_tra_cha_met, zwp_tra_cha_met_di, zwp_tra_cha_met_di_c, zwp_spe_cir_ind, pad_realDate, crb_code_before_transit, transit)
VALUES (src.decl_id, src.zwp_gross_mass, src.zwp_gross_mass_pt_c, src.zwp_no_of_items_pt_c, src.crb_code, src.crb_state_of_seals, src.pad_place, src.pad_date, src.s_quantity, src.cr_code, src.log_co, src.log_location_desc, src.log_location_code, src.pos_location_desc, src.pos_location_code, src.it_identity_pt, src.it_identity_pt_c, src.it_identity, src.zwp_ecs_decl, src.zwp_co_of_exit, src.zwp_co_of_exit_declared, src.zwp_co_of_exit_changed_to, src.zwp_storing, src.zwp_co_of_export, src.zwp_decl_type_1a, src.zwp_no_of_items, src.zwp_no_of_items_pt, src.zwp_no_of_package, src.zwp_no_of_packages_pt, src.zwp_no_of_packages_pt_c, src.zwp_country_of_export, src.zwp_country_of_dest, src.zwp_containers, src.zwp_gross_mass_pt, src.zwp_acceptance_date, src.zwp_issuing_date, src.zwp_ead_language, src.zwp_time_to_send_exit_result, src.zwp_time_to_border_arrival, src.zwp_presentation_date, src.zwp_notification_date, src.zwp_status, src.zwp_exit_date, src.zwp_present_stopped_date, src.zwp_com_ref_num, src.zwp_com_ref_num_di, src.zwp_com_ref_num_di_c, src.zwp_dec_sub_tim, src.zwp_tra_cha_met, src.zwp_tra_cha_met_di, src.zwp_tra_cha_met_di_c, src.zwp_spe_cir_ind, src.pad_realDate, src.crb_code_before_transit, src.transit);	
		
	SET @Merged = 1;
	END

	IF @TableName = 'ariadna_metody_kontroli' BEGIN
		MERGE INTO aes2.ariadna_metody_kontroli AS tgt
USING WI_StageODS.aes2.ariadna_metody_kontroli AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.obsluga_wskazan_kontroli_id=src.obsluga_wskazan_kontroli_id, tgt.poziom_zdefiniowania=src.poziom_zdefiniowania, tgt.metoda_kontroli=src.metoda_kontroli
WHEN NOT MATCHED
THEN INSERT (id, obsluga_wskazan_kontroli_id, poziom_zdefiniowania, metoda_kontroli)
VALUES (src.id, src.obsluga_wskazan_kontroli_id, src.poziom_zdefiniowania, src.metoda_kontroli);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ariadna_owk_podsumowanie' BEGIN
		MERGE INTO aes2.ariadna_owk_podsumowanie AS tgt
USING WI_StageODS.aes2.ariadna_owk_podsumowanie AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.obsluga_wskazan_kontroli_id=src.obsluga_wskazan_kontroli_id, tgt.nr_pozycji=src.nr_pozycji, tgt.zakres_przebieg_kontroli_SO=src.zakres_przebieg_kontroli_SO, tgt.wynik_kontroli_SO=src.wynik_kontroli_SO
WHEN NOT MATCHED
THEN INSERT (id, obsluga_wskazan_kontroli_id, nr_pozycji, zakres_przebieg_kontroli_SO, wynik_kontroli_SO)
VALUES (src.id, src.obsluga_wskazan_kontroli_id, src.nr_pozycji, src.zakres_przebieg_kontroli_SO, src.wynik_kontroli_SO);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ariadna_owk_pozycje' BEGIN
		MERGE INTO aes2.ariadna_owk_pozycje AS tgt
USING WI_StageODS.aes2.ariadna_owk_pozycje AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.obsluga_wskazan_kontroli_id=src.obsluga_wskazan_kontroli_id, tgt.nr_pozycji=src.nr_pozycji
WHEN NOT MATCHED
THEN INSERT (id, obsluga_wskazan_kontroli_id, nr_pozycji)
VALUES (src.id, src.obsluga_wskazan_kontroli_id, src.nr_pozycji);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ariadna_zespol_kontroli' BEGIN
		MERGE INTO aes2.ariadna_zespol_kontroli AS tgt
USING WI_StageODS.aes2.ariadna_zespol_kontroli AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.obsluga_wskazan_kontroli_id=src.obsluga_wskazan_kontroli_id, tgt.login=src.login, tgt.rejestrator_wynikow_ZISAR=src.rejestrator_wynikow_ZISAR
WHEN NOT MATCHED
THEN INSERT (id, obsluga_wskazan_kontroli_id, login, rejestrator_wynikow_ZISAR)
VALUES (src.id, src.obsluga_wskazan_kontroli_id, src.login, src.rejestrator_wynikow_ZISAR);
		
	SET @Merged = 1;
	END

	IF @TableName = 'customs_change' BEGIN
		MERGE INTO aes2.customs_change AS tgt
USING WI_StageODS.aes2.customs_change AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.before_change=src.before_change, tgt.after_change=src.after_change, tgt.item=src.item, tgt.operation_id=src.operation_id
WHEN NOT MATCHED
THEN INSERT (id, before_change, after_change, item, operation_id)
VALUES (src.id, src.before_change, src.after_change, src.item, src.operation_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'customs_directive_change' BEGIN
		MERGE INTO aes2.customs_directive_change AS tgt
USING WI_StageODS.aes2.customs_directive_change AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.code=src.code, tgt.diid=src.diid, tgt.affects=src.affects, tgt.after=src.after, tgt.justification=src.justification, tgt.initial_value=src.initial_value
WHEN NOT MATCHED
THEN INSERT (id, code, diid, affects, after, justification, initial_value)
VALUES (src.id, src.code, src.diid, src.affects, src.after, src.justification, src.initial_value);
		
	SET @Merged = 1;
	END

	IF @TableName = 'customs_directive_cm' BEGIN
		MERGE INTO aes2.customs_directive_cm AS tgt
		USING WI_StageODS.aes2.customs_directive_cm AS src
		ON (tgt.directive_id=src.directive_id AND tgt.code=src.code)
		--WHEN MATCHED
		--THEN UPDATE SET
		--==
		WHEN NOT MATCHED
		THEN INSERT (directive_id, code)
		VALUES (src.directive_id, src.code);		
	SET @Merged = 1;
	END

	IF @TableName = 'customs_directive_indicator' BEGIN
		MERGE INTO aes2.customs_directive_indicator AS tgt
USING WI_StageODS.aes2.customs_directive_indicator AS src
ON (tgt.ID=src.ID)
WHEN MATCHED
THEN UPDATE SET
tgt.DIRECTIVE_ID=src.DIRECTIVE_ID, tgt.NAME=src.NAME, tgt.VALUE=src.VALUE
WHEN NOT MATCHED
THEN INSERT (ID, DIRECTIVE_ID, NAME, VALUE)
VALUES (src.ID, src.DIRECTIVE_ID, src.NAME, src.VALUE);
		
	SET @Merged = 1;
	END

	IF @TableName = 'customs_directive_intr' BEGIN
		MERGE INTO aes2.customs_directive_intr AS tgt
USING WI_StageODS.aes2.customs_directive_intr AS src
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
		MERGE INTO aes2.customs_directive_pointer AS tgt
USING WI_StageODS.aes2.customs_directive_pointer AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.code=src.code, tgt.diid=src.diid, tgt.name=src.name, tgt.type=src.type, tgt.value=src.value
WHEN NOT MATCHED
THEN INSERT (id, code, diid, name, type, value)
VALUES (src.id, src.code, src.diid, src.name, src.type, src.value);
		
	SET @Merged = 1;
	END

	IF @TableName = 'customs_directive_position' BEGIN
		MERGE INTO aes2.customs_directive_position AS tgt
USING WI_StageODS.aes2.customs_directive_position AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.directive_id=src.directive_id, tgt.position=src.position
WHEN NOT MATCHED
THEN INSERT (id, directive_id, position)
VALUES (src.id, src.directive_id, src.position);
		
	SET @Merged = 1;
	END	

	
IF @TableName = 'customs_information' BEGIN
		MERGE INTO aes2.customs_information AS tgt
USING WI_StageODS.aes2.customs_information AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.information=src.information
WHEN NOT MATCHED
THEN INSERT (id, information)
VALUES (src.id, src.information);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_cancellation_request' BEGIN
		MERGE INTO aes2.ecs_exp_cancellation_request AS tgt
USING WI_StageODS.aes2.ecs_exp_cancellation_request AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.msg_id=src.msg_id, tgt.return_mail=src.return_mail, tgt.reason_of_request=src.reason_of_request, tgt.date_of_request=src.date_of_request, tgt.date_of_cancellation_decision=src.date_of_cancellation_decision, tgt.justification_of_decision=src.justification_of_decision, tgt.status=src.status, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.return_post=src.return_post
WHEN NOT MATCHED
THEN INSERT (id, msg_id, return_mail, reason_of_request, date_of_request, date_of_cancellation_decision, justification_of_decision, status, declcoexport_decl_id, return_post)
VALUES (src.id, src.msg_id, src.return_mail, src.reason_of_request, src.date_of_request, src.date_of_cancellation_decision, src.justification_of_decision, src.status, src.declcoexport_decl_id, src.return_post);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_card3_receipient' BEGIN
		MERGE INTO aes2.ecs_exp_card3_receipient AS tgt
USING WI_StageODS.aes2.ecs_exp_card3_receipient AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.declcoexport_decl_id=src.declcoexport_decl_id
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, declcoexport_decl_id)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.declcoexport_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_consignee' BEGIN
		MERGE INTO aes2.ecs_exp_consignee AS tgt
USING WI_StageODS.aes2.ecs_exp_consignee AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, declcoexport_decl_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.declcoexport_decl_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_decl_br_c' BEGIN
	MERGE INTO aes2.ecs_exp_decl_br_c AS tgt
USING WI_StageODS.aes2.ecs_exp_decl_br_c AS src
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
	MERGE INTO aes2.ecs_exp_declarant AS tgt
USING WI_StageODS.aes2.ecs_exp_declarant AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.representative_status=src.representative_status, tgt.indication=src.indication, tgt.no_of_entry_agents_list=src.no_of_entry_agents_list, tgt.date_of_entry_agent_list=src.date_of_entry_agent_list, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, representative_status, indication, no_of_entry_agents_list, date_of_entry_agent_list, declcoexport_decl_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.representative_status, src.indication, src.no_of_entry_agents_list, src.date_of_entry_agent_list, src.declcoexport_decl_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);	
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_deferred_payment' BEGIN
		MERGE INTO aes2.ecs_exp_deferred_payment AS tgt
USING WI_StageODS.aes2.ecs_exp_deferred_payment AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.ref=src.ref, tgt.declcoexport_decl_id=src.declcoexport_decl_id
WHEN NOT MATCHED
THEN INSERT (id, ref, declcoexport_decl_id)
VALUES (src.id, src.ref, src.declcoexport_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_exporter' BEGIN
		MERGE INTO aes2.ecs_exp_exporter AS tgt
USING WI_StageODS.aes2.ecs_exp_exporter AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, declcoexport_decl_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.declcoexport_decl_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_goods_item' BEGIN
		MERGE INTO aes2.ecs_exp_goods_item AS tgt
USING WI_StageODS.aes2.ecs_exp_goods_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_country_of_export=src.gi_country_of_export, tgt.gi_country_of_destination=src.gi_country_of_destination, tgt.gi_gross_mass_br=src.gi_gross_mass_br, tgt.gi_crn=src.gi_crn, tgt.gi_un_dangerous_goods=src.gi_un_dangerous_goods, tgt.gi_taxes_amount=src.gi_taxes_amount, tgt.gi_item_no=src.gi_item_no, tgt.gi_state_br=src.gi_state_br, tgt.vog_statistical_value=src.vog_statistical_value, tgt.vog_statistical_currency=src.vog_statistical_currency, tgt.gi_desc_br=src.gi_desc_br, tgt.gi_cn_code=src.gi_cn_code, tgt.gi_taric_code=src.gi_taric_code, tgt.gi_commodity_code_br=src.gi_commodity_code_br, tgt.gi_country_of_origin=src.gi_country_of_origin, tgt.gi_proc_requested=src.gi_proc_requested, tgt.gi_proc_previous=src.gi_proc_previous, tgt.gi_proc_detail=src.gi_proc_detail, tgt.gi_net_mass=src.gi_net_mass, tgt.gi_net_mass_br=src.gi_net_mass_br, tgt.gi_quantity_suppl_unit=src.gi_quantity_suppl_unit, tgt.gi_desc=src.gi_desc, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.gi_transport_charges_mp=src.gi_transport_charges_mp, tgt.gi_crn_di=src.gi_crn_di, tgt.gi_tar_fir_cod_di=src.gi_tar_fir_cod_di, tgt.gi_tar_sec_cod_di=src.gi_tar_sec_cod_di, tgt.gi_transport_charges_mp_di=src.gi_transport_charges_mp_di, tgt.gi_un_dangerous_goods_di=src.gi_un_dangerous_goods_di, tgt.vog_statistical_currency_di=src.vog_statistical_currency_di, tgt.vog_statistical_value_di=src.vog_statistical_value_di, tgt.arr_status=src.arr_status, tgt.arr_cont_proc=src.arr_cont_proc, tgt.arr_irr_descr=src.arr_irr_descr, tgt.arr_saldo=src.arr_saldo
WHEN NOT MATCHED
THEN INSERT (id, gi_gross_mass, gi_country_of_export, gi_country_of_destination, gi_gross_mass_br, gi_crn, gi_un_dangerous_goods, gi_taxes_amount, gi_item_no, gi_state_br, vog_statistical_value, vog_statistical_currency, gi_desc_br, gi_cn_code, gi_taric_code, gi_commodity_code_br, gi_country_of_origin, gi_proc_requested, gi_proc_previous, gi_proc_detail, gi_net_mass, gi_net_mass_br, gi_quantity_suppl_unit, gi_desc, declcoexport_decl_id, gi_transport_charges_mp, gi_crn_di, gi_tar_fir_cod_di, gi_tar_sec_cod_di, gi_transport_charges_mp_di, gi_un_dangerous_goods_di, vog_statistical_currency_di, vog_statistical_value_di, arr_status, arr_cont_proc, arr_irr_descr, arr_saldo)
VALUES (src.id, src.gi_gross_mass, src.gi_country_of_export, src.gi_country_of_destination, src.gi_gross_mass_br, src.gi_crn, src.gi_un_dangerous_goods, src.gi_taxes_amount, src.gi_item_no, src.gi_state_br, src.vog_statistical_value, src.vog_statistical_currency, src.gi_desc_br, src.gi_cn_code, src.gi_taric_code, src.gi_commodity_code_br, src.gi_country_of_origin, src.gi_proc_requested, src.gi_proc_previous, src.gi_proc_detail, src.gi_net_mass, src.gi_net_mass_br, src.gi_quantity_suppl_unit, src.gi_desc, src.declcoexport_decl_id, src.gi_transport_charges_mp, src.gi_crn_di, src.gi_tar_fir_cod_di, src.gi_tar_sec_cod_di, src.gi_transport_charges_mp_di, src.gi_un_dangerous_goods_di, src.vog_statistical_currency_di, src.vog_statistical_value_di, src.arr_status, src.arr_cont_proc, src.arr_irr_descr, src.arr_saldo);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_itinerary' BEGIN
		MERGE INTO aes2.ecs_exp_itinerary AS tgt
USING WI_StageODS.aes2.ecs_exp_itinerary AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.country=src.country, tgt.declcoexport_decl_id=src.declcoexport_decl_id
WHEN NOT MATCHED
THEN INSERT (id, country, declcoexport_decl_id)
VALUES (src.id, src.country, src.declcoexport_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_seal' BEGIN
		MERGE INTO aes2.ecs_exp_seal AS tgt
USING WI_StageODS.aes2.ecs_exp_seal AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.ident=src.ident, tgt.declcoexport_decl_id=src.declcoexport_decl_id
WHEN NOT MATCHED
THEN INSERT (id, ident, declcoexport_decl_id)
VALUES (src.id, src.ident, src.declcoexport_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_stat_requ' BEGIN
		MERGE INTO aes2.ecs_exp_stat_requ AS tgt
USING WI_StageODS.aes2.ecs_exp_stat_requ AS src
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
		MERGE INTO aes2.ecs_exp_trader_at_present AS tgt
USING WI_StageODS.aes2.ecs_exp_trader_at_present AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcoexport_decl_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcoexport_decl_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_additional_info' BEGIN
		MERGE INTO aes2.ecs_ext_additional_info AS tgt
USING WI_StageODS.aes2.ecs_ext_additional_info AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.declcoexit_decl_id=src.declcoexit_decl_id, tgt.code=src.code, tgt.text=src.text
WHEN NOT MATCHED
THEN INSERT (id, declcoexit_decl_id, code, text)
VALUES (src.id, src.declcoexit_decl_id, src.code, src.text);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_consignee' BEGIN
		MERGE INTO aes2.ecs_ext_consignee AS tgt
USING WI_StageODS.aes2.ecs_ext_consignee AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcoexit_decl_id=src.declcoexit_decl_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcoexit_decl_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcoexit_decl_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_decl_br_c' BEGIN
		MERGE INTO aes2.ecs_ext_decl_br_c AS tgt
USING WI_StageODS.aes2.ecs_ext_decl_br_c AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.comment_f=src.comment_f, tgt.declcoexit_decl_id=src.declcoexit_decl_id
WHEN NOT MATCHED
THEN INSERT (id, comment_f, declcoexit_decl_id)
VALUES (src.id, src.comment_f, src.declcoexit_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_exporter' BEGIN
		MERGE INTO aes2.ecs_ext_exporter AS tgt
USING WI_StageODS.aes2.ecs_ext_exporter AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcoexit_decl_id=src.declcoexit_decl_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcoexit_decl_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcoexit_decl_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_goods_item' BEGIN
		MERGE INTO aes2.ecs_ext_goods_item AS tgt
USING WI_StageODS.aes2.ecs_ext_goods_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_country_of_export=src.gi_country_of_export, tgt.gi_country_of_destination=src.gi_country_of_destination, tgt.gi_gross_mass_br=src.gi_gross_mass_br, tgt.gi_item_no=src.gi_item_no, tgt.gi_commodity_code=src.gi_commodity_code, tgt.gi_state_br=src.gi_state_br, tgt.gi_desc_br=src.gi_desc_br, tgt.gi_commodity_code_br=src.gi_commodity_code_br, tgt.gi_net_mass=src.gi_net_mass, tgt.gi_net_mass_br=src.gi_net_mass_br, tgt.gi_desc=src.gi_desc, tgt.declcoexit_decl_id=src.declcoexit_decl_id, tgt.gi_pro_req=src.gi_pro_req, tgt.gi_pre_pro=src.gi_pre_pro, tgt.gi_com_nom_di=src.gi_com_nom_di, tgt.gi_tar_cod_di=src.gi_tar_cod_di, tgt.gi_met_of_pay=src.gi_met_of_pay, tgt.gi_com_nat_pro=src.gi_com_nat_pro, tgt.gi_sta_val_cur=src.gi_sta_val_cur, tgt.gi_sta_val_amo=src.gi_sta_val_amo, tgt.gi_com_ref_num=src.gi_com_ref_num, tgt.gi_un_dan_goo_cod=src.gi_un_dan_goo_cod, tgt.gi_com_nom=src.gi_com_nom, tgt.gi_tar_cod=src.gi_tar_cod, tgt.gi_tar_fir_add_cod=src.gi_tar_fir_add_cod, tgt.gi_tar_sec_add_cod=src.gi_tar_sec_add_cod, tgt.gi_nat_dd_cod=src.gi_nat_dd_cod, tgt.gi_com_nat_pro_di=src.gi_com_nat_pro_di, tgt.gi_com_ref_num_di=src.gi_com_ref_num_di, tgt.gi_met_of_pay_di=src.gi_met_of_pay_di, tgt.gi_sta_val_amo_di=src.gi_sta_val_amo_di, tgt.gi_sta_val_cur_di=src.gi_sta_val_cur_di, tgt.gi_tar_fir_add_cod_di=src.gi_tar_fir_add_cod_di, tgt.gi_tar_sec_add_cod_di=src.gi_tar_sec_add_cod_di, tgt.gi_un_dan_goo_cod_di=src.gi_un_dan_goo_cod_di
WHEN NOT MATCHED
THEN INSERT (id, gi_gross_mass, gi_country_of_export, gi_country_of_destination, gi_gross_mass_br, gi_item_no, gi_commodity_code, gi_state_br, gi_desc_br, gi_commodity_code_br, gi_net_mass, gi_net_mass_br, gi_desc, declcoexit_decl_id, gi_pro_req, gi_pre_pro, gi_com_nom_di, gi_tar_cod_di, gi_met_of_pay, gi_com_nat_pro, gi_sta_val_cur, gi_sta_val_amo, gi_com_ref_num, gi_un_dan_goo_cod, gi_com_nom, gi_tar_cod, gi_tar_fir_add_cod, gi_tar_sec_add_cod, gi_nat_dd_cod, gi_com_nat_pro_di, gi_com_ref_num_di, gi_met_of_pay_di, gi_sta_val_amo_di, gi_sta_val_cur_di, gi_tar_fir_add_cod_di, gi_tar_sec_add_cod_di, gi_un_dan_goo_cod_di)
VALUES (src.id, src.gi_gross_mass, src.gi_country_of_export, src.gi_country_of_destination, src.gi_gross_mass_br, src.gi_item_no, src.gi_commodity_code, src.gi_state_br, src.gi_desc_br, src.gi_commodity_code_br, src.gi_net_mass, src.gi_net_mass_br, src.gi_desc, src.declcoexit_decl_id, src.gi_pro_req, src.gi_pre_pro, src.gi_com_nom_di, src.gi_tar_cod_di, src.gi_met_of_pay, src.gi_com_nat_pro, src.gi_sta_val_cur, src.gi_sta_val_amo, src.gi_com_ref_num, src.gi_un_dan_goo_cod, src.gi_com_nom, src.gi_tar_cod, src.gi_tar_fir_add_cod, src.gi_tar_sec_add_cod, src.gi_nat_dd_cod, src.gi_com_nat_pro_di, src.gi_com_ref_num_di, src.gi_met_of_pay_di, src.gi_sta_val_amo_di, src.gi_sta_val_cur_di, src.gi_tar_fir_add_cod_di, src.gi_tar_sec_add_cod_di, src.gi_un_dan_goo_cod_di);
		
	SET @Merged = 1;
	END	
	
	IF @TableName = 'ecs_ext_itinerary' BEGIN
		MERGE INTO aes2.ecs_ext_itinerary AS tgt
USING WI_StageODS.aes2.ecs_ext_itinerary AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.country=src.country, tgt.declcoexit_decl_id=src.declcoexit_decl_id
WHEN NOT MATCHED
THEN INSERT (id, country, declcoexit_decl_id)
VALUES (src.id, src.country, src.declcoexit_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_risk_analysis' BEGIN
		MERGE INTO aes2.ecs_ext_risk_analysis AS tgt
USING WI_StageODS.aes2.ecs_ext_risk_analysis AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.ra_desc=src.ra_desc, tgt.ra_desc_lng=src.ra_desc_lng, tgt.ra_item_no=src.ra_item_no, tgt.war_code=src.war_code, tgt.declcoexit_decl_id=src.declcoexit_decl_id
WHEN NOT MATCHED
THEN INSERT (id, ra_desc, ra_desc_lng, ra_item_no, war_code, declcoexit_decl_id)
VALUES (src.id, src.ra_desc, src.ra_desc_lng, src.ra_item_no, src.war_code, src.declcoexit_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_seal' BEGIN
		MERGE INTO aes2.ecs_ext_seal AS tgt
USING WI_StageODS.aes2.ecs_ext_seal AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.identity_f=src.identity_f, tgt.decl_id=src.decl_id
WHEN NOT MATCHED
THEN INSERT (id, identity_f, decl_id)
VALUES (src.id, src.identity_f, src.decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_trader_at_exit' BEGIN
		MERGE INTO aes2.ecs_ext_trader_at_exit AS tgt
USING WI_StageODS.aes2.ecs_ext_trader_at_exit AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcoexit_decl_id=src.declcoexit_decl_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcoexit_decl_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcoexit_decl_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_followup' BEGIN
		MERGE INTO aes2.ecs_followup AS tgt
USING WI_StageODS.aes2.ecs_followup AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.fup_type=src.fup_type, tgt.co_of_exit=src.co_of_exit, tgt.co_of_export=src.co_of_export, tgt.comp_auth_coexp=src.comp_auth_coexp, tgt.response_date=src.response_date, tgt.exit_date=src.exit_date, tgt.followup_date=src.followup_date, tgt.mrn=src.mrn, tgt.replied=src.replied, tgt.direction=src.direction, tgt.email=src.email, tgt.reply_answer=src.reply_answer, tgt.reply_info_avail=src.reply_info_avail, tgt.replytodate=src.replytodate, tgt.tin=src.tin, tgt.initiator_id=src.initiator_id, tgt.declcoexport_decl_id=src.declcoexport_decl_id, tgt.send_date=src.send_date
WHEN NOT MATCHED
THEN INSERT (fup_type, id, co_of_exit, co_of_export, comp_auth_coexp, response_date, exit_date, followup_date, mrn, replied, direction, email, reply_answer, reply_info_avail, replytodate, tin, initiator_id, declcoexport_decl_id, send_date)
VALUES (src.fup_type, src.id, src.co_of_exit, src.co_of_export, src.comp_auth_coexp, src.response_date, src.exit_date, src.followup_date, src.mrn, src.replied, src.direction, src.email, src.reply_answer, src.reply_info_avail, src.replytodate, src.tin, src.initiator_id, src.declcoexport_decl_id, src.send_date);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_los_consignee' BEGIN
		MERGE INTO aes2.ecs_los_consignee AS tgt
USING WI_StageODS.aes2.ecs_los_consignee AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, losdeclcoexit_decl_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.losdeclcoexit_decl_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_los_declarant' BEGIN
		MERGE INTO aes2.ecs_los_declarant AS tgt
USING WI_StageODS.aes2.ecs_los_declarant AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id, tgt.email=src.email
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, losdeclcoexit_decl_id, email)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.losdeclcoexit_decl_id, src.email);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_los_exporter' BEGIN
		MERGE INTO aes2.ecs_los_exporter AS tgt
USING WI_StageODS.aes2.ecs_los_exporter AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, losdeclcoexit_decl_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.losdeclcoexit_decl_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_los_goods_item' BEGIN
		
		MERGE INTO aes2.ecs_los_goods_item AS tgt
USING WI_StageODS.aes2.ecs_los_goods_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.gi_cn_code=src.gi_cn_code, tgt.gi_crn=src.gi_crn, tgt.gi_desc=src.gi_desc, tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_item_no=src.gi_item_no, tgt.transport_fee_pay_type=src.transport_fee_pay_type, tgt.gi_un_dangerous_goods=src.gi_un_dangerous_goods, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id
WHEN NOT MATCHED
THEN INSERT (id, gi_cn_code, gi_crn, gi_desc, gi_gross_mass, gi_item_no, transport_fee_pay_type, gi_un_dangerous_goods, losdeclcoexit_decl_id)
VALUES (src.id, src.gi_cn_code, src.gi_crn, src.gi_desc, src.gi_gross_mass, src.gi_item_no, src.transport_fee_pay_type, src.gi_un_dangerous_goods, src.losdeclcoexit_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_los_itinerary' BEGIN
		MERGE INTO aes2.ecs_los_itinerary AS tgt
USING WI_StageODS.aes2.ecs_los_itinerary AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.country=src.country, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id
WHEN NOT MATCHED
THEN INSERT (id, country, losdeclcoexit_decl_id)
VALUES (src.id, src.country, src.losdeclcoexit_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_los_risk_analysis' BEGIN
		MERGE INTO aes2.ecs_los_risk_analysis AS tgt
USING WI_StageODS.aes2.ecs_los_risk_analysis AS src
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
		MERGE INTO aes2.ecs_los_seal AS tgt
USING WI_StageODS.aes2.ecs_los_seal AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.ident=src.ident, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id
WHEN NOT MATCHED
THEN INSERT (id, ident, losdeclcoexit_decl_id)
VALUES (src.id, src.ident, src.losdeclcoexit_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_los_submitter' BEGIN
		MERGE INTO aes2.ecs_los_submitter AS tgt
USING WI_StageODS.aes2.ecs_los_submitter AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.losdeclcoexit_decl_id=src.losdeclcoexit_decl_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, losdeclcoexit_decl_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.losdeclcoexit_decl_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_mft_goodsitem' BEGIN
		MERGE INTO aes2.ecs_mft_goodsitem AS tgt
USING WI_StageODS.aes2.ecs_mft_goodsitem AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.gi_gross_mass=src.gi_gross_mass, tgt.gino_of_packages=src.gino_of_packages, tgt.gi_item_no=src.gi_item_no, tgt.gi_transport_document=src.gi_transport_document, tgt.gi_kind_of_packages=src.gi_kind_of_packages, tgt.gi_marks_of_packages=src.gi_marks_of_packages, tgt.gi_no_of_pieces=src.gi_no_of_pieces, tgt.gi_commodity_code=src.gi_commodity_code, tgt.gi_item_desc=src.gi_item_desc, tgt.manifest_decl_id=src.manifest_decl_id
WHEN NOT MATCHED
THEN INSERT (id, gi_gross_mass, gino_of_packages, gi_item_no, gi_transport_document, gi_kind_of_packages, gi_marks_of_packages, gi_no_of_pieces, gi_commodity_code, gi_item_desc, manifest_decl_id)
VALUES (src.id, src.gi_gross_mass, src.gino_of_packages, src.gi_item_no, src.gi_transport_document, src.gi_kind_of_packages, src.gi_marks_of_packages, src.gi_no_of_pieces, src.gi_commodity_code, src.gi_item_desc, src.manifest_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_mft_trader_at_exit' BEGIN
		MERGE INTO aes2.ecs_mft_trader_at_exit AS tgt
USING WI_StageODS.aes2.ecs_mft_trader_at_exit AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.manifest_decl_id=src.manifest_decl_id, tgt.email=src.email
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, manifest_decl_id, email)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.manifest_decl_id, src.email);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_query_exportquery' BEGIN
	MERGE INTO aes2.ecs_query_exportquery AS tgt
USING WI_StageODS.aes2.ecs_query_exportquery AS src
ON (tgt.q_query_decl_id=src.q_query_decl_id)
WHEN MATCHED
THEN UPDATE SET
tgt.q_acceptance_date=src.q_acceptance_date, tgt.q_co_exit=src.q_co_exit, tgt.q_co_export=src.q_co_export, tgt.q_co_request=src.q_co_request, tgt.q_container_indicator=src.q_container_indicator, tgt.q_control_date_limit=src.q_control_date_limit, tgt.q_control_result_code=src.q_control_result_code, tgt.q_country_dep_code=src.q_country_dep_code, tgt.q_dest_country_code=src.q_dest_country_code, tgt.q_dispatch_country_code=src.q_dispatch_country_code, tgt.q_crn=src.q_crn, tgt.q_request_date=src.q_request_date, tgt.q_decl_type=src.q_decl_type, tgt.q_decl_submit_time=src.q_decl_submit_time, tgt.q_ead_lang_code=src.q_ead_lang_code, tgt.q_exp_oper_state_type=src.q_exp_oper_state_type, tgt.q_gross_mass=src.q_gross_mass, tgt.q_identity_of_transport=src.q_identity_of_transport, tgt.q_id_of_tran_lang=src.q_id_of_tran_lang, tgt.q_issue_date=src.q_issue_date, tgt.q_mrn=src.q_mrn, tgt.q_number_of_items=src.q_number_of_items, tgt.q_num_of_packages=src.q_num_of_packages, tgt.q_oth_mov_info_reqest=src.q_oth_mov_info_reqest, tgt.q_oth_mov_info_req_lang=src.q_oth_mov_info_req_lang, tgt.q_oth_mov_info_response=src.q_oth_mov_info_response, tgt.q_oth_mov_info_resp_lang=src.q_oth_mov_info_resp_lang, tgt.q_query_reason_code=src.q_query_reason_code, tgt.s_seals_number=src.s_seals_number, tgt.q_spec_circum_indicator=src.q_spec_circum_indicator, tgt.q_status=src.q_status, tgt.q_tran_method_of_payment=src.q_tran_method_of_payment, tgt.request_msg_id=src.request_msg_id, tgt.dts=src.dts
WHEN NOT MATCHED
THEN INSERT (q_query_decl_id, q_acceptance_date, q_co_exit, q_co_export, q_co_request, q_container_indicator, q_control_date_limit, q_control_result_code, q_country_dep_code, q_dest_country_code, q_dispatch_country_code, q_crn, q_request_date, q_decl_type, q_decl_submit_time, q_ead_lang_code, q_exp_oper_state_type, q_gross_mass, q_identity_of_transport, q_id_of_tran_lang, q_issue_date, q_mrn, q_number_of_items, q_num_of_packages, q_oth_mov_info_reqest, q_oth_mov_info_req_lang, q_oth_mov_info_response, q_oth_mov_info_resp_lang, q_query_reason_code, s_seals_number, q_spec_circum_indicator, q_status, q_tran_method_of_payment, request_msg_id, dts)
VALUES (src.q_query_decl_id, src.q_acceptance_date, src.q_co_exit, src.q_co_export, src.q_co_request, src.q_container_indicator, src.q_control_date_limit, src.q_control_result_code, src.q_country_dep_code, src.q_dest_country_code, src.q_dispatch_country_code, src.q_crn, src.q_request_date, src.q_decl_type, src.q_decl_submit_time, src.q_ead_lang_code, src.q_exp_oper_state_type, src.q_gross_mass, src.q_identity_of_transport, src.q_id_of_tran_lang, src.q_issue_date, src.q_mrn, src.q_number_of_items, src.q_num_of_packages, src.q_oth_mov_info_reqest, src.q_oth_mov_info_req_lang, src.q_oth_mov_info_response, src.q_oth_mov_info_resp_lang, src.q_query_reason_code, src.s_seals_number, src.q_spec_circum_indicator, src.q_status, src.q_tran_method_of_payment, src.request_msg_id, src.dts);	
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_consignee' BEGIN
		MERGE INTO aes2.ecs_spp_consignee AS tgt
USING WI_StageODS.aes2.ecs_spp_consignee AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.declcosuppl_decl_id=src.declcosuppl_decl_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, declcosuppl_decl_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.declcosuppl_decl_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_declarant' BEGIN
		MERGE INTO aes2.ecs_spp_declarant AS tgt
USING WI_StageODS.aes2.ecs_spp_declarant AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.date_of_entry_agent_list=src.date_of_entry_agent_list, tgt.indication=src.indication, tgt.no_of_entry_agents_list=src.no_of_entry_agents_list, tgt.representative_status=src.representative_status, tgt.declcoexpsuppl_decl_id=src.declcoexpsuppl_decl_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, date_of_entry_agent_list, indication, no_of_entry_agents_list, representative_status, declcoexpsuppl_decl_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.date_of_entry_agent_list, src.indication, src.no_of_entry_agents_list, src.representative_status, src.declcoexpsuppl_decl_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END	
	
	IF @TableName = 'ecs_spp_deferred_payment' BEGIN
		MERGE INTO aes2.ecs_spp_deferred_payment AS tgt
USING WI_StageODS.aes2.ecs_spp_deferred_payment AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.ref=src.ref, tgt.ref_spp=src.ref_spp, tgt.declcoexpsuppl_decl_id=src.declcoexpsuppl_decl_id
WHEN NOT MATCHED
THEN INSERT (id, ref, ref_spp, declcoexpsuppl_decl_id)
VALUES (src.id, src.ref, src.ref_spp, src.declcoexpsuppl_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_exporter' BEGIN
		MERGE INTO aes2.ecs_spp_exporter AS tgt
USING WI_StageODS.aes2.ecs_spp_exporter AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.eori_spp=src.eori_spp, tgt.tin_spp=src.tin_spp, tgt.declcoexportsuppl_decl_id=src.declcoexportsuppl_decl_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, eori_spp, tin_spp, declcoexportsuppl_decl_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.eori_spp, src.tin_spp, src.declcoexportsuppl_decl_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_goods_item' BEGIN
		MERGE INTO aes2.ecs_spp_goods_item AS tgt
USING WI_StageODS.aes2.ecs_spp_goods_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.gi_cn_code=src.gi_cn_code, tgt.gi_cn_code_spp=src.gi_cn_code_spp, tgt.gi_commodity_code_br=src.gi_commodity_code_br, tgt.gi_country_of_destination=src.gi_country_of_destination, tgt.gi_country_of_destination_spp=src.gi_country_of_destination_spp, tgt.gi_country_of_export=src.gi_country_of_export, tgt.gi_country_of_export_spp=src.gi_country_of_export_spp, tgt.gi_country_of_origin=src.gi_country_of_origin, tgt.gi_country_of_origin_spp=src.gi_country_of_origin_spp, tgt.gi_crn=src.gi_crn, tgt.gi_crn_spp=src.gi_crn_spp, tgt.gi_desc=src.gi_desc, tgt.gi_desc_br=src.gi_desc_br, tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_gross_mass_br=src.gi_gross_mass_br, tgt.gi_gross_mass_spp=src.gi_gross_mass_spp, tgt.gi_item_no=src.gi_item_no, tgt.gi_net_mass=src.gi_net_mass, tgt.gi_net_mass_spp=src.gi_net_mass_spp, tgt.gi_proc_detail=src.gi_proc_detail, tgt.gi_proc_detail_spp=src.gi_proc_detail_spp, tgt.gi_proc_previous=src.gi_proc_previous, tgt.gi_proc_previous_spp=src.gi_proc_previous_spp, tgt.gi_proc_requested=src.gi_proc_requested, tgt.gi_proc_requested_spp=src.gi_proc_requested_spp, tgt.gi_quantity_suppl_unit=src.gi_quantity_suppl_unit, tgt.gi_quantity_suppl_unit_spp=src.gi_quantity_suppl_unit_spp, tgt.gi_taric_code=src.gi_taric_code, tgt.gi_taric_code_spp=src.gi_taric_code_spp, tgt.gi_taxes_amount=src.gi_taxes_amount, tgt.gi_taxes_amount_spp=src.gi_taxes_amount_spp, tgt.gi_transport_charges_mp=src.gi_transport_charges_mp, tgt.gi_un_dangerous_goods=src.gi_un_dangerous_goods, tgt.gi_un_dangerous_goods_spp=src.gi_un_dangerous_goods_spp, tgt.vog_statistical_currency=src.vog_statistical_currency, tgt.vog_statistical_value=src.vog_statistical_value, tgt.vog_statistical_value_spp=src.vog_statistical_value_spp, tgt.declcoexpsuppl_decl_id=src.declcoexpsuppl_decl_id, tgt.gi_transport_charges_mp_spp=src.gi_transport_charges_mp_spp
WHEN NOT MATCHED
THEN INSERT (id, gi_cn_code, gi_cn_code_spp, gi_commodity_code_br, gi_country_of_destination, gi_country_of_destination_spp, gi_country_of_export, gi_country_of_export_spp, gi_country_of_origin, gi_country_of_origin_spp, gi_crn, gi_crn_spp, gi_desc, gi_desc_br, gi_gross_mass, gi_gross_mass_br, gi_gross_mass_spp, gi_item_no, gi_net_mass, gi_net_mass_spp, gi_proc_detail, gi_proc_detail_spp, gi_proc_previous, gi_proc_previous_spp, gi_proc_requested, gi_proc_requested_spp, gi_quantity_suppl_unit, gi_quantity_suppl_unit_spp, gi_taric_code, gi_taric_code_spp, gi_taxes_amount, gi_taxes_amount_spp, gi_transport_charges_mp, gi_un_dangerous_goods, gi_un_dangerous_goods_spp, vog_statistical_currency, vog_statistical_value, vog_statistical_value_spp, declcoexpsuppl_decl_id, gi_transport_charges_mp_spp)
VALUES (src.id, src.gi_cn_code, src.gi_cn_code_spp, src.gi_commodity_code_br, src.gi_country_of_destination, src.gi_country_of_destination_spp, src.gi_country_of_export, src.gi_country_of_export_spp, src.gi_country_of_origin, src.gi_country_of_origin_spp, src.gi_crn, src.gi_crn_spp, src.gi_desc, src.gi_desc_br, src.gi_gross_mass, src.gi_gross_mass_br, src.gi_gross_mass_spp, src.gi_item_no, src.gi_net_mass, src.gi_net_mass_spp, src.gi_proc_detail, src.gi_proc_detail_spp, src.gi_proc_previous, src.gi_proc_previous_spp, src.gi_proc_requested, src.gi_proc_requested_spp, src.gi_quantity_suppl_unit, src.gi_quantity_suppl_unit_spp, src.gi_taric_code, src.gi_taric_code_spp, src.gi_taxes_amount, src.gi_taxes_amount_spp, src.gi_transport_charges_mp, src.gi_un_dangerous_goods, src.gi_un_dangerous_goods_spp, src.vog_statistical_currency, src.vog_statistical_value, src.vog_statistical_value_spp, src.declcoexpsuppl_decl_id, src.gi_transport_charges_mp_spp);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_itinerary' BEGIN
		MERGE INTO aes2.ecs_spp_itinerary AS tgt
USING WI_StageODS.aes2.ecs_spp_itinerary AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.country=src.country, tgt.declcoexpsuppl_decl_id=src.declcoexpsuppl_decl_id, tgt.countrySpp=src.countrySpp
WHEN NOT MATCHED
THEN INSERT (id, country, declcoexpsuppl_decl_id, countrySpp)
VALUES (src.id, src.country, src.declcoexpsuppl_decl_id, src.countrySpp);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_seal' BEGIN
		MERGE INTO aes2.ecs_spp_seal AS tgt
USING WI_StageODS.aes2.ecs_spp_seal AS src
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
		MERGE INTO aes2.ecs_spp_seal_suppl AS tgt
USING WI_StageODS.aes2.ecs_spp_seal_suppl AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.ident=src.ident, tgt.declcoexp_spp_decl_id=src.declcoexp_spp_decl_id
WHEN NOT MATCHED
THEN INSERT (id, ident, declcoexp_spp_decl_id)
VALUES (src.id, src.ident, src.declcoexp_spp_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_consignee' BEGIN
		MERGE INTO aes2.ecs_sum_consignee AS tgt
USING WI_StageODS.aes2.ecs_sum_consignee AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.eori=src.eori, tgt.sumdeclcoexit_decl_id=src.sumdeclcoexit_decl_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, eori, sumdeclcoexit_decl_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.eori, src.sumdeclcoexit_decl_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_declarant' BEGIN
		MERGE INTO aes2.ecs_sum_declarant AS tgt
USING WI_StageODS.aes2.ecs_sum_declarant AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.representative_status=src.representative_status, tgt.indication=src.indication, tgt.no_of_entry_agents_list=src.no_of_entry_agents_list, tgt.date_of_entry_agent_list=src.date_of_entry_agent_list, tgt.sumdeclcoexit_decl_id=src.sumdeclcoexit_decl_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, representative_status, indication, no_of_entry_agents_list, date_of_entry_agent_list, sumdeclcoexit_decl_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.representative_status, src.indication, src.no_of_entry_agents_list, src.date_of_entry_agent_list, src.sumdeclcoexit_decl_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_exporter' BEGIN
		MERGE INTO aes2.ecs_sum_exporter AS tgt
USING WI_StageODS.aes2.ecs_sum_exporter AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.eori=src.eori, tgt.sumdeclcoexit_decl_id=src.sumdeclcoexit_decl_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, eori, sumdeclcoexit_decl_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.eori, src.sumdeclcoexit_decl_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_goods_item' BEGIN
		MERGE INTO aes2.ecs_sum_goods_item AS tgt
USING WI_StageODS.aes2.ecs_sum_goods_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_item_no=src.gi_item_no, tgt.state_br=src.state_br, tgt.gi_crn=src.gi_crn, tgt.gi_desc_br=src.gi_desc_br, tgt.gi_cn_code=src.gi_cn_code, tgt.gi_gross_mass_br=src.gi_gross_mass_br, tgt.gi_un_dangerous_goods=src.gi_un_dangerous_goods, tgt.transport_fee_pay_type=src.transport_fee_pay_type, tgt.gi_crn_br=src.gi_crn_br, tgt.gi_cn_code_br=src.gi_cn_code_br, tgt.gi_un_dangerous_goods_br=src.gi_un_dangerous_goods_br, tgt.transport_fee_pay_type_br=src.transport_fee_pay_type_br, tgt.gi_desc=src.gi_desc, tgt.sumdeclcoexit_decl_id=src.sumdeclcoexit_decl_id
WHEN NOT MATCHED
THEN INSERT (id, gi_gross_mass, gi_item_no, state_br, gi_crn, gi_desc_br, gi_cn_code, gi_gross_mass_br, gi_un_dangerous_goods, transport_fee_pay_type, gi_crn_br, gi_cn_code_br, gi_un_dangerous_goods_br, transport_fee_pay_type_br, gi_desc, sumdeclcoexit_decl_id)
VALUES (src.id, src.gi_gross_mass, src.gi_item_no, src.state_br, src.gi_crn, src.gi_desc_br, src.gi_cn_code, src.gi_gross_mass_br, src.gi_un_dangerous_goods, src.transport_fee_pay_type, src.gi_crn_br, src.gi_cn_code_br, src.gi_un_dangerous_goods_br, src.transport_fee_pay_type_br, src.gi_desc, src.sumdeclcoexit_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_itinerary' BEGIN
		MERGE INTO aes2.ecs_sum_itinerary AS tgt
USING WI_StageODS.aes2.ecs_sum_itinerary AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.country=src.country, tgt.declcoexport_decl_id=src.declcoexport_decl_id
WHEN NOT MATCHED
THEN INSERT (id, country, declcoexport_decl_id)
VALUES (src.id, src.country, src.declcoexport_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_seal' BEGIN
		MERGE INTO aes2.ecs_sum_seal AS tgt
USING WI_StageODS.aes2.ecs_sum_seal AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.ident=src.ident, tgt.sumdeclcoexit_decl_id=src.sumdeclcoexit_decl_id
WHEN NOT MATCHED
THEN INSERT (id, ident, sumdeclcoexit_decl_id)
VALUES (src.id, src.ident, src.sumdeclcoexit_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_submitter' BEGIN
		MERGE INTO aes2.ecs_sum_submitter AS tgt
USING WI_StageODS.aes2.ecs_sum_submitter AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.eori=src.eori, tgt.sumdeclcoexit_decl_id=src.sumdeclcoexit_decl_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, eori, sumdeclcoexit_decl_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.eori, src.sumdeclcoexit_decl_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_trader_at_exit' BEGIN
		MERGE INTO aes2.ecs_sum_trader_at_exit AS tgt
USING WI_StageODS.aes2.ecs_sum_trader_at_exit AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.eori=src.eori, tgt.exs_id=src.exs_id, tgt.return_email=src.return_email, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, eori, exs_id, return_email, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.eori, src.exs_id, src.return_email, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_trs_req_doc' BEGIN
		MERGE INTO aes2.ecs_trs_req_doc AS tgt
USING WI_StageODS.aes2.ecs_trs_req_doc AS src
ON (tgt.ID=src.ID)
WHEN MATCHED
THEN UPDATE SET
tgt.TRS_ITEM_ID=src.TRS_ITEM_ID, tgt.POZ_ID=src.POZ_ID, tgt.KOD=src.KOD, tgt.NR=src.NR, tgt.UWAGI=src.UWAGI, tgt.VERSION=src.VERSION
WHEN NOT MATCHED
THEN INSERT (ID, TRS_ITEM_ID, POZ_ID, KOD, NR, UWAGI, VERSION)
VALUES (src.ID, src.TRS_ITEM_ID, src.POZ_ID, src.KOD, src.NR, src.UWAGI, src.VERSION);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_trs_reservation' BEGIN
		MERGE INTO aes2.ecs_trs_reservation AS tgt
USING WI_StageODS.aes2.ecs_trs_reservation AS src
ON (tgt.ID=src.ID)
WHEN MATCHED
THEN UPDATE SET
tgt.ITEM_ID=src.ITEM_ID, tgt.DECL_ID=src.DECL_ID, tgt.DECLCO_ID=src.DECLCO_ID, tgt.POSID=src.POSID, tgt.KOD=src.KOD, tgt.MRN=src.MRN, tgt.DECLCO_ITEM=src.DECLCO_ITEM, tgt.RESERVED_MASS=src.RESERVED_MASS, tgt.VERSION=src.VERSION, tgt.NCTS_COMMENT=src.NCTS_COMMENT
WHEN NOT MATCHED
THEN INSERT (ID, ITEM_ID, DECL_ID, DECLCO_ID, POSID, KOD, MRN, DECLCO_ITEM, RESERVED_MASS, VERSION, NCTS_COMMENT)
VALUES (src.ID, src.ITEM_ID, src.DECL_ID, src.DECLCO_ID, src.POSID, src.KOD, src.MRN, src.DECLCO_ITEM, src.RESERVED_MASS, src.VERSION, src.NCTS_COMMENT);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_zwp_consignee' BEGIN
		MERGE INTO aes2.ecs_zwp_consignee AS tgt
USING WI_StageODS.aes2.ecs_zwp_consignee AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcopresent_decl_id=src.declcopresent_decl_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcopresent_decl_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcopresent_decl_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_zwp_decl_pt_c' BEGIN
		MERGE INTO aes2.ecs_zwp_decl_pt_c AS tgt
USING WI_StageODS.aes2.ecs_zwp_decl_pt_c AS src
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
		MERGE INTO aes2.ecs_zwp_exporter AS tgt
USING WI_StageODS.aes2.ecs_zwp_exporter AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcopresent_decl_id=src.declcopresent_decl_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcopresent_decl_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcopresent_decl_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_zwp_goods_item' BEGIN
		MERGE INTO aes2.ecs_zwp_goods_item AS tgt
USING WI_StageODS.aes2.ecs_zwp_goods_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_country_of_export=src.gi_country_of_export, tgt.gi_country_of_destination=src.gi_country_of_destination, tgt.gi_gross_mass_br=src.gi_gross_mass_br, tgt.gi_item_no=src.gi_item_no, tgt.gi_commodity_code=src.gi_commodity_code, tgt.gi_state_br=src.gi_state_br, tgt.gi_desc_br=src.gi_desc_br, tgt.gi_commodity_code_br=src.gi_commodity_code_br, tgt.gi_net_mass=src.gi_net_mass, tgt.gi_net_mass_br=src.gi_net_mass_br, tgt.gi_desc=src.gi_desc, tgt.declcopresent_decl_id=src.declcopresent_decl_id, tgt.gi_pro_req=src.gi_pro_req, tgt.gi_pre_pro=src.gi_pre_pro, tgt.gi_com_nom_di=src.gi_com_nom_di, tgt.gi_tar_cod_di=src.gi_tar_cod_di, tgt.gi_met_of_pay=src.gi_met_of_pay, tgt.gi_com_nat_pro=src.gi_com_nat_pro, tgt.gi_sta_val_cur=src.gi_sta_val_cur, tgt.gi_sta_val_amo=src.gi_sta_val_amo, tgt.gi_com_ref_num=src.gi_com_ref_num, tgt.gi_un_dan_goo_cod=src.gi_un_dan_goo_cod, tgt.gi_com_nom=src.gi_com_nom, tgt.gi_tar_cod=src.gi_tar_cod, tgt.gi_tar_fir_add_cod=src.gi_tar_fir_add_cod, tgt.gi_tar_sec_add_cod=src.gi_tar_sec_add_cod, tgt.gi_nat_dd_cod=src.gi_nat_dd_cod, tgt.gi_com_nat_pro_di=src.gi_com_nat_pro_di, tgt.gi_com_ref_num_di=src.gi_com_ref_num_di, tgt.gi_met_of_pay_di=src.gi_met_of_pay_di, tgt.gi_sta_val_amo_di=src.gi_sta_val_amo_di, tgt.gi_sta_val_cur_di=src.gi_sta_val_cur_di, tgt.gi_tar_fir_add_cod_di=src.gi_tar_fir_add_cod_di, tgt.gi_tar_sec_add_cod_di=src.gi_tar_sec_add_cod_di, tgt.gi_un_dan_goo_cod_di=src.gi_un_dan_goo_cod_di
WHEN NOT MATCHED
THEN INSERT (id, gi_gross_mass, gi_country_of_export, gi_country_of_destination, gi_gross_mass_br, gi_item_no, gi_commodity_code, gi_state_br, gi_desc_br, gi_commodity_code_br, gi_net_mass, gi_net_mass_br, gi_desc, declcopresent_decl_id, gi_pro_req, gi_pre_pro, gi_com_nom_di, gi_tar_cod_di, gi_met_of_pay, gi_com_nat_pro, gi_sta_val_cur, gi_sta_val_amo, gi_com_ref_num, gi_un_dan_goo_cod, gi_com_nom, gi_tar_cod, gi_tar_fir_add_cod, gi_tar_sec_add_cod, gi_nat_dd_cod, gi_com_nat_pro_di, gi_com_ref_num_di, gi_met_of_pay_di, gi_sta_val_amo_di, gi_sta_val_cur_di, gi_tar_fir_add_cod_di, gi_tar_sec_add_cod_di, gi_un_dan_goo_cod_di)
VALUES (src.id, src.gi_gross_mass, src.gi_country_of_export, src.gi_country_of_destination, src.gi_gross_mass_br, src.gi_item_no, src.gi_commodity_code, src.gi_state_br, src.gi_desc_br, src.gi_commodity_code_br, src.gi_net_mass, src.gi_net_mass_br, src.gi_desc, src.declcopresent_decl_id, src.gi_pro_req, src.gi_pre_pro, src.gi_com_nom_di, src.gi_tar_cod_di, src.gi_met_of_pay, src.gi_com_nat_pro, src.gi_sta_val_cur, src.gi_sta_val_amo, src.gi_com_ref_num, src.gi_un_dan_goo_cod, src.gi_com_nom, src.gi_tar_cod, src.gi_tar_fir_add_cod, src.gi_tar_sec_add_cod, src.gi_nat_dd_cod, src.gi_com_nat_pro_di, src.gi_com_ref_num_di, src.gi_met_of_pay_di, src.gi_sta_val_amo_di, src.gi_sta_val_cur_di, src.gi_tar_fir_add_cod_di, src.gi_tar_sec_add_cod_di, src.gi_un_dan_goo_cod_di);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_zwp_itinerary' BEGIN
		MERGE INTO aes2.ecs_zwp_itinerary AS tgt
USING WI_StageODS.aes2.ecs_zwp_itinerary AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.country=src.country, tgt.declcopresent_decl_id=src.declcopresent_decl_id
WHEN NOT MATCHED
THEN INSERT (id, country, declcopresent_decl_id)
VALUES (src.id, src.country, src.declcopresent_decl_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_zwp_seal' BEGIN
		MERGE INTO aes2.ecs_zwp_seal AS tgt
USING WI_StageODS.aes2.ecs_zwp_seal AS src
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
		MERGE INTO aes2.ecs_zwp_trader_at_present AS tgt
USING WI_StageODS.aes2.ecs_zwp_trader_at_present AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.declcopresent_decl_id=src.declcopresent_decl_id, tgt.eori=src.eori, tgt.email=src.email
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, declcopresent_decl_id, eori, email)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.declcopresent_decl_id, src.eori, src.email);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_consignee_of_item' BEGIN
		MERGE INTO aes2.ecs_exp_consignee_of_item AS tgt
USING WI_StageODS.aes2.ecs_exp_consignee_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.goods_item_id=src.goods_item_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, goods_item_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.goods_item_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_container' BEGIN
		MERGE INTO aes2.ecs_exp_container AS tgt
USING WI_StageODS.aes2.ecs_exp_container AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.state_br=src.state_br, tgt.identity_f=src.identity_f, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, state_br, identity_f, goods_item_id)
VALUES (src.id, src.state_br, src.identity_f, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_correction' BEGIN
		MERGE INTO aes2.ecs_exp_correction AS tgt
USING WI_StageODS.aes2.ecs_exp_correction AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.code=src.code, tgt.value=src.value, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, code, value, goods_item_id)
VALUES (src.id, src.code, src.value, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_exporter_of_item' BEGIN
		MERGE INTO aes2.ecs_exp_exporter_of_item AS tgt
USING WI_StageODS.aes2.ecs_exp_exporter_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.goods_item_id=src.goods_item_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, goods_item_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.goods_item_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_item_br_c' BEGIN
		MERGE INTO aes2.ecs_exp_item_br_c AS tgt
USING WI_StageODS.aes2.ecs_exp_item_br_c AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.comment_f=src.comment_f, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, comment_f, goods_item_id)
VALUES (src.id, src.comment_f, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_national_add_code' BEGIN
		MERGE INTO aes2.ecs_exp_national_add_code AS tgt
USING WI_StageODS.aes2.ecs_exp_national_add_code AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.code=src.code, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, code, goods_item_id)
VALUES (src.id, src.code, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_package' BEGIN
		MERGE INTO aes2.ecs_exp_package AS tgt
USING WI_StageODS.aes2.ecs_exp_package AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.no_of_packages=src.no_of_packages, tgt.kind=src.kind, tgt.no_of_pieces=src.no_of_pieces, tgt.state_br=src.state_br, tgt.marks=src.marks, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, no_of_packages, kind, no_of_pieces, state_br, marks, goods_item_id)
VALUES (src.id, src.no_of_packages, src.kind, src.no_of_pieces, src.state_br, src.marks, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_previous_document' BEGIN
		MERGE INTO aes2.ecs_exp_previous_document AS tgt
USING WI_StageODS.aes2.ecs_exp_previous_document AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.type=src.type, tgt.ref=src.ref, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, type, ref, goods_item_id)
VALUES (src.id, src.type, src.ref, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_produced_document' BEGIN
		MERGE INTO aes2.ecs_exp_produced_document AS tgt
USING WI_StageODS.aes2.ecs_exp_produced_document AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.state_br=src.state_br, tgt.state_br_c=src.state_br_c, tgt.type=src.type, tgt.ref=src.ref, tgt.goods_item_id=src.goods_item_id, tgt.remarks=src.remarks, tgt.agrex_result=src.agrex_result, tgt.agrex_discrep_info=src.agrex_discrep_info, tgt.item_quantity=src.item_quantity, tgt.quantity_unit=src.quantity_unit, tgt.poz_id=src.poz_id
WHEN NOT MATCHED
THEN INSERT (id, state_br, state_br_c, type, ref, goods_item_id, remarks, agrex_result, agrex_discrep_info, item_quantity, quantity_unit, poz_id)
VALUES (src.id, src.state_br, src.state_br_c, src.type, src.ref, src.goods_item_id, src.remarks, src.agrex_result, src.agrex_discrep_info, src.item_quantity, src.quantity_unit, src.poz_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_quantity_of_goods' BEGIN
		MERGE INTO aes2.ecs_exp_quantity_of_goods AS tgt
USING WI_StageODS.aes2.ecs_exp_quantity_of_goods AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.unit=src.unit, tgt.qualifier_of_unit=src.qualifier_of_unit, tgt.quantity=src.quantity, tgt.goods_item_id=src.goods_item_id, tgt.poz_id_req_doc=src.poz_id_req_doc
WHEN NOT MATCHED
THEN INSERT (id, unit, qualifier_of_unit, quantity, goods_item_id, poz_id_req_doc)
VALUES (src.id, src.unit, src.qualifier_of_unit, src.quantity, src.goods_item_id, src.poz_id_req_doc);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_special_mention' BEGIN
		MERGE INTO aes2.ecs_exp_special_mention AS tgt
USING WI_StageODS.aes2.ecs_exp_special_mention AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.code=src.code, tgt.text=src.text, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, code, text, goods_item_id)
VALUES (src.id, src.code, src.text, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_taric_add_code' BEGIN
		MERGE INTO aes2.ecs_exp_taric_add_code AS tgt
USING WI_StageODS.aes2.ecs_exp_taric_add_code AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.code=src.code, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, code, goods_item_id)
VALUES (src.id, src.code, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_exp_tariff_measure' BEGIN
		MERGE INTO aes2.ecs_exp_tariff_measure AS tgt
USING WI_StageODS.aes2.ecs_exp_tariff_measure AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.taric_sid=src.taric_sid, tgt.series=src.series, tgt.geographical_area=src.geographical_area, tgt.order_no=src.order_no, tgt.suppl_unit=src.suppl_unit, tgt.suppl_unit_qualifier=src.suppl_unit_qualifier, tgt.type=src.type, tgt.goods_item_id=src.goods_item_id, tgt.tariff_measure_source=src.tariff_measure_source, tgt.footnotes=src.footnotes, tgt.archiv=src.archiv, tgt.rec_date=src.rec_date
WHEN NOT MATCHED
THEN INSERT (id, taric_sid, series, geographical_area, order_no, suppl_unit, suppl_unit_qualifier, type, goods_item_id, tariff_measure_source, footnotes, archiv, rec_date)
VALUES (src.id, src.taric_sid, src.series, src.geographical_area, src.order_no, src.suppl_unit, src.suppl_unit_qualifier, src.type, src.goods_item_id, src.tariff_measure_source, src.footnotes, src.archiv, src.rec_date);
		
	SET @Merged = 1;
	END	
	
	IF @TableName = 'ecs_exp_tax' BEGIN
		MERGE INTO aes2.ecs_exp_tax AS tgt
USING WI_StageODS.aes2.ecs_exp_tax AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.base=src.base, tgt.rate=src.rate, tgt.amount=src.amount, tgt.method_of_payment=src.method_of_payment, tgt.type=src.type, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, base, rate, amount, method_of_payment, type, goods_item_id)
VALUES (src.id, src.base, src.rate, src.amount, src.method_of_payment, src.type, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_consignee_of_item' BEGIN
		MERGE INTO aes2.ecs_ext_consignee_of_item AS tgt
USING WI_StageODS.aes2.ecs_ext_consignee_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.goods_item_id=src.goods_item_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, goods_item_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.goods_item_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_container' BEGIN
		MERGE INTO aes2.ecs_ext_container AS tgt
USING WI_StageODS.aes2.ecs_ext_container AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.state_br=src.state_br, tgt.identity_f=src.identity_f, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, state_br, identity_f, goods_item_id)
VALUES (src.id, src.state_br, src.identity_f, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_exporter_of_item' BEGIN
		MERGE INTO aes2.ecs_ext_exporter_of_item AS tgt
USING WI_StageODS.aes2.ecs_ext_exporter_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.goods_item_id=src.goods_item_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, goods_item_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.goods_item_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_item_br_c' BEGIN
		MERGE INTO aes2.ecs_ext_item_br_c AS tgt
USING WI_StageODS.aes2.ecs_ext_item_br_c AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.comment_f=src.comment_f, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, comment_f, goods_item_id)
VALUES (src.id, src.comment_f, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_package' BEGIN
		MERGE INTO aes2.ecs_ext_package AS tgt
USING WI_StageODS.aes2.ecs_ext_package AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.no_of_packages=src.no_of_packages, tgt.kind=src.kind, tgt.no_of_pieces=src.no_of_pieces, tgt.state_br=src.state_br, tgt.marks=src.marks, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, no_of_packages, kind, no_of_pieces, state_br, marks, goods_item_id)
VALUES (src.id, src.no_of_packages, src.kind, src.no_of_pieces, src.state_br, src.marks, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_previous_document' BEGIN
		MERGE INTO aes2.ecs_ext_previous_document AS tgt
USING WI_StageODS.aes2.ecs_ext_previous_document AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.type_f=src.type_f, tgt.ref_f=src.ref_f, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, type_f, ref_f, goods_item_id)
VALUES (src.id, src.type_f, src.ref_f, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_produced_document' BEGIN
		MERGE INTO aes2.ecs_ext_produced_document AS tgt
USING WI_StageODS.aes2.ecs_ext_produced_document AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.state_br=src.state_br, tgt.state_br_c=src.state_br_c, tgt.type_f=src.type_f, tgt.ref_t=src.ref_t, tgt.goods_item_id=src.goods_item_id, tgt.transit=src.transit
WHEN NOT MATCHED
THEN INSERT (id, state_br, state_br_c, type_f, ref_t, goods_item_id, transit)
VALUES (src.id, src.state_br, src.state_br_c, src.type_f, src.ref_t, src.goods_item_id, src.transit);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_ext_special_mention' BEGIN
		MERGE INTO aes2.ecs_ext_special_mention AS tgt
USING WI_StageODS.aes2.ecs_ext_special_mention AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.code=src.code, tgt.goods_item_id=src.goods_item_id, tgt.text=src.text, tgt.textlng=src.textlng
WHEN NOT MATCHED
THEN INSERT (id, code, goods_item_id, text, textlng)
VALUES (src.id, src.code, src.goods_item_id, src.text, src.textlng);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_los_consignee_of_item' BEGIN
		MERGE INTO aes2.ecs_los_consignee_of_item AS tgt
USING WI_StageODS.aes2.ecs_los_consignee_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.goods_item_id=src.goods_item_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, goods_item_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.goods_item_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_los_container' BEGIN
		MERGE INTO aes2.ecs_los_container AS tgt
USING WI_StageODS.aes2.ecs_los_container AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.identity_f=src.identity_f, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, identity_f, goods_item_id)
VALUES (src.id, src.identity_f, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_los_exporter_of_item' BEGIN
		MERGE INTO aes2.ecs_los_exporter_of_item AS tgt
USING WI_StageODS.aes2.ecs_los_exporter_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.goods_item_id=src.goods_item_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, goods_item_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.goods_item_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_los_package' BEGIN
		MERGE INTO aes2.ecs_los_package AS tgt
USING WI_StageODS.aes2.ecs_los_package AS src
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
		MERGE INTO aes2.ecs_los_produced_document AS tgt
USING WI_StageODS.aes2.ecs_los_produced_document AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.ref=src.ref, tgt.type=src.type, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, ref, type, goods_item_id)
VALUES (src.id, src.ref, src.type, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_mft_customsdata' BEGIN
		MERGE INTO aes2.ecs_mft_customsdata AS tgt
USING WI_StageODS.aes2.ecs_mft_customsdata AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.gross_mass=src.gross_mass, tgt.mrn=src.mrn, tgt.no_of_packages=src.no_of_packages, tgt.item_no=src.item_no, tgt.no_of_pieces=src.no_of_pieces, tgt.partial_shipment=src.partial_shipment, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, gross_mass, mrn, no_of_packages, item_no, no_of_pieces, partial_shipment, goods_item_id)
VALUES (src.id, src.gross_mass, src.mrn, src.no_of_packages, src.item_no, src.no_of_pieces, src.partial_shipment, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_query_consignee' BEGIN
		MERGE INTO aes2.ecs_query_consignee AS tgt
USING WI_StageODS.aes2.ecs_query_consignee AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.exportquery_id=src.exportquery_id, tgt.email=src.email
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, exportquery_id, email)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.exportquery_id, src.email);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_query_exporter' BEGIN
		MERGE INTO aes2.ecs_query_exporter AS tgt
USING WI_StageODS.aes2.ecs_query_exporter AS src
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
		MERGE INTO aes2.ecs_query_goods_item AS tgt
USING WI_StageODS.aes2.ecs_query_goods_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.cc_combined_nomenclature=src.cc_combined_nomenclature, tgt.cc_national_add_code=src.cc_national_add_code, tgt.cc_taric_code=src.cc_taric_code, tgt.cc_taric_1st_add_code=src.cc_taric_1st_add_code, tgt.cc_taric_2nd_add_code=src.cc_taric_2nd_add_code, tgt.gi_country_of_destination=src.gi_country_of_destination, tgt.gi_country_of_export=src.gi_country_of_export, tgt.gi_crn=src.gi_crn, tgt.gi_desc=src.gi_desc, tgt.gi_desc_lang=src.gi_desc_lang, tgt.gi_gross_mass=src.gi_gross_mass, tgt.gi_item_no=src.gi_item_no, tgt.gi_national_procedure=src.gi_national_procedure, tgt.gi_net_mass=src.gi_net_mass, tgt.gi_proc_previous=src.gi_proc_previous, tgt.gi_proc_requested=src.gi_proc_requested, tgt.gi_statistical_value=src.gi_statistical_value, tgt.gi_statistical_val_currency=src.gi_statistical_val_currency, tgt.gi_transport_fee_pay_type=src.gi_transport_fee_pay_type, tgt.gi_un_dangerous_goods=src.gi_un_dangerous_goods, tgt.exportquery_id=src.exportquery_id
WHEN NOT MATCHED
THEN INSERT (id, cc_combined_nomenclature, cc_national_add_code, cc_taric_code, cc_taric_1st_add_code, cc_taric_2nd_add_code, gi_country_of_destination, gi_country_of_export, gi_crn, gi_desc, gi_desc_lang, gi_gross_mass, gi_item_no, gi_national_procedure, gi_net_mass, gi_proc_previous, gi_proc_requested, gi_statistical_value, gi_statistical_val_currency, gi_transport_fee_pay_type, gi_un_dangerous_goods, exportquery_id)
VALUES (src.id, src.cc_combined_nomenclature, src.cc_national_add_code, src.cc_taric_code, src.cc_taric_1st_add_code, src.cc_taric_2nd_add_code, src.gi_country_of_destination, src.gi_country_of_export, src.gi_crn, src.gi_desc, src.gi_desc_lang, src.gi_gross_mass, src.gi_item_no, src.gi_national_procedure, src.gi_net_mass, src.gi_proc_previous, src.gi_proc_requested, src.gi_statistical_value, src.gi_statistical_val_currency, src.gi_transport_fee_pay_type, src.gi_un_dangerous_goods, src.exportquery_id);
		
	SET @Merged = 1;
	END	
		
		
	IF @TableName = 'ecs_query_itinerary' BEGIN
		MERGE INTO aes2.ecs_query_itinerary AS tgt
USING WI_StageODS.aes2.ecs_query_itinerary AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.country=src.country, tgt.exportquery_id=src.exportquery_id
WHEN NOT MATCHED
THEN INSERT (id, country, exportquery_id)
VALUES (src.id, src.country, src.exportquery_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_query_risk_analysis' BEGIN
		MERGE INTO aes2.ecs_query_risk_analysis AS tgt
USING WI_StageODS.aes2.ecs_query_risk_analysis AS src
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
		MERGE INTO aes2.ecs_query_seal AS tgt
USING WI_StageODS.aes2.ecs_query_seal AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.ident=src.ident, tgt.identityLang=src.identityLang, tgt.exportquery_id=src.exportquery_id
WHEN NOT MATCHED
THEN INSERT (id, ident, identityLang, exportquery_id)
VALUES (src.id, src.ident, src.identityLang, src.exportquery_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_consignee_of_item' BEGIN
		MERGE INTO aes2.ecs_spp_consignee_of_item AS tgt
USING WI_StageODS.aes2.ecs_spp_consignee_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.goods_item_id=src.goods_item_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, goods_item_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.goods_item_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_container' BEGIN
		MERGE INTO aes2.ecs_spp_container AS tgt
USING WI_StageODS.aes2.ecs_spp_container AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.identity_f=src.identity_f, tgt.identity_f_spp=src.identity_f_spp, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, identity_f, identity_f_spp, goods_item_id)
VALUES (src.id, src.identity_f, src.identity_f_spp, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_exporter_of_item' BEGIN
		MERGE INTO aes2.ecs_spp_exporter_of_item AS tgt
USING WI_StageODS.aes2.ecs_spp_exporter_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.eori=src.eori, tgt.regon=src.regon, tgt.eori_spp=src.eori_spp, tgt.tin_spp=src.tin_spp, tgt.goods_item_id=src.goods_item_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, eori, regon, eori_spp, tin_spp, goods_item_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.eori, src.regon, src.eori_spp, src.tin_spp, src.goods_item_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_nat_add_code_suppl' BEGIN
		MERGE INTO aes2.ecs_spp_nat_add_code_suppl AS tgt
USING WI_StageODS.aes2.ecs_spp_nat_add_code_suppl AS src
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
		MERGE INTO aes2.ecs_spp_national_add_code AS tgt
USING WI_StageODS.aes2.ecs_spp_national_add_code AS src
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
		MERGE INTO aes2.ecs_spp_package AS tgt
USING WI_StageODS.aes2.ecs_spp_package AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.kind=src.kind, tgt.kind_spp=src.kind_spp, tgt.marks=src.marks, tgt.no_of_packages=src.no_of_packages, tgt.no_of_packages_spp=src.no_of_packages_spp, tgt.no_of_pieces=src.no_of_pieces, tgt.no_of_pieces_spp=src.no_of_pieces_spp, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, kind, kind_spp, marks, no_of_packages, no_of_packages_spp, no_of_pieces, no_of_pieces_spp, goods_item_id)
VALUES (src.id, src.kind, src.kind_spp, src.marks, src.no_of_packages, src.no_of_packages_spp, src.no_of_pieces, src.no_of_pieces_spp, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_prev_doc_proc_gosp' BEGIN
	MERGE INTO aes2.ecs_spp_prev_doc_proc_gosp AS tgt
USING WI_StageODS.aes2.ecs_spp_prev_doc_proc_gosp AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.ref=src.ref, tgt.ref_spp=src.ref_spp, tgt.type=src.type, tgt.type_spp=src.type_spp, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, ref, ref_spp, type, type_spp, goods_item_id)
VALUES (src.id, src.ref, src.ref_spp, src.type, src.type_spp, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_previous_document' BEGIN
		MERGE INTO aes2.ecs_spp_previous_document AS tgt
USING WI_StageODS.aes2.ecs_spp_previous_document AS src
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
		MERGE INTO aes2.ecs_spp_produced_document AS tgt
USING WI_StageODS.aes2.ecs_spp_produced_document AS src
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
		MERGE INTO aes2.ecs_spp_quantity_of_goods AS tgt
USING WI_StageODS.aes2.ecs_spp_quantity_of_goods AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.qualifier_of_unit=src.qualifier_of_unit, tgt.qualifier_of_unit_spp=src.qualifier_of_unit_spp, tgt.quantity=src.quantity, tgt.quantity_spp=src.quantity_spp, tgt.unit=src.unit, tgt.unit_spp=src.unit_spp, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, qualifier_of_unit, qualifier_of_unit_spp, quantity, quantity_spp, unit, unit_spp, goods_item_id)
VALUES (src.id, src.qualifier_of_unit, src.qualifier_of_unit_spp, src.quantity, src.quantity_spp, src.unit, src.unit_spp, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_special_mention' BEGIN
		MERGE INTO aes2.ecs_spp_special_mention AS tgt
USING WI_StageODS.aes2.ecs_spp_special_mention AS src
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
		MERGE INTO aes2.ecs_spp_tar_add_cod_spp AS tgt
USING WI_StageODS.aes2.ecs_spp_tar_add_cod_spp AS src
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
		MERGE INTO aes2.ecs_spp_taric_add_code AS tgt
USING WI_StageODS.aes2.ecs_spp_taric_add_code AS src
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
		MERGE INTO aes2.ecs_spp_tariff_measure AS tgt
USING WI_StageODS.aes2.ecs_spp_tariff_measure AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.geographical_area=src.geographical_area, tgt.geographical_area_spp=src.geographical_area_spp, tgt.order_no=src.order_no, tgt.order_no_spp=src.order_no_spp, tgt.series=src.series, tgt.series_spp=src.series_spp, tgt.suppl_unit=src.suppl_unit, tgt.suppl_unit_qualifier=src.suppl_unit_qualifier, tgt.suppl_unit_qualifier_spp=src.suppl_unit_qualifier_spp, tgt.suppl_unit_spp=src.suppl_unit_spp, tgt.taric_sid=src.taric_sid, tgt.taric_sid_spp=src.taric_sid_spp, tgt.type=src.type, tgt.type_spp=src.type_spp, tgt.goods_item_id=src.goods_item_id, tgt.tariff_measure_source=src.tariff_measure_source, tgt.footnotes=src.footnotes, tgt.archiv=src.archiv, tgt.rec_date=src.rec_date
WHEN NOT MATCHED
THEN INSERT (id, geographical_area, geographical_area_spp, order_no, order_no_spp, series, series_spp, suppl_unit, suppl_unit_qualifier, suppl_unit_qualifier_spp, suppl_unit_spp, taric_sid, taric_sid_spp, type, type_spp, goods_item_id, tariff_measure_source, footnotes, archiv, rec_date)
VALUES (src.id, src.geographical_area, src.geographical_area_spp, src.order_no, src.order_no_spp, src.series, src.series_spp, src.suppl_unit, src.suppl_unit_qualifier, src.suppl_unit_qualifier_spp, src.suppl_unit_spp, src.taric_sid, src.taric_sid_spp, src.type, src.type_spp, src.goods_item_id, src.tariff_measure_source, src.footnotes, src.archiv, src.rec_date);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_spp_tax' BEGIN
		MERGE INTO aes2.ecs_spp_tax AS tgt
USING WI_StageODS.aes2.ecs_spp_tax AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.amount=src.amount, tgt.amount_spp=src.amount_spp, tgt.base=src.base, tgt.base_spp=src.base_spp, tgt.method_of_payment=src.method_of_payment, tgt.method_of_payment_spp=src.method_of_payment_spp, tgt.rate=src.rate, tgt.rate_spp=src.rate_spp, tgt.type=src.type, tgt.type_spp=src.type_spp, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, amount, amount_spp, base, base_spp, method_of_payment, method_of_payment_spp, rate, rate_spp, type, type_spp, goods_item_id)
VALUES (src.id, src.amount, src.amount_spp, src.base, src.base_spp, src.method_of_payment, src.method_of_payment_spp, src.rate, src.rate_spp, src.type, src.type_spp, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_consignee_of_item' BEGIN
		MERGE INTO aes2.ecs_sum_consignee_of_item AS tgt
USING WI_StageODS.aes2.ecs_sum_consignee_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.eori=src.eori, tgt.goods_item_id=src.goods_item_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, eori, goods_item_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.eori, src.goods_item_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_container' BEGIN
		MERGE INTO aes2.ecs_sum_container AS tgt
USING WI_StageODS.aes2.ecs_sum_container AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.state_br=src.state_br, tgt.identity_f=src.identity_f, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, state_br, identity_f, goods_item_id)
VALUES (src.id, src.state_br, src.identity_f, src.goods_item_id);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_exporter_of_item' BEGIN
		MERGE INTO aes2.ecs_sum_exporter_of_item AS tgt
USING WI_StageODS.aes2.ecs_sum_exporter_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.eori=src.eori, tgt.goods_item_id=src.goods_item_id, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, eori, goods_item_id, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.eori, src.goods_item_id, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END

	IF @TableName = 'ecs_sum_package' BEGIN
		MERGE INTO aes2.ecs_sum_package AS tgt
USING WI_StageODS.aes2.ecs_sum_package AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.no_of_packages=src.no_of_packages, tgt.no_of_pieces=src.no_of_pieces, tgt.state_br=src.state_br, tgt.kind=src.kind, tgt.marks=src.marks, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, no_of_packages, no_of_pieces, state_br, kind, marks, goods_item_id)
VALUES (src.id, src.no_of_packages, src.no_of_pieces, src.state_br, src.kind, src.marks, src.goods_item_id);
		
	SET @Merged = 1;
	END	
	
	
	IF @TableName = 'ecs_sum_produced_document' BEGIN
		MERGE INTO aes2.ecs_sum_produced_document AS tgt
USING WI_StageODS.aes2.ecs_sum_produced_document AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.state_br=src.state_br, tgt.state_br_c=src.state_br_c, tgt.type=src.type, tgt.ref=src.ref, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, state_br, state_br_c, type, ref, goods_item_id)
VALUES (src.id, src.state_br, src.state_br_c, src.type, src.ref, src.goods_item_id);
		
	SET @Merged = 1;
	END	
	
	IF @TableName = 'ecs_sum_tariff_measure' BEGIN
		MERGE INTO aes2.ecs_sum_tariff_measure AS tgt
USING WI_StageODS.aes2.ecs_sum_tariff_measure AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.taric_sid=src.taric_sid, tgt.series=src.series, tgt.geographical_area=src.geographical_area, tgt.order_no=src.order_no, tgt.suppl_unit=src.suppl_unit, tgt.suppl_unit_qualifier=src.suppl_unit_qualifier, tgt.type=src.type, tgt.goods_item_id=src.goods_item_id, tgt.tariff_measure_source=src.tariff_measure_source, tgt.footnotes=src.footnotes, tgt.archiv=src.archiv, tgt.rec_date=src.rec_date
WHEN NOT MATCHED
THEN INSERT (id, taric_sid, series, geographical_area, order_no, suppl_unit, suppl_unit_qualifier, type, goods_item_id, tariff_measure_source, footnotes, archiv, rec_date)
VALUES (src.id, src.taric_sid, src.series, src.geographical_area, src.order_no, src.suppl_unit, src.suppl_unit_qualifier, src.type, src.goods_item_id, src.tariff_measure_source, src.footnotes, src.archiv, src.rec_date);
		
	SET @Merged = 1;
	END	
	IF @TableName = 'ecs_zwp_consignee_of_item' BEGIN
		MERGE INTO aes2.ecs_zwp_consignee_of_item AS tgt
USING WI_StageODS.aes2.ecs_zwp_consignee_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.goods_item_id=src.goods_item_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, goods_item_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.goods_item_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END	
	IF @TableName = 'ecs_zwp_container' BEGIN
		MERGE INTO aes2.ecs_zwp_container AS tgt
USING WI_StageODS.aes2.ecs_zwp_container AS src
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
		MERGE INTO aes2.ecs_zwp_exporter_of_item AS tgt
USING WI_StageODS.aes2.ecs_zwp_exporter_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.goods_item_id=src.goods_item_id, tgt.eori=src.eori, tgt.email=src.email, tgt.AEO_CERTIFICATE_GROUP_ID=src.AEO_CERTIFICATE_GROUP_ID
WHEN NOT MATCHED
THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, goods_item_id, eori, email, AEO_CERTIFICATE_GROUP_ID)
VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.goods_item_id, src.eori, src.email, src.AEO_CERTIFICATE_GROUP_ID);
		
	SET @Merged = 1;
	END	
	IF @TableName = 'ecs_zwp_item_pt_c' BEGIN
		MERGE INTO aes2.ecs_zwp_item_pt_c AS tgt
USING WI_StageODS.aes2.ecs_zwp_item_pt_c AS src
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
		MERGE INTO aes2.ecs_zwp_package AS tgt
USING WI_StageODS.aes2.ecs_zwp_package AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.no_of_packages=src.no_of_packages, tgt.kind=src.kind, tgt.no_of_pieces=src.no_of_pieces, tgt.state_br=src.state_br, tgt.marks=src.marks, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, no_of_packages, kind, no_of_pieces, state_br, marks, goods_item_id)
VALUES (src.id, src.no_of_packages, src.kind, src.no_of_pieces, src.state_br, src.marks, src.goods_item_id);
		
	SET @Merged = 1;
	END	
	IF @TableName = 'ecs_zwp_previous_document' BEGIN
		MERGE INTO aes2.ecs_zwp_previous_document AS tgt
USING WI_StageODS.aes2.ecs_zwp_previous_document AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.type_f=src.type_f, tgt.ref_f=src.ref_f, tgt.goods_item_id=src.goods_item_id
WHEN NOT MATCHED
THEN INSERT (id, type_f, ref_f, goods_item_id)
VALUES (src.id, src.type_f, src.ref_f, src.goods_item_id);
		
	SET @Merged = 1;
	END	
	IF @TableName = 'ecs_zwp_produced_document' BEGIN
		MERGE INTO aes2.ecs_zwp_produced_document AS tgt
USING WI_StageODS.aes2.ecs_zwp_produced_document AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.state_br=src.state_br, tgt.state_br_c=src.state_br_c, tgt.type_f=src.type_f, tgt.ref_t=src.ref_t, tgt.goods_item_id=src.goods_item_id, tgt.transit=src.transit
WHEN NOT MATCHED
THEN INSERT (id, state_br, state_br_c, type_f, ref_t, goods_item_id, transit)
VALUES (src.id, src.state_br, src.state_br_c, src.type_f, src.ref_t, src.goods_item_id, src.transit);
		
	SET @Merged = 1;
	END	
	IF @TableName = 'ecs_zwp_special_mention' BEGIN
		MERGE INTO aes2.ecs_zwp_special_mention AS tgt
USING WI_StageODS.aes2.ecs_zwp_special_mention AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.code=src.code, tgt.goods_item_id=src.goods_item_id, tgt.text=src.text, tgt.textlng=src.textlng
WHEN NOT MATCHED
THEN INSERT (id, code, goods_item_id, text, textlng)
VALUES (src.id, src.code, src.goods_item_id, src.text, src.textlng);
		
	SET @Merged = 1;
	END	
	IF @TableName = 'ecs_query_consignee_of_item' BEGIN
		MERGE INTO aes2.ecs_query_consignee_of_item AS tgt
USING WI_StageODS.aes2.ecs_query_consignee_of_item AS src
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
		MERGE INTO aes2.ecs_query_container AS tgt
USING WI_StageODS.aes2.ecs_query_container AS src
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
		MERGE INTO aes2.ecs_query_exporter_of_item AS tgt
USING WI_StageODS.aes2.ecs_query_exporter_of_item AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.city=src.city, tgt.country=src.country, tgt.name_f=src.name_f, tgt.postcode=src.postcode, tgt.street_and_no=src.street_and_no, tgt.tin=src.tin, tgt.gi_id=src.gi_id, tgt.email=src.email
WHEN NOT MATCHED
THEN INSERT (id, city, country, name_f, postcode, street_and_no, tin, gi_id, email)
VALUES (src.id, src.city, src.country, src.name_f, src.postcode, src.street_and_no, src.tin, src.gi_id, src.email);
		
	SET @Merged = 1;
	END	
	IF @TableName = 'ecs_query_package' BEGIN
		MERGE INTO aes2.ecs_query_package AS tgt
USING WI_StageODS.aes2.ecs_query_package AS src
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
		MERGE INTO aes2.ecs_query_previous_document AS tgt
USING WI_StageODS.aes2.ecs_query_previous_document AS src
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
		MERGE INTO aes2.ecs_query_produced_document AS tgt
USING WI_StageODS.aes2.ecs_query_produced_document AS src
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
		MERGE INTO aes2.ecs_query_special_mention AS tgt
USING WI_StageODS.aes2.ecs_query_special_mention AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.code=src.code, tgt.text=src.text, tgt.text_lang=src.text_lang, tgt.gi_id=src.gi_id
WHEN NOT MATCHED
THEN INSERT (id, code, text, text_lang, gi_id)
VALUES (src.id, src.code, src.text, src.text_lang, src.gi_id);
		
	SET @Merged = 1;
	END	

	IF @TableName = 'aes_other' BEGIN
		MERGE INTO aes2.aes_other AS tgt
		USING WI_StageODS.aes2.aes_other AS src
		ON (tgt.decl_id=src.decl_id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.status=src.status, tgt.source_document_number=src.source_document_number, tgt.gross_mass=src.gross_mass, tgt.nett_mass=src.nett_mass, tgt.co_declaration=src.co_declaration, tgt.co_destination=src.co_destination, tgt.acceptance_date=src.acceptance_date, tgt.closing_date=src.closing_date, tgt.closing_date_limit=src.closing_date_limit, tgt.quantity=src.quantity, tgt.type=src.type, tgt.procedure_s=src.procedure_s, tgt.goods_description=src.goods_description, tgt.currency=src.currency, tgt.value=src.value, tgt.identity_of_transport=src.identity_of_transport, tgt.means_of_transport=src.means_of_transport, tgt.measure_unit=src.measure_unit, tgt.kind_of_packages=src.kind_of_packages, tgt.number_of_packages=src.number_of_packages, tgt.marks_of_packages=src.marks_of_packages, tgt.reamarks=src.reamarks, tgt.assigned_flag=src.assigned_flag, tgt.assigned_date=src.assigned_date
		WHEN NOT MATCHED
		THEN INSERT (decl_id, status, source_document_number, gross_mass, nett_mass, co_declaration, co_destination, acceptance_date, closing_date, closing_date_limit, quantity, type, procedure_s, goods_description, currency, value, identity_of_transport, means_of_transport, measure_unit, kind_of_packages, number_of_packages, marks_of_packages, reamarks, assigned_flag, assigned_date)
		VALUES (src.decl_id, src.status, src.source_document_number, src.gross_mass, src.nett_mass, src.co_declaration, src.co_destination, src.acceptance_date, src.closing_date, src.closing_date_limit, src.quantity, src.type, src.procedure_s, src.goods_description, src.currency, src.value, src.identity_of_transport, src.means_of_transport, src.measure_unit, src.kind_of_packages, src.number_of_packages, src.marks_of_packages, src.reamarks, src.assigned_flag, src.assigned_date);		
	SET @Merged = 1;
	END
	
	IF @TableName = 'aes_other_trader' BEGIN
		MERGE INTO aes2.aes_other_trader AS tgt
		USING WI_StageODS.aes2.aes_other_trader AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.street_and_no=src.street_and_no, tgt.postcode=src.postcode, tgt.city=src.city, tgt.name_f=src.name_f, tgt.country=src.country, tgt.tin=src.tin, tgt.regon=src.regon, tgt.other_decl_id=src.other_decl_id, tgt.eori=src.eori, tgt.email=src.email, tgt.aeo_certificate_group_id=src.aeo_certificate_group_id, tgt.type=src.type
		WHEN NOT MATCHED
		THEN INSERT (id, street_and_no, postcode, city, name_f, country, tin, regon, other_decl_id, eori, email, aeo_certificate_group_id, type)
		VALUES (src.id, src.street_and_no, src.postcode, src.city, src.name_f, src.country, src.tin, src.regon, src.other_decl_id, src.eori, src.email, src.aeo_certificate_group_id, src.type);		
	SET @Merged = 1;
	END
	
	IF @TableName = 'aes_other_destination' BEGIN
		MERGE INTO aes2.aes_other_destination AS tgt
		USING WI_StageODS.aes2.aes_other_destination AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.decl_id=src.decl_id, tgt.mrn=src.mrn, tgt.gross_mass=src.gross_mass, tgt.assigned_date=src.assigned_date, tgt.return_date=src.return_date, tgt.quantity=src.quantity, tgt.type=src.type, tgt.measure_unit=src.measure_unit, tgt.kind_of_packages=src.kind_of_packages, tgt.number_of_packages=src.number_of_packages, tgt.marks_of_packages=src.marks_of_packages, tgt.reamarks=src.reamarks
		WHEN NOT MATCHED
		THEN INSERT (id, decl_id, mrn, gross_mass, assigned_date, return_date, quantity, type, measure_unit, kind_of_packages, number_of_packages, marks_of_packages, reamarks)
		VALUES (src.id, src.decl_id, src.mrn, src.gross_mass, src.assigned_date, src.return_date, src.quantity, src.type, src.measure_unit, src.kind_of_packages, src.number_of_packages, src.marks_of_packages, src.reamarks);		
	SET @Merged = 1;
	END	

	IF @TableName = 'aes_psw' BEGIN
		MERGE INTO aes2.aes_psw AS tgt
		USING WI_StageODS.aes2.aes_psw AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.zcp_id=src.zcp_id, tgt.psw_status=src.psw_status, tgt.psw_prln_date=src.psw_prln_date, tgt.psw_prln_justification=src.psw_prln_justification, tgt.psw_srd_print=src.psw_srd_print, tgt.psw_prln_mrn=src.psw_prln_mrn, tgt.psw_time_to_autoprocess=src.psw_time_to_autoprocess, tgt.acceptance_date_time=src.acceptance_date_time, tgt.psw_proposal_date=src.psw_proposal_date, tgt.psw_proposal_justif=src.psw_proposal_justif, tgt.declaration_co=src.declaration_co, tgt.calc_date=src.calc_date, tgt.regi_date=src.regi_date, tgt.zcp_system_number=src.zcp_system_number, tgt.gross_mass=src.gross_mass, tgt.no_of_items=src.no_of_items, tgt.number_of_packages=src.number_of_packages, tgt.additional_decl_type=src.additional_decl_type, tgt.containers=src.containers, tgt.acceptance_date=src.acceptance_date, tgt.cr_code=src.cr_code, tgt.P1C=src.P1C, tgt.psw_digital_signature=src.psw_digital_signature, tgt.autorized_ex=src.autorized_ex
		WHEN NOT MATCHED
		THEN INSERT (id, zcp_id, psw_status, psw_prln_date, psw_prln_justification, psw_srd_print, psw_prln_mrn, psw_time_to_autoprocess, acceptance_date_time, psw_proposal_date, psw_proposal_justif, declaration_co, calc_date, regi_date, zcp_system_number, gross_mass, no_of_items, number_of_packages, additional_decl_type, containers, acceptance_date, cr_code, P1C, psw_digital_signature, autorized_ex)
		VALUES (src.id, src.zcp_id, src.psw_status, src.psw_prln_date, src.psw_prln_justification, src.psw_srd_print, src.psw_prln_mrn, src.psw_time_to_autoprocess, src.acceptance_date_time, src.psw_proposal_date, src.psw_proposal_justif, src.declaration_co, src.calc_date, src.regi_date, src.zcp_system_number, src.gross_mass, src.no_of_items, src.number_of_packages, src.additional_decl_type, src.containers, src.acceptance_date, src.cr_code, src.P1C, src.psw_digital_signature, src.autorized_ex);
	SET @Merged = 1;
	END

	IF @TableName = 'aes_psw_additional_info' BEGIN
		MERGE INTO aes2.aes_psw_additional_info AS tgt
		USING WI_StageODS.aes2.aes_psw_additional_info AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.psw_id=src.psw_id, tgt.code=src.code, tgt.description=src.description
		WHEN NOT MATCHED
		THEN INSERT (id, psw_id, code, description)
		VALUES (src.id, src.psw_id, src.code, src.description);
	SET @Merged = 1;
	END

	IF @TableName = 'aes_psw_address' BEGIN
		MERGE INTO aes2.aes_psw_address AS tgt
		USING WI_StageODS.aes2.aes_psw_address AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.zip_code=src.zip_code, tgt.country=src.country, tgt.city=src.city, tgt.street_and_no=src.street_and_no
		WHEN NOT MATCHED
		THEN INSERT (id, zip_code, country, city, street_and_no)
		VALUES (src.id, src.zip_code, src.country, src.city, src.street_and_no);
	SET @Merged = 1;
	END

	IF @TableName = 'aes_psw_business_entity_ai' BEGIN
		MERGE INTO aes2.aes_psw_business_entity_ai AS tgt
		USING WI_StageODS.aes2.aes_psw_business_entity_ai AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.psw_business_entity_id=src.psw_business_entity_id, tgt.code=src.code
		WHEN NOT MATCHED
		THEN INSERT (id, psw_business_entity_id, code)
		VALUES (src.id, src.psw_business_entity_id, src.code);
	SET @Merged = 1;
	END

	IF @TableName = 'aes_psw_doc_signer' BEGIN
		MERGE INTO aes2.aes_psw_doc_signer AS tgt
		USING WI_StageODS.aes2.aes_psw_doc_signer AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.email=src.email, tgt.name=src.name, tgt.surname=src.surname, tgt.criminal_liab_cert=src.criminal_liab_cert, tgt.phone=src.phone, tgt.customs_agent_entry_date=src.customs_agent_entry_date, tgt.customs_agent_entry_no=src.customs_agent_entry_no
		WHEN NOT MATCHED
		THEN INSERT (id, email, name, surname, criminal_liab_cert, phone, customs_agent_entry_date, customs_agent_entry_no)
		VALUES (src.id, src.email, src.name, src.surname, src.criminal_liab_cert, src.phone, src.customs_agent_entry_date, src.customs_agent_entry_no);
	SET @Merged = 1;
	END


	IF @TableName = 'aes_psw_item' BEGIN
		MERGE INTO aes2.aes_psw_item AS tgt
		USING WI_StageODS.aes2.aes_psw_item AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.psw_id=src.psw_id, tgt.item_no=src.item_no, tgt.p1c=src.p1c, tgt.cus_code=src.cus_code, tgt.item_code=src.item_code, tgt.item_description=src.item_description, tgt.net_mass_kg=src.net_mass_kg, tgt.gross_mass_kg=src.gross_mass_kg, tgt.be_receiver_id=src.be_receiver_id, tgt.be_sender_id=src.be_sender_id, tgt.be_seller_id=src.be_seller_id, tgt.be_buyer_id=src.be_buyer_id
		WHEN NOT MATCHED
		THEN INSERT (id, psw_id, item_no, p1c, cus_code, item_code, item_description, net_mass_kg, gross_mass_kg, be_receiver_id, be_sender_id, be_seller_id, be_buyer_id)
		VALUES (src.id, src.psw_id, src.item_no, src.p1c, src.cus_code, src.item_code, src.item_description, src.net_mass_kg, src.gross_mass_kg, src.be_receiver_id, src.be_sender_id, src.be_seller_id, src.be_buyer_id);
	SET @Merged = 1;
	END

	IF @TableName = 'aes_psw_business_entity' BEGIN
		MERGE INTO aes2.aes_psw_business_entity AS tgt
		USING WI_StageODS.aes2.aes_psw_business_entity AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.psw_address_id=src.psw_address_id, tgt.psw_doc_signer_id=src.psw_doc_signer_id, tgt.email=src.email, tgt.eori=src.eori, tgt.identifier=src.identifier, tgt.name=src.name, tgt.regon=src.regon, tgt.tin=src.tin, tgt.be_outpost=src.be_outpost, tgt.representative_type=src.representative_type, tgt.aeo_certificate_group_id=src.aeo_certificate_group_id, tgt.customer_type=src.customer_type, tgt.decl_id=src.decl_id
		WHEN NOT MATCHED
		THEN INSERT (id, psw_address_id, psw_doc_signer_id, email, eori, identifier, name, regon, tin, be_outpost, representative_type, aeo_certificate_group_id, customer_type, decl_id)
		VALUES (src.id, src.psw_address_id, src.psw_doc_signer_id, src.email, src.eori, src.identifier, src.name, src.regon, src.tin, src.be_outpost, src.representative_type, src.aeo_certificate_group_id, src.customer_type, src.decl_id);
	SET @Merged = 1;
	END

	IF @TableName = 'aes_psw_item_add_info' BEGIN
		MERGE INTO aes2.aes_psw_item_add_info AS tgt
		USING WI_StageODS.aes2.aes_psw_item_add_info AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.psw_item_id=src.psw_item_id, tgt.code=src.code, tgt.description=src.description
		WHEN NOT MATCHED
		THEN INSERT (id, psw_item_id, code, description)
		VALUES (src.id, src.psw_item_id, src.code, src.description);
	SET @Merged = 1;
	END

	IF @TableName = 'AES_PSW_ITEM_CONTAINER' BEGIN
		MERGE INTO aes2.AES_PSW_ITEM_CONTAINER AS tgt
		USING WI_StageODS.aes2.AES_PSW_ITEM_CONTAINER AS src
		ON (tgt.ID=src.ID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.PSW_ITEM_ID=src.PSW_ITEM_ID, tgt.CONTAINER_NUMBER=src.CONTAINER_NUMBER
		WHEN NOT MATCHED
		THEN INSERT (ID, PSW_ITEM_ID, CONTAINER_NUMBER)
		VALUES (src.ID, src.PSW_ITEM_ID, src.CONTAINER_NUMBER);
	SET @Merged = 1;
	END

	IF @TableName = 'aes_psw_item_pack' BEGIN
		MERGE INTO aes2.aes_psw_item_pack AS tgt
		USING WI_StageODS.aes2.aes_psw_item_pack AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.psw_item_id=src.psw_item_id, tgt.pack_quantity=src.pack_quantity, tgt.pack_number_sign=src.pack_number_sign, tgt.pack_type=src.pack_type
		WHEN NOT MATCHED
		THEN INSERT (id, psw_item_id, pack_quantity, pack_number_sign, pack_type)
		VALUES (src.id, src.psw_item_id, src.pack_quantity, src.pack_number_sign, src.pack_type);
	SET @Merged = 1;
	END

	IF @TableName = 'aes_psw_item_prev_doc' BEGIN
		MERGE INTO aes2.aes_psw_item_prev_doc AS tgt
		USING WI_StageODS.aes2.aes_psw_item_prev_doc AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.psw_item_id=src.psw_item_id, tgt.category=src.category, tgt.code=src.code, tgt.number=src.number, tgt.prev_doc_no=src.prev_doc_no
		WHEN NOT MATCHED
		THEN INSERT (id, psw_item_id, category, code, number, prev_doc_no)
		VALUES (src.id, src.psw_item_id, src.category, src.code, src.number, src.prev_doc_no);
	SET @Merged = 1;
	END

	IF @TableName = 'aes_psw_item_req_doc' BEGIN
		MERGE INTO aes2.aes_psw_item_req_doc AS tgt
		USING WI_StageODS.aes2.aes_psw_item_req_doc AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.psw_item_id=src.psw_item_id, tgt.doc_code=src.doc_code, tgt.doc_number=src.doc_number, tgt.doc_notes=src.doc_notes, tgt.item_quantity=src.item_quantity, tgt.quantity_unit=src.quantity_unit, tgt.agrim_result=src.agrim_result, tgt.agrim_discrep_info=src.agrim_discrep_info, tgt.poz_id=src.poz_id, tgt.institution_name=src.institution_name, tgt.expiration_date=src.expiration_date, tgt.Identifier=src.Identifier
		WHEN NOT MATCHED
		THEN INSERT (id, psw_item_id, doc_code, doc_number, doc_notes, item_quantity, quantity_unit, agrim_result, agrim_discrep_info, poz_id, institution_name, expiration_date, Identifier)
		VALUES (src.id, src.psw_item_id, src.doc_code, src.doc_number, src.doc_notes, src.item_quantity, src.quantity_unit, src.agrim_result, src.agrim_discrep_info, src.poz_id, src.institution_name, src.expiration_date, src.Identifier);
	SET @Merged = 1;
	END

	IF @TableName = 'aes_psw_natural_person' BEGIN
		MERGE INTO aes2.aes_psw_natural_person AS tgt
		USING WI_StageODS.aes2.aes_psw_natural_person AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.psw_address_id=src.psw_address_id, tgt.psw_doc_signer_id=src.psw_doc_signer_id, tgt.identifier=src.identifier, tgt.name=src.name, tgt.surname=src.surname, tgt.id_no=src.id_no, tgt.pesel=src.pesel, tgt.representative_type=src.representative_type, tgt.be_outpost=src.be_outpost, tgt.decl_id=src.decl_id, tgt.customer_type=src.customer_type
		WHEN NOT MATCHED
		THEN INSERT (id, psw_address_id, psw_doc_signer_id, identifier, name, surname, id_no, pesel, representative_type, be_outpost, decl_id, customer_type)
		VALUES (src.id, src.psw_address_id, src.psw_doc_signer_id, src.identifier, src.name, src.surname, src.id_no, src.pesel, src.representative_type, src.be_outpost, src.decl_id, src.customer_type);
	SET @Merged = 1;
	END

	IF @TableName = 'aes_psw_natural_pers_add_info' BEGIN
		MERGE INTO aes2.aes_psw_natural_pers_add_info AS tgt
		USING WI_StageODS.aes2.aes_psw_natural_pers_add_info AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.psw_natural_person_id=src.psw_natural_person_id, tgt.code=src.code
		WHEN NOT MATCHED
		THEN INSERT (id, psw_natural_person_id, code)
		VALUES (src.id, src.psw_natural_person_id, src.code);
	SET @Merged = 1;
	END


		IF (@Merged = 0)
		BEGIN
				DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
				THROW 51002, @Info, 0;
					END
				END
			;