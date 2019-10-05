CREATE PROCEDURE [stat].dgp_eksport_intr_agregacja
as
  --
  exec stat.DziennikWpisInfo 'start: dgp_eksport_intr_agregacja - insert'
  --
  -- Agregacja danych
  insert into [stat].dgt_eksport_intr_agr
  select ek_pcn,
         ek_zp,
         ek_pcnp,
         ek_kraj_przeznaczenia,
         ek_odbiorca,
         ek_nip,
         ek_RokMc,
         ek_rodzaj_transakcji,
         ek_kod_transportu,
         ek_kod_warunkow_dostawy,
         ek_kod_izby_celnej,
         ek_kod_procedury_celnej,
         ek_znacznik_kategorii_progowej,
         sum(ek_masa_netto) as ek_masa_netto,
         sum(ek_ilosc) as ek_ilosc,
         sum(ek_wartosc_stat_zl) as ek_wartosc_stat_zl,
         sum(ek_wartosc_stat_usd) as ek_wartosc_stat_usd,
         sum(ek_wartosc_stat_euro) as ek_wartosc_stat_euro,
         sum(ek_wartosc_faktury) as ek_wartosc_faktury,
         null,
         null,
         null,
         null
    from stat.dgt_eksport_intr
   group by ek_pcn,
         ek_zp,
         ek_pcnp,
         ek_kraj_przeznaczenia,
         ek_odbiorca,
         ek_nip,
         ek_RokMc,
         ek_rodzaj_transakcji,
         ek_kod_transportu,
         ek_kod_warunkow_dostawy,
         ek_kod_izby_celnej,
         ek_kod_procedury_celnej,
         ek_znacznik_kategorii_progowej
  --
  exec stat.DziennikWpisInfo 'stop: dgp_eksport_intr_agregacja'