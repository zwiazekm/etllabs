-- =============================================
-- Autor:		    Krzysztof Nagły
-- Data utworzenia: 10.06.2014
-- Opis:            Krok 6b, procedura wybiera podmioty o najniższych obrotach wg wartości MSOKP
-- =============================================
CREATE PROCEDURE [stat].[dop_vies6b_IntrSporzadzListePodmWgMSOKP]
    --@p_rok int,
	@p_miesiac int,
	@p_typ char(1)
AS
begin
  exec stat.DziennikWpisInfo 'Początek procedury dop_vies6b_intrSporzadzListePodmWgMSOKP, która wyznacza podmioty o najniższych obrotach wg wartości MSOKP';

  if @p_typ = 'P'
    begin
		exec stat.DziennikWpisInfo 'Wyznaczanie dla nabyć - do tabeli [stat].[dot_viesNabyciaListaPodmWgMSOKP]';
		insert into [stat].[dot_viesNabyciaListaPodmWgMSOKP]
			select kpn2.RokMc,
				   kpn2.kod_kraju,
				   kpn2.id_pod,
				   kpn2.kod_towarowy,
				   kpn2.kraj_pochodzenia,
				   kpn2.rodzaj_transakcji,
				   kpn2.nabycia_bezposr,
				   kpn2.sumaDlaPodmiotow,
				   kpn2.msokp
			  from (select kpn.RokMc,
						   kpn.kod_kraju,
						   min(kpn.sumaDlaPodmiotow) as sumaDlaPodmiotowMinWiekszaOdMsokp,
						   kpn.msokp
					  from (select nab.RokMc,
								   nab.kod_kraju,
								   ipod.id_pod,
								   nab.nabycia_bezposr,
								   SUM(nab.nabycia_bezposr) over(partition by nab.RokMc, nab.kod_kraju
																 order by nab.RokMc, nab.kod_kraju, nab.nabycia_bezposr
																 rows unbounded preceding) as sumaDlaPodmiotow,
								   kkm.msokp
							  from stat.[dot_viesIstatAnalizaSzacowaniePodprNabycia] nab,
								   stat.dgv_kopia_intr_dane_pod ipod,
								   stat.dot_kategoria kat,
								   (select kk.kod_kraju,
											 so.msokp,
											 so.RokMc
										from (select nab.kod_kraju
											   from stat.[dot_viesIstatAnalizaSzacowaniePodprNabycia] nab
											  group by nab.kod_kraju) kk,
											 stat.dot_viesNabyciaKM_K1_StrukturaOgolna so
									   where kk.kod_kraju = so.KodKraju
										 /*and so.NrOkresu = 6*/) kkm
							  where nab.nip = ipod.nip
								and ipod.id_pod = kat.id_pod
								and nab.kod_kraju = kkm.kod_kraju
								and nab.RokMc = kkm.RokMc
								and kat.kategoria > 1
								and nab.RokMc % 100 = @p_miesiac   --KNo: poprawić 
								and nab.nabycia_bezposr > 0
								and kat.rodz_kat = 'P') kpn  --order by nab.nr_okresu, nab.kod_kraju, nab.nabycia_bezposr, sumaDlaPodmiotow
					  where kpn.msokp < kpn.sumaDlaPodmiotow
					  group by kpn.RokMc, kpn.kod_kraju, kpn.msokp
					  /*order by kpn.nr_okresu, kpn.kod_kraju*/) misu,
					 (select nab.RokMc,
							 nab.kod_kraju,
							 ipod.id_pod,
							 nab.kod_towarowy,
							 nab.kraj_pochodzenia,
							 nab.rodzaj_transakcji,
							 nab.nabycia_bezposr,
							 SUM(nab.nabycia_bezposr) over(partition by nab.RokMc, nab.kod_kraju
														   order by nab.RokMc, nab.kod_kraju, nab.nabycia_bezposr
														   rows unbounded preceding) as sumaDlaPodmiotow,
							 kkm.msokp
						from stat.[dot_viesIstatAnalizaSzacowaniePodprNabycia] nab,
							 stat.dgv_kopia_intr_dane_pod ipod,
							 stat.dot_kategoria kat,
							 (select kk.kod_kraju,
				  					 so.msokp,
									 so.RokMc
								from (select nab.kod_kraju
										from stat.[dot_viesIstatAnalizaSzacowaniePodprNabycia] nab
										group by nab.kod_kraju) kk,
										stat.dot_viesNabyciaKM_K1_StrukturaOgolna so
								where kk.kod_kraju = so.KodKraju
								/*and so.NrOkresu = 6*/) kkm
					   where nab.nip = ipod.nip
						 and ipod.id_pod = kat.id_pod
						 and nab.kod_kraju = kkm.kod_kraju
						 and nab.RokMc = kkm.RokMc
						 and kat.kategoria > 1
						 and nab.RokMc % 100 = @p_miesiac
						 and nab.nabycia_bezposr > 0
						 and kat.rodz_kat = 'P') kpn2
			 where kpn2.RokMc = misu.RokMc
			   and kpn2.kod_kraju = misu.kod_kraju
			   and kpn2.sumaDlaPodmiotow <= misu.sumaDlaPodmiotowMinWiekszaOdMsokp
			 order by kpn2.RokMc, kpn2.kod_kraju, kpn2.nabycia_bezposr;
    end;
  else
    begin
		exec stat.DziennikWpisInfo 'Wyznaczanie dla dostaw - do tabeli [stat].[dot_viesDostawyListaPodmWgMSOKP]';
		insert into [stat].[dot_viesDostawyListaPodmWgMSOKP]
			select kpn2.RokMc,
				   kpn2.kod_kraju,
				   kpn2.id_pod,
				   kpn2.kod_towarowy,
				   kpn2.kraj_pochodzenia,
				   kpn2.rodzaj_transakcji,
				   kpn2.dostawy_bezposr,
				   kpn2.sumaDlaPodmiotow,
				   kpn2.msokp
			  from (select kpn.RokMc,
						   kpn.kod_kraju,
						   min(kpn.sumaDlaPodmiotow) as sumaDlaPodmiotowMinWiekszaOdMsokp,
						   kpn.msokp
					  from (select dos.RokMc,
								   dos.kod_kraju,
								   ipod.id_pod,
								   dos.dostawy_bezposr,
								   SUM(dos.dostawy_bezposr) over(partition by dos.RokMc, dos.kod_kraju
																 order by dos.RokMc, dos.kod_kraju, dos.dostawy_bezposr
																 rows unbounded preceding) as sumaDlaPodmiotow,
								   kkm.msokp
							  from stat.[dot_viesIstatAnalizaSzacowaniePodprDostawy] dos,
								   stat.dgv_kopia_intr_dane_pod ipod,
								   stat.dot_kategoria kat,
								   (select kk.kod_kraju,
										   so.msokp,
										   so.RokMc
									  from (select dos.kod_kraju
											  from stat.[dot_viesIstatAnalizaSzacowaniePodprDostawy] dos
											 group by dos.kod_kraju) kk,
										   stat.dot_viesDostawyKM_K1_StrukturaOgolna so
									 where kk.kod_kraju = so.KodKraju
									 /*and so.NrOkresu = 6*/) kkm
							  where dos.nip = ipod.nip
								and ipod.id_pod = kat.id_pod
								and dos.kod_kraju = kkm.kod_kraju
								and dos.RokMc = kkm.RokMc
								and kat.kategoria > 1
								and dos.RokMc % 100 = @p_miesiac
								and dos.dostawy_bezposr > 0
								and kat.rodz_kat = 'W') kpn  --order by nab.nr_okresu, nab.kod_kraju, nab.nabycia_bezposr, sumaDlaPodmiotow
					  where kpn.msokp < kpn.sumaDlaPodmiotow
					  group by kpn.RokMc, kpn.kod_kraju, kpn.msokp
					  /*order by kpn.nr_okresu, kpn.kod_kraju*/) misu,
					 (select dos.RokMc,
							 dos.kod_kraju,
							 ipod.id_pod,
							 dos.kod_towarowy,
							 dos.kraj_pochodzenia,
							 dos.rodzaj_transakcji,
							 dos.dostawy_bezposr,
							 SUM(dos.dostawy_bezposr) over(partition by dos.RokMc, dos.kod_kraju
														   order by dos.RokMc, dos.kod_kraju, dos.dostawy_bezposr
														   rows unbounded preceding) as sumaDlaPodmiotow,
							 kkm.msokp
						from stat.[dot_viesIstatAnalizaSzacowaniePodprDostawy] dos,
							 stat.dgv_kopia_intr_dane_pod ipod,
							 stat.dot_kategoria kat,
							 (select kk.kod_kraju,
				  					 so.msokp,
									 so.RokMc
								from (select nab.kod_kraju
										from stat.[dot_viesIstatAnalizaSzacowaniePodprDostawy] nab
										group by nab.kod_kraju) kk,
										stat.dot_viesDostawyKM_K1_StrukturaOgolna so
								where kk.kod_kraju = so.KodKraju
								/*and so.NrOkresu = 6*/) kkm
					   where dos.nip = ipod.nip
						 and ipod.id_pod = kat.id_pod
						 and dos.kod_kraju = kkm.kod_kraju
						 and dos.RokMc = kkm.RokMc
						 and kat.kategoria > 1
						 and dos.RokMc % 100 = @p_miesiac
						 and dos.dostawy_bezposr > 0
						 and kat.rodz_kat = 'W') kpn2
			 where kpn2.RokMc = misu.RokMc
			   and kpn2.kod_kraju = misu.kod_kraju
			   and kpn2.sumaDlaPodmiotow <= misu.sumaDlaPodmiotowMinWiekszaOdMsokp
			 order by kpn2.RokMc, kpn2.kod_kraju, kpn2.dostawy_bezposr;
    end; --dla if - else

	exec stat.DziennikWpisInfo 'Koniec procedury dop_vies6b_intrSporzadzListePodmWgMSOKP, która wyznacza podmioty o najniższych obrotach wg wartości MSOKP';
end;