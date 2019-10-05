create  PROCEDURE [stat].dgp_import_intr_doszacowanie_generacja_ver_1
  @p_data_od datetime,
  @p_data_do datetime
as
  declare @v_komunikat varchar(1024)
  --
  set @v_komunikat = 'start: dgp_import_intr_doszacowanie_generacja_ver_1 od ' + convert(varchar(12), @p_data_od) + ' do '+ convert(varchar(12), @p_data_do)
  --
  exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
  --
  -- ... przygotowanie tymczasowej pomocniczej tabeli
  create table #dgt_import_intr_agr (
    im_pcn                         varchar (8),
    im_zp                          varchar (1),
    im_pcnp                        varchar (8),
    im_kraj_pochodzenia            varchar (2),
    im_kraj_wysylki                varchar (2),
    im_odbiorca                    varchar (14),
    im_nip                         varchar (10),
    im_RokMc                       int,
    im_rodzaj_transakcji           varchar (2),
    im_kod_transportu              varchar (1),
    im_kod_warunkow_dostawy        varchar (3),
    im_kod_izby_celnej             varchar (2),
    im_kod_procedury_celnej        varchar (4),
    im_znacznik_kategorii_progowej varchar (1),
    im_masa_netto                  varchar (15),
    im_ilosc                       varchar (15),
    im_wartosc_stat_zl             varchar (15),
    im_wartosc_stat_usd            varchar (15),
    im_wartosc_stat_euro           varchar (15),
    im_wartosc_faktury             varchar (15)

  )
  -- ... pobranie doszacowanych danych
  --
  insert into #dgt_import_intr_agr
  select isnull (
           (select nowy 
              from stat.dgv_kopia_sl_mapowania
             where rodzaj = 'cn' and stary = isnull (dwp.kod_towarowy, '99209900')),
           isnull (dwp.kod_towarowy, '99209900')
         )                                      im_pcn,
         ' '                                    im_zp,
         isnull (
           (select nowy 
              from stat.dgv_kopia_sl_mapowania
             where rodzaj = 'cn' and stary = isnull (dwp.kod_towarowy, '99209900')),
           isnull (dwp.kod_towarowy, '99209900')
         )                                      im_pcnp,
         isnull (
           (select nowy 
              from stat.dgv_kopia_sl_mapowania
             where rodzaj = 'kraje' and stary = dwp.kraj_pochodzenia),
           dwp.kraj_pochodzenia
         )                                      im_kraj_pochodzenia,
         isnull (
           (select nowy 
              from stat.dgv_kopia_sl_mapowania
             where rodzaj = 'kraje' and stary = dwp.kraj_przezn_wysyl),
           dwp.kraj_przezn_wysyl
         )                                      im_kraj_wysylki,
         left (ltrim (rtrim (isnull (dwd.regon_zobowiazanego, ''))) + '00000000000000', 14) im_odbiorca,
         dwd.nip_zobowiazanego                  im_nip,
         dwd.RokMc as im_miesiac_rok,
         isnull (
           (select nowy 
              from stat.dgv_kopia_sl_mapowania
             where rodzaj = 'transakcje' and stary = dwp.rodzaj_transakcji),
           dwp.rodzaj_transakcji
         )                                      im_rodzaj_transakcji,
         left (ltrim (rtrim (dwp.rodzaj_transportu)), 1) im_kod_transportu,
         dwp.warunki_dostawy                    im_kod_warunkow_dostawy,
         null                                   im_kod_izby_celnej,
         '0000'                                 im_kod_procedury_celnej,
         dwp.wskaznik_progowy                   im_znacznik_kategorii_progowej,
         dwp.masa_netto                         im_masa_netto,
         dwp.uzup_jm                            im_ilosc,
         dwp.wartosc_statystyczna               im_wartosc_stat_zl,
         convert (integer, isnull (
           (select top 1 dwp.wartosc_statystyczna / k.kurs
              from stat.dgv_kopia_kw_tabela t,
                   dgv_kopia_kw_kurs k
             where t.nr_tabeli = k.nr_tabeli
               and k.id_waluty = 'USD'
			   and dwd.RokMc BETWEEN dbo.[KonwertujDateNaRokMc](t.data_od) AND dbo.[KonwertujDateNaRokMc](t.data_do)
               and t.aktywna = 'Y')          
         , 0))                                  im_wartosc_stat_usd,
         convert (integer, isnull (
           (select top 1 dwp.wartosc_statystyczna / k.kurs
              from stat.dgv_kopia_kw_tabela t,
                   dgv_kopia_kw_kurs k
             where t.nr_tabeli = k.nr_tabeli
               and k.id_waluty = 'EUR'
			   and dwd.RokMc BETWEEN dbo.[KonwertujDateNaRokMc](t.data_od) AND dbo.[KonwertujDateNaRokMc](t.data_do)
               and t.aktywna = 'Y')          
         , 0))                                  im_wartosc_stat_euro,
         dwp.wartosc_faktury                    im_wartosc_faktury

    from stat.dot_dekl_wynik_dok as dwd,
         dot_dekl_wynik_poz as dwp
   where dwd.id = dwp.id
     and dwd.typ = 'P'
     and dwp.nr_grp is null
     and dwd.RokMc BETWEEN dbo.[KonwertujDateNaRokMc](@p_data_od) AND dbo.[KonwertujDateNaRokMc](@p_data_do)
   -- ... agregacja
  insert into [stat].dgt_import_intr_agr
  ( im_pcn,
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
         im_masa_netto,
         im_ilosc,
         im_wartosc_stat_zl,
         im_wartosc_stat_usd,
         im_wartosc_stat_euro,
         im_wartosc_faktury
  )
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
         sum (convert (numeric, im_masa_netto)),
         sum (convert (numeric, im_ilosc)),
         sum (convert (numeric, im_wartosc_stat_zl)),
         sum (convert (numeric, im_wartosc_stat_usd)),
         sum (convert (numeric, im_wartosc_stat_euro)),
         sum (convert (numeric, im_wartosc_faktury))
    from #dgt_import_intr_agr
   group by im_pcn,
         im_zp,
         im_pcnp,
         im_kraj_pochodzenia,
         im_kraj_wysylki,
         im_odbiorca,
         im_nip,
         imRokMc,
         im_rodzaj_transakcji,
         im_kod_transportu,
         im_kod_warunkow_dostawy,
         im_kod_izby_celnej,
         im_kod_procedury_celnej,
         im_znacznik_kategorii_progowej
  -- ... usuniecie tymczasowej tabeli
  drop table #dgt_import_intr_agr
  --
  exec stat.DziennikWpisInfo 'stop: dgp_import_intr_doszacowanie_generacja_ver_1'