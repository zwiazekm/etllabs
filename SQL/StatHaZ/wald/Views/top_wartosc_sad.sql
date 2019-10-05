CREATE VIEW wald.top_wartosc_sad
AS
SELECT     --TOP 100 PERCENT 
stat, 
koment, 
idDokNr, 
PozId, 
MasaNetto, 
IloscUzupelniajacaJm, 
WartoscStatystyczna,
CAST(CAST(WartoscStatystyczna / CASE WHEN MasaNetto=0 THEN NULL 
			 ELSE MasaNetto END AS FLOAT)AS NUMERIC(38,2)) AS [wartosc za kg], 
CAST(CAST(WartoscStatystyczna / CASE WHEN Iloscuzupelniajacajm=0 THEN NULL
			 ELSE Iloscuzupelniajacajm END AS FLOAT)AS NUMERIC(38,2)) AS wartosc_szt, 
OpisTowaru, 
SUBSTRING(KodTowarowy, 1, 8) AS KodTowarowy, 
KrajPochodzenia
--FROM         
--wald.wal_dgt_kopia_v2_sad_dpdz_tow
FROM         wald.wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD
/*WHERE     
(WartoscStatystyczna >16276538)*/
--ORDER BY WartoscStatystyczna DESC