CREATE VIEW stat.dgv_kopia_istat_dekl_wynik_poz
AS
SELECT [flaga], [generacjaId], [id_dok], [kod_towarowy], [komentarz], [kraj_pochodzenia], [kraj_przezn_wysyl], [masa_netto], [opis_towaru], [pozid], [rodzaj_transakcji], [rodzaj_transportu], [semafor], [Status], [uzup_jm], [wartosc_faktury], [wartosc_stat], [warunki_dostawy], [wsk_progowy]
FROM stat.dgt_kopia_istat_dekl_wynik_poz
WHERE GeneracjaId = 201305002;