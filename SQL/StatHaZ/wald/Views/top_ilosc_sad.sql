CREATE VIEW wald.top_ilosc_sad
AS
SELECT     
--TOP 100 PERCENT
stat, koment, 
idDokNr, 
PozId, 
IloscUzupelniajacaJm, 
MasaNetto, 
WartoscStatystyczna, 
CONVERT(numeric(20, 2),  WartoscStatystyczna / case when MasaNetto=0 then 1 else MasaNetto end) AS [Wartosc za kg], 
CONVERT(numeric(20, 2), WartoscStatystyczna / IloscUzupelniajacaJm) AS [Wartosc na szt], 
OpisTowaru, 
SUBSTRING(KodTowarowy, 1, 8) AS KodTowarowy,
wald.tbl_sl_taryfa_cn8.nazwa_jm, 
KrajPochodzenia
FROM         wald.wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD
INNER JOIN wald.tbl_sl_taryfa_cn8 ON
wald.wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD.KodTowarowy=wald.tbl_sl_taryfa_cn8.kod_cn
--ORDER BY IloscUzupelniajacaJm DESC