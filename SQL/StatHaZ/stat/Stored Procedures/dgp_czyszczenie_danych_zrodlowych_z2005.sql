CREATE PROCEDURE [stat].[dgp_czyszczenie_danych_zrodlowych_z2005] AS

 -----------------------------------------------------------------------------------------------------------------------------------------
  
  -- intrastat
  declare @v_komunikat varchar(255)
    set @v_komunikat = 'START: dgp_czyszczenie_danych_zrodlowych_z2005'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
  
  insert into [stat].dgt_info select 'analiza: kontrola poprawności i modyfikacje - intrastat START', getdate ()

-- pcn, pcnp
print '-- pcn, pcnp'

update [stat].dgv_kopia_istat_dekl_wynik_poz
set kod_towarowy = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_istat_dekl_wynik_poz dwp,
dgv_kopia_istat_dekl_wynik_dok dwd
where (dwp.id_dok = dwd.id_dok)
and (bd_rodzaj = 'kod_towarowy')
and (dwp.kod_towarowy = bd_bledna_wartosc)
and (bd_id_dok = dwp.id_dok)
and (bd_id_dok_pozid =dwp.pozid)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - INTR: kod_towarowy' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator
--
-- kraj_pochodzenia
print '-- kraj_pochodzenia'

update [stat].dgv_kopia_istat_dekl_wynik_poz
set kraj_pochodzenia = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_istat_dekl_wynik_poz dwp,
dgv_kopia_istat_dekl_wynik_dok dwd
where (dwp.id_dok = dwd.id_dok)
and (bd_rodzaj = 'kraj_pochodzenia')
and isnull(dwp.kraj_pochodzenia,'a1') = isnull(bd_bledna_wartosc,'a1')
and (bd_id_dok = dwp.id_dok) 
and (bd_id_dok_pozid =dwp.pozid)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - INTR: kraj_pochodzenia' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- kraj_wysylki
print '-- kraj_wysylki'

update [stat].dgv_kopia_istat_dekl_wynik_poz
set kraj_przezn_wysyl = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_istat_dekl_wynik_poz dwp,
dgv_kopia_istat_dekl_wynik_dok dwd
where (dwp.id_dok = dwd.id_dok)
and (bd_rodzaj = 'kraj_przezn_wysyl')
and (isnull(dwp.kraj_przezn_wysyl,'') = isnull(bd_bledna_wartosc,''))
and (bd_id_dok = dwp.id_dok) 
and (bd_id_dok_pozid =dwp.pozid)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - INTR: kraj_przezn_wysyl' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator
--

-- rodzaj_transakcji
print '-- rodzaj_transakcji'

update [stat].dgv_kopia_istat_dekl_wynik_poz
set rodzaj_transakcji = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_istat_dekl_wynik_poz dwp,
dgv_kopia_istat_dekl_wynik_dok dwd
where (dwp.id_dok = dwd.id_dok)
and (bd_rodzaj = 'rodzaj_transakcji')
and (dwp.rodzaj_transakcji = bd_bledna_wartosc)
and (bd_id_dok = dwp.id_dok) 
and (bd_id_dok_pozid =dwp.pozid)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - INTR: rodzaj_transakcji' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator
--

-- kod_transportu
print '-- kod_transportu'

update [stat].dgv_kopia_istat_dekl_wynik_poz
set rodzaj_transportu = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_istat_dekl_wynik_poz dwp,
dgv_kopia_istat_dekl_wynik_dok dwd
where (dwp.id_dok = dwd.id_dok)
and (bd_rodzaj = 'rodzaj_transportu')
and (dwp.rodzaj_transportu = bd_bledna_wartosc)
and (bd_id_dok = dwp.id_dok) 
and (bd_id_dok_pozid =dwp.pozid)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - INTR: rodzaj_transportu' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- kod_warunkow_dostawy
print '-- kod_warunkow_dostawy'
-- 
update [stat].dgv_kopia_istat_dekl_wynik_poz
set warunki_dostawy = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_istat_dekl_wynik_poz dwp,
dgv_kopia_istat_dekl_wynik_dok dwd
where dwp.id_dok=dwd.id_dok 
and bd_rodzaj='warunki_dostawy'
and dwp.warunki_dostawy=bd_bledna_wartosc
and bd_id_dok = dwp.id_dok
and bd_id_dok_pozid =dwp.pozid

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - INTR: kod_warunkow_dostawy' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


update [stat].dgv_kopia_istat_dekl_wynik_poz
set warunki_dostawy = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_istat_dekl_wynik_poz dwp,
dgv_kopia_istat_dekl_wynik_dok dwd
where (dwp.id_dok = dwd.id_dok)
and (bd_rodzaj = 'warunki_dostawy')
and (dwp.warunki_dostawy = bd_bledna_wartosc)
and (bd_id_dok = dwp.id_dok) 
and (bd_id_dok_pozid =dwp.pozid)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - INTR: warunki_dostawy' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- masa_netto
print '-- masa_netto'

update [stat].dgv_kopia_istat_dekl_wynik_poz
set masa_netto = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_istat_dekl_wynik_poz dwp,
dgv_kopia_istat_dekl_wynik_dok dwd
where (dwp.id_dok = dwd.id_dok)
and (bd_rodzaj = 'masa_netto')
and (dwp.masa_netto = bd_bledna_wartosc)
and (bd_id_dok = dwp.id_dok)
and (bd_id_dok_pozid = dwp.pozid)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - INTR: masa_netto' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- ilosc
print '-- ilosc'

update [stat].dgv_kopia_istat_dekl_wynik_poz
set uzup_jm = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_istat_dekl_wynik_poz dwp,
dgv_kopia_istat_dekl_wynik_dok dwd
where (dwp.id_dok = dwd.id_dok)
and (bd_rodzaj = 'uzup_jm')
and (dwp.uzup_jm = bd_bledna_wartosc)
and (bd_id_dok = dwp.id_dok)
and (bd_id_dok_pozid = dwp.pozid)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - INTR: uzup_jm' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- wartosc_stat_zl
print '-- wartosc_stat_zl'

update [stat].dgv_kopia_istat_dekl_wynik_poz
set wartosc_stat = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_istat_dekl_wynik_poz dwp,
dgv_kopia_istat_dekl_wynik_dok dwd
where (dwp.id_dok = dwd.id_dok)
and (bd_rodzaj = 'wartosc_stat')
and (dwp.wartosc_stat = bd_bledna_wartosc)
and (bd_id_dok = dwp.id_dok) 
and (bd_id_dok_pozid = dwp.pozid)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - INTR: wartosc_stat' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


-- wartosc_faktury
print '-- wartosc_faktury'

update [stat].dgv_kopia_istat_dekl_wynik_poz
set wartosc_faktury = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_istat_dekl_wynik_poz dwp,
dgv_kopia_istat_dekl_wynik_dok dwd
where (dwp.id_dok = dwd.id_dok)
and (bd_rodzaj = 'wartosc_faktury')
and (dwp.wartosc_faktury = bd_bledna_wartosc)
and (bd_id_dok = dwp.id_dok) 
and (bd_id_dok_pozid = dwp.pozid)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - INTR: wartosc_faktury' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

  insert into [stat].dgt_info select 'analiza: kontrola poprawności i modyfikacje - intrastat STOP', getdate ()
  -----------------------------------------------------------------------------------------------------------------------------------------
  -- sad

print '-- sad'

insert into [stat].dgt_info select 'analiza: kontrola poprawności i modyfikacje - sad START', getdate ()

--pcn, pcnp
print '-- pcn, pcnp'

update [stat].dgv_kopia_v2_sad_dpdz_tow
set [KodTowarowy] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_sad_dpdz_tow st
where (bd_rodzaj = 'kodtowarowy')
and ([KodTowarowy] = bd_bledna_wartosc)
and (bd_iddoknr = st.[IdDokNr])
and (bd_iddoknr_pozid = st.[PozId])

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: kodtowarowy' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator
--

-- kraj_pochodzenia
print '-- kraj_pochodzenia'

update [stat].dgv_kopia_v2_sad_dpdz_tow
set [KrajPochodzenia] = 'QW'
from stat.dgv_kopia_v2_sad_dpdz_tow
where [KrajPochodzenia]='EU'

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: krajpochodzenia EU na QW' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

update [stat].dgv_kopia_v2_sad_dpdz_tow
set [KrajPochodzenia] = 'QW'
from stat.dgv_kopia_v2_sad_dpdz_tow
where [KrajPochodzenia]='QU'

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: krajpochodzenia QU na QW' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

update [stat].dgv_kopia_v2_sad_dpdz_tow
set [KrajPochodzenia] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_sad_dpdz_tow st
where (bd_rodzaj = 'krajpochodzenia')
and ([KrajPochodzenia] = bd_bledna_wartosc)
and (bd_iddoknr = st.[IdDokNr]) 
and (bd_iddoknr_pozid = st.[PozId])

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: krajpochodzenia' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator
--

-- kraj_wysylki
print '-- kraj_wysylki'

update [stat].dgv_kopia_v2_dok_sad
SET KrajWysylki = 'QW'
where krajwysylki='EU'

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: krajwysylki EU na QW' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

update [stat].dgv_kopia_v2_dok_sad
SET KrajWysylki = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_dok_sad ds
where (bd_rodzaj = 'krajwysylki')
and (ds.KrajWysylki = bd_bledna_wartosc)
and (bd_iddoknr = ds.idDokNr)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: krajwysylki' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- kraj_przeznaczenia'
print '-- kraj_przeznaczenia'

update [stat].dgv_kopia_v2_dok_sad
set [KrajPrzeznaczenia] = 'QW'
where [KrajPrzeznaczenia]='EU'

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: krajprzeznaczenia EU na QW' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

update [stat].dgv_kopia_v2_dok_sad
set [KrajPrzeznaczenia] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_dok_sad ds
where (bd_rodzaj = 'krajprzeznaczenia')
and (ds.[KrajPrzeznaczenia] = bd_bledna_wartosc)
and (bd_iddoknr = ds.idDokNr)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: krajprzeznaczenia' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- rodzaj_transakcji
print '-- rodzaj_transakcji'

update [stat].dgv_kopia_v2_dok_sad
set [RodzajTransakcji] = '11'
from stat.dgv_kopia_v2_dok_sad
where [RodzajTransakcji] is null

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: rodzajtransakcji NULL na 11' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

update [stat].dgv_kopia_v2_dok_sad
set [RodzajTransakcji] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_dok_sad ds
where (bd_rodzaj = 'rodzajtransakcji')
and (isnull(ds.[RodzajTransakcji],'') = isnull(bd_bledna_wartosc,''))
and (bd_iddoknr = ds.idDokNr)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: rodzajtransakcji' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- kod_transportu
print '-- kod_transportu'

update [stat].dgv_kopia_v2_sad_transport
set [Rodzaj] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_sad_transport tr
where (bd_rodzaj = 'rodzaj')
and (tr.[Rodzaj] = bd_bledna_wartosc)
and (bd_iddoknr = tr.idDokNr)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: rodzaj' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- kod_warunkow_dostawy
print '-- kod_warunkow_dostawy'

update [stat].dgv_kopia_v2_dok_sad
set [KodDost] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_dok_sad ds
where (bd_rodzaj = 'koddost')
and (ds.[KodDost] = bd_bledna_wartosc)
and (bd_iddoknr = ds.idDokNr)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: koddost' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


-- kod_procedury_celnej
print '-- kod_procedury_celnej'

update [stat].dgv_kopia_v2_sad_dpdz_tow
set [procedura] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_sad_dpdz_tow st
where (bd_rodzaj = 'procedura')
and ([procedura] = bd_bledna_wartosc)
and (bd_iddoknr = st.[IdDokNr])
and (bd_iddoknr_pozid = st.[PozId])

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: procedura' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- kod_waluty
print '-- kod_waluty'

update [stat].dgv_kopia_v2_dok_sad
set [Waluta] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_dok_sad ds
where (bd_rodzaj = 'waluta')
and (ds.[Waluta] = bd_bledna_wartosc)
and (bd_iddoknr = ds.idDokNr)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: waluta' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- kod_kraju_srodka_transportu
print '-- kod_kraju_srodka_transportu'

update [stat].dgv_kopia_v2_sad_transport
set [Kraj] = 'QW'
where [Kraj]='EU'

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: kraj EU na QW' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

update [stat].dgv_kopia_v2_sad_transport
set [Kraj] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_sad_transport tr
where (bd_rodzaj = 'kraj')
and (tr.[Kraj] = bd_bledna_wartosc)
and (bd_iddoknr = tr.idDokNr)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: kraj' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


-- kontener
print '-- kontener'

update [stat].dgv_kopia_v2_dok_sad

set [Kontenery] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_dok_sad ds
where (bd_rodzaj = 'kontenery')
and (ds.[Kontenery] = bd_bledna_wartosc)
and (bd_iddoknr = ds.idDokNr)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: kontenery' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- kod_preferencji
print '-- kod_preferencji'

update [stat].dgv_kopia_v2_sad_dpdz_tow
set [Preferencje] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_sad_dpdz_tow st
where (bd_rodzaj = 'preferencje')
and ([Preferencje] = bd_bledna_wartosc)
and (bd_iddoknr = st.[IdDokNr]) 
and (bd_iddoknr_pozid = st.[PozId])

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: preferencje' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


-- masa_netto
print '-- masa_netto'

update [stat].dgv_kopia_v2_sad_dpdz_tow
set [MasaNetto] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_sad_dpdz_tow st
where (bd_rodzaj = 'masanetto')
and ([MasaNetto] = bd_bledna_wartosc)
and (bd_iddoknr = st.[IdDokNr])
and (bd_iddoknr_pozid = st.[PozId])

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: masanetto' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator
--

-- masa_brutto
print '-- masa_brutto'

update [stat].dgv_kopia_v2_dok_sad
set [MasaBrutto] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_dok_sad ds
where (bd_rodzaj = 'masabrutto')
and (ds.[MasaBrutto] = bd_bledna_wartosc)
and (bd_iddoknr = ds.idDokNr)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: masabrutto' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


-- ilosc
print '-- ilosc'

update [stat].dgv_kopia_v2_sad_dpdz_tow
set [IloscUzupelniajacaJm] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_sad_dpdz_tow st
where (bd_rodzaj = 'iloscuzupelniajacajm')
and ([IloscUzupelniajacaJm] = bd_bledna_wartosc)
and (bd_iddoknr = st.[IdDokNr])
and (bd_iddoknr_pozid = st.[PozId])

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: iloscuzupelniajacajm' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- wartosc_stat_zl
print '-- wartosc_stat_zl'

update [stat].dgv_kopia_v2_sad_dpdz_tow
set [WartoscStatystyczna] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_sad_dpdz_tow st
where (bd_rodzaj = 'wartoscstatystyczna')
and ([WartoscStatystyczna] = bd_bledna_wartosc)
and (bd_iddoknr = st.[IdDokNr])
and (bd_iddoknr_pozid = st.[PozId])

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: wartoscstatystyczna' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- wartosc_pozycji
print '-- wartosc_pozycji'

update [stat].dgv_kopia_v2_sad_dpdz_tow
set [WartoscPozycji] = bd_nowa_wartosc
from dgt_bledne_dane_1,
dgv_kopia_v2_sad_dpdz_tow st
where (bd_rodzaj = 'wartoscpozycji')
and ([WartoscPozycji] = bd_bledna_wartosc)
and (bd_iddoknr = st.[IdDokNr])
and (bd_iddoknr_pozid = st.[PozId])


INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: wartoscpozycji' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


-----------------------------------------------------------------------------------------------------------------------------------------
  -- ecs

-- pcn, pcnp
        print 'ECS -- pcn, pcnp'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_cn_code = bd_nowa_wartosc
          from dgt_bledne_dane_1,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
           and gi_cn_code = bd_bledna_wartosc
           and bd_rodzaj = 'kodtowarowy'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
       
INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: kodtowarowy' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

 
 -- kraj_pochodzenia - ECS nie ma kraju pochodzenia

        -- kraj_wysylki
        print 'ECS -- kraj_wysylki gdy jest w nagłówku'
        --
   	update [stat].dgv_kopia_ecs_exp_declcoexport
         set exp_country_of_export ='QW'
	where exp_country_of_export='EU'

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: krajwysylki w nagłówku EU na QW' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


        update [stat].dgv_kopia_ecs_exp_declcoexport
           set exp_country_of_export = bd_nowa_wartosc
          from dgt_bledne_dane_1
         where exp_country_of_export = bd_bledna_wartosc 
	   and bd_rodzaj = 'krajwysylki'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = decl_id
           and exp_country_of_export is not null
      
INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: krajwysylki w nagłówku' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

        
        print 'ECS -- kraj_wysylki gdy jest na pozycji'
        --

     update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_country_of_export = 'QW'
where gi_country_of_export = 'EU'

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: krajwysylki na pozycji EU na QW' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_country_of_export = bd_nowa_wartosc
          from dgt_bledne_dane_1,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
 	   and gi_country_of_export = bd_bledna_wartosc
           and bd_rodzaj = 'krajwysylki'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
           and gi_country_of_export is not null
        
INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: krajwysylki na pozycji' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

    -- kraj_przeznaczenia'
    -- kraj_wysylki
        print 'ECS -- kraj_przeznaczenia gdy jest w nagłówku'
        --
  update [stat].dgv_kopia_ecs_exp_declcoexport
           set exp_country_of_destinatnion = 'QW'
where exp_country_of_destinatnion='EU'

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: krajprzeznaczenia w nagłówku EU na QW' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

        update [stat].dgv_kopia_ecs_exp_declcoexport
           set exp_country_of_destinatnion = bd_nowa_wartosc
          from dgt_bledne_dane_1
         where exp_country_of_destinatnion = bd_bledna_wartosc           
	   and bd_rodzaj = 'krajprzeznaczenia'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = decl_id
           and exp_country_of_destinatnion is not null


INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: krajprzeznaczenia w nagłówku' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

        
        print 'ECS -- kraj_przeznaczenia gdy jest na pozycji'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_country_of_destination = 'QW'
where gi_country_of_destination='EU'

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: krajprzeznaczenia na pozycji EU na QW' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_country_of_destination = bd_nowa_wartosc
          from dgt_bledne_dane_1,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
 	   and gi_country_of_destination = bd_bledna_wartosc
           and bd_rodzaj = 'krajprzeznaczenia'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
           and gi_country_of_destination is not null
     

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: krajprzeznaczenia na pozycji' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator
   

        -- rodzaj_transakcji
        print 'ECS -- rodzaj_transakcji'
        --

        update [stat].dgv_kopia_ecs_exp_declcoexport
        set td_nature_of_transation = '11'
	where td_nature_of_transation is null

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: rodzajtransakcji NULL na 11' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

        update [stat].dgv_kopia_ecs_exp_declcoexport
           set td_nature_of_transation = bd_nowa_wartosc
          from dgt_bledne_dane_1
         where  isnull(td_nature_of_transation,'') = isnull(bd_bledna_wartosc,'')
           and bd_rodzaj = 'rodzajtransakcji'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = decl_id

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: rodzajtransakcji' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


        -- kod_transportu
        print 'ECS -- kod_transportu'
        --
        update [stat].dgv_kopia_ecs_exp_declcoexport
           set tab_mode = bd_nowa_wartosc
          from dgt_bledne_dane_1       
	where bd_rodzaj = 'rodzaj'
	   and tab_mode like bd_bledna_wartosc + '%'
           and bd_tabela = 'dgv_kopia_v2_sad_transport'
           and bd_iddoknr = decl_id
        

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: rodzaj' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


        -- kod_warunkow_dostawy
        print 'ECS -- kod_warunkow_dostawy'

	update [stat].dgv_kopia_ecs_exp_declcoexport
	set dt_code = 'EXW'
	where 	dt_code is null

	 --
        update [stat].dgv_kopia_ecs_exp_declcoexport
           set dt_code = bd_nowa_wartosc
          from dgt_bledne_dane_1
         where bd_rodzaj = 'koddost'
	   and isnull(dt_code,'') = isnull(bd_bledna_wartosc,'')
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = decl_id
        

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: koddost' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


        -- kod_izby_celnej
        print 'ECS -- kod_izby_celnej'
        --
        update [stat].dgv_kopia_ecs_exp_declcoexport
           set exp_co_of_export = bd_nowa_wartosc
          from dgt_bledne_dane_1
         where bd_rodzaj = 'uczgloszenia'
	   and exp_co_of_export like bd_bledna_wartosc + '%'
           and bd_tabela = 'dgv_kopia_v2_sad_uc'
           and bd_iddoknr = decl_id


INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: uczgloszenia' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator
        
        -- kod_procedury_celnej
        print 'ECS -- kod_procedury_celnej'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_proc_requested = substring(bd_nowa_wartosc,1,2),
               gi_proc_previous = substring(bd_nowa_wartosc,3,2)
          from dgt_bledne_dane_1,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
	   and gi_proc_requested = substring(bd_bledna_wartosc,1,2)
           and gi_proc_previous = substring(bd_bledna_wartosc,3,2)
           and bd_rodzaj = 'procedura'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
        

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: procedura' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

        -- kod_waluty
        print 'ECS -- kod_waluty'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set vog_statistical_currency = bd_nowa_wartosc
          from dgt_bledne_dane_1,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di        
	where decl_id = declcoexport_decl_id
	   and vog_statistical_currency = bd_bledna_wartosc
           and bd_rodzaj = 'waluta'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
        

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: waluta' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


        -- kod_kraju_srodka_transportu
        print 'ECS -- kod_kraju_srodka_transportu'
        --

        update [stat].dgv_kopia_ecs_exp_declcoexport
           set tab_country = 'QW'
	where tab_country='EU'

	INSERT INTO [wald].raport 
	SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: kraj EU na QW' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

        update [stat].dgv_kopia_ecs_exp_declcoexport
           set tab_country = bd_nowa_wartosc
          from dgt_bledne_dane_1 
	where bd_rodzaj = 'kraj'
 	   and tab_country = bd_bledna_wartosc
           and bd_tabela = 'dgv_kopia_v2_sad_transport'
           and bd_iddoknr = decl_id
        

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: kraj' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


        -- kontener
        print 'ECS -- kontenery'
        --
        update [stat].dgv_kopia_ecs_exp_declcoexport
           set exp_containers = bd_nowa_wartosc
          from dgt_bledne_dane_1
	where bd_rodzaj = 'kontenery'
 	   and exp_containers = bd_bledna_wartosc
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = decl_id
        

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: kontenery' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

       
        -- masa_netto
        print 'ECS -- masa_netto'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_net_mass = bd_nowa_wartosc
          from dgt_bledne_dane_1,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
	   and gi_net_mass = bd_bledna_wartosc
           and bd_rodzaj = 'masanetto'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
        

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: masanetto' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


        -- masa_brutto
        print 'ECS -- masa_brutto'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_gross_mass = bd_nowa_wartosc
          from dgt_bledne_dane_1,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
	   and gi_gross_mass = bd_bledna_wartosc
           and bd_rodzaj = 'masabrutto'
           and bd_tabela = 'dgv_kopia_v2_dok_sad'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
       

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: masabrutto' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


        -- ilosc
        print 'ECS -- ilosc'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set gi_quantity_suppl_unit = bd_nowa_wartosc
          from dgt_bledne_dane_1,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di
         where decl_id = declcoexport_decl_id
	   and gi_quantity_suppl_unit = bd_bledna_wartosc
           and bd_rodzaj = 'iloscuzupelniajacajm'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
        

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: iloscuzupelniajacajm' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

        -- wartosc_stat_zl
        print 'ECS -- wartosc_stat_zl'
        --
        update [stat].dgv_kopia_ecs_exp_goods_item
           set vog_statistical_value = bd_nowa_wartosc
          from dgt_bledne_dane_1,
               dgv_kopia_ecs_exp_goods_item st,
               dgv_kopia_ecs_exp_declcoexport di         
	where decl_id = declcoexport_decl_id
	   and vog_statistical_value = bd_bledna_wartosc
           and bd_rodzaj = 'wartoscstatystyczna'
           and bd_tabela = 'dgv_kopia_v2_sad_dpdz_tow'
           and bd_iddoknr = st.declcoexport_decl_id
           and bd_iddoknr_pozid = st.id
        

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: wartoscstatystyczna' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


update [stat].dgv_kopia_ecs_exp_exporter
set regon=left(bd_nowa_wartosc,14)
from dgt_bledne_dane_1, dgv_kopia_ecs_exp_exporter
where declcoexport_decl_id=bd_iddoknr 
 		and regon=bd_bledna_wartosc
		and bd_rodzaj = 'regon'
		and bd_tabela='dgv_kopia_ecs_exp_exporter'


INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: REGON' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator
      
-- kasowania
print '-- Kasowania'

-- ... intrastat
print ' INTRASTAT -- kasowania'
delete dgv_kopia_istat_dekl_wynik_poz
from stat.dgv_kopia_istat_dekl_wynik_poz,
dgt_bledne_dane_1 
where (bd_do_usuniecia = 'T')
and (bd_id_dok is not null)
and (id_dok = bd_id_dok)
and (pozid = bd_id_dok_pozid or bd_id_dok_pozid is null)  

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - INTR: do usunięcia' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- ... sad
print 'SAD -- kasowania'

delete dgv_kopia_v2_sad_dpdz_tow
from stat.dgv_kopia_v2_sad_dpdz_tow,
dgt_bledne_dane_1 
where (bd_do_usuniecia = 'T')
and (bd_iddoknr is not null)
and ([IdDokNr] = bd_iddoknr)
and ([PozId] = bd_iddoknr_pozid or bd_iddoknr_pozid is null)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - SAD: do usunięcia' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

-- ... ecs
print 'ECS -- kasowania'
delete dgv_kopia_ecs_exp_goods_item
from stat.dgv_kopia_ecs_exp_goods_item,         
dgt_bledne_dane_1 
where bd_do_usuniecia = 'T'
and bd_iddoknr is not null
and declcoexport_decl_id = bd_iddoknr
and (id = bd_iddoknr_pozid or bd_iddoknr_pozid is null)

INSERT INTO [wald].raport 
SELECT 'C' AS Akcja, 'Czyszczenie danych źródłowych - ECS: do usunięcia' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

insert into [stat].dgt_info select 'analiza: kontrola poprawności i modyfikacje - sad STOP', getdate ()

    set @v_komunikat = 'STOP: dgp_czyszczenie_danych_zrodlowych_z2005'
    exec stat.DziennikWpisInfo @v_komunikat, @@PROCID