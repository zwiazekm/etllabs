CREATE PROCEDURE [stat].dgp_import_intr_agregacja
as
  --
  exec stat.DziennikWpisInfo 'start: dgp_import_intr_agregacja - insert'
  --
  -- Agregacja danych
  insert into [stat].dgt_import_intr_agr
  select im_pcn,
         im_zp,
         im_pcnp,
         im_kraj_pochodzenia,
         im_kraj_wysylki,
         im_odbiorca,
         im_nip,
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
         sum(im_wartosc_stat_euro) im_wartosc_stat_euro,
         sum(im_wartosc_faktury) im_wartosc_faktury,
         null,
         null,
         null,
         null
    from stat.dgt_import_intr
   group by im_pcn,
         im_zp,
         im_pcnp,
         im_kraj_pochodzenia,
         im_kraj_wysylki,
         im_odbiorca,
         im_nip,
         im_RokMc,
         im_rodzaj_transakcji,
         im_kod_transportu,
         im_kod_warunkow_dostawy,
         im_kod_izby_celnej,
         im_kod_procedury_celnej,
         im_znacznik_kategorii_progowej
  --

  exec stat.DziennikWpisInfo 'stop: dgp_import_intr_agregacja'