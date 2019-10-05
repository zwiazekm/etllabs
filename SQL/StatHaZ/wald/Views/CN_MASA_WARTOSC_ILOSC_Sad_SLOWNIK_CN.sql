CREATE  VIEW wald.CN_MASA_WARTOSC_ILOSC_Sad_SLOWNIK_CN
AS

SELECT     *
FROM         wald.wal_dgt_kopia_v2_sad_dpdz_tow
WHERE (SUBSTRING(CONVERT(VARCHAR, MasaNetto),1,patindex('%.%',convert(varchar,MasaNetto))-1) IN (SELECT kod_cn FROM wald.tbl_sl_taryfa_cn8_wszystkie_lata)

OR CONVERT(VARCHAR, [IloscUzupelniajacaJm]) IN (SELECT kod_cn FROM wald.tbl_sl_taryfa_cn8_wszystkie_lata)

OR	CONVERT(varchar, WartoscStatystyczna) IN (SELECT kod_cn FROM wald.tbl_sl_taryfa_cn8_wszystkie_lata))
and convert(varchar,[idDokNr])+convert(varchar,[PozId]) not in (select convert(varchar,id_dok)+convert(varchar,poz_id) from wald.top_widoki_arch)