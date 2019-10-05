
CREATE PROCEDURE [wald].[p_kontrola_ropy_naftowej]
@prog float

AS

--DECLARE
--SET @prog= 4

INSERT INTO [wald].dgt_bledne_dane
SELECT     
NULL AS bd_miesiac, 
'masanetto' AS bd_rodzaj, 
'dgv_kopia_v2_sad_dpdz_tow' AS bd_tabela, 
CONVERT (numeric(10),MasaNetto) AS bd_bledna_wartosc,
	CASE 
		WHEN (WartoscStatystyczna / MasaNetto)>@prog AND (WartoscStatystyczna / MasaNetto)<= @prog*10 
			THEN CONVERT (numeric(10),MasaNetto*10)
		WHEN (WartoscStatystyczna / MasaNetto)>@prog*10 AND (WartoscStatystyczna / MasaNetto)<=@prog*100 
			THEN CONVERT (numeric(10),MasaNetto*100)
		WHEN (WartoscStatystyczna / MasaNetto)>@prog*100 AND (WartoscStatystyczna / MasaNetto)<=@prog*1000 
			THEN CONVERT (numeric(10),MasaNetto*1000)
		WHEN (WartoscStatystyczna / MasaNetto)>@prog*1000 AND (WartoscStatystyczna / MasaNetto)<=@prog*10000 
			THEN CONVERT (numeric(10),MasaNetto*10000)
		ELSE 'PRZEKRACZA zakres'
	  END  AS bd_nowa_wartosc,
idDokNr AS bd_idDokNr, 
NULL AS bd_id_dok, 
[PozId] AS bd_idDokNr_PozId, 
NULL AS bd_id_dok_pozid, 
NULL AS bd_do_usuniecia, 
'Wartosc kg odbiega od średniej dla kodu CN' as bd_koment,
'S' AS bd_typ,
suser_sname() as uname
FROM         
[wald].wal_dgt_kopia_v2_sad_dpdz_tow
WHERE     
(SUBSTRING(KodTowarowy,1,4) = '2709') AND (WartoscStatystyczna / MasaNetto > @prog)

INSERT INTO wald.raport 
SELECT 'R' AS Akcja, 'Kontrola - ropa naftowa' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator