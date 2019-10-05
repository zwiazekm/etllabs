CREATE  view [stat].dgv_kopia_istat_dekl_wynik_dok_poz
AS
SELECT     
dok.id_dok, 
dok.[Status] AS dok_status, 
dok.typ, 
--dok.miesiac, 
dok.numer, 
dok.nip_zobowiazanego, 
dok.regon_zobowiazanego, 
--dok.rok, 
dok.RokMc,
dok.wersja, 
poz.pozid, 
poz.[Status] AS poz_status, 
poz.komentarz, 
poz.opis_towaru, 
poz.kraj_przezn_wysyl, 
poz.warunki_dostawy, 
poz.rodzaj_transakcji, 
poz.rodzaj_transportu, 
poz.kod_towarowy, 
poz.kraj_pochodzenia, 
poz.masa_netto, 
poz.uzup_jm, 
poz.wartosc_faktury, 
poz.wartosc_stat, 
poz.wsk_progowy, 
poz.flaga, 
poz.semafor, 
poz.generacjaId
FROM         
[stat].dgt_kopia_istat_dekl_wynik_dok dok INNER JOIN
[stat].dgt_kopia_istat_dekl_wynik_poz poz ON 
dok.id_dok = poz.id_dok