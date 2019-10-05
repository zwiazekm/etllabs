CREATE VIEW  wald.v_widelki_poprawa_reczna_EKSPORT_INTR_MASA_SZCZEG AS
SELECT  --TOP 100 PERCENT   
	wi.*, cn8.opis_cn,
	poz.opis_towaru, pod.regon, pod.nip, pod.nazwa
FROM         
wald.v_widelki_poprawa_reczna_EKSPORT_INTR_MASA wi INNER JOIN
wald.wal_dgt_kopia_istat_dekl_wynik_poz poz 
ON (wi.id_dok = poz.id_dok AND wi.id_dok_pozid = poz.[PozId]) INNER JOIN
wald.tbl_sl_taryfa_cn8 cn8 ON wi.kod_towarowy = cn8.kod_cn INNER JOIN
wald.wal_dgt_kopia_istat_dekl_wynik_dok dok ON wi.id_dok = dok.id_dok INNER JOIN
stat.dgt_kopia_intr_dane_pod pod ON 
(dok.regon_zobowiazanego = pod.regon and dok.nip_zobowiazanego = pod.nip)
--order by wi.kod_towarowy