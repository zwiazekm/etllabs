
CREATE PROCEDURE [wald].[p_powiazania_prawidlowe_specjalne_eksport_do_bledne_dane] AS

INSERT INTO [wald].dgt_bledne_dane
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
	END AS bd_typ,
suser_sname() as uname
FROM 
wald.tbl_sprawdzenie_powiazan_specjalne
WHERE
stat='T'

TRUNCATE TABLE [wald].tbl_sprawdzenie_powiazan_specjalne