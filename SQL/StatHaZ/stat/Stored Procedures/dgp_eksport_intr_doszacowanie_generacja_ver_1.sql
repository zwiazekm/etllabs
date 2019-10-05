


CREATE PROCEDURE [stat].dgp_eksport_intr_doszacowanie_generacja_ver_1
  @p_data_od datetime,
  @p_data_do datetime
as
  declare @v_komunikat varchar(1024)
  --
  set @v_komunikat = 'start: dgp_eksport_intr_doszacowanie_generacja_ver_1 od ' + convert(varchar(12), @p_data_od) + ' do '+ convert(varchar(12), @p_data_do)
  --
  exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
  --
  -- ... przygotowanie tymczasowej pomocniczej tabeli
  create table #dgt_eksport_intr_agr (
    ek_pcn                         varchar (8),
    ek_zp                          char (1),
    ek_pcnp                        varchar (8),
    ek_kraj_przeznaczenia          varchar (2),
    ek_odbiorca                    varchar (14),
    ek_nip                         varchar (10),
    ek_RokMc                       int,
    ek_rodzaj_transakcji           varchar (2),
    ek_kod_transportu              char (1),
    ek_kod_warunkow_dostawy        varchar (3),
    ek_kod_izby_celnej             varchar (2),
    ek_kod_procedury_celnej        varchar (4),
    ek_znacznik_kategorii_progowej char (1),
    ek_masa_netto                  DECIMAL (19, 3),
    ek_ilosc                       DECIMAL (19, 3),
    ek_wartosc_stat_zl             DECIMAL (19, 3),
    ek_wartosc_stat_usd            DECIMAL (19, 3),
    ek_wartosc_stat_euro           DECIMAL (19, 3),
    ek_wartosc_faktury             DECIMAL (19, 3)
  )
  -- ... pobranie doszacowanych danych
  --
  insert into #dgt_eksport_intr_agr
  select isnull (
           (select nowy 
              from stat.dgv_kopia_sl_mapowania
             where rodzaj = 'cn' and stary = isnull (dwp.kod_towarowy, '99209900')),
           isnull (dwp.kod_towarowy, '99209900')
         )                                                ek_pcn,
         ' '                                              ek_zp,
         isnull (
           (select nowy 
              from stat.dgv_kopia_sl_mapowania
             where rodzaj = 'cn' and stary = isnull (dwp.kod_towarowy, '99209900')),
           isnull (dwp.kod_towarowy, '99209900')
         )                                                ek_pcnp,
         isnull (
           (select nowy
              from stat.dgv_kopia_sl_mapowania
             where rodzaj = 'kraje' and stary = dwp.kraj_przezn_wysyl),
           dwp.kraj_przezn_wysyl
         )                                                ek_kraj_przeznaczenia,
         left (ltrim (rtrim (isnull (dwd.regon_zobowiazanego, ''))) + '00000000000000', 14) ek_odbiorca,
         dwd.nip_zobowiazanego                            ek_nip,
         dwd.RokMc									      ek_miesiac_rok,
         isnull (
             (select nowy 
                from stat.dgv_kopia_sl_mapowania
               where rodzaj = 'transakcje' and stary = dwp.rodzaj_transakcji),
           dwp.rodzaj_transakcji
         )                                                ek_rodzaj_transakcji,
         left (ltrim (rtrim (dwp.rodzaj_transportu)), 1)  ek_kod_transportu,
         dwp.warunki_dostawy                              ek_kod_warunkow_dostawy,
         null                                             ek_kod_izby_celnej,
         '0000'                                           ek_kod_procedury_celnej,
         dwp.wskaznik_progowy                             ek_znacznik_kategorii_progowej,
         dwp.masa_netto                                   ek_masa_netto,
         dwp.uzup_jm                                      ek_ilosc,
         dwp.wartosc_statystyczna                         ek_wartosc_stat_zl,
         convert (integer, isnull (
           (select top 1 dwp.wartosc_statystyczna / k.kurs
              from stat.dgv_kopia_kw_tabela t,
                   stat.dgv_kopia_kw_kurs k
             where t.nr_tabeli = k.nr_tabeli
               and k.id_waluty = 'USD'
			   and dwd.RokMc between dbo.KonwertujDateNaRokMc(t.data_od) and dbo.KonwertujDateNaRokMc(t.data_do)
               and t.aktywna = 'Y')          
         , 0))                                            ek_wartosc_stat_usd,
         convert (integer, isnull (
           (select top 1 dwp.wartosc_statystyczna / k.kurs
              from stat.dgv_kopia_kw_tabela t,
                   stat.dgv_kopia_kw_kurs k
             where t.nr_tabeli = k.nr_tabeli
               and k.id_waluty = 'EUR'
			   and dwd.RokMc between dbo.KonwertujDateNaRokMc(t.data_od) and dbo.KonwertujDateNaRokMc(t.data_do)
               and t.aktywna = 'Y')          
         , 0))                                            ek_wartosc_stat_euro,
         dwp.wartosc_faktury                              ek_wartosc_faktury

    from stat.dot_dekl_wynik_dok as dwd,
         stat.dot_dekl_wynik_poz as dwp
   where dwd.id = dwp.id
     and dwd.typ = 'W'
     and dwp.nr_grp is null
     and dwd.RokMc BETWEEN dbo.[KonwertujDateNaRokMc](@p_data_od) AND dbo.[KonwertujDateNaRokMc](@p_data_do)
	 
  -- ... agregacja
  insert into [stat].dgt_eksport_intr_agr ( ek_pcn,
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
         ek_masa_netto,
         ek_ilosc,
         ek_wartosc_stat_zl,
         ek_wartosc_stat_usd,
         ek_wartosc_stat_euro,
         ek_wartosc_faktury)
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
         sum (ek_masa_netto),
         sum (ek_ilosc),
         sum (ek_wartosc_stat_zl),
         sum (ek_wartosc_stat_usd),
         sum (ek_wartosc_stat_euro),
         sum (ek_wartosc_faktury)

    from #dgt_eksport_intr_agr
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
  -- ... usuniecie tymczasowej tabeli
  drop table #dgt_eksport_intr_agr
  --
  exec stat.DziennikWpisInfo 'stop: dgp_eksport_intr_doszacowanie_generacja_ver_1'