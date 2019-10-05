CREATE PROCEDURE [stat].dgp_eksport_sad_sads_polaczenie
as
  --
  exec stat.DziennikWpisInfo 'start: dgp_eksport_sad_sads_polaczenie'
  --
  -- PoĄczenie SAD i SADS
  truncate table [stat].dgt_eksport_sad_sads
  --
  insert into [stat].dgt_eksport_sad_sads
  select ek_pcn,
         ek_zp,
         ek_pcnp,
         ek_kraj_przeznaczenia,
         ek_kraj_wysylki,
         ek_kod_kraju_sprzedazy,
         ek_odbiorca,
         ek_RokMc,
         ek_rodzaj_transakcji,
         ek_kod_transportu_g,
         ek_kod_transportu_w,
         ek_kod_warunkow_dostawy,
         ek_kod_izby_celnej,
         ek_kod_procedury_celnej,
         ek_kod_waluty,
         ek_kod_kraju_srodka_transportu,
         ek_kontener,
         ek_masa_netto,
         ek_masa_brutto,
         ek_ilosc,
         ek_wartosc_stat_zl,
         ek_wartosc_stat_usd,
         ek_wartosc_stat_euro,
         ek_wartosc_pozycji
    from dgt_eksport_sad
 
   order by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
  --
  exec stat.DziennikWpisInfo 'stop: dgp_eksport_sad_sads_polaczenie'