-- =============================================
-- Autor:		    Krzysztof Nagły
-- Data utworzenia: 04.06.2014
-- Opis: Krok 3, wyciągnięcie z VIES danych podmiotów, które są PPP, wyliczenie obrotów miesięcznych i rocznych w VIES dla wybranych podmiotów w obu kierunkach handlu
-- =============================================

create procedure stat.dop_vies3_WybierzPodmiotyPonizejProgu 
@p_rok int, 
@p_prog_podstawowy_przywoz int, 
@p_prog_podstawowy_wywoz int 
as

begin
    declare @v_tekst varchar(1024);

    if @p_rok is null 
	begin
	    select @v_tekst = 'Nie ustawiono roku na wejściu procedury: dop_vies_polacz_kwartalne_z_miesiecznymi.';
		raiserror(@v_tekst,16,1);
		return;
	end;

	if @p_prog_podstawowy_przywoz is null
	begin
	    select @v_tekst = 'Nie ustawiono wartości progu podstawowego dla przywozów na dany rok';
		raiserror(@v_tekst,16,1);
		return;
	end;

	if @p_prog_podstawowy_wywoz is null
	begin
	    select @v_tekst = 'Nie ustawiono wartości progu podstawowego dla wywozów na dany rok';
		raiserror(@v_tekst,16,1);
		return;
	end;

	exec stat.DziennikWpisInfo 'Wyciągnięcie podmiotów kategorii 1 na podstawie INTRASTAT - tabela: #kategoria_tmp';
	--wyciągnięcie podmiotów kategorii 1 na podstawie intrastat
    select idp.nip,
	       dk.wazna_do_mies,
		   dk.rodz_kat,
		   obr.roczny_stat_przywoz,
		   obr.roczny_stat_wywoz, dk.wazna_do_rok
	  into #kategoria_tmp
	  from stat.dgt_kopia_intr_dane_pod idp,
	       stat.dot_kategoria dk,
		   stat.dot_obroty_roczne obr
	 where dk.wazna_od_rok <= @p_rok
	   and isnull(dk.wazna_do_rok,year(GETDATE())) >= @p_rok
	   and idp.id_pod = dk.id_pod
	   and dk.kategoria = 1
	   and idp.nip = obr.nip
	   and obr.rok = @p_rok;

	--przetwarzanie dla nabyć

  	truncate table stat.[dot_viesNabyciaKM_K1];

	exec stat.DziennikWpisInfo 'wyciągnięcie z VIES danych podmiotów, które są kategorii 1 wg intrastat, zapis do tabeli: stat.dot_vies_nabycia_kwartalne_i_miesieczne_kategoria_1 - nabycia';
	--wyciągnięcie z VIES danych podmiotów, które są kategorii 1 wg intrastat
	--to są dane miesięczne wg VIES
	insert into stat.[dot_viesNabyciaKM_K1] --nip_vies_nabycia_kategoria_1
	select nkim.*
	  from #kategoria_tmp kt,
	       stat.[dot_viesNabyciaKM] nkim --będzie po wykonaniu innej procedury
	 where nkim.NIPNabywcy = kt.nip;

	truncate table stat.[dot_viesNabyciaKM_ObrotyMies];

	exec stat.DziennikWpisInfo 'wyliczenie obrotów miesięcznych dla podmiotów z VIES, zapis do tabeli: stat.dot_vies_nabycia_kwartalne_i_miesieczne_obroty_miesieczne - nabycia';
	 --wyliczenie obrotów miesięcznych dla podmiotów z VIES
	insert into stat.[dot_viesNabyciaKM_ObrotyMies]
	 select nkim.NIPNabywcy nip, 
	        nkim.[RokMc] numer_okresu, 
			SUM(nkim.nabycie_bezposrednie) nabycia_bezposrednie_w_miesiacu
	   from stat.[dot_viesNabyciaKM] nkim
	  group by nkim.NIPNabywcy, nkim.[RokMc];
 	
	truncate table stat.[dot_viesNabyciaKM_ObrotyMies_K1];

	exec stat.DziennikWpisInfo 'wybranie miesięcznych obrotów tych podmiotów z VIES, które są kategorii 1 w intrastat, zapis do tabeli: stat.dot_vies_nabycia_kwartalne_i_miesieczne_obroty_miesieczne_kategoria_1 - nabycia';
	--wybranie miesięcznych obrotów tych podmiotów z VIES, które są kategorii 1 w intrastat
	--to są obroty miesięczne z VIES
	insert into stat.[dot_viesNabyciaKM_ObrotyMies_K1]
	select nkimom.*
	  from stat.[dot_viesNabyciaKM_ObrotyMies] nkimom,
	       #kategoria_tmp kt  
	 where nkimom.nip = kt.nip;

	truncate table stat.[dot_viesNabyciaKM_ObrotyRoczne];

	 exec stat.DziennikWpisInfo 'wyliczenie obrotów rocznych dla podmiotów z VIES - zapis w tabeli: stat.dot_vies_nabycia_kwartalne_i_miesieczne_obroty_roczne - nabycia';
	 --wyliczenie obrotów rocznych dla podmiotów z VIES
	 insert into stat.[dot_viesNabyciaKM_ObrotyRoczne]
	 select nkim.NIPNabywcy nip, 
			SUM(nkim.nabycie_bezposrednie) nabycia_bezposrednie_w_roku
	   from stat.dot_viesNabyciaKM nkim --stat.dot_vies_nabycia_kwartalne_i_miesieczne nkim
	  group by nkim.NIPNabywcy;

	  truncate table stat.[dot_viesNabyciaKM_ObrotyRoczne_K1];
	
	 exec stat.DziennikWpisInfo 'wybranie rocznych obrotów tych podmiotów z VIES, które są kategorii 1 w intrastat zapis do tabeli: stat.dot_vies_nabycia_kwartalne_i_miesieczne_obroty_roczne_kategoria_1 - nabycia';
     --wybranie rocznych obrotów tych podmiotów z VIES, które są kategorii 1 w intrastat - nabycia
	 insert into stat.[dot_viesNabyciaKM_ObrotyRoczne_K1]
	 select nkimor.*
	   from stat.[dot_viesNabyciaKM_ObrotyRoczne] nkimor,
	       #kategoria_tmp kt  
	  where nkimor.nip = kt.nip;
	  --koniec nabyć
	  

	  --przetwarzanie dla dostaw

	truncate table stat.[dot_viesDostawyKM_K1];

	  exec stat.DziennikWpisInfo 'wyciągnięcie z VIES danych podmiotów, które są kategorii 1 wg intrastat do tabeli: stat.dot_vies_dostawy_kwartalne_i_miesieczne_kategoria_1 - dostawy';
	  --wyciągnięcie z VIES danych podmiotów, które są kategorii 1 wg intrastat
	  insert into stat.[dot_viesDostawyKM_K1] --nip_vies_nabycia_kategoria_1
	  select dkim.*
	    from #kategoria_tmp kt,
	         stat.[dot_viesDostawyKM] dkim --będzie po wykonaniu innej procedury
	   where dkim.NIPDostawcy = kt.nip;

	truncate table stat.[dot_viesDostawyKM_ObrotyMies];

	   exec stat.DziennikWpisInfo 'wyliczenie obrotów miesięcznych dla podmiotów z VIES zapis do tabeli: stat.dot_vies_dostawy_kwartalne_i_miesieczne_obroty_miesieczne - dostawy';
	   --wyliczenie obrotów miesięcznych dla podmiotów z VIES
	   insert into stat.[dot_viesDostawyKM_ObrotyMies]
	   select dkim.NIPDostawcy nip, 
	          dkim.RokMc,
		      SUM(dkim.dostawa_bezposrednia) dostawy_bezposrednie_w_miesiacu
	     from stat.[dot_viesDostawyKM] dkim
	    group by dkim.NIPDostawcy, dkim.RokMc;
 
	truncate table stat.[dot_viesDostawyKM_ObrotyMies_K1];

	  exec stat.DziennikWpisInfo 'wybranie miesięcznych obrotów tych podmiotów z VIES, które są kategorii 1 w intrastat - zapis do tabeli stat.dot_vies_dostawy_kwartalne_i_miesieczne_obroty_miesieczne_kategoria_1 - dostawy';
	  --wybranie miesięcznych obrotów tych podmiotów z VIES, które są kategorii 1 w intrastat
	  insert into stat.[dot_viesDostawyKM_ObrotyMies_K1]
	  select dkimom.*
	    from stat.[dot_viesDostawyKM_ObrotyMies] dkimom,
	         #kategoria_tmp kt  
	   where dkimom.nip = kt.nip;

	truncate table stat.[dot_viesDostawyKM_ObrotyRoczne];

	exec stat.DziennikWpisInfo 'wyliczenie obrotów rocznych dla podmiotów z VIES, zapis do tabeli: stat.dot_vies_dostawy_kwartalne_i_miesieczne_obroty_roczne - dostawy';
	--wyliczenie obrotów rocznych dla podmiotów z VIES
	insert into stat.[dot_viesDostawyKM_ObrotyRoczne]
	select dkim.NIPDostawcy nip, 
			SUM(dkim.dostawa_bezposrednia) dostawy_bezposrednie_w_roku
	    from stat.[dot_viesDostawyKM] dkim
	group by dkim.NIPDostawcy;

	truncate table stat.[dot_viesDostawyKM_ObrotyRoczne_K1];

	   exec stat.DziennikWpisInfo 'wybranie rocznych obrotów tych podmiotów z VIES, które są kategorii 1 w intrastat, zapis do tabeli: stat.dot_vies_dostawy_kwartalne_i_miesieczne_obroty_roczne_kategoria_1 - dostawy';
       --wybranie rocznych obrotów tych podmiotów z VIES, które są kategorii 1 w intrastat
	   insert into stat.[dot_viesDostawyKM_ObrotyRoczne_K1]
	   select dkimor.*
	     from stat.[dot_viesDostawyKM_ObrotyRoczne] dkimor,
	          #kategoria_tmp kt  
	    where dkimor.nip = kt.nip;
	    --koniec dostaw
end;