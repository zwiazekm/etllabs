CREATE VIEW wald.top_masa_sad
AS
SELECT     
--TOP 100 PERCENT 	
				stat,
				 koment, 
				idDokNr,
				 PozId,
				 MasaNetto,
				 IloscUzupelniajacaJm,
				 WartoscStatystyczna,
				 CONVERT(numeric(20, 2),  WartoscStatystyczna / CASE WHEN MasaNetto=0 THEN NULL ELSE MasaNetto END ) AS [wartosc za kg],
				 CONVERT(numeric(20, 2), WartoscStatystyczna /CASE WHEN  IloscUzupelniajacaJm=0 THEN NULL ELSE IloscUzupelniajacaJm END) AS wartosc_jm, 
				OpisTowaru,
				 SUBSTRING(KodTowarowy, 1, 8) AS KodTowarowy, KrajPochodzenia
--FROM         wald.wal_dgt_kopia_v2_sad_dpdz_tow
FROM           wald.wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD
--WHERE     (MasaNetto > 10000000)
--ORDER BY -- OpisTowaru,
--MasaNetto DESC