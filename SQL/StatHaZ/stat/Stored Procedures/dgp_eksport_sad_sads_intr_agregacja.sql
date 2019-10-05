CREATE PROCEDURE [stat].dgp_eksport_sad_sads_intr_agregacja
as
  --
  exec stat.DziennikWpisInfo 'start: dgp_eksport_sad_sads_intr_agregacja'
  --
  -- Agregacja danych
  truncate table [stat].dgt_eksport_sad_sads_intr_agr
  --
  insert into [stat].dgt_eksport_sad_sads_intr_agr
  select ek_pcn,
         ek_zp,
         ek_pcnp,
         ek_kraj_przeznaczenia,
         ek_odbiorca,
         ek_RokMc,
         ek_rodzaj_transakcji,
         ek_kod_transportu,
         ek_kod_warunkow_dostawy,
         ek_kod_izby_celnej,
         ek_kod_procedury_celnej,
         ek_znacznik_kategorii_progowej,
         sum(ek_masa_netto) ek_masa_netto,
         sum(ek_ilosc) ek_ilosc,
         sum(ek_wartosc_stat_zl) ek_wartosc_stat_zl,
         sum(ek_wartosc_stat_usd) ek_wartosc_stat_usd,
         sum(ek_wartosc_stat_euro) ek_wartosc_stat_euro
    from dgt_eksport_sad_sads_intr
   group by ek_pcn,
         ek_zp,
         ek_pcnp,
         ek_kraj_przeznaczenia,
         ek_odbiorca,
         ek_RokMc,
         ek_rodzaj_transakcji,
         ek_kod_transportu,
         ek_kod_warunkow_dostawy,
         ek_kod_izby_celnej,
         ek_kod_procedury_celnej,
         ek_znacznik_kategorii_progowej
--   order by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  --

  exec stat.DziennikWpisInfo 'stop: dgp_eksport_sad_sads_intr_agregacja'