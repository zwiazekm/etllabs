CREATE PROCEDURE [stat].dgp_import_intr_generacja_ver_3
  @p_data_od datetime,
  @p_data_do datetime
as
  declare @v_komunikat varchar(1024)
  --
  set @v_komunikat = 'start: dgp_import_intr_generacja_ver_3 od ' + convert(varchar(12), @p_data_od) + ' do '+ convert(varchar(12), @p_data_do)
  --
  -- ... pobranie "gotowych" danych
  exec stat.DziennikWpisInfo 'start: dgp_import_intr_generacja_ver_3 - intrastat - insert'

  truncate table [stat].dgt_import_intr;

  insert into [stat].dgt_import_intr
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
         upper (isnull (
           (select nowy 
              from stat.dgv_kopia_sl_mapowania
             where rodzaj = 'kraje' and stary = dwp.kraj_pochodzenia),
           dwp.kraj_pochodzenia
         ))                                     im_kraj_pochodzenia,
         upper (isnull (
           (select nowy 
              from stat.dgv_kopia_sl_mapowania
             where rodzaj = 'kraje' and stary = dwp.kraj_przezn_wysyl),
           dwp.kraj_przezn_wysyl
         ))                                     im_kraj_wysylki,
         left (ltrim (rtrim (isnull (dwd.regon_zobowiazanego, ''))) + '00000000000000', 14) im_odbiorca,
         dwd.nip_zobowiazanego                  im_nip,
         dbo.KonwertujOkresNaMMYY(dwd.RokMc) AS im_miesiac_rok,
         isnull (
           (select nowy 
              from stat.dgv_kopia_sl_mapowania
             where rodzaj = 'transakcje' and stary = dwp.rodzaj_transakcji),
           dwp.rodzaj_transakcji
         )                                      im_rodzaj_transakcji,
         left (ltrim (rtrim (dwp.rodzaj_transportu)), 1) im_kod_transportu,
         dwp.warunki_dostawy                    im_kod_warunkow_dostawy,
     --    isnull (
       --    (select nowy 
       --       from stat.dgv_kopia_sl_mapowania
        --     where rodzaj = 'izby' and stary = left (dz.id_jedn, 2)),
       --    left (dz.id_jedn, 2)         )           
null                          im_kod_izby_celnej,
         '0000'                                 im_kod_procedury_celnej,
         1                                      im_znacznik_kategorii_progowej,
         dwp.masa_netto                         im_masa_netto,
         dwp.uzup_jm                            im_ilosc,
         dwp.wartosc_stat                       im_wartosc_stat_zl,
         convert (varchar, convert (numeric (15,2), isnull (
           dwp.wartosc_stat / usd.kurs
         , 0)))                                 im_wartosc_stat_usd,
         convert (varchar, convert (numeric (15,2), isnull (
           dwp.wartosc_stat / eur.kurs
         , 0)))                                 im_wartosc_stat_euro,
         dwp.wartosc_faktury                    im_wartosc_faktury,
         null                                   im_iddoknr,
         dwd.id_dok                             im_id_dok,
         null                                   im_iddoknr_pozid,
         dwp.pozid                              im_id_dok_pozid,
         'I'                                    im_typ
    from stat.dgv_kopia_istat_dekl_wynik_dok as dwd,
         stat.dot_dekl_wynik_poz_nowa_wartosc_stat as dwp,
       --  (select id_dok_dekl_wynik, isnull (id_jedn, left (sym_dok_zrd, 6)) id_jedn from stat.dgv_kopia_istat_dok_zrodlowy group by id_dok_dekl_wynik, isnull (id_jedn, left (sym_dok_zrd, 6))) as dz,
         stat.dgv_kopia_intr_dane_pod dp,
         stat.dot_kategoria k,
         (select k.kurs kurs,
                 data_od,
                 data_do
            from stat.dgv_kopia_kw_tabela t,
                 stat.dgv_kopia_kw_kurs k
           where t.nr_tabeli = k.nr_tabeli
             and k.id_waluty = 'USD'
             and t.aktywna = 'Y') usd,
         (select k.kurs kurs,
                 data_od,
                 data_do
            from stat.dgv_kopia_kw_tabela t,
                 stat.dgv_kopia_kw_kurs k
           where t.nr_tabeli = k.nr_tabeli
             and k.id_waluty = 'EUR'
             and t.aktywna = 'Y') eur
   where dwd.id_dok = dwp.id_dok
    -- and dwd.id_dok = dz.id_dok_dekl_wynik
     and dwd.nip_zobowiazanego = dp.nip
     and dp.id_pod = k.id_pod
	 and dwd.RokMc BETWEEN k.WaznaOdRokMc AND k.WaznaDoRokMc
     and k.kategoria <> '1'
     and k.rodz_kat = dwd.typ
     and dwd.typ = 'P'
     and dwd.[Status] != 'U'
     and dwp.[Status] = 'Y'
     and dbo.KonwertujOkresNaDate(dwd.RokMc) BETWEEN usd.data_od and usd.data_do
     and dbo.KonwertujOkresNaDate(dwd.RokMc) BETWEEN eur.data_od and eur.data_do
     and dbo.KonwertujOkresNaDate(dwd.RokMc) BETWEEN @p_data_od and @p_data_do
     and isnull(dwp.kod_towarowy,'99209900') not in ('49070030', '71082000','71189000','27111100','27112100','27160000')
     and isnull(dwp.rodzaj_transakcji,'') not in ('42', '43','60')
     and isnull(dwp.kraj_pochodzenia,'') <> 'PL'


  --
  -- włączenia z SADów
  -- SAD 2.0
  exec stat.DziennikWpisInfo 'start: dgp_import_intr_generacja_ver_3 - sad - insert'
  insert into [stat].dgt_import_intr
  select left ( isnull (st.[KodTowarowy], '99209900'), 8)                                                 im_pcn,
         ' '                                                   im_zp,
         left (isnull (st.[KodTowarowy], '99209900'), 8)                                                 im_pcnp,
         upper (st.[KrajPochodzenia])                                                    im_kraj_pochodzenia,
         upper (ds.KrajWysylki)                                                    im_kraj_wysylki,
         left (ltrim (rtrim (isnull (isnull (
           (select top 1 [Regon] 
              from stat.dgv_kopia_v2_kontrahenci k2, 
					stat.dgv_kopia_v2_sad_odbiorca sn
             where sn.idKntr = k2.idKntr and sn.idDokNr = ds.idDokNr),
           (select top 1 [Regon] 
              from stat.dgv_kopia_v2_tmp_kontrahenci kt2
             where kt2.[IdDokNr] = ds.idDokNr and kt2.[Typ] = 'ODB')
         ), ''))) + '00000000000000', 14)                                                                                 
                                                               im_odbiorca,
         '          '                                          im_nip,
         substring (convert (varchar, di.[DataPrzyjecia], 112), 5, 2) +
         substring (convert (varchar, di.[DataPrzyjecia], 112), 3, 2) im_miesiac_rok,
         ds.[RodzajTransakcji]                                                     im_rodzaj_transakcji,
         tr.[Rodzaj]                                             im_kod_transportu,
         ds.[KodDost]                                            im_kod_warunkow_dostawy,
         isnull (
           (select nowy 
              from stat.dgv_kopia_sl_mapowania
             where rodzaj = 'izby' and stary = substring (su.[UCZgloszenia], 3, 2)),
           substring (su.[UCZgloszenia], 3, 2)
         )                                                     im_kod_izby_celnej,
         left (st.[procedura], 4)                                                     im_kod_procedury_celnej,
         0                                                     im_znacznik_kategorii_progowej,
         isnull (st.[MasaNetto], 0)                              im_masa_netto,
         isnull (st.[IloscUzupelniajacaJm], 0)                   im_ilosc,
         isnull (st.[WartoscStatystyczna], 0)                    im_wartosc_stat_zl,
         convert (varchar, convert (numeric (15,2), isnull (
             st.[WartoscStatystyczna] / usd.kurs
         , 0)))                                                im_wartosc_stat_usd,
         convert (varchar, convert (numeric (15,2), isnull (
             st.[WartoscStatystyczna] / eur.kurs
         , 0)))                                                im_wartosc_stat_euro,
         isnull (st.[WartoscStatystyczna], 0)                    im_wartosc_faktury,
         di.idDokNr                                            im_iddoknr,
         null                                                  im_id_dok,
         st.[PozId]                                              im_iddoknr_pozid,
         null                                                  im_id_dok_pozid,
         'S'                                                   im_typ
  from  stat.dgv_kopia_v2_sad_dpdz_tow st,
        stat.dgv_kopia_v2_dok_sad ds,
        stat.dgv_kopia_v2_dok_info di,
        stat.dgv_kopia_v2_sad_transport tr,
        stat.dgv_kopia_v2_sad_uc su,
        (select k.kurs kurs,
                data_od,
                data_do
           from stat.dgv_kopia_kw_tabela t,
                stat.dgv_kopia_kw_kurs k
          where t.nr_tabeli = k.nr_tabeli
            and k.id_waluty = 'USD'
            and t.aktywna = 'Y') usd,
        (select k.kurs kurs,
                data_od,
                data_do
           from stat.dgv_kopia_kw_tabela t,
                stat.dgv_kopia_kw_kurs k
          where t.nr_tabeli = k.nr_tabeli
            and k.id_waluty = 'EUR'
            and t.aktywna = 'Y') eur
  where ds.idDokNr = st.[IdDokNr]
    and ds.idDokNr = di.idDokNr
    and ds.idDokNr = tr.idDokNr
    and ds.idDokNr = su.idDokNr
    and tr.[Wewn_Granica] = 'G' 
    and di.[Status] in ('X', 'G')
    and di.[DataPrzyjecia] between @p_data_od and  @p_data_do
    and di.[DataPrzyjecia] between usd.data_od and usd.data_do
    and di.[DataPrzyjecia] between eur.data_od and eur.data_do
    and (    left (st.[procedura], 2) in ('01','42','43','45','02','07','41','48','49','51','68','91')
          or (     left (st.[procedura], 2) = '40'
               and (    left (st.[procedura], 4) <> '4000'
                     or ds.[RodzajTransakcji] <> '23')
             )
        )
    and (substring(convert(varchar, st.[procedura]), 3, 1) not in ('4', '5') 
         or substring (convert (varchar, st.[procedura]), 3, 2) ='53')
      and isnull(st.[KodTowarowy],'99209900') not in ('49070030', '71082000','71189000','27111100','27112100','27160000')
      and isnull(ds.[RodzajTransakcji],'') not in ('42', '43','60')
    and (    right (left (st.[procedura], 4), 2) not in ('21', '22')
          or left (st.[procedura], 2) in ('61', '63', '68'))
    and st.[KrajPochodzenia] != 'PL'
   -- intrastat
    and (    (     st.[procedura] = '5154'
               and ds.KrajWysylki in ('AT','BE','BG','CY','CZ','DE','DK','EE','ES','FI','FR','GB','GR','HR','HU','IE','IT','LT','LU','LV','MT','NL','PL','PT','QR','QV','RO','SE','SI','SK'))
          or (     ds.[P1c] = 'T2LF'
               and st.[procedura] = '4900'
               and ds.KrajWysylki in ('AT','BE','BG','CY','CZ','DE','DK','EE','ES','FI','FR','GB','GR','HR','HU','IE','IT','LT','LU','LV','MT','NL','PL','PT','QR','QV','RO','SE','SI','SK'))
)