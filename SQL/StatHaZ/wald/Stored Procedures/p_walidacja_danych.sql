CREATE PROCEDURE [wald].[p_walidacja_danych]
AS 

TRUNCATE TABLE [wald].dgt_bledne_dane

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: START' AS Opis, NULL AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator
------------------------
-------INTRASTAT--------
------------------------
-------------------------------------------------------
-- 1 kod_towarowy - sprawdzenie z wartościami słownikowymi
-------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT  
NULL AS bd_mmrr,
'kod_towarowy' AS bd_rodzaj,
'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela, 
wp.kod_towarowy AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
NULL AS bd_iddoknr, 
wp.id_dok AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
wp.[PozId] AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS koment,
'I' AS bd_typ,
suser_sname() as uname
FROM         
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp, [wald].wal_dgt_kopia_istat_dekl_wynik_dok wd
WHERE    
wp.id_dok=wd.id_dok and  
wp.kod_towarowy  NOT IN (SELECT kod_cn FROM wald.tbl_sl_taryfa_cn8)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa reguła 1: kod towarowy - INTRASTAT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator



-----------------------------------------------------------
-- 2 kraj_pochodzenia - sprawdzenie z wartościami słownikowymi
-----------------------------------------------------------
-- INSERT INTO [wald].dgt_bledne_dane
-- SELECT  
-- NULL AS bd_mmrr,
-- 'kraj_pochodzenia', 
-- 'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela, 
-- wp.kraj_pochodzenia AS bd_bledna_wartosc, 
-- NULL AS bd_nowa_wartosc, 
-- NULL AS bd_iddoknr, 
-- wp.id_dok AS bd_id_dok, 
-- NULL AS bd_iddoknr_pozid, 
-- wp.pozid AS bd_id_dok_pozid, 
-- NULL AS bd_do_usuniecia,
-- NULL AS koment,
-- 'I' AS bd_typ,
-- suser_sname() as uname
-- FROM         
-- [wald].wal_dgt_kopia_istat_dekl_wynik_poz wp
-- WHERE      
-- wp.kraj_pochodzenia  NOT IN (SELECT DISTINCT kod FROM wald.tbl_sl_kraje)
-- AND wp.kraj_pochodzenia IS NOT NULL
-- AND wp.kraj_pochodzenia <>''
-- AND(wp.kraj_przezn_wysyl NOT IN (SELECT kod from wald.view_sl_kraje_UE) OR (wp.kraj_pochodzenia='QZ'))
-- 
-- INSERT INTO wald.raport 
-- SELECT 'W' AS Akcja, 'Kontrola slownikowa reguła 2: kraj pochodzenia - INTRASTAT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

/*
-------------------------------------------------
-- 3 krajPochodzenia = PL w przywozie - do usuniecia
-------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT  
--RIGHT('0'+CONVERT(VARCHAR,wd.miesiac),2)+RIGHT('0'+CONVERT(VARCHAR,wd.rok),2) AS bd_mmrr,
NULL AS bd_mmrr,
'kraj_pochodzenia',
'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela,
wp.kraj_pochodzenia AS bd_bledna_wartosc,
NULL AS bd_nowa_wartosc,
NULL AS bd_iddoknr,
wd.id_dok AS bd_id_dok, 
NULL AS bd_iddoknr_pozid,
wp.pozid AS bd_id_dok_pozid,
'T' AS bd_do_usuniecia,
'Kraj pochodzenia w przywozie PL, - usuwamy' AS koment,
'I' AS bd_typ,
suser_sname() as uname

FROM    
[wald].wal_dgt_kopia_istat_dekl_wynik_dok wd,
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp	             

WHERE   
(wd.id_dok=wp.id_dok) 
AND(wd.typ = 'P') 
AND(wp.kraj_pochodzenia = 'PL')

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj pochodzenia = PL w przywozie - do usuniecia - INTRASTAT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator
*/

--UNION ALL

--------------------------------------------------------------------------
-- 4 KrajPochodzenia NULL, pusty lub nie nalezy do slownikow w przywozie i kraj wysylki nalezy do UE - mapowanie 
--------------------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT  
--RIGHT('0'+CONVERT(VARCHAR,wd.miesiac),2)+RIGHT('0'+CONVERT(VARCHAR,wd.rok),2) AS bd_mmrr,
NULL AS bd_mmrr,
'kraj_pochodzenia',
'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela,
wp.kraj_pochodzenia AS bd_bledna_wartosc,
wp.kraj_przezn_wysyl AS bd_nowa_wartosc,
NULL AS bd_iddoknr,
wd.id_dok AS bd_id_dok, 
NULL AS bd_iddoknr_pozid,
wp.[PozId] AS bd_id_dok_pozid,
NULL AS bd_do_usuniecia,
'Kraj pochodzenia w przywozie NULL lub nie istnieje w słowniku, kraj_wysylki: '+ wp.kraj_przezn_wysyl +' -mapowanie' AS koment,
'I' AS bd_typ,
suser_sname() as uname

FROM    
[wald].wal_dgt_kopia_istat_dekl_wynik_dok wd,
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp	             

WHERE   
wp.kod_towarowy not in ('99500000', '99302044', '99302700', '99309900') -- zgodnie z wytycznymi wypełniania deklaracji Intrastat
and wd.id_dok=wp.id_dok 
and wd.typ = 'P'
and (wp.kraj_pochodzenia IS NULL or wp.kraj_pochodzenia = '' or wp.kraj_pochodzenia  not in (SELECT DISTINCT [Kod] FROM wald.tbl_sl_kraje))
AND(wp.kraj_przezn_wysyl IN (SELECT [Kod] from wald.view_sl_kraje_UE))

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj pochodzenia,NULL,pusty,kraj wysylki(UE) - mapowanie - INTRASTAT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

------------------------------------------------------------------------------
-- 5 KrajPochodzenia NULL,pusty w przywozie i kraj wysylki NIE nalezy do UE - kasowanie
------------------------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT  
--RIGHT('0'+CONVERT(VARCHAR,wd.miesiac),2)+RIGHT('0'+CONVERT(VARCHAR,wd.rok),2) AS bd_mmrr,
NULL AS bd_mmrr,
'kraj_pochodzenia',
'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela,
wp.kraj_pochodzenia AS bd_bledna_wartosc,
NULL AS bd_nowa_wartosc,
NULL AS bd_iddoknr,
wd.id_dok AS bd_id_dok, 
NULL AS bd_iddoknr_pozid,
wp.[PozId] AS bd_id_dok_pozid,
'T' AS bd_do_usuniecia,
'Kraj pochodzenia w przywozie NULL , kraj_wysylki: '+ wp.kraj_przezn_wysyl +'  usuwanie' AS koment,
'I' AS bd_typ,
suser_sname() as uname

FROM    
[wald].wal_dgt_kopia_istat_dekl_wynik_dok wd,
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp  

WHERE   
wp.kod_towarowy not in ('99500000', '99302044', '99302700', '99309900') -- zgodnie z wytycznymi wypełniania deklaracji Intrastat
and wd.id_dok=wp.id_dok 
and wd.typ = 'P'
and (wp.kraj_pochodzenia is null or wp.kraj_pochodzenia = '')
and wp.kraj_przezn_wysyl not in (SELECT [Kod] from wald.view_sl_kraje_UE) 

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj pochodzenia,NULL,pusty,kraj wysylki(<> UE) - do usuniecia - INTRASTAT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

------------------------------------------------------------
-- 6 kraj_przezn_wysyl - sprawdzenie z wartościami słownikowymi
------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT  
--RIGHT('0'+CONVERT(VARCHAR,wd.miesiac),2)+RIGHT('0'+CONVERT(VARCHAR,wd.rok),2) AS bd_mmrr, 
NULL AS bd_mmrr,
'kraj_przezn_wysyl' AS bd_rodzaj, 
'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela, 
wp.kraj_przezn_wysyl AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
NULL AS bd_iddoknr, 
wp.id_dok AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
wp.[PozId] AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS koment,
'I' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp
--[wald].wal_dgt_kopia_istat_dekl_wynik_dok wd
WHERE      
--(wd.id_dok=wp.id_dok)
wp.kraj_przezn_wysyl NOT IN (SELECT DISTINCT [Kod] FROM wald.view_sl_kraje_UE) 
AND wp.kraj_przezn_wysyl IS NOT NULL 
AND wp.kraj_przezn_wysyl <> ''

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj przezn_wysl - INTRASTAT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

-----------------------------------------------------------------------------
-- 7 KrajWysylki PL w przywozie i kraj pochodzenia nalezący do UE - do mapowania
-----------------------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT  
--RIGHT('0'+CONVERT(VARCHAR,wd.miesiac),2)+RIGHT('0'+CONVERT(VARCHAR,wd.rok),2) AS bd_mmrr,
NULL AS bd_mmrr,
'kraj_przezn_wysyl',
'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela,
wp.kraj_przezn_wysyl AS bd_bledna_wartosc,
wp.kraj_pochodzenia AS bd_nowa_wartosc,
NULL AS bd_iddoknr,
wp.id_dok AS bd_id_dok, 
NULL AS bd_iddoknr_pozid,
wp.[PozId] AS bd_id_dok_pozid,
NULL AS bd_do_usuniecia,
'Kraj wysylki w przywozie PL, kraj pochodzenia: '+ wp.kraj_pochodzenia +'  - mapujemy' AS koment,
'I' AS bd_typ,
suser_sname() as uname

FROM    
[wald].wal_dgt_kopia_istat_dekl_wynik_dok wd,
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp	             

WHERE   
wd.id_dok=wp.id_dok 
AND(wd.typ = 'P') 
AND((wp.kraj_przezn_wysyl = 'PL') OR (wp.kraj_przezn_wysyl IS NULL) OR (wp.kraj_przezn_wysyl = ''))
AND wp.kraj_pochodzenia IN (SELECT [Kod] FROM wald.view_sl_kraje_UE)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj wysylki = PL,NULL,pusty w przywozie,kraj pochodzenia(UE)- mapowanie - INTRASTAT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

-------------------------------------------------------------------------------------------------
-- 8 KrajWysylki PL w przywozie lub NULL lub '' i kraj pochodzenia NIE nalezący do UE - do usuniecia 
-------------------------------------------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT  
--RIGHT('0'+CONVERT(VARCHAR,wd.miesiac),2)+RIGHT('0'+CONVERT(VARCHAR,wd.rok),2) AS bd_mmrr,
NULL AS bd_mmrr,
'kraj_przezn_wysyl',
'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela,
wp.kraj_przezn_wysyl AS bd_bledna_wartosc,
NULL AS bd_nowa_wartosc,
NULL AS bd_iddoknr,
wd.id_dok AS bd_id_dok, 
NULL AS bd_iddoknr_pozid,
wp.[PozId] AS bd_id_dok_pozid,
'T' AS bd_do_usuniecia,
'Kraj wysylki w przywozie PL, kraj pochodzenia: '+ wp.kraj_pochodzenia +'  - usuwamy' AS koment,
'I' AS bd_typ,
suser_sname() as uname

FROM    
[wald].wal_dgt_kopia_istat_dekl_wynik_dok wd,
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp	             

WHERE   
wd.id_dok=wp.id_dok 
AND(wd.typ = 'P') 
AND ((wp.kraj_przezn_wysyl = 'PL')OR (wp.kraj_przezn_wysyl IS NULL)OR (wp.kraj_przezn_wysyl = ''))
AND wp.kraj_pochodzenia  NOT IN (SELECT [Kod] FROM wald.view_sl_kraje_UE)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj wysylki = PL,NULL,pusty w przywozie,kraj pochodzenia(<>UE)- do usuniecia - INTRASTAT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

----------------------------------------------------
-- 9 KrajPrzeznaczenia PL, NULL, '' w wywozie - usuwamy
----------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT  
--RIGHT('0'+CONVERT(VARCHAR,wd.miesiac),2)+RIGHT('0'+CONVERT(VARCHAR,wd.rok),2) AS bd_mmrr,
NULL AS bd_mmrr,
'kraj_przezn_wysyl',
'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela,
wp.kraj_przezn_wysyl AS bd_bledna_wartosc,
NULL AS bd_nowa_wartosc,
NULL AS bd_iddoknr,
wd.id_dok AS bd_id_dok, 
NULL AS bd_iddoknr_pozid,
wp.[PozId] AS bd_id_dok_pozid,
'T' AS bd_do_usuniecia,
'Kraj przeznaczenia w wywozie PL,NULL,'' - usuwamy' AS koment,
'I' AS bd_typ,
suser_sname() as uname

FROM    
[wald].wal_dgt_kopia_istat_dekl_wynik_dok wd,
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp	             

WHERE   
wd.id_dok=wp.id_dok 
and wd.typ = 'W'
and (wp.kraj_przezn_wysyl = 'PL' or wp.kraj_przezn_wysyl = '' or wp.kraj_przezn_wysyl IS NULL)

INSERT INTO wald.raport 

SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj przeznaczenia = PL,NULL,pusty w wywozie - do usuniecia - INTRASTAT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL


------------------------------------------------------------
-- 10 rodzaj_transakcji - sprawdzenie z wartościami słownikowymi
------------------------------------------------------------

-- intrastat przywóz ma 3 kody rodzaju transakcji więcej niż wywóz
INSERT INTO [wald].dgt_bledne_dane
SELECT  
--RIGHT('0'+CONVERT(VARCHAR,wd.miesiac),2)+RIGHT('0'+CONVERT(VARCHAR,wd.rok),2) AS bd_mmrr, 
NULL AS bd_mmrr,
'rodzaj_transakcji' AS bd_rodzaj, 
'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela, 
wp.rodzaj_transakcji AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
NULL AS bd_iddoknr, 
wp.id_dok AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
wp.[PozId] AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
'Niepoprawny rodzaj transakcji' AS koment,
'I' AS bd_typ,
suser_sname() as uname
FROM         
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp,
[wald].wal_dgt_kopia_istat_dekl_wynik_dok wd
WHERE     	
wd.id_dok=wp.id_dok AND
(wp.rodzaj_transakcji NOT IN (SELECT [Kod] FROM wald.tbl_sl_rodz_transakcji) or wp.rodzaj_transakcji = '') AND
(wp.kod_towarowy NOT LIKE '995%' AND wp.kod_towarowy NOT LIKE '993%') AND
wd.typ='P'

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: rodzaj transakcji - INTRASTAT przywóz' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


------------------------------------------------------------
-- 11 rodzaj_transakcji - sprawdzenie z wartościami słownikowymi
------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT  
--RIGHT('0'+CONVERT(VARCHAR,wd.miesiac),2)+RIGHT('0'+CONVERT(VARCHAR,wd.rok),2) AS bd_mmrr, 
NULL AS bd_mmrr,
'rodzaj_transakcji' AS bd_rodzaj, 
'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela, 
wp.rodzaj_transakcji AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
NULL AS bd_iddoknr, 
wp.id_dok AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
wp.[PozId] AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
'Niepoprawny rodzaj transakcji' AS koment,
'I' AS bd_typ,
suser_sname() as uname
FROM         
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp,
[wald].wal_dgt_kopia_istat_dekl_wynik_dok wd
WHERE     	
wd.id_dok=wp.id_dok AND
(wp.rodzaj_transakcji NOT IN (SELECT [Kod] FROM wald.tbl_sl_rodz_transakcji WHERE [Uwagi]<>'Tylko Intrastat Przywóz') or wp.rodzaj_transakcji = '') AND
(wp.kod_towarowy NOT LIKE '995%' AND wp.kod_towarowy NOT LIKE '993%') AND
wd.typ='W'

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: rodzaj transakcji - INTRASTAT wywóz' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


------------------------------------------------------------

-- 12 rodzaj_transportu - sprawdzenie z wartościami słownikowymi
------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT  
--RIGHT('0'+CONVERT(VARCHAR,wd.miesiac),2)+RIGHT('0'+CONVERT(VARCHAR,wd.rok),2) AS bd_mmrr, 
NULL AS bd_mmrr,
'rodzaj_transportu' AS bd_rodzaj, 
'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela, 
wp.rodzaj_transportu AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, NULL AS bd_iddoknr, 
wp.id_dok AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
wp.[PozId] AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS koment,
'I' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp
--[wald].wal_dgt_kopia_istat_dekl_wynik_dok wd
WHERE      
--wd.id_dok=wp.id_dok
wp.rodzaj_transportu NOT IN 
(SELECT DISTINCT [Kod] FROM wald.tbl_sl_rodzaje_transportu) 
AND wp.rodzaj_transportu IS NOT NULL 
AND wp.rodzaj_transportu <> ''

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: rodzaj transportu - INTRASTAT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

----------------------------------------------------------
-- 13 warunki_dostawy - sprawdzenie z wartościami słownikowymi
----------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT  
--RIGHT('0'+CONVERT(VARCHAR,wd.miesiac),2)+RIGHT('0'+CONVERT(VARCHAR,wd.rok),2) AS bd_mmrr, 
NULL AS bd_mmrr,
'warunki_dostawy' AS bd_rodzaj, 
'dgv_kopia_istat_dekl_wynik_poz' AS bd_tabela, 
wp.warunki_dostawy AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
NULL AS bd_iddoknr, 
wp.id_dok AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
wp.[PozId] AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS koment,
'I' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp
--[wald].wal_dgt_kopia_istat_dekl_wynik_dok wd
WHERE 
--wd.id_dok=wp.id_dok     
wp.warunki_dostawy  NOT IN 
(SELECT DISTINCT [Kod] FROM wald.tbl_sl_war_dostaw) AND
wp.warunki_dostawy !=''

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: warunki dostawy - INTRASTAT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

-----------------
-------SAD-------
-----------------
-------------------------------------------------------
-- 14 kod towarowy - sprawdzenie z wartościami słownikowymi
-------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),3,2) AS bd_mmrr,
'kodtowarowy' AS bd_rodzaj, 
'dgv_kopia_v2_sad_dpdz_tow' AS bd_tabela, 
tw.KodTowarowy AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
tw.idDokNr AS bd_idDokNr,
NULL AS bd_id_dok, 
tw.[PozId] AS bd_idDokNr_PozId, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'S' AS bd_typ,
suser_sname() as uname
FROM         
[wald].wal_dgt_kopia_v2_sad_dpdz_tow tw,
[wald].wal_dgt_kopia_v2_dok_info di
WHERE        
tw.idDokNr=di.idDokNr and
tw.KodTowarowy NOT IN (SELECT kod_cn FROM wald.tbl_sl_taryfa_cn8)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kod towarowy - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


--UNION ALL

-------------------------------------------------------------------
-- 15 koddost sprawdzenie z wartościami słownikowymi i różne od pustego
-------------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),3,2) AS bd_mmrr,
'koddost' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
ds.KodDost AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
ds.idDokNr AS bd_idDokNr, 
NULL AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'S' AS bd_typ,
suser_sname() as uname

FROM              
[wald].wal_dgt_kopia_v2_dok_sad ds
--[wald].wal_dgt_kopia_v2_dok_info di
WHERE     
--ds.idDokNr=di.idDokNr
ds.KodDost NOT IN 
(SELECT DISTINCT [Kod] FROM wald.tbl_sl_war_dostaw) 
AND (ds.KodDost!='')

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: warunki dostawy - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

--------------------------------------------------------
-- 16 KrajPochodzenia sprawdzenie z wartościami słownikowymi
--------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),3,2) AS bd_mmrr,
'krajpochodzenia' AS bd_rodzaj, 
'dgv_kopia_v2_sad_dpdz_tow' AS bd_tabela, 
tw.[KrajPochodzenia] AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
tw.idDokNr AS bd_idDokNr, 
NULL AS bd_id_dok, 
tw.[PozId] AS bd_idDokNr_PozId, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'S' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_v2_sad_dpdz_tow tw
--[wald].wal_dgt_kopia_v2_dok_info di

WHERE     
--tw.idDokNr=di.idDokNr
(
tw.[KrajPochodzenia] NOT IN (SELECT DISTINCT [Kod] FROM wald.tbl_sl_kraje) OR (tw.[KrajPochodzenia]='QZ')
)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj pochodzenia - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

------------------------------------------------------------
--17 Krajprzeznaczenia - sprawdzenie z wartościami słownikowymi
------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT    	
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),3,2) AS bd_mmrr,
'krajprzeznaczenia' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
ds.KrajPrzeznaczenia AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
ds.idDokNr AS bd_idDokNr, 
NULL AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia, 
NULL AS bd_koment,
'S' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_v2_dok_sad ds
--[wald].wal_dgt_kopia_v2_dok_info di

WHERE     
--ds.idDokNr=di.idDokNr
(ds.KrajPrzeznaczenia NOT IN (SELECT DISTINCT [Kod] FROM tbl_sl_kraje))

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj przeznaczenia - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

------------------------------------------------------
-- 18 krajwysylki - sprawdzenie z wartościami słownikowymi
------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT      
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),3,2) AS bd_mmrr,
'KrajWysylki' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
ds.KrajWysylki AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
ds.idDokNr AS bd_idDokNr, 
NULL AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'S' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_v2_dok_sad ds
--[wald].wal_dgt_kopia_v2_dok_info di

WHERE      
--ds.idDokNr=di.idDokNr
ds.KrajWysylki NOT IN 
(SELECT DISTINCT [Kod] FROM wald.tbl_sl_kraje)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj wysylki - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

------------------------------------------------------
-- 19 preferencje - sprawdzenie z wartościami słownikowymi
------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),3,2) AS bd_mmrr,
'preferencje' AS bd_rodzaj, 
'dgv_kopia_v2_sad_dpdz_tow' AS bd_tabela, 
tw.[Preferencje] AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
tw.idDokNr AS bd_idDokNr, 
NULL AS bd_id_dok, 
tw.[PozId] AS bd_idDokNr_PozId, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'S' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_v2_sad_dpdz_tow tw
--[wald].wal_dgt_kopia_v2_dok_info di

WHERE     
--tw.idDokNr=di.idDokNr
tw.[Preferencje] NOT IN 
(SELECT DISTINCT [Kod] FROM wald.tbl_sl_preferencje)

INSERT INTO wald.raport 

SELECT 'W' AS Akcja, 'Kontrola slownikowa: kod preferencji - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

----------------------------------------------------
-- 20, 21, 22 Procedura - sprawdzenie z wartościami słownikowymi
----------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT         
NULL AS bd_mmrr, 
'procedura' AS bd_rodzaj,
'dgv_kopia_v2_sad_dpdz_tow' AS bd_tabela, 
tw.[Procedura] AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
tw.idDokNr AS bd_idDokNr, 
NULL AS bd_id_dok, 
tw.[PozId] AS bd_idDokNr_PozId, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
'brak procedury '+SUBSTRING(tw.[Procedura],1,2) AS bd_koment,
'S' AS bd_typ,
suser_sname() as uname
FROM         
[wald].wal_dgt_kopia_v2_sad_dpdz_tow tw
WHERE     
SUBSTRING(tw.[Procedura],1,2) NOT IN (SELECT DISTINCT [Kod procedury] FROM wald.tbl_sl_procedury)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: procedura celna 2 pierwsze znaki - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

INSERT INTO [wald].dgt_bledne_dane
SELECT         
NULL AS bd_mmrr, 
'procedura' AS bd_rodzaj,
'dgv_kopia_v2_sad_dpdz_tow' AS bd_tabela, 
tw.[Procedura] AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
tw.idDokNr AS bd_idDokNr, 
NULL AS bd_id_dok, 
tw.[PozId] AS bd_idDokNr_PozId, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
'brak procedury '+SUBSTRING(tw.[Procedura],3,2) AS bd_koment,
'S' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_v2_sad_dpdz_tow tw

WHERE     
SUBSTRING(tw.[Procedura],3,2) NOT IN (SELECT DISTINCT [Kod procedury] FROM wald.tbl_sl_procedury)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: procedura celna 2 ostatnie znaki - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


--walidacja wyłączona z powodu braku rzetelnego słownika procedur na 4 znakach jacek.przybysz 12.06.2013
-- INSERT INTO [wald].dgt_bledne_dane
-- SELECT         
-- NULL AS bd_mmrr, 
-- 'procedura' AS bd_rodzaj,
-- 'dgv_kopia_v2_sad_dpdz_tow' AS bd_tabela, 
-- tw.Procedura AS bd_bledna_wartosc, 
-- NULL AS bd_nowa_wartosc, 
-- tw.idDokNr AS bd_idDokNr, 
-- NULL AS bd_id_dok, 
-- tw.PozId AS bd_idDokNr_PozId, 
-- NULL AS bd_id_dok_pozid, 
-- NULL AS bd_do_usuniecia,
-- 'niepoprawna procedura '+tw.Procedura AS bd_koment,
-- 'S' AS bd_typ,
-- suser_sname() as uname
-- 
-- FROM         
-- [wald].wal_dgt_kopia_v2_sad_dpdz_tow tw
-- 
-- WHERE     
-- tw.Procedura NOT IN (SELECT kod FROM wald.tbl_sl_procedury4zn)
-- 
-- INSERT INTO wald.raport 
-- SELECT 'W' AS Akcja, 'Kontrola slownikowa: niepoprawna procedura - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator
-- --UNION ALL

-----------------------------------------------------------
-- 23 rodzajtransakcji - sprawdzenie z wartościami słownikowymi
-----------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),3,2) AS bd_mmrr,
'rodzajtransakcji' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
ds.[RodzajTransakcji] AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
ds.idDokNr AS bd_idDokNr, 
NULL AS bd_id_dok,
NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'S' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_v2_dok_sad ds,
[wald].wal_dgt_kopia_v2_dok_info di
       
WHERE     
ds.idDokNr=di.idDokNr AND

(ds.[RodzajTransakcji] IS NULL
OR ds.[RodzajTransakcji]=''
OR ds.[RodzajTransakcji] NOT IN 

(SELECT DISTINCT [Kod] FROM tbl_sl_rodz_transakcji where [Uwagi]<>'Tylko Intrastat Przywóz'))

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: rodzaj transakcji - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


--UNION ALL

-----------------------------------------------------------------------------------
-- 24 Rodzaj (rodzaj transportu) - sprawdzenie z wartościami słownikowymi - transport G
-----------------------------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr,
--SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),3,2) AS bd_mmrr, 
'rodzaj' AS bd_rodzaj, 
'dgv_kopia_v2_sad_transport' AS bd_tabela, 
st.Rodzaj AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
st.idDokNr AS bd_idDokNr, 
NULL AS bd_id_dok, NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, NULL AS bd_do_usuniecia, 
NULL AS bd_koment,
'S' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_v2_sad_transport st
--[wald].wal_dgt_kopia_v2_dok_info di

WHERE     
--st.idDokNr=di.idDokNr
(
st.Rodzaj NOT IN 
(SELECT DISTINCT [Kod] FROM wald.tbl_sl_rodzaje_transportu )) OR
((st.Rodzaj IS NULL) 
AND(st.Wewn_Granica = 'G'))

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: rodzaj transportu - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

------------------------------------------------------------------------
-- 25 kraj (kraj środka transportu) - sprawdzenie z wartościami słownikowymi
------------------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr,
--SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),3,2) AS bd_mmrr, 
'kraj' AS bd_rodzaj, 
'dgv_kopia_v2_sad_transport' AS bd_tabela, 
st.[Kraj] AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
st.idDokNr AS bd_idDokNr, 
NULL AS bd_id_dok, NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia, 
NULL AS bd_koment,
'S' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_v2_sad_transport st
--[wald].wal_dgt_kopia_v2_dok_info di
WHERE     

--st.idDokNr=di.idDokNr
(st.[Kraj] NOT IN 
(SELECT DISTINCT [Kod] FROM  wald.tbl_sl_kraje))

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj srodka transportu - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

-------------------------------------------------
-- 26 waluta - sprawdzenie z wartościami słownikowymi
-------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr,
--SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),di.DataPrzyjecia,112),3,2) AS bd_mmrr, 
'waluta' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
ds.Waluta AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
ds.idDokNr AS bd_idDokNr, 
NULL AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'S' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_v2_dok_sad ds
--[wald].wal_dgt_kopia_v2_dok_info di
WHERE     
--ds.idDokNr=di.idDokNr
(ds.Waluta NOT IN (SELECT DISTINCT Kod FROM wald.tbl_sl_waluty))

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kod waluty - SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

-----------------
-------ECS-------
-----------------
-------------------------------------------------------------------
-- 27 koddost sprawdzenie z wartościami słownikowymi i różne od pustego
-------------------------------------------------------------------

INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),3,2) AS bd_mmrr,
'koddost' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
eed.dt_code AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eed.decl_id AS bd_idDokNr, 
NULL AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname

FROM              
[wald].wal_dgt_kopia_ecs_exp_declcoexport eed
WHERE     
eed.dt_code NOT IN (SELECT [Kod] FROM wald.tbl_sl_war_dostaw) 
OR (eed.dt_code IS NULL)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: warunki dostawy - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

-------------------------------------------------------
-- 28 kod towarowy - sprawdzenie z wartościami słownikowymi
-------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),3,2) AS bd_mmrr,
'kodtowarowy' AS bd_rodzaj, 
'dgv_kopia_v2_sad_dpdz_tow' AS bd_tabela, 
eegi.gi_cn_code AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eegi.declcoexport_decl_id AS bd_iddoknr,
NULL AS bd_id_dok, 
eegi."id" AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname
FROM         
[wald].wal_dgt_kopia_ecs_exp_goods_item eegi,
[wald].wal_dgt_kopia_ecs_exp_declcoexport eed
WHERE        
eegi.declcoexport_decl_id=eed.decl_id and
eegi.gi_cn_code NOT IN (SELECT kod_cn FROM wald.tbl_sl_taryfa_cn8)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kod towarowy - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator



--UNION ALL

------------------------------------------------------------------------
-- 29 kraj (kraj środka transportu) - sprawdzenie z wartościami słownikowymi
------------------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),3,2) AS bd_mmrr,
'kraj' AS bd_rodzaj, 
'dgv_kopia_v2_sad_transport' AS bd_tabela, 
eed.tab_country AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eed.decl_id AS bd_idDokNr, 
NULL AS bd_id_dok,
NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia, 
NULL AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_ecs_exp_declcoexport eed

WHERE     
eed.tab_country NOT IN (SELECT [Kod] FROM wald.tbl_sl_kraje)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj srodka transportu - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

------------------------------------------------------------
-- 30 Krajprzeznaczenia (nagłówek) - sprawdzenie z wartościami słownikowymi
------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT    	
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),3,2) AS bd_mmrr,
'krajprzeznaczenia' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
eed.exp_country_of_destinatnion AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eed.decl_id AS bd_idDokNr, 
NULL AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia, 
NULL AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_ecs_exp_declcoexport eed

WHERE     
(eed.exp_country_of_destinatnion NOT IN (SELECT [Kod] FROM tbl_sl_kraje))AND

(eed.exp_country_of_destinatnion <>'')

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj przeznaczenia (naglowek) - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

-------------------------------------------
-- 31 Krajprzeznaczenia (nagłówek) PL - usuwamy
-------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT    	
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),3,2) AS bd_mmrr,
'krajprzeznaczenia' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
eed.exp_country_of_destinatnion AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eed.decl_id AS bd_idDokNr, 
NULL AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
'T' AS bd_do_usuniecia, 
'Kraj przeznaczenia w naglowku PL - usuwamy' AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_ecs_exp_declcoexport eed

WHERE     
(eed.exp_country_of_destinatnion ='PL')

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj przeznaczenia = PL (naglowek) - do usuniecia - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

------------------------------------------------------------
-- 32 Krajprzeznaczenia (pozycja) - sprawdzenie z wartościami słownikowymi
------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT    
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),3,2) AS bd_mmrr,
'krajprzeznaczenia' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
eegi.gi_country_of_destination AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eegi.declcoexport_decl_id AS bd_idDokNr, 
NULL AS bd_id_dok, 
eegi."id" AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia, 
NULL AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_ecs_exp_goods_item eegi
--[wald].wal_dgt_kopia_ecs_exp_declcoexport eed

WHERE     
--(eegi.declcoexport_decl_id=eed.decl_id)
(eegi.gi_country_of_destination NOT IN (SELECT [Kod] FROM tbl_sl_kraje))AND
(eegi.gi_country_of_destination <>'')

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj przeznaczenia (pozycja) - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

------------------------------------------
-- 33 Krajprzeznaczenia (pozycja) PL - usuwamy
------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT    
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),3,2) AS bd_mmrr,
'krajprzeznaczenia' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
eegi.gi_country_of_destination AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eegi.declcoexport_decl_id AS bd_idDokNr, 
NULL AS bd_id_dok, 
eegi."id" AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
'T' AS bd_do_usuniecia, 
'Kraj przeznaczenia (pozycja) PL - usuwamy' AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_ecs_exp_goods_item eegi
--[wald].wal_dgt_kopia_ecs_exp_declcoexport eed

WHERE     
--(eegi.declcoexport_decl_id=eed.decl_id)
(eegi.gi_country_of_destination = 'PL')

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj przeznaczenia = PL (pozycja) - do usuniecia - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

------------------------------------------------------
-- 34 krajwysylki (nagłówek) - sprawdzenie z wartościami słownikowymi
------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT      
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),3,2) AS bd_mmrr,
'krajwysylki' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
eed.exp_country_of_export AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eed.decl_id AS bd_idDokNr, 
NULL AS bd_id_dok, 
NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_ecs_exp_declcoexport eed

WHERE      
eed.exp_country_of_export NOT IN (SELECT [Kod] FROM wald.tbl_sl_kraje)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj wysylki (naglowek) - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator



--UNION ALL

------------------------------------------------------
-- 35 krajwysylki (pozycja) - sprawdzenie z wartościami słownikowymi
------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT      
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),3,2) AS bd_mmrr,
'krajwysylki' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
eegi.gi_country_of_export AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eegi.declcoexport_decl_id AS bd_idDokNr, 
NULL AS bd_id_dok, 
eegi."id" AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_ecs_exp_goods_item eegi
--[wald].wal_dgt_kopia_ecs_exp_declcoexport eed


WHERE      
--eegi.declcoexport_decl_id=eed.decl_id
eegi.gi_country_of_export NOT IN (SELECT [Kod] FROM wald.tbl_sl_kraje)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kraj wysylki (pozycja)- ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

----------------------------------------------------
-- 36, 37 Procedura - sprawdzenie z wartościami słownikowymi
----------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT         
NULL AS bd_mmrr, 
'procedura' AS bd_rodzaj,
'dgv_kopia_v2_sad_dpdz_tow' AS bd_tabela, 
eegi.gi_proc_requested + eegi.gi_proc_previous AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eegi.declcoexport_decl_id AS bd_idDokNr, 
NULL AS bd_id_dok, 
eegi."id" AS bd_idDokNr_PozId, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
'brak procedury '+eegi.gi_proc_requested AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname
FROM         
[wald].wal_dgt_kopia_ecs_exp_goods_item eegi
WHERE     
eegi.gi_proc_requested NOT IN (SELECT [Kod procedury] FROM wald.tbl_sl_procedury)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: procedura celna 2 pierwsze znaki - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

INSERT INTO [wald].dgt_bledne_dane
SELECT         
NULL AS bd_mmrr, 
'procedura' AS bd_rodzaj,
'dgv_kopia_v2_sad_dpdz_tow' AS bd_tabela, 
eegi.gi_proc_requested + eegi.gi_proc_previous AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eegi.declcoexport_decl_id AS bd_idDokNr, 
NULL AS bd_id_dok, 
eegi."id" AS bd_idDokNr_PozId, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
'brak procedury '+eegi.gi_proc_previous AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname
FROM         
[wald].wal_dgt_kopia_ecs_exp_goods_item eegi
WHERE     
eegi.gi_proc_previous NOT IN (SELECT [Kod procedury] FROM wald.tbl_sl_procedury)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: procedura celna 2 ostatnie znaki - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


--UNION ALL

-----------------------------------------------------------
-- 38 rodzajtransakcji - sprawdzenie z wartościami słownikowymi
-----------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),3,2) AS bd_mmrr,
'rodzajtransakcji' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
eed.td_nature_of_transation AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eed.decl_id AS bd_idDokNr, 
NULL AS bd_id_dok,
NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_ecs_exp_declcoexport eed       
            
WHERE     
(eed.td_nature_of_transation IS NULL OR eed.td_nature_of_transation='' OR eed.td_nature_of_transation NOT IN 
(SELECT DISTINCT [Kod] FROM tbl_sl_rodz_transakcji where [Uwagi]<>'Tylko Intrastat Przywóz'))

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: rodzaj transakcji - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


--UNION ALL

-----------------------------------------------------------------------------------
-- 39 Rodzaj (rodzaj transportu) - sprawdzenie z wartościami słownikowymi
-----------------------------------------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),3,2) AS bd_mmrr,
'rodzaj' AS bd_rodzaj, 
'dgv_kopia_v2_sad_transport' AS bd_tabela, 
SUBSTRING(eed.tab_mode,1,1) AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eed.decl_id AS bd_idDokNr, 
NULL AS bd_id_dok,
NULL AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid,
NULL AS bd_do_usuniecia, 
NULL AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_ecs_exp_declcoexport eed

WHERE     
SUBSTRING(eed.tab_mode,1,1) NOT IN (SELECT [Kod] FROM wald.tbl_sl_rodzaje_transportu )

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: rodzaj transportu - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--UNION ALL

-------------------------------------------------
-- 40 waluta - sprawdzenie z wartościami słownikowymi
-------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_mmrr, 
--SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),5,2) + SUBSTRING(CONVERT(VARCHAR(8),eed.exp_acceptance_date,112),3,2) AS bd_mmrr,
'waluta' AS bd_rodzaj, 
'dgv_kopia_v2_dok_sad' AS bd_tabela, 
eegi.vog_statistical_currency AS bd_bledna_wartosc, 
NULL AS bd_nowa_wartosc, 
eegi.declcoexport_decl_id AS bd_iddoknr, 
NULL AS bd_id_dok, 
eegi."id" AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname

FROM         
[wald].wal_dgt_kopia_ecs_exp_goods_item eegi
--[wald].wal_dgt_kopia_ecs_exp_declcoexport eed

WHERE     
--eegi.declcoexport_decl_id=eed.decl_id
eegi.vog_statistical_currency NOT IN (SELECT Kod FROM wald.tbl_sl_waluty)

INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: kod waluty- ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator



-------------------------------------------------
-- 41 regon - sprawdzenie długości regonów
-------------------------------------------------
INSERT INTO [wald].dgt_bledne_dane
select 
null,
'regon' as bd_rodzaj,
'dgv_kopia_ecs_exp_exporter' as bd_tabela,
expo.regon as bd_bledna_wartosc,

null as bd_nowa_wartosc,
declcoexport_decl_id as bd_iddoknr,
NULL AS bd_id_dok, 
null AS bd_iddoknr_pozid, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia,
NULL AS bd_koment,
'E' AS bd_typ,
suser_sname() as uname
from
wald.wal_dgt_kopia_ecs_exp_exporter expo
where len(regon)<>14

INSERT INTO wald.raport 

SELECT 'W' AS Akcja, 'Kontrola długości regonów - ECS' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator



INSERT INTO wald.raport 
SELECT 'W' AS Akcja, 'Kontrola slownikowa: STOP' AS Opis, (SELECT COUNT(*) FROM [wald].dgt_bledne_dane)  AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator