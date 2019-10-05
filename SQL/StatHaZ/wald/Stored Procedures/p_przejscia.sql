CREATE PROCEDURE [wald].[p_przejscia] 
AS

--DELETE 
--FROM [wald].raport
--WHERE 
--Akcja='M'

--mapowanie blednych kodow towarowych INTR

TRUNCATE TABLE wald.tbl_przejsc_tmp;
INSERT INTO wald.tbl_przejsc_tmp
select * 
from (
select * from wald.tbl_przejsc
union
select * from wald.tbl_przejsc_cn) a


INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania START' AS Opis, NULL  AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
	[wald].dgt_bledne_dane bd,
	[wald].tbl_przejsc_tmp pr
WHERE
	(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
	AND (bd.bd_rodzaj=bd_kolumna)
	AND (bd.bd_rodzaj='kod_towarowy')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: kod_towarowy INTR' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie kraj_pochodzenia INTR

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='kraj_pochodzenia')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: kraj_pochodzenia INTR' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie kraj_przezn_wysyl INTR

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='kraj_przezn_wysyl')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: kraj_przezn_wysyl INTR' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


--mapowanie rodzaj_transakcji INTR

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(isnull(bd.bd_bledna_wartosc,'')=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='rodzaj_transakcji')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: rodzaj_transakcji INTR' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie rodzaj_transportu INTR

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='rodzaj_transportu')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: rodzaj_transportu INTR' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie warunki_dostawy INTR

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='warunki_dostawy')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: warunki_dostawy INTR' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie blednych kodow towarowych SAD

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd_kolumna='kod_towarowy')
AND (bd.bd_rodzaj='kodtowarowy')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: kodtowarowy SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie krajpochodzenia SAD

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE

(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='krajpochodzenia')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: krajpochodzenia SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie krajwysylki SAD

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='krajwysylki')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: krajwysylki SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie krajprzeznaczenia' SAD

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='krajprzeznaczenia')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: krajprzeznaczenia SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie rodzajtransakcji' SAD

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(ISNULL(bd.bd_bledna_wartosc,'')=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='rodzajtransakcji')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: rodzajtransakcji SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie rodzajtransportu' SAD

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='rodzaj')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: rodzajtransportu SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie kod warunkow dostawy' SAD

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(ISNULL(bd.bd_bledna_wartosc,'')=isnull(pr.bd_niepoprawna_wartosc,''))
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='koddost')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: kod warunkow dostawy SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie procedura' SAD

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='procedura')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: procedura SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie waluta' SAD

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='waluta')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: waluta SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie kraj srodka transportu' SAD

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='kraj')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: kraj srodka transportu SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

--mapowanie preferencje' SAD

UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj=bd_kolumna)
AND (bd.bd_rodzaj='preferencje')

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: preferencje SAD' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator



--mapowanie pozostałych rodzajow bledow

/*
UPDATE bd
SET bd.bd_nowa_wartosc=pr.bd_poprawna_wartosc,
bd.bd_koment=pr.bd_komentarz
FROM 
[wald].dgt_bledne_dane bd,
[wald].tbl_przejsc_tmp pr
WHERE
(bd.bd_bledna_wartosc=pr.bd_niepoprawna_wartosc)
AND (bd.bd_rodzaj <> 'kodtowarowy' OR bd.bd_rodzaj <> 'kod_towarowy')
AND (bd.bd_rodzaj=pr.bd_kolumna)
**/


--Mapowanie matematyczne kodów towarowych
--Błedny kod towarowy wpadł do tabeli - ten kod wyszukuje najbliższy matematycznie kod towarowy do kodu błednego

select bd_bledna_wartosc, bd_nowa_wartosc into #tmpcn 
from dgt_bledne_dane where bd_rodzaj in ('kod_towarowy','kodtowarowy') and bd_nowa_wartosc is null 
and bd_bledna_wartosc not like '% %'
group by bd_bledna_wartosc, bd_nowa_wartosc

declare @v_diff int
declare @v_cn int

declare cr_diff cursor for 
select convert(bigint,bd_bledna_wartosc) from #tmpcn
	open cr_diff
	while (1=1)
	begin
		fetch cr_diff into @v_cn
		if @@FETCH_STATUS = 0
		begin
--select @v_diff
			select @v_diff = Min (Abs ((@v_cn - convert(bigint, kod_cn)))) from tbl_sl_taryfa_cn8
		update #tmpcn
		set bd_nowa_wartosc=	(select top 1 kod_cn	from tbl_sl_taryfa_cn8 
		where (abs(convert(bigint,kod_cn)-@v_cn)=@v_diff))
		from #tmpcn
	   where convert(bigint,bd_bledna_wartosc)=@v_cn 
			
		end	
		if @@FETCH_STATUS <> 0
			break
	end
	close cr_diff
	deallocate cr_diff


UPDATE wald.dgt_bledne_dane
set bd_nowa_wartosc = b.bd_nowa_wartosc
from wald.dgt_bledne_dane a, #tmpcn b
where a.bd_nowa_wartosc is null and a.bd_rodzaj in ('kod_towarowy','kodtowarowy') and a.bd_bledna_wartosc=b.bd_bledna_wartosc


INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania: kod_towarowy, kodtowarowy - mapowanie matematyczne' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator


drop table #tmpcn;

--

INSERT INTO wald.raport 
SELECT 'M' AS Akcja, 'Mapowania STOP' AS Opis, NULL Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator