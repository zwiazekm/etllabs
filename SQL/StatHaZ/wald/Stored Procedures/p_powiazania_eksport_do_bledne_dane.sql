
CREATE PROCEDURE [wald].[p_powiazania_eksport_do_bledne_dane] AS

INSERT INTO [wald].dgt_bledne_dane (bd_mmrr, bd_rodzaj, bd_tabela, bd_bledna_wartosc, bd_nowa_wartosc, bd_iddoknr, bd_id_dok, bd_iddoknr_pozid, bd_id_dok_pozid, bd_do_usuniecia, bd_koment, bd_typ)
SELECT
NULL AS bd_mmrr,
NULL AS bd_rodzaj,
NULL AS bd_tabela,
NULL AS bd_bledna_wartosc,
NULL AS bd_nowa_wartosc,
dokument_SAD AS bd_iddoknr,
deklaracja_INTR AS bd_id_dok,
pozycja_SAD AS bd_iddoknr_pozid,
pozycja_INTR AS bd_id_dok_pozid,
stat AS bd_do_usuniecia,
'usunięto - '+ rodzaj_bledu as bd_koment,
CASE	
	WHEN dokument_SAD IS NULL THEN 'I' 
	ELSE 'S'
	END AS bd_typ

FROM 
wald.tbl_sprawdzenie_powiazan
WHERE
stat='T'


INSERT INTO wald.raport 
SELECT 'Z' AS Akcja, 'Powiazania- eksport do bledne dane' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

TRUNCATE TABLE [wald].tbl_sprawdzenie_powiazan