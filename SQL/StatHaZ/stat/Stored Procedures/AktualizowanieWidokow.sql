CREATE PROCEDURE stat.AktualizowanieWidokow
	@GeneracjaId int
AS
--////////CELINA///////--
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_v2_dok_info', 'stat.dgt_kopia_v2_dok_info', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_v2_sad_dpdz_tow', 'stat.dgt_kopia_v2_sad_dpdz_tow', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_v2_dok_sad', 'stat.dgt_kopia_v2_dok_sad', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_v2_sad_transport', 'stat.dgt_kopia_v2_sad_transport', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_v2_sad_uc', 'stat.dgt_kopia_v2_sad_uc', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_v2_sad_odbiorca', 'stat.dgt_kopia_v2_sad_odbiorca', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_v2_sad_nadawca', 'stat.dgt_kopia_v2_sad_nadawca', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_v2_sl_pac', 'stat.dgt_kopia_v2_sl_pac', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_v2_sl_transport', 'stat.dgt_kopia_v2_sl_transport', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_v2_sl_rodz_transakcji', 'stat.dgt_kopia_v2_sl_rodz_transakcji', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_v2_sl_procedura', 'stat.dgt_kopia_v2_sl_procedura', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_sl_war_dostaw', 'stat.dgt_kopia_sl_war_dostaw', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_v2_kontrahenci', 'stat.dgt_kopia_v2_kontrahenci', @GeneracjaId;
--////////ECS///////--
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_declcoexport', 'stat.dgt_kopia_ecs_exp_declcoexport', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_goods_item', 'stat.dgt_kopia_ecs_exp_goods_item', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_seal', 'stat.dgt_kopia_ecs_exp_seal', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_declarant', 'stat.dgt_kopia_ecs_exp_declarant', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_card3_receipient', 'stat.dgt_kopia_ecs_exp_card3_receipient', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_deferred_payment', 'stat.dgt_kopia_ecs_exp_deferred_payment', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_itinerary', 'stat.dgt_kopia_ecs_exp_itinerary', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_cancellation_request', 'stat.dgt_kopia_ecs_exp_cancellation_request', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_customs_decl', 'stat.dgt_kopia_customs_decl', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_consignee', 'stat.dgt_kopia_ecs_exp_consignee', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_decl_br_c', 'stat.dgt_kopia_ecs_exp_decl_br_c', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_exporter', 'stat.dgt_kopia_ecs_exp_exporter', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_consignee_of_item', 'stat.dgt_kopia_ecs_exp_consignee_of_item', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_container', 'stat.dgt_kopia_ecs_exp_container', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_correction', 'stat.dgt_kopia_ecs_exp_correction', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_exporter_of_item', 'stat.dgt_kopia_ecs_exp_exporter_of_item', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_item_br_c', 'stat.dgt_kopia_ecs_exp_item_br_c', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_national_add_code', 'stat.dgt_kopia_ecs_exp_national_add_code', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_package', 'stat.dgt_kopia_ecs_exp_package', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_taric_add_code', 'stat.dgt_kopia_ecs_exp_taric_add_code', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_produced_document', 'stat.dgt_kopia_ecs_exp_produced_document', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_previous_document', 'stat.dgt_kopia_ecs_exp_previous_document', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_quantity_of_goods', 'stat.dgt_kopia_ecs_exp_quantity_of_goods', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_tariff_measure', 'stat.dgt_kopia_ecs_exp_tariff_measure', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_tax', 'stat.dgt_kopia_ecs_exp_tax', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_ecs_exp_special_mention', 'stat.dgt_kopia_ecs_exp_special_mention', @GeneracjaId;
--//////INTRASTAT/////--
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_istat_dekl_wynik_dok', 'stat.dgt_kopia_istat_dekl_wynik_dok', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_istat_dekl_wynik_poz', 'stat.dgt_kopia_istat_dekl_wynik_poz', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_istat_dok_zrodlowy', 'stat.dgt_kopia_istat_dok_zrodlowy', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_intr_dane_pod', 'stat.dgt_kopia_intr_dane_pod', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_intr_rdin', 'stat.dgt_kopia_intr_rdin', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_intr_ape', 'stat.dgt_kopia_intr_ape', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_intr_wlasc_terytor', 'stat.dgt_kopia_intr_wlasc_terytor', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_poufnosc', 'stat.dgt_kopia_poufnosc', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_slowniki', 'stat.dgt_kopia_slowniki', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_kw_tabela', 'stat.dgt_kopia_kw_tabela', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_kw_kurs', 'stat.dgt_kopia_kw_kurs', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_istat_dekl_wynik_blad', 'stat.dgt_kopia_istat_dekl_wynik_blad', @GeneracjaId;
EXEC stat.AktualizowanieWidoku 'stat.dgv_kopia_intr_fwpdk', 'stat.dgt_kopia_intr_fwpdk', @GeneracjaId;