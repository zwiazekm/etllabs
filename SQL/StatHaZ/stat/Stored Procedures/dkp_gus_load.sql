CREATE procedure stat.dkp_gus_load
@p_nazwa varchar(30) = 'test.xls'
as
  declare @v_id int
  declare @v_wersja varchar(10)
  -- pobranie max z
  --
  select @v_id = isnull(max(id),0) + 1 from stat.dkt_plik_gus
  select top 1 @v_wersja = isnull(wersja,'1.0') from gust.dkv_gus_wersja
  
  insert into stat.dkt_plik_gus
    (id, nazwa, wersja)
   values 
    (@v_id, @p_nazwa, @v_wersja)
  --import
  insert into stat.dkt_plik_gus_poz
   (id_pliku,
    typ,
    pcn,
    kraj_przeznaczenia,
    kraj_wysylki,
    kraj_pochodzenia,
    regon,
    miesiac_rok,
    rodzaj_transakcji,
    kod_transportu,
    kod_warunkow_dostawy,
    kod_izby_celnej,
    kod_procedury_celnej,
    masa_netto,
    ilosc,
    wartosc_stat_zl,
    wartosc_stat_usd,
    wartosc_stat_euro,
    komentarz,
    propozycja,
    prog,
    status)
    select  @v_id,
            'I',
            pcn,
            null,
            kraj_wys,
            kraj_poch,
            regon,
            miesiac_rok,
            tranzak,
            trans,
            war_dos,
            left(urz_cel,2),
            procedura,
            masa_net,
            ilosc,            
            wart_zl,
            wart_dol,
            wart_euro,
            komentarz,
            propozycja,        
            prog,
            'S'
    from gust.dkv_gus_import
  --eksport
  insert into stat.dkt_plik_gus_poz
   (id_pliku,
    typ,
    pcn,
    kraj_przeznaczenia,
    kraj_wysylki,
    kraj_pochodzenia,
    regon,
    miesiac_rok,
    rodzaj_transakcji,
    kod_transportu,
    kod_warunkow_dostawy,
    kod_izby_celnej,
    kod_procedury_celnej,
    masa_netto,
    ilosc,
    wartosc_stat_zl,
    wartosc_stat_usd,
    wartosc_stat_euro,
    komentarz,
    propozycja,
    prog,
    status)
    select  @v_id,
            'E',
            pcn,
            kraj_przezn,
            NULL,
            NULL,
            regon,
            miesiac_rok,
            tranzak,
            trans,
            war_dos,
            left(urz_cel,2),
            procedura,
            masa_net,
            ilosc,            
            wart_zl,
            wart_dol,
            wart_euro,
            komentarz,
            propozycja,        
            prog,
            'S'
    from gust.dkv_gus_eksport