CREATE  VIEW wald.CN_MASA_WARTOSC_ILOSC_Sad_6znaki_LEFT
AS
SELECT     stat, koment, idDokNr, [PozId], KodTowarowy, OpisTowaru, [KrajPochodzenia], MasaNetto, [IloscUzupelniajacaJm], WartoscStatystyczna, generacjaId
FROM         wald.wal_dgt_kopia_v2_sad_dpdz_tow
WHERE     stat IS NULL AND 
(LEFT(KodTowarowy, 6) = LEFT(MasaNetto, 6) OR
LEFT(KodTowarowy, 6) = LEFT([IloscUzupelniajacaJm], 6) OR
LEFT(KodTowarowy, 6) = LEFT(WartoscStatystyczna, 6))
and convert(varchar,[iddoknr])+convert(varchar,[PozId]) not in (select convert(varchar,id_dok)+convert(varchar,poz_id) from top_widoki_arch)