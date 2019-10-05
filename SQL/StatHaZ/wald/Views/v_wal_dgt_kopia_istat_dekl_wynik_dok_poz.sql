CREATE VIEW wald.v_wal_dgt_kopia_istat_dekl_wynik_dok_poz
AS
SELECT     
	wald.wal_dgt_kopia_istat_dekl_wynik_dok.id_dok, 
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.[PozId], 
	wald.wal_dgt_kopia_istat_dekl_wynik_dok.typ, 
	wald.wal_dgt_kopia_istat_dekl_wynik_dok.RokMc, 
	wald.wal_dgt_kopia_istat_dekl_wynik_dok.nip_zobowiazanego, 
	wald.wal_dgt_kopia_istat_dekl_wynik_dok.regon_zobowiazanego, 
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.kod_towarowy, 
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.opis_towaru, 
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.kraj_przezn_wysyl, 
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.kraj_pochodzenia, 
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.masa_netto, 
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.uzup_jm, 
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.wartosc_faktury, 
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.wartosc_stat
FROM wald.wal_dgt_kopia_istat_dekl_wynik_dok 
INNER JOIN wald.wal_dgt_kopia_istat_dekl_wynik_poz ON 
	wald.wal_dgt_kopia_istat_dekl_wynik_dok.id_dok = wald.wal_dgt_kopia_istat_dekl_wynik_poz.id_dok