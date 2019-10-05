
CREATE VIEW wald.v_raport_wartosc_usunietych
AS
SELECT     wald.dgt_bledne_dane.bd_rodzaj, SUM(wald.wal_dgt_kopia_istat_dekl_wynik_poz.wartosc_stat) AS wart_stat
FROM         wald.dgt_bledne_dane INNER JOIN
                      wald.wal_dgt_kopia_istat_dekl_wynik_poz ON wald.dgt_bledne_dane.bd_id_dok = wald.wal_dgt_kopia_istat_dekl_wynik_poz.id_dok AND 
                      wald.dgt_bledne_dane.bd_id_dok_pozid = wald.wal_dgt_kopia_istat_dekl_wynik_poz.[PozId]
WHERE     (wald.dgt_bledne_dane.bd_do_usuniecia = 'T')
GROUP BY wald.dgt_bledne_dane.bd_rodzaj