CREATE PROCEDURE [stat].dgp_import_sad_generacja_ver_3
  @p_data_od datetime, 
  @p_data_do datetime 
as
  declare @v_komunikat varchar(1024)
  --
  set @v_komunikat = 'start: dgp_import_sad_generacja_ver_3 od ' + convert(varchar(12), @p_data_od) + ' do '+ convert(varchar(12), @p_data_do)
  --
  exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
  --
  -- SAD 2.0
  exec stat.DziennikWpisInfo 'start: dgp_import_sad_generacja_ver_3 - insert'

  insert into [stat].dgt_import_sad
    select distinct left ( isnull (st.[KodTowarowy], '99209900') + isnull(st.[KodTaric],'00'), 10)                     im_pcn,
           ' '                                                   im_zp,
  left ( isnull (st.[KodTowarowy], '99209900') + isnull(st.[KodTaric],'00'), 10)                     im_pcnp,
           upper (st.[KrajPochodzenia])                                                    im_kraj_pochodzenia,
           upper (ds.KrajWysylki)                                                    im_kraj_wysylki,
           '  '                                                  im_kraj_zakupu,
           left (ltrim (rtrim (isnull (isnull (
             (select top 1 [Regon] 
                from stat.dgv_kopia_v2_kontrahenci k2, stat.dgv_kopia_v2_sad_odbiorca sn
               where sn.idKntr = k2.idKntr and sn.idDokNr = ds.idDokNr),
             (select top 1 [Regon] 
                from stat.dgv_kopia_v2_tmp_kontrahenci kt2
               where kt2.[IdDokNr] = ds.idDokNr and kt2.[Typ] = 'ODB')
           ), ''))) + '00000000000000', 14)                    im_odbiorca,
           substring (convert (varchar, di.[DataPrzyjecia], 112), 5, 2) +
           substring (convert (varchar, di.[DataPrzyjecia], 112), 3, 2) im_miesiac_rok,
         ds.[RodzajTransakcji]                                                     im_rodzaj_transakcji,
           tr.[Rodzaj]                                             im_kod_transportu_g,
null                                   im_kod_transportu_w,
           ds.[KodDost]                                            im_kod_warunkow_dostawy,
           isnull (
             (select nowy 
                from stat.dgv_kopia_sl_mapowania
               where rodzaj = 'izby' and stary = substring (su.[UCZgloszenia], 3, 2)),
             substring (su.[UCZgloszenia], 3, 2)
           )                                                     im_kod_izby_celnej,
              left (st.[procedura], 4)                                                     im_kod_procedury_celnej,
           ds.[Waluta]                                             im_kod_waluty,
           tr.[Kraj]                                                     im_kod_kraju_srodka_transportu,
           ds.[Kontenery]                                          im_kontener,
           st.[Preferencje]                                        im_kod_preferencji,
           isnull (st.[MasaNetto], 0)                              im_masa_netto,
           isnull (ds.[MasaBrutto], 0)                             im_masa_brutto,
           isnull (st.[IloscUzupelniajacaJm], 0)                   im_ilosc,
           isnull (st.[WartoscStatystyczna], 0)                    im_wartosc_stat_zl,
           convert (varchar, convert (numeric (15,2), isnull (
             st.[WartoscStatystyczna] / usd.kurs
           , 0)))                                                im_wartosc_stat_usd,
           convert (varchar, convert (numeric (15,2), isnull (
             st.[WartoscStatystyczna] / eur.kurs
           , 0)))                                                im_wartosc_stat_euro,
           isnull (st.[WartoscPozycji], 0)                         im_wartosc_pozycji,
           di.idDokNr                                            im_iddoknr,
           st.[PozId]                                              im_iddoknr_pozid,
           'S'                                                   im_typ
    from  stat.dgv_kopia_v2_sad_dpdz_tow st,
          stat.dgv_kopia_v2_dok_sad ds,
          stat.dgv_kopia_v2_dok_info di,
          stat.dgv_kopia_v2_sad_transport tr,
          stat.dgv_kopia_v2_sad_uc su,
          (select k.kurs kurs,
                  convert (varchar, t.data_od, 112) data_od,
                  convert (varchar, t.data_do, 112) data_do
             from stat.dgv_kopia_kw_tabela t,
                  stat.dgv_kopia_kw_kurs k
            where t.nr_tabeli = k.nr_tabeli
              and k.id_waluty = 'USD'
              and t.aktywna = 'Y') usd,
          (select k.kurs kurs,
                  convert (varchar, t.data_od, 112) data_od,
                  convert (varchar, t.data_do, 112) data_do
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
      and convert (varchar, di.[DataPrzyjecia], 112) between convert (varchar, @p_data_od, 112) and convert (varchar, @p_data_do, 112)
      and convert (varchar, di.[DataPrzyjecia], 112) between usd.data_od and usd.data_do     
      and convert (varchar, di.[DataPrzyjecia], 112) between eur.data_od and eur.data_do
      and (    left (st.[procedura], 2) in ('01','42','43','45','02','07','41','48','49','51','68','91')
            or (     left (st.[procedura], 2) = '40'
                 and (    left (st.[procedura], 4) <> '4000'
                       or ds.[RodzajTransakcji] <> '23'
                     )
               )
          )
      and (    substring (convert (varchar, st.[procedura]), 3, 1) not in ('4', '5') 
            or substring (convert (varchar, st.[procedura]), 3, 2) = '53'
          )
      and isnull(st.[KodTowarowy],'99209900') not in ('49070030', '71082000','71189000','27111100','27112100','27160000')
      and isnull(ds.[RodzajTransakcji],'') not in ('42', '43','60')
      and (    right (left (st.[procedura], 4), 2) not in ('21', '22')
            or left (st.[procedura], 2) in ('61','63','68')
          )
      and st.[KrajPochodzenia] != 'PL'
     -- intrastat
      and not (    (     st.[procedura] = '5154'
               and ds.KrajWysylki in ('AT','BE','BG','CY','CZ','DE','DK','EE','ES','FI','FR','GB','GR','HR','HU','IE','IT','LT','LU','LV','MT','NL','PL','PT','QR','QV','RO','SE','SI','SK'))
          or (     ds.[P1c] = 'T2LF'
               and st.[procedura] = '4900'
               and ds.KrajWysylki in ('AT','BE','BG','CY','CZ','DE','DK','EE','ES','FI','FR','GB','GR','HR','HU','IE','IT','LT','LU','LV','MT','NL','PL','PT','QR','QV','RO','SE','SI','SK'))
        )
  --
  exec stat.DziennikWpisInfo 'stop: dgp_import_sad_generacja_ver_3'