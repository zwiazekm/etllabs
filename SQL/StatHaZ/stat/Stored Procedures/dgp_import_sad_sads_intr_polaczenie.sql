CREATE  PROCEDURE [stat].dgp_import_sad_sads_intr_polaczenie
as
  --
  exec stat.DziennikWpisInfo 'start: dgp_import_sad_sads_intr_polaczenie'
  --
  -- PoĄczenie danych
  truncate table [stat].dgt_import_sad_sads_intr
  --
  insert into [stat].dgt_import_sad_sads_intr
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
         im_masa_netto,
         im_ilosc,
         im_wartosc_stat_zl,
         im_wartosc_stat_usd,
         im_wartosc_stat_euro
    from stat.dgt_import_intr_agr
   union all
  select left (im_pcn, 8),
         im_zp,
         left (im_pcnp, 8),
         im_kraj_pochodzenia,
         im_kraj_wysylki,
         im_odbiorca,
         im_RokMc,
         im_rodzaj_transakcji,
         im_kod_transportu_g as  im_kod_transportu,
         im_kod_warunkow_dostawy,
         im_kod_izby_celnej,
         im_kod_procedury_celnej,
         '0' im_znacznik_kategorii_progowej,
         im_masa_netto,
         im_ilosc,
         im_wartosc_stat_zl,
         im_wartosc_stat_usd,
         im_wartosc_stat_euro
    from dgt_import_sad_sads_agr
   --union all
--   select cn,
--          zn_p,
--          cn_p,
--          kraj_poch,
--          kraj_wys,
--          regon,
--          mies_rok,
--          tranzak,
--          trans,
--          war_dos,
--          urz_cel,
--          [proc],
--          '0' prog,
--          right ('               ' + ltrim (rtrim (masa_net)), 15),
--          right ('               ' + ltrim (rtrim (ilosc)), 15),
--          right ('               ' + ltrim (rtrim (wart_zl)), 15),
--          right ('               ' + ltrim (rtrim (wart_dol)), 15),
--          right ('               ' + ltrim (rtrim (wart_euro)), 15)
--     from import0104_2004_dbf
--   order by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
  --
  exec stat.DziennikWpisInfo 'stop: dgp_import_sad_sads_intr_polaczenie'