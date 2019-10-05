CREATE  PROCEDURE [stat].dgp_eksport_sad_sads_intr_polaczenie
as
  --
  exec stat.DziennikWpisInfo 'start: dgp_eksport_sad_sads_intr_polaczenie'
  --
  -- PoĄczenie danych
  truncate table [stat].dgt_eksport_sad_sads_intr
  --
  insert into [stat].dgt_eksport_sad_sads_intr
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
         ek_masa_netto, 
         ek_ilosc, 
         ek_wartosc_stat_zl, 
         ek_wartosc_stat_usd, 
         ek_wartosc_stat_euro
    from stat.dgt_eksport_intr_agr
   union all
  select left (ek_pcn, 8), 
         ek_zp,
         left (ek_pcnp, 8),
         ek_kraj_przeznaczenia, 
         ek_odbiorca, 
         ek_RokMc, 
         ek_rodzaj_transakcji, 
         ek_kod_transportu_g as ek_kod_transportu , 
         ek_kod_warunkow_dostawy, 
         ek_kod_izby_celnej, 
         ek_kod_procedury_celnej, 
         '0' ek_znacznik_kategorii_progowej, 
         ek_masa_netto, 
         ek_ilosc, 
         ek_wartosc_stat_zl, 
         ek_wartosc_stat_usd, 
         ek_wartosc_stat_euro
    from stat.dgt_eksport_sad_sads_agr
   --union all
--   select cn,
--          zn_p,
--          cn_p,
--          kraj_przez,
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
--     from eksport0104_2004_dbf
--   order by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
  --
  exec stat.DziennikWpisInfo 'stop: dgp_eksport_sad_sads_intr_polaczenie'