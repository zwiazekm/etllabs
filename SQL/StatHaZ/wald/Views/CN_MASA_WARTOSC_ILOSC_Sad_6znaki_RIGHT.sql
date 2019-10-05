CREATE  VIEW wald.CN_MASA_WARTOSC_ILOSC_Sad_6znaki_RIGHT
AS
SELECT     stat, koment, idDokNr, [PozId], KodTowarowy, OpisTowaru, [KrajPochodzenia], MasaNetto, [IloscUzupelniajacaJm], WartoscStatystyczna, generacjaId
FROM         wald.wal_dgt_kopia_v2_sad_dpdz_tow
WHERE     (stat IS NULL) AND 
(RIGHT(KodTowarowy, 6) = RIGHT(MasaNetto, 6) OR
RIGHT(KodTowarowy, 6) = RIGHT([IloscUzupelniajacaJm], 6) OR
RIGHT(KodTowarowy, 6) = RIGHT(WartoscStatystyczna, 6))
and convert(varchar,[iddoknr])+convert(varchar,[PozId]) not in (select convert(varchar,id_dok)+convert(varchar,poz_id) from top_widoki_arch)