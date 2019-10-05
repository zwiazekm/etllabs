CREATE  PROCEDURE [stat].dgp_eksport_sad_sads_agregacja
as
  --
  declare @Id bigint;
  exec @Id = [stat].dgp_wstaw_info 'start: dgp_eksport_sad_sads_agregacja', @@PROCID;
  --
  -- Agregacja danych
  truncate table [stat].dgt_eksport_sad_sads_agr
  --
  insert into [stat].dgt_eksport_sad_sads_agr
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
         sum(ek_masa_netto) as ek_masa_netto,
         sum(ek_masa_brutto) as ek_masa_brutto,
         sum(ek_ilosc) as ek_ilosc,
         sum(ek_wartosc_stat_zl) as ek_wartosc_stat_zl,
         sum(ek_wartosc_stat_usd) as ek_wartosc_stat_usd,
         sum(ek_wartosc_stat_euro) as ek_wartosc_stat_euro,
         sum(ek_wartosc_pozycji) as ek_wartosc_pozycji
    from dgt_eksport_sad_sads
   group by ek_pcn,
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
         ek_kontener
  --

  exec stat.DziennikWpisInfo 'stop: dgp_eksport_sad_sads_agregacja'
  exec stat.DziennikCzas @Id;