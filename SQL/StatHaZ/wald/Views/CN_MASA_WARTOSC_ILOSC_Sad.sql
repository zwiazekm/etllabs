CREATE  VIEW wald.CN_MASA_WARTOSC_ILOSC_Sad
AS
SELECT *
FROM wald.wal_dgt_kopia_v2_sad_dpdz_tow
WHERE (KodTowarowy = CONVERT(varchar, MasaNetto, 8) OR
      KodTowarowy = CONVERT(varchar, [IloscUzupelniajacaJm]) OR
      KodTowarowy = CONVERT(varchar, WartoscStatystyczna))
and convert(varchar,[idDokNr])+convert(varchar,[PozId]) not in (select convert(varchar,id_dok)+convert(varchar,poz_id) from top_widoki_arch)