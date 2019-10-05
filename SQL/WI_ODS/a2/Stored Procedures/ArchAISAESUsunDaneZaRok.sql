--========================================
--Author: Tomasz Pióro
--Date: 2014-08-12
--Description: Procedura usuwania danych za konkretny rok w systemie AISAES.
--========================================

CREATE PROCEDURE [a2].[ArchAISAESUsunDaneZaRok]
	@Rok int
AS
	DECLARE @DataOd DATE = DATEFROMPARTS(@Rok+0, 1, 1);
	DECLARE @DataDo DATE = DATEFROMPARTS(@Rok+1, 1, 1);

	SET XACT_ABORT ON;
	BEGIN TRANSACTION;

	DELETE e  FROM [aies].[ICS_ENS_CUST] e
	INNER JOIN aies.ICS_ENS i ON i.[ID] = e.ENS_ID
	WHERE (i.REGI_DATE >= @DataOd and i.REGI_DATE < @DataDo) OR (i.ACCP_DATE >= @DataOd and i.ACCP_DATE < @DataDo);

	DELETE e FROM [aies].[ICS_ENS_ITEMS] e
	INNER JOIN aies.ICS_ENS i ON i.[ID] = e.[ENS_ID]
	WHERE (i.REGI_DATE >= @DataOd and i.REGI_DATE < @DataDo) OR (i.ACCP_DATE >= @DataOd and i.ACCP_DATE < @DataDo);
	
	DELETE e FROM [aies].[ICS_ENS_SUBS_ENTR] e
	INNER JOIN aies.ICS_ENS i ON i.ID = e.ENS_ID
	WHERE (i.REGI_DATE >= @DataOd and i.REGI_DATE < @DataDo) OR (i.ACCP_DATE >= @DataOd and i.ACCP_DATE < @DataDo);

	DELETE e FROM [aies].[ICS_ENS_SEALS] e
	INNER JOIN aies.ICS_ENS i ON i.ID = e.ENS_ID
	WHERE (i.REGI_DATE >= @DataOd and i.REGI_DATE < @DataDo) OR (i.ACCP_DATE >= @DataOd and i.ACCP_DATE < @DataDo);

	DELETE e FROM [aies].[ICS_ENS_ITI] e
	INNER JOIN aies.ICS_ENS i ON i.ID = e.ENS_ID
	WHERE (i.REGI_DATE >= @DataOd and i.REGI_DATE < @DataDo) OR (i.ACCP_DATE >= @DataOd and i.ACCP_DATE < @DataDo);

	DELETE i FROM [aies].[ICS_ENS] i
	WHERE (i.REGI_DATE >= @DataOd and i.REGI_DATE < @DataDo) OR (i.ACCP_DATE >= @DataOd and i.ACCP_DATE < @DataDo);

	DELETE e FROM [aies].[ICS_GAN_CUST_DATA_DETL] e
	INNER JOIN aies.ICS_GAN_CUST_DATA d ON d.ID = e.GAN_CUST_DATA_ID
	 INNER JOIN aies.ICS_GAN_ITEMS i ON i.ID = d.GAN_ITEM_ID
	INNER JOIN aies.ICS_GAN g ON g.ID = i.GAN_ID
	WHERE (g.REGI_DATE >= @DataOd and g.REGI_DATE < @DataDo) OR (g.ACCP_DATE >= @DataOd and g.ACCP_DATE < @DataDo);
	
	DELETE e FROM [aies].[ICS_GAN_CUST_DATA] e
	INNER JOIN aies.ICS_GAN_ITEMS i ON i.[ID] = e.GAN_ITEM_ID
	INNER JOIN aies.ICS_GAN g ON g.[ID] = i.GAN_ID
	WHERE (g.REGI_DATE >= @DataOd and g.REGI_DATE < @DataDo) OR (g.ACCP_DATE >= @DataOd and g.ACCP_DATE < @DataDo);
	
	DELETE e FROM [aies].[ICS_GAN_ITEMS] e
	INNER JOIN [aies].[ICS_GAN] g ON g.[ID] = e.GAN_ID
	WHERE (g.REGI_DATE >= @DataOd and g.REGI_DATE < @DataDo) OR (g.ACCP_DATE >= @DataOd and g.ACCP_DATE < @DataDo);

	DELETE e FROM [aies].[ICS_GAN_CUST] e
	INNER JOIN [aies].[ICS_GAN] g ON g.[ID] = e.GAN_ID
	WHERE (g.REGI_DATE >= @DataOd and g.REGI_DATE < @DataDo) OR (g.ACCP_DATE >= @DataOd and g.ACCP_DATE < @DataDo);

	DELETE i FROM [aies].[ICS_GAN] i
	WHERE (i.REGI_DATE >= @DataOd and i.REGI_DATE < @DataDo) or (i.ACCP_DATE >= @DataOd and i.ACCP_DATE < @DataDo);

	DELETE e FROM [aies].[ICS_ENS_PROD_DOCU] e
	INNER JOIN aies.ICS_ENS_ITEMS i ON i.[ID] = e.ENS_ITEM_ID
	INNER JOIN aies.ICS_ENS en ON en.ID = i.ENS_ID
	WHERE (en.REGI_DATE >= @DataOd and en.REGI_DATE < @DataDo) OR (en.ACCP_DATE >= @DataOd and en.ACCP_DATE < @DataDo);

	DELETE e FROM [aies].[ICS_ENS_SPEC_MENT] e
	INNER JOIN aies.ICS_ENS_ITEMS i ON i.[ID] = e.ENS_ITEM_ID
	INNER JOIN aies.ICS_ENS en ON en.ID = i.ENS_ID
	WHERE (en.REGI_DATE >= @DataOd and en.REGI_DATE < @DataDo) OR (en.ACCP_DATE >= @DataOd and en.ACCP_DATE < @DataDo);

	DELETE e FROM [aies].[ICS_ENS_ITEM_TRANS] e
	INNER JOIN aies.ICS_ENS_ITEMS i ON i.[ID] = e.ENS_ITEM_ID
	INNER JOIN aies.ICS_ENS en ON en.ID = i.ENS_ID
	WHERE (en.REGI_DATE >= @DataOd and en.REGI_DATE < @DataDo) OR (en.ACCP_DATE >= @DataOd and en.ACCP_DATE < @DataDo);
	
	DELETE e FROM [aies].[ICS_ENS_ITEM_ADD_INFO] e
	INNER JOIN aies.ICS_ENS_ITEMS i ON i.[ID] = e.ENS_ITEM_ID
	INNER JOIN aies.ICS_ENS en ON en.ID = i.ENS_ID
	WHERE (en.REGI_DATE >= @DataOd and en.REGI_DATE < @DataDo) OR (en.ACCP_DATE >= @DataOd and en.ACCP_DATE < @DataDo);

	DELETE e FROM [aies].[ICS_ENS_ITEM_PACK] e
	INNER JOIN aies.ICS_ENS_ITEMS i ON i.[ID] = e.ENS_ITEM_ID
	INNER JOIN aies.ICS_ENS en ON en.ID = i.ENS_ID
	WHERE (en.REGI_DATE >= @DataOd and en.REGI_DATE < @DataDo) OR (en.ACCP_DATE >= @DataOd and en.ACCP_DATE < @DataDo);

	DELETE e FROM [aies].[ICS_ENS_ITEM_CONT] e
	INNER JOIN aies.ICS_ENS_ITEMS i ON i.[ID] = e.ENS_ITEM_ID
	INNER JOIN aies.ICS_ENS en ON en.ID = i.ENS_ID
	WHERE (en.REGI_DATE >= @DataOd and en.REGI_DATE < @DataDo) OR (en.ACCP_DATE >= @DataOd and en.ACCP_DATE < @DataDo);

	DELETE e FROM [aies].[ICS_ENS_ITEM_CUST] e
	INNER JOIN aies.ICS_ENS_ITEMS i ON i.[ID] = e.ENS_ITEM_ID
	INNER JOIN aies.ICS_ENS en ON en.ID = i.ENS_ID
	WHERE (en.REGI_DATE >= @DataOd and en.REGI_DATE < @DataDo) OR (en.ACCP_DATE >= @DataOd and en.ACCP_DATE < @DataDo);

	DELETE e  FROM [aies].[ecs_exp_prev_doc_proc_gosp] e
	INNER JOIN aies.ecs_exp_declcoexport d ON e.goods_item_id = d.decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_provisional_document] e
	INNER JOIN aies.ecs_exp_declcoexport d ON e.goods_item_id = d.decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_exporter_of_item] e
	INNER JOIN aies.ecs_zwp_goods_item g ON g.id = e.goods_item_id
	INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = g.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_container] e
	INNER JOIN aies.ecs_zwp_goods_item g ON g.id = e.goods_item_id
	INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = g.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_consignee_of_item] e
	INNER JOIN aies.ecs_zwp_goods_item g ON g.id = e.goods_item_id
	INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = g.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_special_mention] e
	INNER JOIN aies.ecs_zwp_goods_item g ON g.id = e.goods_item_id
	INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = g.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_previous_document] e
	INNER JOIN aies.ecs_zwp_goods_item g ON g.id = e.goods_item_id
	INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = g.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_produced_document] e
	INNER JOIN aies.ecs_zwp_goods_item g ON g.id = e.goods_item_id
	INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = g.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_package] e
	INNER JOIN aies.ecs_zwp_goods_item g ON g.id = e.goods_item_id
	INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = g.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_item_pt_c] e
	INNER JOIN aies.ecs_zwp_goods_item g ON g.id = e.goods_item_id
	INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = g.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_goods_item] e
	INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = e.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_exporter] e
    INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = e.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_decl_pt_c] e
    INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = e.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_consignee] e
    INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = e.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_trader_at_present] e
	INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = e.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_seal] e
    INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = e.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_risk_analysis] e
    INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = e.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_itinerary] e
    INNER JOIN aies.ecs_zwp_declcopresent d ON d.decl_id = e.declcopresent_decl_id
	WHERE d.zwp_acceptance_date >= @DataOd and d.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_zwp_declcopresent] e
	WHERE e.zwp_acceptance_date >= @DataOd and e.zwp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_special_mention] e
	INNER JOIN aies.ecs_query_goods_item g ON g.id = e.gi_id
	INNER JOIN aies.ecs_query_exportquery q ON q.q_acceptance_date = g.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_exporter_of_item] e
	INNER JOIN aies.ecs_query_goods_item g ON g.id = e.gi_id
	INNER JOIN aies.ecs_query_exportquery q ON q.q_acceptance_date = g.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_produced_document] e
	INNER JOIN aies.ecs_query_goods_item g ON g.id = e.gi_id
	INNER JOIN aies.ecs_query_exportquery q ON q.q_acceptance_date = g.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_container] e
	INNER JOIN aies.ecs_query_goods_item g ON g.id = e.gi_id
	INNER JOIN aies.ecs_query_exportquery q ON q.q_acceptance_date = g.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_previous_document] e
	INNER JOIN aies.ecs_query_goods_item g ON g.id = e.gi_id
	INNER JOIN aies.ecs_query_exportquery q ON q.q_acceptance_date = g.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_consignee_of_item] e
	INNER JOIN aies.ecs_query_goods_item g ON g.id = e.gi_id
	INNER JOIN aies.ecs_query_exportquery q ON q.q_acceptance_date = g.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_package] e
	INNER JOIN aies.ecs_query_goods_item g ON g.id = e.gi_id
	INNER JOIN aies.ecs_query_exportquery q ON q.q_acceptance_date = g.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_goods_item] e
	INNER JOIN [aies].[ecs_query_exportquery] q ON q.q_query_decl_id = e.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_exporter] e
	INNER JOIN aies.ecs_query_exportquery q ON q.q_query_decl_id = e.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_seal] e
	INNER JOIN aies.ecs_query_exportquery q ON q.q_query_decl_id = e.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_risk_analysis] e
	INNER JOIN aies.ecs_query_exportquery q ON q.q_query_decl_id = e.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_consignee] e
	INNER JOIN aies.ecs_query_exportquery q ON q.q_query_decl_id = e.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_itinerary] e
	INNER JOIN aies.ecs_query_exportquery q ON q.q_query_decl_id = e.exportquery_id
	WHERE q.q_acceptance_date >= @DataOd and q.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_query_exportquery] e
	WHERE e.q_acceptance_date >= @DataOd and e.q_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_trader_at_exit] e
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = e.exs_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_consignee] e
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = e.sumdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_declarant] e
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = e.sumdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_exporter] e
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = e.sumdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_itinerary] e
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = e.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_seal] e
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = e.sumdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_submitter] e
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = e.sumdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_exporter_of_item] e
    INNER JOIN aies.ecs_sum_goods_item i ON e.goods_item_id = i.id
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = i.sumdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_consignee_of_item] e
    INNER JOIN aies.ecs_sum_goods_item i ON e.goods_item_id = i.id
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = i.sumdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_container] e
    INNER JOIN aies.ecs_sum_goods_item i ON e.goods_item_id = i.id
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = i.sumdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_tariff_measure] e
    INNER JOIN aies.ecs_sum_goods_item i ON e.goods_item_id = i.id
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = i.sumdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_package] e
    INNER JOIN aies.ecs_sum_goods_item i ON e.goods_item_id = i.id
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = i.sumdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_produced_document] e
	INNER JOIN aies.ecs_sum_goods_item i ON e.goods_item_id = i.id
	INNER JOIN aies.ecs_sum_declcoexit d ON d.decl_id = i.sumdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_goods_item] e
	INNER JOIN aies.ecs_sum_declcoexit d ON d.[decl_id] = e.sumdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_sum_declcoexit] e
	WHERE e.exp_acceptance_date >= @DataOd and e.exp_acceptance_date < @DataOd;

	DELETE e FROM [aies].[ecs_spp_exporter_of_item] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_tax] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_container] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_package] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_national_add_code] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_nat_add_code_suppl] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_consignee_of_item] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e  FROM [aies].[ecs_spp_quantity_of_goods] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_produced_document] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_previous_document] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_prev_doc_proc_gosp] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_tariff_measure] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_taric_add_code] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_tar_add_cod_spp] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_special_mention] e
	INNER JOIN aies.ecs_spp_goods_item g ON  g.id = e.goods_item_id
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = g.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_goods_item] e
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = e.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_deferred_payment] e
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = e.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_declarant] e
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = e.[declcoexpsuppl_decl_id]
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_consignee] e
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = e.declcosuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_seal_suppl] e
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = e.declcoexp_spp_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_seal] e
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = e.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_itinerary] e
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON d.decl_id = e.declcoexpsuppl_decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_exporter] e
	INNER JOIN aies.ecs_spp_declcoexpsuppl d ON e.declcoexportsuppl_decl_id = d.decl_id
	WHERE (d.pad_date >= @DataOd and d.pad_date < @DataDo) OR (d.spp_link_date >= @DataOd and d.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_spp_declcoexpsuppl] e
	WHERE (e.pad_date >= @DataOd and e.pad_date < @DataDo) OR (e.spp_link_date >= @DataOd and e.spp_link_date < @DataDo);

	DELETE e FROM [aies].[ecs_mft_customsdata] e
	INNER JOIN aies.ecs_mft_goodsitem g ON g.[id] = e.goods_item_id
    INNER JOIN aies.ecs_mft_manifest m ON m.decl_id = g.id
	WHERE m.mf_acceptance_date >= @DataOd and m.mf_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_mft_goodsitem] e
	INNER JOIN aies.ecs_mft_manifest m ON m.decl_id = e.manifest_decl_id
	WHERE m.mf_acceptance_date >= @DataOd and m.mf_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_mft_trader_at_exit] e
    INNER JOIN aies.ecs_mft_manifest m ON m.decl_id = e.manifest_decl_id
	WHERE m.mf_acceptance_date >= @DataOd and m.mf_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_mft_manifest] e
	WHERE e.mf_acceptance_date >= @DataOd and e.mf_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_container] e
	INNER JOIN aies.ecs_los_goods_item i ON i.id = e.goods_item_id
	INNER JOIN aies.ecs_los_declcoexit d ON d.decl_id = i.losdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_consignee_of_item] e
	INNER JOIN aies.ecs_los_goods_item i ON i.id = e.goods_item_id
	INNER JOIN aies.ecs_los_declcoexit d ON d.decl_id = i.losdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_produced_document] e
	INNER JOIN aies.ecs_los_goods_item i ON i.id = e.goods_item_id
	INNER JOIN aies.ecs_los_declcoexit d ON d.decl_id = i.losdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_package] e
	INNER JOIN aies.ecs_los_goods_item i ON i.id = e.goods_item_id
	INNER JOIN aies.ecs_los_declcoexit d ON d.decl_id = i.losdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_exporter_of_item] e
	INNER JOIN aies.ecs_los_goods_item i ON i.id = e.goods_item_id
	INNER JOIN aies.ecs_los_declcoexit d ON d.decl_id = i.losdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_goods_item] e
	INNER JOIN aies.ecs_los_declcoexit d ON d.decl_id = e.losdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_submitter] e
	INNER JOIN aies.ecs_los_declcoexit d ON d.decl_id = e.losdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_itinerary] e
	INNER JOIN [aies].[ecs_los_declcoexit] d ON d.decl_id = e.losdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_exporter] e
	INNER JOIN aies.ecs_los_declcoexit d ON d.decl_id = e.losdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_consignee] e
	INNER JOIN aies.ecs_los_declcoexit d ON d.decl_id = e.losdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_seal] e
	INNER JOIN aies.ecs_los_declcoexit d ON e.losdeclcoexit_decl_id = d.decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_risk_analysis] e
	INNER JOIN aies.ecs_los_declcoexit d ON d.decl_id = e.losdeclcoexit_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_declarant] e
	INNER JOIN aies.ecs_los_declcoexit d ON e.losdeclcoexit_decl_id = d.decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_los_declcoexit] e
	WHERE e.exp_acceptance_date >= @DataOd and e.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_container] e
	INNER JOIN aies.ecs_ext_goods_item d ON d.id = e.goods_item_id
	INNER JOIN aies.ecs_ext_declcoexit t ON t.decl_id = d.declcoexit_decl_id
	WHERE t.ext_acceptance_date >= @DataOd and t.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_item_br_c] e
	INNER JOIN aies.ecs_ext_goods_item d ON d.id = e.goods_item_id
	INNER JOIN aies.ecs_ext_declcoexit t ON t.decl_id = d.declcoexit_decl_id
	WHERE t.ext_acceptance_date >= @DataOd and t.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_consignee_of_item] e
	INNER JOIN aies.ecs_ext_goods_item d ON d.id = e.goods_item_id
	INNER JOIN aies.ecs_ext_declcoexit t ON t.decl_id = d.declcoexit_decl_id
	WHERE t.ext_acceptance_date >= @DataOd and t.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_exporter_of_item] e
	INNER JOIN aies.ecs_ext_goods_item d ON d.id = e.goods_item_id
	INNER JOIN aies.ecs_ext_declcoexit t ON t.decl_id = d.declcoexit_decl_id
	WHERE t.ext_acceptance_date >= @DataOd and t.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_package] e
	INNER JOIN aies.ecs_ext_goods_item d ON d.id = e.goods_item_id
	INNER JOIN aies.ecs_ext_declcoexit t ON t.decl_id = d.declcoexit_decl_id
	WHERE t.ext_acceptance_date >= @DataOd and t.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_previous_document] e
	INNER JOIN aies.ecs_ext_goods_item d ON d.id = e.goods_item_id
	INNER JOIN aies.ecs_ext_declcoexit t ON t.decl_id = d.declcoexit_decl_id
	WHERE t.ext_acceptance_date >= @DataOd and t.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_produced_document] e
	INNER JOIN aies.ecs_ext_goods_item d ON d.id = e.goods_item_id
	INNER JOIN aies.ecs_ext_declcoexit t ON t.decl_id = d.declcoexit_decl_id
	WHERE t.ext_acceptance_date >= @DataOd and t.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_special_mention] e
    INNER JOIN aies.ecs_ext_goods_item d ON d.id = e.goods_item_id
	INNER JOIN aies.ecs_ext_declcoexit t ON t.decl_id = d.declcoexit_decl_id
	WHERE t.ext_acceptance_date >= @DataOd and t.ext_acceptance_date < @DataDo;

	DELETE e  FROM [aies].[ecs_ext_goods_item] e
    INNER JOIN aies.ecs_ext_declcoexit d ON d.decl_id = e.declcoexit_decl_id
	WHERE d.ext_acceptance_date >= @DataOd and d.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_itinerary] e
    INNER JOIN aies.ecs_ext_declcoexit d ON d.decl_id = e.declcoexit_decl_id
	WHERE d.ext_acceptance_date >= @DataOd and d.ext_acceptance_date < @DataDo;

	DELETE e  FROM [aies].[ecs_ext_additional_info] e
	INNER JOIN aies.ecs_ext_declcoexit d ON d.decl_id = e.declcoexit_decl_id
	WHERE d.ext_acceptance_date >= @DataOd and d.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_risk_analysis] e
    INNER JOIN aies.ecs_ext_declcoexit d ON d.decl_id = e.declcoexit_decl_id
	WHERE d.ext_acceptance_date >= @DataOd and d.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_trader_at_exit] e
	INNER JOIN aies.ecs_ext_declcoexit d ON d.decl_id = e.declcoexit_decl_id
	WHERE d.ext_acceptance_date >= @DataOd and d.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_consignee] e
	INNER JOIN aies.ecs_ext_declcoexit d ON d.decl_id = e.declcoexit_decl_id
	WHERE d.ext_acceptance_date >= @DataOd and d.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_decl_br_c] e
     INNER JOIN aies.ecs_ext_declcoexit d ON d.decl_id = e.declcoexit_decl_id
	WHERE d.ext_acceptance_date >= @DataOd and d.ext_acceptance_date < @DataDo;
	
	DELETE e FROM [aies].[ecs_ext_exporter] e
	INNER JOIN aies.ecs_ext_declcoexit d ON d.decl_id = e.declcoexit_decl_id
	WHERE d.ext_acceptance_date >= @DataOd and d.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_seal] e
	INNER JOIN aies.ecs_ext_declcoexit d ON d.decl_id = e.decl_id
	WHERE d.ext_acceptance_date >= @DataOd and d.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_declcoexit] e
	WHERE e.ext_acceptance_date >= @DataOd and e.ext_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_followup] e
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = e.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_previous_document] e
	INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_prev_doc_proc_gosp] e
    INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_consignee_of_item] e
    INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_container] e
    INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_correction] e
    INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_item_br_c] e
    INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_exporter_of_item] e
    INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_national_add_code] e
    INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_package] e
    INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_produced_document] e
    INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_quantity_of_goods] e
    INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_ext_special_mention] e
    INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_taric_add_code] e
	INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_tariff_measure] e
	INNER JOIN aies.ecs_exp_goods_item i ON e.goods_item_id = i.[id]
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_tax] e
	INNER JOIN aies.ecs_exp_goods_item i ON i.[id] = e.goods_item_id
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = i.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_goods_item] e
	INNER JOIN aies.ecs_exp_declcoexport d ON e.declcoexport_decl_id = d.decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_trader_at_present] e
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = e.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_stat_requ] e
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = e.decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_consignee] e
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = e.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_declarant] e
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = e.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_item_br_c] e
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = e.goods_item_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_exporter] e
	INNER JOIN [aies].ecs_exp_declcoexport d ON d.decl_id = e.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_seal] e
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = e.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_cancellation_request] e
	INNER JOIN [aies].[ecs_exp_declcoexport] d ON e.declcoexport_decl_id =d.decl_id
	WHERE d.[exp_acceptance_date] >= @DataOd and [d].[exp_acceptance_date] < @DataDo;

	DELETE e FROM [aies].[ecs_exp_itinerary] e
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = e.declcoexport_decl_id
	WHERE d.[exp_acceptance_date] >= @DataOd and d.[exp_acceptance_date]< @DataDo;

	DELETE e FROM [aies].[ecs_exp_deferred_payment] e
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = e.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_card3_receipient] e
	INNER JOIN aies.ecs_exp_declcoexport d ON d.decl_id = e.declcoexport_decl_id
	WHERE d.exp_acceptance_date >= @DataOd and d.exp_acceptance_date < @DataDo;

	DELETE e FROM [aies].[ecs_exp_declcoexport] e
	WHERE e.exp_acceptance_date >= @DataOd AND e.exp_acceptance_date < @DataDo;

	COMMIT TRANSACTION;

RETURN 0