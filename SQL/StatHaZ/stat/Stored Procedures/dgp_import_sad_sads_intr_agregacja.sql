CREATE  PROCEDURE [stat].dgp_import_sad_sads_intr_agregacja
as
  --
  exec stat.DziennikWpisInfo 'start: dgp_import_sad_sads_intr_agregacja'
  --
  -- Agregacja danych
  truncate table [stat].dgt_import_sad_sads_intr_agr
  --
  insert into [stat].dgt_import_sad_sads_intr_agr
  select im_pcn,
         im_zp,
         im_pcnp,
         im_kraj_pochodzenia,
         im_kraj_wysylki,
         im_odbiorca,
         im_RokMc,
         im_rodzaj_transakcji,
         im_kod_transportu,
         im_kod_warunkow_dostawy,
         im_kod_izby_celnej,
         im_kod_procedury_celnej,
         im_znacznik_kategorii_progowej,
         sum(im_masa_netto) im_masa_netto,
         sum(im_ilosc) im_ilosc,
         sum(im_wartosc_stat_zl) im_wartosc_stat_zl,
         sum(im_wartosc_stat_usd) im_wartosc_stat_usd,
         sum(im_wartosc_stat_euro) im_wartosc_stat_euro
    from dgt_import_sad_sads_intr
   group by im_pcn,
         im_zp,
         im_pcnp,
         im_kraj_pochodzenia,
         im_kraj_wysylki,
         im_odbiorca,
         im_RokMc,
         im_rodzaj_transakcji,
         im_kod_transportu,
         im_kod_warunkow_dostawy,
         im_kod_izby_celnej,
         im_kod_procedury_celnej,
         im_znacznik_kategorii_progowej
--   order by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
  --

  exec stat.DziennikWpisInfo 'stop: dgp_import_sad_sads_intr_agregacja'