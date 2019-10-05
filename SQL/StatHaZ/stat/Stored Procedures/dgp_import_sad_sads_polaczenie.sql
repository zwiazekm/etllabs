CREATE  PROCEDURE [stat].dgp_import_sad_sads_polaczenie
as
  --
  exec stat.DziennikWpisInfo 'start: dgp_import_sad_sads_polaczenie'
  --
  -- Połączenie SAD i SADS
truncate table [stat].dgt_import_sad_sads;
  insert into [stat].dgt_import_sad_sads
  select im_pcn,
         im_zp,
         im_pcnp,
         im_kraj_pochodzenia,
         im_kraj_wysylki,
         im_kraj_zakupu,
         im_odbiorca,
         im_RokMc,
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
         im_masa_netto,
         im_masa_brutto,
         im_ilosc,
         im_wartosc_stat_zl,
         im_wartosc_stat_usd,
         im_wartosc_stat_euro,
         im_wartosc_pozycji
    from stat.dgt_import_sad
   order by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
  --
  exec stat.DziennikWpisInfo 'stop: dgp_import_sad_sads_polaczenie'