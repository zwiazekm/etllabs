CREATE procedure [stat].dop_wyznaczenie_wartosci_statystycznej
  @p_data_do date
as
  --
  exec stat.DziennikWpisInfo 'start', @@PROCID
  --
  print 'Procedura dop_wyznaczenie_wartosci_statystycznej'
  print 'Parametry:'
  print '@p_data_do = ' + convert (varchar, @p_data_do, 111)
  --
  -- Obliczenie wspolczynnika F na wszystkie miesiace danego roku
	TRUNCATE TABLE tmp.wspolczynnik_f;
	DECLARE @rok smallint = year(@p_data_do);
    insert into tmp.wspolczynnik_f
	select @rok*100 + m.Miesiac
		, stat.dof_wspolczynnik_f ('P', @rok*100 + m.Miesiac)
		, stat.dof_wspolczynnik_f ('W', @rok*100 + m.Miesiac)
	from stat.vMiesiace m;

  -- Wybor pozycji
  update stat.dot_dekl_wynik_poz_nowa_wartosc_stat
     set wartosc_stat = dwp.wartosc_faktury * case when dwd.typ = 'P' then wf.wf_wspolczynnik_f_przywoz else wf_wspolczynnik_f_wywoz end
    from stat.dgv_kopia_istat_dekl_wynik_dok dwd,
         stat.dot_dekl_wynik_poz_nowa_wartosc_stat dwp,
         stat.dgv_kopia_intr_dane_pod dp,
         stat.dot_kategoria k,
         tmp.wspolczynnik_f wf
   where dwp.id_dok = dwd.id_dok
     and dwd.nip_zobowiazanego = dp.nip
     and dp.id_pod = k.id_pod
     and dwd.[Status] != 'U'
     and dwp.[Status] = 'Y'
     and k.kategoria in ('2', '3')
     and dwd.RokMc = wf.wf_RokMc
     and dwd.RokMc between k.WaznaOdRokMc and k.WaznaDoRokMc
     and (    k.kategoria = '2'
           or (     k.kategoria = '3'
                and (dwp.wartosc_stat is null or dwp.wartosc_stat = 0)
              )
         );




	TRUNCATE TABLE tmp.wspolczynnik_f;
	SET @rok = year(@p_data_do) - 1;
    insert into tmp.wspolczynnik_f
	select @rok*100 + m.Miesiac
		, stat.dof_wspolczynnik_f ('P', @rok*100 + m.Miesiac)
		, stat.dof_wspolczynnik_f ('W', @rok*100 + m.Miesiac)
	from stat.vMiesiace m;

  -- Wybor pozycji
  update stat.dot_dekl_wynik_poz_nowa_wartosc_stat
     set wartosc_stat = dwp.wartosc_faktury * case when dwd.typ = 'P' then wf.wf_wspolczynnik_f_przywoz else wf_wspolczynnik_f_wywoz end
    from stat.dgv_kopia_istat_dekl_wynik_dok dwd,
         stat.dot_dekl_wynik_poz_nowa_wartosc_stat dwp,
         stat.dgv_kopia_intr_dane_pod dp,
         stat.dot_kategoria k,
         tmp.wspolczynnik_f wf
   where dwp.id_dok = dwd.id_dok
     and dwd.nip_zobowiazanego = dp.nip
     and dp.id_pod = k.id_pod
     and dwd.[Status] != 'U'
     and dwp.[Status] = 'Y'
     and k.kategoria in ('2', '3')
     and dwd.RokMc = wf.wf_RokMc
     and dwd.RokMc between k.WaznaOdRokMc and k.WaznaDoRokMc
     and (    k.kategoria = '2'
           or (     k.kategoria = '3'
                and (dwp.wartosc_stat is null or dwp.wartosc_stat = 0)
              )
         )
  -- ... wyczyszczenie pomocniczej tableli z wspolczynnikiem F
	TRUNCATE TABLE tmp.wspolczynnik_f;
  --
  exec stat.DziennikWpisInfo 'stop', @@PROCID