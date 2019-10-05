CREATE PROCEDURE [stat].dgp_eksport_intr_generacja_ver_3
  @p_data_od datetime,
  @p_data_do datetime
as
  declare @v_komunikat varchar(1024)
  --
  set @v_komunikat = 'start: dgp_eksport_intr_generacja_ver_3 od ' + convert(varchar(12), @p_data_od) + ' do '+ convert(varchar(12), @p_data_do)
  --
  exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
  -- ... pobranie "gotowych" danych
  exec stat.DziennikWpisInfo 'start: dgp_eksport_intr_generacja_ver_3 - intrastat - insert'
  insert into [stat].dgt_eksport_intr
  select         left (isnull (dwp.kod_towarowy, '99209900') , 8)                                          ek_pcn,
         ' '                                              ek_zp,
                 left (isnull (dwp.kod_towarowy, '99209900') , 8)                                                ek_pcnp,
         upper ( dwp.kraj_przezn_wysyl)                                               ek_kraj_przeznaczenia,
         left (ltrim (rtrim (isnull (dwd.regon_zobowiazanego, ''))) + '00000000000000', 14) ek_odbiorca,
         dwd.nip_zobowiazanego                            ek_nip,
		 dbo.KonwertujOkresNaMMYY(dwd.RokMc) AS           ek_miesiac_rok,
        dwp.rodzaj_transakcji                                                   ek_rodzaj_transakcji,
         left (ltrim (rtrim (dwp.rodzaj_transportu)), 1)  ek_kod_transportu,
         dwp.warunki_dostawy                              ek_kod_warunkow_dostawy,
--         isnull (
  --           (select nowy 
    --            from stat.dgv_kopia_sl_mapowania
      --         where rodzaj = 'izby' and stary = left (dz.id_jedn, 2)),
        --   left (dz.id_jedn, 2))
null                                                ek_kod_izby_celnej,
         '0000'                                           ek_kod_procedury_celnej,
         1                                                ek_znacznik_kategorii_progowej,
         dwp.masa_netto                                   ek_masa_netto,
         dwp.uzup_jm                                      ek_ilosc,
         dwp.wartosc_stat                                 ek_wartosc_stat_zl,
         convert (varchar, convert (numeric (15,2), isnull (
           dwp.wartosc_stat / usd.kurs
         , 0)))                                           ek_wartosc_stat_usd,
         convert (varchar, convert (numeric (15,2), isnull (
           dwp.wartosc_stat / eur.kurs
         , 0)))                                           ek_wartosc_stat_euro,
         dwp.wartosc_faktury                              ek_wartosc_faktury,
         null                                             ek_iddoknr,
         dwd.id_dok                                       ek_id_dok,
         null                                             ek_iddoknr_pozid,
         dwp.pozid                                        ek_id_dok_pozid,
         'I'                                              ek_typ
    from stat.dgv_kopia_istat_dekl_wynik_dok as dwd,
         dot_dekl_wynik_poz_nowa_wartosc_stat as dwp,
   --      (select id_dok_dekl_wynik, isnull (id_jedn, left (sym_dok_zrd, 6)) id_jedn from stat.dgv_kopia_istat_dok_zrodlowy group by id_dok_dekl_wynik, isnull (id_jedn, left (sym_dok_zrd, 6))) as dz,
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
   --  and dwd.id_dok = dz.id_dok_dekl_wynik
     and dwd.nip_zobowiazanego = dp.nip
     and dp.id_pod = k.id_pod
	 and dwd.RokMc BETWEEN k.WaznaOdRokMc AND k.WaznaDoRokMc
     and k.kategoria <> 1
     and k.rodz_kat = dwd.typ
     and dwd.typ = 'W'
     and dwd.[Status] != 'U'
     and dwp.[Status] = 'Y'
     and dbo.KonwertujOkresNaDate(dwd.RokMc) BETWEEN usd.data_od and usd.data_do
     and dbo.KonwertujOkresNaDate(dwd.RokMc) BETWEEN eur.data_od and eur.data_do
     and dbo.KonwertujOkresNaDate(dwd.RokMc) BETWEEN @p_data_od and @p_data_do
     and left (isnull (dwp.kod_towarowy, '99209900') , 8) not in ('49070030', '71082000', '71189000', '27111100', '27112100', '27160000')
     and isnull(dwp.rodzaj_transakcji,'') not in ('52', '53', '60')
    --
    -- wĄczenia
    -- SAD 2.0
  exec stat.DziennikWpisInfo 'start: dgp_eksport_intr_generacja_ver_3 - sad - insert'
  insert into [stat].dgt_eksport_intr
    select left ( isnull (st.[KodTowarowy], '99209900'), 8)                                                        ek_pcn,
           ' '                                                          ek_zp,
           left ( isnull (st.[KodTowarowy], '99209900'), 8)                                                        ek_pcnp,
           upper ( isnull (st.[KrajPrzeznaczenia], ds.[KrajPrzeznaczenia])     )                                               ek_kraj_przeznaczenia,
           left (ltrim (rtrim (isnull (isnull(
             (select top 1 [Regon] 
                from stat.dgv_kopia_v2_kontrahenci k2, dgv_kopia_v2_sad_nadawca sn
               where sn.idKntr = k2.idKntr
                 and sn.idDokNr = ds.idDokNr),
             (select top 1 [Regon] 
                from stat.dgv_kopia_v2_tmp_kontrahenci kt2
               where kt2.[IdDokNr] = ds.idDokNr
                 and kt2.[Typ] = 'NAD')
           ), ''))) + '00000000000000', 14)                             ek_odbiorca,
           '          '                                                 ek_nip,
           substring (convert (varchar, di.[DataPrzyjecia], 112), 5, 2) +
           substring (convert (varchar, di.[DataPrzyjecia], 112), 3, 2)   ek_miesiac_rok,
           ds.[RodzajTransakcji]                                                            ek_rodzaj_transakcji,
           tr.[Rodzaj]                                                    ek_kod_transportu,
           ds.[KodDost]                                                   ek_kod_warunkow_dostawy,
           isnull (
             (select nowy 
                from stat.dgv_kopia_sl_mapowania
               where rodzaj = 'izby' and stary = substring (su.[UCZgloszenia], 3, 2)),
             substring (su.[UCZgloszenia], 3, 2)
           )                                                            ek_kod_izby_celnej,
             left (st.[procedura], 4)                                              ek_kod_procedury_celnej,
           0                                                            ek_znacznik_kategorii_progowej,
           isnull (st.[MasaNetto], 0)                                     ek_masa_netto,
           isnull (st.[IloscUzupelniajacaJm], 0)                          ek_ilosc,
           isnull (st.[WartoscStatystyczna], 0)                           ek_wartosc_stat_zl,
           convert (varchar, convert (numeric (15,2), isnull (
             st.[WartoscStatystyczna] / usd.kurs
           , 0)))                                                       ek_wartosc_stat_usd,
           convert (varchar, convert (numeric (15,2), isnull (
             st.[WartoscStatystyczna] / eur.kurs
           , 0)))                                                       ek_wartosc_stat_euro,
           isnull (st.[WartoscStatystyczna], 0)                           ek_wartosc_faktury,
          di.idDokNr                                                    ek_iddoknr,
          null                                                          ek_id_dok,
          st.[PozId]                                                      ek_iddoknr_pozid,
          null                                                          ek_id_dok_pozid,
          'S'                                                           ek_typ
     from stat.dgv_kopia_v2_sad_dpdz_tow st,
          dgv_kopia_v2_dok_sad ds,
          dgv_kopia_v2_dok_info di,
          dgv_kopia_v2_sad_transport tr,
          dgv_kopia_v2_sad_uc su,
          (select k.kurs kurs,
                  convert (varchar, t.data_od, 112) data_od,
                  convert (varchar, t.data_do, 112) data_do
             from stat.dgv_kopia_kw_tabela t,
                  dgv_kopia_kw_kurs k
            where t.nr_tabeli = k.nr_tabeli              and k.id_waluty = 'USD'
              and t.aktywna = 'Y') usd,
          (select k.kurs kurs,
                  convert (varchar, t.data_od, 112) data_od,
                  convert (varchar, t.data_do, 112) data_do
             from stat.dgv_kopia_kw_tabela t,
                  dgv_kopia_kw_kurs k
            where t.nr_tabeli = k.nr_tabeli
              and k.id_waluty = 'EUR'
              and t.aktywna = 'Y') eur
    where ds.idDokNr = st.[IdDokNr]
      and ds.idDokNr = di.idDokNr
      and ds.idDokNr = tr.idDokNr
      and ds.idDokNr = su.idDokNr
      and tr.[Wewn_Granica] = 'G'
      and di.[Status] in ('X', 'G')
      and left (convert (varchar, di.[DataPrzyjecia], 112), 6) between left (convert (varchar, @p_data_od, 112), 6) and left (convert (varchar, @p_data_do, 112), 6)
      and convert (varchar, di.[DataPrzyjecia], 112) between usd.data_od and usd.data_do
      and convert (varchar, di.[DataPrzyjecia], 112) between eur.data_od and eur.data_do
      and (    (    left (st.[procedura], 2) = '10'
                and (    left (st.[procedura], 4) <> '1000' 
                      or ds.[RodzajTransakcji] not in ('23'))
                and left (st.[procedura], 4) not in ('1021', '1022', '1071', '1076', '1077'))
            or left (st.[procedura], 2) in ('11', '21', '22')
            or left (st.[procedura], 4) in  ('3151', '3191', '3192', 
                                           '7102', '7141', '7151', '7154', 
                                           '7602', '7641', '7651', '7654', 
                                           '7702', '7741', '7751', '7754', 
                                           '7802', '7841', '7851', '7854')
          )
      and isnull(st.[KodTowarowy],'99209900') not in ('49070030', '71082000', '71189000', '27111100', '27112100', '27160000')
      and isnull(ds.[RodzajTransakcji],'') not in ('52', '53', '60')
       -- intrastat
      and ( upper ( isnull (st.[KrajPrzeznaczenia], ds.[KrajPrzeznaczenia])) in ('AT','BE','BG','CY','CZ','DE','DK','EE','ES','FI','FR','GB','GR','HR','HU','IE','IT','LT','LU','LV','MT','NL','PL','PT','QR','QV','RO','SE','SI','SK')
              and ( st.[procedura]='3151' or (ds.[P1c] = 'T2LF' and st.[procedura]='4900')) 
           )
--sp_help dgt_eksport_intr
insert into [stat].dgt_eksport_intr
    select distinct left (isnull(eegi.gi_cn_code,'99209900'), 8)                           ek_pcn,
           ' '                                                                             ek_zp,
          left (isnull(eegi.gi_cn_code,'99209900'), 8)                                     ek_pcnp,
           upper (isnull(eegi.gi_country_of_destination, eed.exp_country_of_destinatnion)) ek_kraj_przeznaczenia,
          isnull(isnull(isnull((select top 1 case when ltrim(regon)='' then null else regon end 
                           from stat.dgv_kopia_ecs_exp_exporter_of_item 
                          where goods_item_id = eegi.id) ,
                        (select top 1 case when ltrim(dgv_kopia_intr_dane_pod.regon)='' then null else dgv_kopia_intr_dane_pod.regon end
                           from stat.dgv_kopia_ecs_exp_exporter_of_item, dgv_kopia_intr_dane_pod 
                          where goods_item_id = eegi.id and substring(tin,3,20) =  nip)),
                 isnull((select top 1 case when ltrim(regon)='' then null else regon end
                           from stat.dgv_kopia_ecs_exp_exporter 
                          where declcoexport_decl_id = eed.decl_id) ,
                        (select top 1 case when ltrim(dgv_kopia_intr_dane_pod.regon)='' then null else dgv_kopia_intr_dane_pod.regon end
                           from stat.dgv_kopia_ecs_exp_exporter, dgv_kopia_intr_dane_pod  
                          where declcoexport_decl_id = eed.decl_id and substring(tin,3,20) = nip))), '99999999999999') ek_odbiorca,
           '          '                                                                    ek_nip,
           substring (convert (varchar, eed.exp_acceptance_date, 112), 5, 2) +
           substring (convert (varchar, eed.exp_acceptance_date, 112), 3, 2)               ek_miesiac_rok,
           eed.td_nature_of_transation                                                     ek_rodzaj_transakcji,
           substring (eed.tab_mode,1,1)                                                    ek_kod_transportu,
           eed.dt_code                                                                     ek_kod_warunkow_dostawy,
           substring (eed.exp_co_of_export,3,2)                                            ek_kod_izby_celnej,
           eegi.gi_proc_requested + eegi.gi_proc_previous                                  ek_kod_procedury_celnej,
           0                                                                               ek_znacznik_kategorii_progowej,
           isnull (eegi.gi_net_mass, 0)                                                    ek_masa_netto,
           isnull (eegi.gi_quantity_suppl_unit, 0)                                         ek_ilosc,
           isnull (eegi.vog_statistical_value, 0)                                          ek_wartosc_stat_zl,
           convert (varchar, convert (numeric (15,2), isnull (
             eegi.vog_statistical_value / usd.kurs, 0)))                                   ek_wartosc_stat_usd,
           convert (varchar, convert (numeric (15,2), isnull (
             eegi.vog_statistical_value / eur.kurs, 0)))                                   ek_wartosc_stat_euro,
           0                                                                               ek_wartosc_faktury,
           eed.decl_id                                                                     ek_iddoknr,
           null                                                                            ek_id_dok,
           eegi.id                                                                         ek_iddoknr_pozid,
           null                                                                            ek_id_dok_pozid,
           'E'                                                                             ek_type
    from  stat.dgv_kopia_ecs_exp_goods_item eegi,
          dgv_kopia_ecs_exp_declcoexport eed,
          (select k.kurs kurs, convert (varchar, t.data_od, 112) data_od, convert (varchar, t.data_do, 112) data_do
             from stat.dgv_kopia_kw_tabela t,
                  stat.dgv_kopia_kw_kurs k
            where t.nr_tabeli = k.nr_tabeli
              and k.id_waluty = 'USD'
              and t.aktywna = 'Y') usd,
          (select k.kurs kurs, convert (varchar, t.data_od, 112) data_od, convert (varchar, t.data_do, 112) data_do
             from stat.dgv_kopia_kw_tabela t,
                  stat.dgv_kopia_kw_kurs k
            where t.nr_tabeli = k.nr_tabeli
              and k.id_waluty = 'EUR'
              and t.aktywna = 'Y') eur
   where eed.decl_id = eegi.declcoexport_decl_id
      and convert (varchar, eed.exp_acceptance_date, 112) between usd.data_od and usd.data_do
      and convert (varchar, eed.exp_acceptance_date, 112) between eur.data_od and eur.data_do
      and eed.exp_status in ('T', 'Z')
      and convert (varchar, eed.exp_acceptance_date, 112) between convert (varchar, @p_data_od, 112) and convert (varchar, @p_data_do, 112)
      and ((left (eegi.gi_proc_requested, 2) = '10'
          and(left (eegi.gi_proc_requested + eegi.gi_proc_previous, 4) <> '1000'
                     or isnull(eed.td_nature_of_transation,'')not in ('23')
                     )
                 and left (eegi.gi_proc_requested + eegi.gi_proc_previous , 4) not in ('1021', '1022', '1071', '1076', '1077')
               )
            or left (eegi.gi_proc_requested, 2) in ('11', '21', '22')
            or left (eegi.gi_proc_requested + eegi.gi_proc_previous , 4) in  ('3151', '3191', '3192',
                                           '7102', '7141', '7151', '7154',
                                           '7602', '7641', '7651', '7654',
                                           '7702', '7741', '7751', '7754',
                                           '7802', '7841', '7851', '7854')
          )
      and left (isnull(eegi.gi_cn_code,'99209900'), 8) not in ('49070030', '71082000', '71189000', '27111100', '27112100', '27160000')
      and isnull(eed.td_nature_of_transation,'') not in ('52', '53', '60')
 -- intrastat
      and ( upper (isnull(eegi.gi_country_of_destination, eed.exp_country_of_destinatnion)) in ('AT','BE','CY','CZ','DK','EE','FI','FR','GR','ES','IE','LT','LU','LV','MT','NL','DE','PL','PT','SK','SI','SE','HU','GB','IT','BG','RO')
                  and ( left (eegi.gi_proc_requested + eegi.gi_proc_previous , 4)='3151')
              )

  exec stat.DziennikWpisInfo 'stop: dgp_eksport_intr_generacja_ver_3'