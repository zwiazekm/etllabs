

-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-14
-- Description:	Procedura merge'ująca w schemacie NCTS.
-- =============================================

CREATE PROCEDURE [ncts].[MergeAllNCTS1FromStageODS]
AS
BEGIN
	SET NOCOUNT ON;

		EXEC [ncts].[MergeTableFromStageODS] ADD_INF_REQ_TYP;
		EXEC [ncts].[MergeTableFromStageODS] ADD_INF_RESP_TYP;
		EXEC [ncts].[MergeTableFromStageODS] ARE;
		-- EXEC [ncts].[MergeTableFromStageODS] COL_EXIT; //brak w źródle
		EXEC [ncts].[MergeTableFromStageODS] CONTR_RES_TYP;
		EXEC [ncts].[MergeTableFromStageODS] CONTR_TRANS_OPER_DESCR;
		EXEC [ncts].[MergeTableFromStageODS] CROSS_BORD_TYP;
		EXEC [ncts].[MergeTableFromStageODS] CUST_OFF;
		EXEC [ncts].[MergeTableFromStageODS] CUST_OFF_INF;
		EXEC [ncts].[MergeTableFromStageODS] DECL_TYP;
		EXEC [ncts].[MergeTableFromStageODS] DOC_TYP;
		EXEC [ncts].[MergeTableFromStageODS] ENQ_INF_COD_TYP;
		EXEC [ncts].[MergeTableFromStageODS] ENQ_REQ_INF_COD_TYP;
		EXEC [ncts].[MergeTableFromStageODS] ENQ_RESP_COD_TYP;
		EXEC [ncts].[MergeTableFromStageODS] ENQUIRY_INF;
		EXEC [ncts].[MergeTableFromStageODS] ENQUIRY_INF_REQ;
		EXEC [ncts].[MergeTableFromStageODS] ENQUIRY_REQUEST;
		EXEC [ncts].[MergeTableFromStageODS] ENQUIRY_RESPONSE;
		EXEC [ncts].[MergeTableFromStageODS] GUARANTEE_TYP;
		EXEC [ncts].[MergeTableFromStageODS] INV_GUARANTEE_REAS;
		EXEC [ncts].[MergeTableFromStageODS] LANG;
		-- EXEC [ncts].[MergeTableFromStageODS] MEAS_UNIT; //brak w SSIS
		EXEC [ncts].[MergeTableFromStageODS] OFF_ROL_TYP;
		EXEC [ncts].[MergeTableFromStageODS] PACK_TYP;
		EXEC [ncts].[MergeTableFromStageODS] RECOVERY_ACCEPTANCE;
		EXEC [ncts].[MergeTableFromStageODS] RECOVERY_DISPATCH;
		EXEC [ncts].[MergeTableFromStageODS] RECOVERY_GUARANTEE;
		EXEC [ncts].[MergeTableFromStageODS] RECOVERY_GUARANTOR;
		EXEC [ncts].[MergeTableFromStageODS] RECOVERY_REQUEST;
		EXEC [ncts].[MergeTableFromStageODS] RISK_ANA_TYP;
		-- EXEC [ncts].[MergeTableFromStageODS] SEARCHTERMS; //brak w źródle
		EXEC [ncts].[MergeTableFromStageODS] SENS_GOODS_CLASS;
		EXEC [ncts].[MergeTableFromStageODS] SPEC_CIRC_IND;
		EXEC [ncts].[MergeTableFromStageODS] SPEC_MENT_TYP;
		EXEC [ncts].[MergeTableFromStageODS] SPEC_NOT_COD;
		EXEC [ncts].[MergeTableFromStageODS] TRAD_SP_AUTH_ID;
		EXEC [ncts].[MergeTableFromStageODS] TRADS;
		EXEC [ncts].[MergeTableFromStageODS] TRAFF_TYP;
		EXEC [ncts].[MergeTableFromStageODS] TRANS_CHRG_METH;
		EXEC [ncts].[MergeTableFromStageODS] TRANS_OPER_STAT_TYP_NAZWY;
		EXEC [ncts].[MergeTableFromStageODS] TRANSH_CONT;
		EXEC [ncts].[MergeTableFromStageODS] TRANSP_MOD;
		EXEC [ncts].[MergeTableFromStageODS] UN_DANGER_GOODS;

		EXEC [ncts].[MergeTableFromStageODS] ADD_INF_REQ_TYP_NAM;
		EXEC [ncts].[MergeTableFromStageODS] ADD_INF_RESP_TYP_NAM;
		EXEC [ncts].[MergeTableFromStageODS] ARE_ACT;
		EXEC [ncts].[MergeTableFromStageODS] CONTR_GOODS_ITEM;
		EXEC [ncts].[MergeTableFromStageODS] CONTR_RES_TYP_NAM;
		EXEC [ncts].[MergeTableFromStageODS] CONTR_TRANS_OPER_DET;
		EXEC [ncts].[MergeTableFromStageODS] CROSS_BORD_TYP_DESCR;
		EXEC [ncts].[MergeTableFromStageODS] CUST_OFF_ACT;
		-- EXEC [ncts].[MergeTableFromStageODS] CUST_OFF_TYP; //brak w analizie
		EXEC [ncts].[MergeTableFromStageODS] DECL_TYP_NAM;
		EXEC [ncts].[MergeTableFromStageODS] DOC_TYP_NAM;
		EXEC [ncts].[MergeTableFromStageODS] EN_ROUT_EVENT;
		EXEC [ncts].[MergeTableFromStageODS] ENQ_COMM;
		EXEC [ncts].[MergeTableFromStageODS] ENQ_INF_COD_TYP_NAM;
		EXEC [ncts].[MergeTableFromStageODS] ENQ_INF_REQ;
		EXEC [ncts].[MergeTableFromStageODS] ENQ_INF_RESP;
		EXEC [ncts].[MergeTableFromStageODS] ENQ_REQ_INF_COD_TYP_NAM;
		EXEC [ncts].[MergeTableFromStageODS] ENQ_RESP_COD_TYP_NAM;
		EXEC [ncts].[MergeTableFromStageODS] ENQUIRY_INF_DET;
		EXEC [ncts].[MergeTableFromStageODS] ENQUIRY_INF_REQ_DET;
		EXEC [ncts].[MergeTableFromStageODS] GUARANTEE_TYP_NAM;
		EXEC [ncts].[MergeTableFromStageODS] INV_GUARANTEE_REAS_NAM;
		EXEC [ncts].[MergeTableFromStageODS] LANG_NAM;
		--EXEC [ncts].[MergeTableFromStageODS] MEAS_UNIT_NAM; // brak w SSIS
		EXEC [ncts].[MergeTableFromStageODS] OFF_ROL_TYP_DESCR;
		EXEC [ncts].[MergeTableFromStageODS] PACK_TYP_NAM;
		EXEC [ncts].[MergeTableFromStageODS] RISK_ANA_TYP_NAM;
		EXEC [ncts].[MergeTableFromStageODS] RISK_ANA_TYP_NAM_PL;
		EXEC [ncts].[MergeTableFromStageODS] RISK_ANA_TYP_NAM_PL_100;
		EXEC [ncts].[MergeTableFromStageODS] RISK_ANA_TYP_NAM_PL_234;
		EXEC [ncts].[MergeTableFromStageODS] RISK_ANA_TYP_NAM_PL_305;
		--EXEC [ncts].[MergeTableFromStageODS] SENS_GOODS_CLASS_DESCR; // brak w SSIS
		EXEC [ncts].[MergeTableFromStageODS] SP_AUTH_GOODS_EXCL;
		EXEC [ncts].[MergeTableFromStageODS] SPEC_CIRC_IND_NAM;
		EXEC [ncts].[MergeTableFromStageODS] SPEC_MENT_TYP_NAM;
		EXEC [ncts].[MergeTableFromStageODS] SPEC_NOT_COD_NAM;
		EXEC [ncts].[MergeTableFromStageODS] TRAD;
		EXEC [ncts].[MergeTableFromStageODS] TRAD_OFF_SP_AUTH;
		EXEC [ncts].[MergeTableFromStageODS] TRAFF_TYP_DESCR;
		EXEC [ncts].[MergeTableFromStageODS] TRANS_CHRG_METH_NAM;
		EXEC [ncts].[MergeTableFromStageODS] TRANS_OPER_MESS;
		EXEC [ncts].[MergeTableFromStageODS] TRANS_OPER_UNL;
		EXEC [ncts].[MergeTableFromStageODS] TRANSP_MOD_DESCR;
		EXEC [ncts].[MergeTableFromStageODS] UN_DANGER_GOODS_NAM;

		EXEC [ncts].[MergeTableFromStageODS] ARE_DET;
		EXEC [ncts].[MergeTableFromStageODS] ARE_NAM;
		EXEC [ncts].[MergeTableFromStageODS] CONTR_GOODS_ITEM_CONT;
		EXEC [ncts].[MergeTableFromStageODS] CONTR_GOODS_ITEM_DESCR;
		EXEC [ncts].[MergeTableFromStageODS] CONTR_GOODS_ITEM_DOC;
		EXEC [ncts].[MergeTableFromStageODS] CONTR_GOODS_ITEM_PACK;
		EXEC [ncts].[MergeTableFromStageODS] CONTR_GOODS_ITEM_SENS;
		EXEC [ncts].[MergeTableFromStageODS] CONTR_GOODS_ITEM_SPEC_MENT;
		EXEC [ncts].[MergeTableFromStageODS] CUST_OFF_ADDR;
		EXEC [ncts].[MergeTableFromStageODS] CUST_OFF_NAM;
		EXEC [ncts].[MergeTableFromStageODS] CUST_OFF_ROL;
		EXEC [ncts].[MergeTableFromStageODS] EN_ROUT_EVENT_DET;
		EXEC [ncts].[MergeTableFromStageODS] ENQ_REM;
		EXEC [ncts].[MergeTableFromStageODS] TRAD_OFF_SP_AUTH_LOC;
		EXEC [ncts].[MergeTableFromStageODS] TRAD_SP_AUTH;

		EXEC [ncts].[MergeTableFromStageODS] SP_AUTH_CONTR_LOC;
		EXEC [ncts].[MergeTableFromStageODS] TRANS_OPER;

		EXEC [ncts].[MergeTableFromStageODS] ITINERARY;
		EXEC [ncts].[MergeTableFromStageODS] TRADER_ENQUIRY_REQ;
		EXEC [ncts].[MergeTableFromStageODS] TRADER_ENQUIRY_RESP;
		EXEC [ncts].[MergeTableFromStageODS] TRANS_OPER_RISK_PL;
		EXEC [ncts].[MergeTableFromStageODS] TRANS_OPER_VERS;

		EXEC [ncts].[MergeTableFromStageODS] DECL_GOODS_ITEM;
		EXEC [ncts].[MergeTableFromStageODS] DECL_TRANS_OPER_DET;
		EXEC [ncts].[MergeTableFromStageODS] GUARANTEE_I;
		EXEC [ncts].[MergeTableFromStageODS] SEAL_DET;
		EXEC [ncts].[MergeTableFromStageODS] TRANS_OPER_PASS;

		EXEC [ncts].[MergeTableFromStageODS] DECL_GOODS_ITEM_CONT;
		EXEC [ncts].[MergeTableFromStageODS] DECL_GOODS_ITEM_DOC;
		EXEC [ncts].[MergeTableFromStageODS] DECL_GOODS_ITEM_PACK;
		EXEC [ncts].[MergeTableFromStageODS] DECL_GOODS_ITEM_SENS;
		EXEC [ncts].[MergeTableFromStageODS] DECL_GOODS_ITEM_SPEC_MENT;
		EXEC [ncts].[MergeTableFromStageODS] GUARANTEE_REF;
		EXEC [ncts].[MergeTableFromStageODS] SEAL_DET_VERS;
		EXEC [ncts].[MergeTableFromStageODS] TRANS_OPER_STAT_HIST;

		EXEC [ncts].[MergeTableFromStageODS] GUARANTEE_VAL_LIM;

	/* procedura mergujące do starego procesu.
		EXEC [ncts].[MergeTableFromStageODS] 'ADD_INF_REQ_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'ADD_INF_RESP_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'ARE';
		EXEC [ncts].[MergeTableFromStageODS] 'CONTR_RES_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'CONTR_TRANS_OPER_DESCR';
		EXEC [ncts].[MergeTableFromStageODS] 'CROSS_BORD_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'CUST_OFF';
		EXEC [ncts].[MergeTableFromStageODS] 'DECL_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'DOC_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQ_INF_COD_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQ_REQ_INF_COD_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQ_RESP_COD_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQUIRY_INF';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQUIRY_INF_REQ';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQUIRY_REQUEST';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQUIRY_RESPONSE';
		EXEC [ncts].[MergeTableFromStageODS] 'GUARANTEE_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'INV_GUARANTEE_REAS';
		EXEC [ncts].[MergeTableFromStageODS] 'LANG';
		EXEC [ncts].[MergeTableFromStageODS] 'OFF_ROL_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'PACK_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'RECOVERY_ACCEPTANCE';
		EXEC [ncts].[MergeTableFromStageODS] 'RECOVERY_DISPATCH';
		EXEC [ncts].[MergeTableFromStageODS] 'RECOVERY_GUARANTEE';
		EXEC [ncts].[MergeTableFromStageODS] 'RECOVERY_GUARANTOR';
		EXEC [ncts].[MergeTableFromStageODS] 'RECOVERY_REQUEST';
		EXEC [ncts].[MergeTableFromStageODS] 'RISK_ANA_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'SENS_GOODS_CLASS';
		EXEC [ncts].[MergeTableFromStageODS] 'SPEC_CIRC_IND';
		EXEC [ncts].[MergeTableFromStageODS] 'SPEC_MENT_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'SPEC_NOT_COD';
		EXEC [ncts].[MergeTableFromStageODS] 'TRAD_SP_AUTH_ID';
		EXEC [ncts].[MergeTableFromStageODS] 'TRADS';
		EXEC [ncts].[MergeTableFromStageODS] 'TRAFF_TYP';
		EXEC [ncts].[MergeTableFromStageODS] 'TRANS_CHRG_METH';
		EXEC [ncts].[MergeTableFromStageODS] 'TRANS_OPER_STAT_TYP_NAZWY';
		EXEC [ncts].[MergeTableFromStageODS] 'TRANSH_CONT';
		EXEC [ncts].[MergeTableFromStageODS] 'TRANSP_MOD';
		EXEC [ncts].[MergeTableFromStageODS] 'UN_DANGER_GOODS';
		EXEC [ncts].[MergeTableFromStageODS] 'ADD_INF_REQ_TYP_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'ADD_INF_RESP_TYP_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'ARE_ACT';
		EXEC [ncts].[MergeTableFromStageODS] 'CONTR_GOODS_ITEM';
		EXEC [ncts].[MergeTableFromStageODS] 'CONTR_RES_TYP_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'CONTR_TRANS_OPER_DET';
		EXEC [ncts].[MergeTableFromStageODS] 'CROSS_BORD_TYP_DESCR';
		EXEC [ncts].[MergeTableFromStageODS] 'CUST_OFF_ACT';
		EXEC [ncts].[MergeTableFromStageODS] 'CUST_OFF_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'CUST_OFF_INF';
		EXEC [ncts].[MergeTableFromStageODS] 'DECL_TYP_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'DOC_TYP_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'EN_ROUT_EVENT';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQ_COMM';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQ_INF_COD_TYP_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQ_INF_REQ';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQ_INF_RESP';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQ_RESP_COD_TYP_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQUIRY_INF_DET';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQUIRY_INF_REQ_DET';
		EXEC [ncts].[MergeTableFromStageODS] 'GUARANTEE_TYP_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'INV_GUARANTEE_REAS_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'LANG_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'OFF_ROL_TYP_DESCR';
		EXEC [ncts].[MergeTableFromStageODS] 'PACK_TYP_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'RISK_ANA_TYP_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'RISK_ANA_TYP_NAM_PL';
		EXEC [ncts].[MergeTableFromStageODS] 'RISK_ANA_TYP_NAM_PL_100';
		EXEC [ncts].[MergeTableFromStageODS] 'RISK_ANA_TYP_NAM_PL_234';
		EXEC [ncts].[MergeTableFromStageODS] 'RISK_ANA_TYP_NAM_PL_305';
		EXEC [ncts].[MergeTableFromStageODS] 'SENS_GOODS_CLASS_DESCR';
		EXEC [ncts].[MergeTableFromStageODS] 'SP_AUTH_GOODS_EXCL';
		EXEC [ncts].[MergeTableFromStageODS] 'SPEC_CIRC_IND_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'SPEC_MENT_TYP_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'SPEC_NOT_COD_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'TRAD';
		EXEC [ncts].[MergeTableFromStageODS] 'TRAD_OFF_SP_AUTH';
		EXEC [ncts].[MergeTableFromStageODS] 'TRAFF_TYP_DESCR';
		EXEC [ncts].[MergeTableFromStageODS] 'TRANS_CHRG_METH_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'TRANS_OPER_MESS';
		EXEC [ncts].[MergeTableFromStageODS] 'TRANS_OPER_UNL';
		EXEC [ncts].[MergeTableFromStageODS] 'UN_DANGER_GOODS_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'ARE_DET';
		EXEC [ncts].[MergeTableFromStageODS] 'ARE_NAM';
		EXEC [ncts].[MergeTableFromStageODS] 'CONTR_GOODS_ITEM_CONT';
		EXEC [ncts].[MergeTableFromStageODS] 'CONTR_GOODS_ITEM_DESCR';
		EXEC [ncts].[MergeTableFromStageODS] 'CONTR_GOODS_ITEM_DOC';
		EXEC [ncts].[MergeTableFromStageODS] 'CONTR_GOODS_ITEM_PACK';
		EXEC [ncts].[MergeTableFromStageODS] 'CONTR_GOODS_ITEM_SENS';
		EXEC [ncts].[MergeTableFromStageODS] 'CONTR_GOODS_ITEM_SPEC_MENT';
		EXEC [ncts].[MergeTableFromStageODS] 'CUST_OFF_ADDR';
		EXEC [ncts].[MergeTableFromStageODS] 'CUST_OFF_ROL';
		EXEC [ncts].[MergeTableFromStageODS] 'EN_ROUT_EVENT_DET';
		EXEC [ncts].[MergeTableFromStageODS] 'ENQ_REM';
		EXEC [ncts].[MergeTableFromStageODS] 'TRAD_OFF_SP_AUTH_LOC';
		EXEC [ncts].[MergeTableFromStageODS] 'SP_AUTH_CONTR_LOC';
		EXEC [ncts].[MergeTableFromStageODS] 'TRAD_SP_AUTH';
		EXEC [ncts].[MergeTableFromStageODS] 'TRANS_OPER';
		EXEC [ncts].[MergeTableFromStageODS] 'ITINERARY';
		EXEC [ncts].[MergeTableFromStageODS] 'TRADER_ENQUIRY_REQ';
		EXEC [ncts].[MergeTableFromStageODS] 'TRADER_ENQUIRY_RESP';
		EXEC [ncts].[MergeTableFromStageODS] 'TRANS_OPER_RISK_PL';	
		EXEC [ncts].[MergeTableFromStageODS] 'TRANS_OPER_VERS';			
		EXEC [ncts].[MergeTableFromStageODS] 'DECL_GOODS_ITEM';
		EXEC [ncts].[MergeTableFromStageODS] 'DECL_TRANS_OPER_DET';
		EXEC [ncts].[MergeTableFromStageODS] 'GUARANTEE_I';
		EXEC [ncts].[MergeTableFromStageODS] 'SEAL_DET';
		EXEC [ncts].[MergeTableFromStageODS] 'TRANS_OPER_PASS';
		EXEC [ncts].[MergeTableFromStageODS] 'DECL_GOODS_ITEM_CONT';
		EXEC [ncts].[MergeTableFromStageODS] 'DECL_GOODS_ITEM_DOC';
		EXEC [ncts].[MergeTableFromStageODS] 'DECL_GOODS_ITEM_PACK';
		EXEC [ncts].[MergeTableFromStageODS] 'DECL_GOODS_ITEM_SENS';
		EXEC [ncts].[MergeTableFromStageODS] 'DECL_GOODS_ITEM_SPEC_MENT';
		EXEC [ncts].[MergeTableFromStageODS] 'GUARANTEE_REF';
		EXEC [ncts].[MergeTableFromStageODS] 'SEAL_DET_VERS';
		EXEC [ncts].[MergeTableFromStageODS] 'TRANS_OPER_STAT_HIST';
		EXEC [ncts].[MergeTableFromStageODS] 'GUARANTEE_VAL_LIM';
		EXEC [ncts].[MergeTableFromStageODS] 'TRANSP_MOD_DESCR';
	*/	


		
END