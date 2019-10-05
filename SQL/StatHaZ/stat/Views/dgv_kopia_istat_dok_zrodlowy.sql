CREATE VIEW stat.dgv_kopia_istat_dok_zrodlowy
AS
SELECT [czy_potw], [data_wpr_zrd], [email], [err_xml], [generacjaId], [id_dok_dekl_wynik], [id_dok_zrd], [id_jedn], [id_pliku], [regon], [rodz_dok_zrd], [sposob_wpr_zrd], [sym_dok_zrd], [wprowadzil], [xml]
FROM stat.dgt_kopia_istat_dok_zrodlowy
WHERE GeneracjaId = 201305002;