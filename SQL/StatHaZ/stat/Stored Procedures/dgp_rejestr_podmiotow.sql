CREATE PROCEDURE [stat].dgp_rejestr_podmiotow
  @p_data_do datetime
as
  --
  exec stat.DziennikWpisInfo 'start: dgp_rejestr_podmiotow';
  --
  truncate table [stat].dgt_rejestr_podmiotow;
  
  --KN: Zamiast doklejać spacje można użyć CHAR(255)...
  
  insert into [stat].dgt_rejestr_podmiotow
  select left(idp.nip + '          ', 10) nip,
         left(isnull(idp.regon,'') + '              ', 14) regon,
         left(isnull(idp.nazwa,'') 
            + '                                                   '
            + '                                                   '
            + '                                                   '
            + '                                                   '
            + '                                                   ', 255) nazwa_pelna,
         left(isnull(idp.imie,'') + '                                   ', 35) imie,
         left(isnull(idp.nazwisko,'') + '                                   ', 35) nazwisko,
         left(isnull(idp.kod_kraj,'') + '  ', 2) kraj,
         left(isnull(idp.kod_gmina,'') + '       ', 7) gmina,
         left(isnull(idp.kod_poczt,'') + '        ', 8) kod_poczt,
         left(isnull(idp.poczta,'') + '                                   ', 35) poczta,
         left(isnull(idp.miejscowosc,'') + '                                   ', 35) miejscowosc,
         left(isnull(idp.ulica,'') + '                                             ', 45) ulica,
         left(isnull(idp.nr_dom,'') + '         ', 9) nr_domu,
         left(isnull(idp.nr_lok,'') + '     ', 5) nr_lok,
         left(isnull(idp.telefon,'') + '                                   ', 35) telefon,
         left(isnull(idp.faks,'') + '                                   ', 35)faks,
         left(isnull(idp.email,'') 
            + '                                                                    '
            + '                                                            ', 128) email,
         left(isnull(idp.rodz_vat,'') + ' ', 1) rodz_vat,
         left(isnull(convert(varchar(8), idp.data_zakoncz),'') + '        ', 8) data_zakoncz,
         left(isnull(kat_p.kategoria,'') + ' ', 1) kategoria_p,
         left(isnull(kat_w.kategoria,'') + ' ', 1) kategoria_w,
         left(isnull(convert(varchar(1),prio_p.priorytet),'') + ' ', 1) priorytet_p,
         left(isnull(convert(varchar(1),prio_w.priorytet),'') + ' ', 1) priorytet_w,
         left(isnull(dgv_kopia_intr_rdin.kod_us,'') + '          ', 10) kod_us,
         right('              ' + convert(varchar(14), isnull(dgv_kopia_intr_rdin.trans_dostawa,0)), 14) trans_dostawa,
         right('              ' + convert(varchar(14), isnull(dgv_kopia_intr_rdin.trans_nabycie,0)), 14) trans_nabycie
    from [stat].dgt_kopia_intr_dane_pod idp
      LEFT JOIN    [stat].dgv_kopia_intr_rdin ON idp.nip = dgv_kopia_intr_rdin.[NIP] 
      LEFT JOIN    [stat].dgv_kopia_dot_kategoria kat_p ON idp.id_pod  = kat_p.id_pod
      LEFT JOIN    [stat].dgv_kopia_dot_kategoria kat_w ON idp.id_pod  = kat_w.id_pod
      LEFT JOIN    [stat].dgv_kopia_dot_priorytet prio_p ON idp.id_pod  = prio_p.id_pod
      LEFT JOIN    [stat].dgv_kopia_dot_priorytet prio_w ON idp.id_pod  = prio_w.id_pod
   where 
         kat_p.rodz_kat = 'P'
     and kat_w.rodz_kat = 'W'
     and prio_p.rodzaj_prior = 'P'
     and prio_w.rodzaj_prior = 'W'
     and month (@p_data_do) between kat_p.wazna_od_mies and isnull(kat_p.wazna_do_mies, 12)
     and year (@p_data_do) between kat_p.wazna_od_rok and isnull(kat_p.wazna_do_rok, 2099)
     and month (@p_data_do) between kat_w.wazna_od_mies and isnull(kat_w.wazna_do_mies, 12)
     and year (@p_data_do) between kat_w.wazna_od_rok and isnull(kat_w.wazna_do_rok, 2099)
     and month (@p_data_do) between prio_p.wazna_od_mies and isnull(prio_p.wazna_do_mies, 12)
     and year (@p_data_do) between prio_p.wazna_od_rok and isnull(prio_p.wazna_do_rok, 2099)
     and month (@p_data_do) between prio_w.wazna_od_mies and isnull(prio_w.wazna_do_mies, 12)
     and year (@p_data_do) between prio_w.wazna_od_rok and isnull(prio_w.wazna_do_rok, 2099)
	 and dgv_kopia_intr_rdin.RokMc = dbo.[KonwertujDateNaRokMc](@p_data_do)
   order by 1  
  --
  exec stat.DziennikWpisInfo 'stop: dgp_rejestr_podmiotow'