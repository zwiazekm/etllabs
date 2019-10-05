-- =============================================
-- Autor:		    ?
-- Autor modyf      Kamil Nowiński
-- Data utworzenia: ?
-- Data modyf       30.09.2014
-- Opis:            Procedura wyliczająca obroty bieżące (na każdy miesiąc bieżącego roku) i obroty ubiegłoroczne (na każdy miesiąc poprzedniego roku) dla podmiotów. 
--                  Modyfikacja dodała obroty ubiegloroczne
-- =============================================
CREATE PROCEDURE [stat].dop_generacja_danych_poczatkowych
  @p_data_do date
as
begin
  --
  declare @idm bigint;
  declare @id bigint;
  declare @info varchar(1000) = '@p_data_do = ' + convert (varchar, @p_data_do, 111)
  exec @id = stat.DziennikWpisInfo @info, @@PROCID;
  --
  print 'Procedura dop_generacja_danych_poczatkowych';
  print 'Parametry:';
  print @info;
  --
  -- Generacja danych
  -- ... obliczenie wspolczynnika F na wszystkie miesiace danego roku
  --
	TRUNCATE TABLE tmp.wspolczynnik_f;
	DECLARE @rok smallint = year(@p_data_do);
    insert into tmp.wspolczynnik_f
	select @rok*100 + m.Miesiac
		, stat.dof_wspolczynnik_f ('P', @rok*100 + m.Miesiac)
		, stat.dof_wspolczynnik_f ('W', @rok*100 + m.Miesiac)
	from stat.vMiesiace m;

  -- ... dot_obroty_biezace
  print '-- ... dot_obroty_biezace';
  exec @idm = [stat].DziennikWpisInfo '- dot_obroty_biezace', @@PROCID;
  --
  insert into stat.dot_obroty_biezace
  select dp.id_pod id_pod,
         dwd.RokMc ,
         sum (case when dwd.typ = 'P' then isnull (dwp.wartosc_stat, dwp.wartosc_faktury * wf_wspolczynnik_f_przywoz) else 0 end) as stat_przywoz,
         sum (case when dwd.typ = 'W' then isnull (dwp.wartosc_stat, dwp.wartosc_faktury * wf_wspolczynnik_f_wywoz) else 0 end) as stat_wywoz,
         sum (case when dwd.typ = 'P'
                   and left (dwp.rodzaj_transakcji, 1) in ('4', '5')
                   then isnull (dwp.wartosc_stat, dwp.wartosc_faktury * wf_wspolczynnik_f_przywoz)
                   else 0
               end
         ) as trans_nu_przywoz,
         sum (case when dwd.typ = 'W'
                    and left (dwp.rodzaj_transakcji, 1) in ('4', '5')
                   then isnull (dwp.wartosc_stat, dwp.wartosc_faktury * wf_wspolczynnik_f_wywoz)
                   else 0
               end
         ) as trans_nu_wywoz
    from stat.dot_dekl_wynik_poz_nowa_wartosc_stat as dwp,
		 stat.dgv_kopia_istat_dekl_wynik_dok as dwd,
		 stat.dgv_kopia_intr_dane_pod as dp,
         tmp.wspolczynnik_f as wf
   where dwp.id_dok = dwd.id_dok
     and dwd.nip_zobowiazanego = dp.nip
     and dwd.RokMc = wf.wf_RokMc
     and dwd.[Status] != 'U'
     and dwp.[Status] = 'Y'
     and dwd.RokMc BETWEEN dbo.KonwertujMiRNaRokMc(1, @rok) AND dbo.KonwertujMiRNaRokMc(MONTH(@p_data_do), @rok)
   group by dp.id_pod,
         dwd.RokMc;

	exec stat.DziennikCzas @idm;



  -- ... dot_obroty_ubiegloroczne
    print '-- ... ubiegloroczne';
    exec @idm = [stat].DziennikWpisInfo '- obroty_ubiegloroczne', @@PROCID;

	TRUNCATE TABLE tmp.wspolczynnik_f;
	SET @rok = year(@p_data_do) - 1;
    insert into tmp.wspolczynnik_f
	select @rok*100 + m.Miesiac
		, stat.dof_wspolczynnik_f ('P', @rok*100 + m.Miesiac)
		, stat.dof_wspolczynnik_f ('W', @rok*100 + m.Miesiac)
	from stat.vMiesiace m;
 
  insert into stat.dot_obroty_ubiegloroczne
  select dp.id_pod id_pod,
         dwd.RokMc,
         sum (case when dwd.typ = 'P' 
		           then isnull (dwp.wartosc_stat, dwp.wartosc_faktury * wf_wspolczynnik_f_przywoz) 
				   else 0 
			  end) stat_przywoz,
         sum (case when dwd.typ = 'W' 
		           then isnull (dwp.wartosc_stat, dwp.wartosc_faktury * wf_wspolczynnik_f_wywoz) 
				   else 0 
			  end) stat_wywoz,
         sum (case when dwd.typ = 'P'
                    and left (dwp.rodzaj_transakcji, 1) in ('4', '5')
                   then isnull (dwp.wartosc_stat, dwp.wartosc_faktury * wf_wspolczynnik_f_przywoz)
                   else 0
              end) trans_nu_przywoz,
         sum (case when dwd.typ = 'W'
                    and left (dwp.rodzaj_transakcji, 1) in ('4', '5')
                   then isnull (dwp.wartosc_stat, dwp.wartosc_faktury * wf_wspolczynnik_f_wywoz)
                   else 0
              end) trans_nu_wywoz
    from stat.dot_dekl_wynik_poz_nowa_wartosc_stat as dwp,
	     stat.dgv_kopia_istat_dekl_wynik_dok as dwd,
		 stat.dgv_kopia_intr_dane_pod as dp,
         tmp.wspolczynnik_f as wf
   where dwp.id_dok = dwd.id_dok
     and dwd.nip_zobowiazanego = dp.nip
     and dwd.RokMc = wf.wf_RokMc
     and dwd.[Status] != 'U'
     and dwp.[Status] = 'Y'
     and dwd.RokMc BETWEEN dbo.KonwertujMiRNaRokMc(1, @rok) AND dbo.KonwertujMiRNaRokMc(12, @rok)
   group by dp.id_pod,
         dwd.RokMc;

  --
  --  exec [stat].DziennikWpisInfo 'stop: obroty_biezace i ubiegloroczne', @@PROCID;
	exec stat.DziennikCzas @idm;

  --
   -- ... wyczyszczenie tabel pomocniczych
  truncate table tmp.wspolczynnik_f;
  --
  exec stat.DziennikWpisInfo 'stop', @@PROCID;
  exec stat.DziennikCzas @id;
end;