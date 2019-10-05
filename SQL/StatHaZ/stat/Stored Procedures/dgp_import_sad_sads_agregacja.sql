CREATE  PROCEDURE [stat].dgp_import_sad_sads_agregacja
as
  --
  exec stat.DziennikWpisInfo 'start: dgp_import_sad_sads_agregacja'
  --
  -- Agregacja danych
  truncate table [stat].dgt_import_sad_sads_agr
  --
  insert into [stat].dgt_import_sad_sads_agr
  select im_pcn,
         im_zp,
         im_pcnp,
         im_kraj_pochodzenia,
         im_kraj_wysylki,
         im_kraj_zakupu,
         im_odbiorca,
         im_miesiac_rok,
         im_rodzaj_transakcji,
         im_kod_transportu_g,
         im_kod_transportu_w,
         im_kod_warunkow_dostawy,
         im_kod_izby_celnej,
         im_kod_procedury_celnej,
         im_kod_waluty,
         im_kod_kraju_srodka_transportu,
         im_kontener,
         im_kod_preferencji,
         sum(im_masa_netto) as im_masa_netto,
         sum(im_masa_brutto) as im_masa_brutto,
         sum(im_ilosc) as im_ilosc,
         sum(im_wartosc_stat_zl) as im_wartosc_stat_zl,
         sum(im_wartosc_stat_usd) as im_wartosc_stat_usd,
         sum(im_wartosc_stat_euro) as im_wartosc_stat_euro,
         sum(im_wartosc_pozycji) as im_wartosc_pozycji
    from stat.dgt_import_sad_sads
   group by im_pcn,
         im_zp,
         im_pcnp,
         im_kraj_pochodzenia,
         im_kraj_wysylki,
         im_kraj_zakupu,
         im_odbiorca,
         im_miesiac_rok,
         im_rodzaj_transakcji,
         im_kod_transportu_g,
         im_kod_transportu_w,
         im_kod_warunkow_dostawy,
         im_kod_izby_celnej,
         im_kod_procedury_celnej,
         im_kod_waluty,
         im_kod_kraju_srodka_transportu,
         im_kontener,
         im_kod_preferencji
  --

  exec stat.DziennikWpisInfo 'stop: dgp_import_sad_sads_agregacja'