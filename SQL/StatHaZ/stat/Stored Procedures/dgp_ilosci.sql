CREATE procedure [stat].dgp_ilosci AS
--
select im_RokMc,
       sum (im_masa_netto) im_masa_netto,
       sum (im_ilosc) im_ilosc,
       sum (im_wartosc_stat_zl) im_wartosc_stat_zl,
       sum (im_wartosc_stat_usd) im_wartosc_stat_usd,
       sum (im_wartosc_stat_euro) im_wartosc_stat_euro
  from dgt_import_sad_sads_intr_agr
 group by im_RokMc
order by 1
--
select im_RokMc,
       im_znacznik_kategorii_progowej,
       sum (im_masa_netto) im_masa_netto,
       sum (im_ilosc) im_ilosc,
       sum (im_wartosc_stat_zl) im_wartosc_stat_zl,
       sum (im_wartosc_stat_usd) im_wartosc_stat_usd,
       sum (im_wartosc_stat_euro) im_wartosc_stat_euro
  from dgt_import_sad_sads_intr_agr
 group by im_RokMc,
       im_znacznik_kategorii_progowej
order by 1, 2
--------------------------------------------------------------------------------------
select ek_RokMc,
       sum (ek_masa_netto) ek_masa_netto,
       sum (ek_ilosc) ek_ilosc,
       sum (ek_wartosc_stat_zl) ek_wartosc_stat_zl,
       sum (ek_wartosc_stat_usd) ek_wartosc_stat_usd,
       sum (ek_wartosc_stat_euro) ek_wartosc_stat_euro
  from dgt_eksport_sad_sads_intr_agr
 group by ek_RokMc
order by 1
--
select ek_RokMc,
       ek_znacznik_kategorii_progowej,
       sum (ek_masa_netto) ek_masa_netto,
       sum (ek_ilosc) ek_ilosc,
       sum (ek_wartosc_stat_zl) ek_wartosc_stat_zl,
       sum (ek_wartosc_stat_usd) ek_wartosc_stat_usd,
       sum (ek_wartosc_stat_euro) ek_wartosc_stat_euro
  from dgt_eksport_sad_sads_intr_agr
 group by ek_RokMc,
       ek_znacznik_kategorii_progowej
order by 1, 2