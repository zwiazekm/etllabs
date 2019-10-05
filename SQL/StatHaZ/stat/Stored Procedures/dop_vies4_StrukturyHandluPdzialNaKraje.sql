-- =============================================
-- Autor:		    Krzysztof Nagły
-- Data utworzenia: 04.06.2014
-- Opis: Krok 4, przygotowanie struktury handlu w podziale na kraje na podstawie danych z VIES
-- =============================================

create procedure stat.dop_vies4_StrukturyHandluPdzialNaKraje as

begin
    --przetwarzanie dla nabyć

	truncate table stat.[dot_viesNabyciaKM_K1_Struktura];

    exec stat.DziennikWpisInfo 'wyznaczenie jaką częścią obrotów miesięcznych jest dana deklaracja VIES - dla podmiotów poniżej progu podstawowego, zapis do tabeli: stat.dot_vies_nabycia_kwartalne_i_miesieczne_kategoria_1_struktura - nabycia';
	--wyznaczenie jaką częścią obrotów miesięcznych jest dana deklaracja VIES - dla podmiotów poniżej progu podstawowego
	insert into stat.[dot_viesNabyciaKM_K1_Struktura]
	select nkim_k1.NIPNabywcy,
	       nkim_k1.NrOkresu,
		   nkim_k1.KodKraju,
		   nkim_k1.nabycie_bezposrednie/nkim_om_k1.nabycia_bezposrednie_w_miesiacu udzial_w_nabyciach_bezposrednich_w_miesiacu
	  from stat.[dot_viesNabyciaKM_K1] nkim_k1, --deklaracje VIES dla nabyć podmiotów które są poniżej progu podstawowego wg danych intrastat
	       stat.[dot_viesNabyciaKM_ObrotyMies_K1] nkim_om_k1 --miesięczne obroty dla nabyć tych podmiotów, które są kategorii 1 w intrastat
	 where nkim_k1.nabycie_bezposrednie > 0
	   and nkim_om_k1.nabycia_bezposrednie_w_miesiacu > 0
	   and nkim_om_k1.nip = nkim_k1.NIPNabywcy
	   and nkim_k1.NrOkresu = nkim_om_k1.numer_okresu
	 order by nkim_k1.NIPNabywcy, nkim_k1.NrOkresu, nkim_k1.KodKraju;

	truncate table stat.[dot_viesNabyciaKM_K1_WgMiesKraj];

	 --wyznaczenie obrotów miesięcznych dla deklaracji VIES, wg kraju, dla podmiotów poniżej progu podstawowego - kategoria intrastat = 1
	 exec stat.DziennikWpisInfo 'wyznaczenie obrotów miesięcznych dla deklaracji VIES, wg kraju, dla podmiotów poniżej progu podstawowego - kategoria intrastat = 1, zapis do tabeli: stat.dot_vies_nabycia_kwartalne_i_miesieczne_kategoria_1_wg_miesiecy_i_krajow - nabycia';
	insert into stat.[dot_viesNabyciaKM_K1_WgMiesKraj]
    select nkim_k1.NrOkresu,
	       nkim_k1.KodKraju,
		   sum(nkim_k1.nabycie_bezposrednie) nabycia_bezposrednie_z_danego_kraju_w_danym_miesiacu
	  from stat.[dot_viesNabyciaKM_K1] nkim_k1
	 group by nkim_k1.NrOkresu, nkim_k1.KodKraju;

	truncate table stat.[dot_viesNabyciaKM_ObrotyMies_K1_Ogolem];

	 --wyznaczenie ogólnych obrotów miesięcznych w VIES dla podmiotów o kategorii 1 w intrastat
	 exec stat.DziennikWpisInfo 'wyznaczenie ogólnych obrotów miesięcznych w VIES dla podmiotów o kategorii 1 w intrastat, zapis do tabeli stat.dot_vies_nabycia_kwartalne_i_miesieczne_obroty_miesieczne_kategoria_1_ogolem - nabycia';
	insert into stat.[dot_viesNabyciaKM_ObrotyMies_K1_Ogolem]
	select nkimom.numer_okresu, 
	       sum(nkimom.nabycia_bezposrednie_w_miesiacu) nabycia_w_miesiacu_ogolem
	  from stat.[dot_viesNabyciaKM_ObrotyMies_K1] nkimom
	 group by nkimom.numer_okresu;

	truncate table stat.[dot_viesNabyciaKM_K1_StrukturaOgolna];

	 --wyznaczanie struktury ogólnej - jaki jest udział miesięcznych obrotów nabyć z danego kraju, do ogólnej wartości nabyć ze wszystkich krajów, dla nabyć podmiotów poniżej progu podstawowego
	 exec stat.DziennikWpisInfo 'wyznaczanie struktury ogólnej - jaki jest udział miesięcznych obrotów nabyć z danego kraju, do ogólnej wartości nabyć ze wszystkich krajów, dla nabyć podmiotów poniżej progu podstawowego, zapis do tabeli: stat.dot_vies_nabycia_kwartalne_i_miesieczne_kategoria_1_struktura_ogolna - nabycia';
	insert into stat.[dot_viesNabyciaKM_K1_StrukturaOgolna]
	select nkim_k1_wmik.RokMc,
	       nkim_k1_wmik.KodKraju,
		   nkim_k1_wmik.nabycia_bezposrednie_z_danego_kraju_w_danym_miesiacu/nkim_om_k1_o.nabycia_w_miesiacu_ogolem nabycia_udzial_miesiecznych_obrotow_z_danym_krajem_wobec_obrotow_ogolem,
		   nkim_om_k1_o.nabycia_w_miesiacu_ogolem/nkim_k1_wmik.nabycia_bezposrednie_z_danego_kraju_w_danym_miesiacu msokp
	  from stat.[dot_viesNabyciaKM_K1_WgMiesKraj] nkim_k1_wmik,
	       stat.[dot_viesNabyciaKM_ObrotyMies_K1_Ogolem] nkim_om_k1_o
	 where nkim_k1_wmik.nabycia_bezposrednie_z_danego_kraju_w_danym_miesiacu > 0
	   and nkim_om_k1_o.nabycia_w_miesiacu_ogolem > 0
	   and nkim_k1_wmik.RokMc = nkim_om_k1_o.RokMc
	 order by nkim_k1_wmik.RokMc, nkim_k1_wmik.KodKraju, nabycia_udzial_miesiecznych_obrotow_z_danym_krajem_wobec_obrotow_ogolem;       
	 
	 --koniec przetwarzania dla nabyć



    --przetwarzanie dla dostaw

	truncate table stat.[dot_viesDostawyKM_K1_Struktura];

    exec stat.DziennikWpisInfo 'wyznaczenie jaką częścią obrotów miesięcznych jest dana deklaracja VIES - dla podmiotów poniżej progu podstawowego, zapis do tabeli: stat.dot_vies_dostawy_kwartalne_i_miesieczne_kategoria_1_struktura - dostawy';
	--wyznaczenie jaką częścią obrotów miesięcznych jest dana deklaracja VIES - dla podmiotów poniżej progu podstawowego
	insert into stat.[dot_viesDostawyKM_K1_Struktura]
	select dkim_k1.NIPDostawcy,
	       dkim_k1.NrOkresu,
		   dkim_k1.KodKraju,
		   dkim_k1.dostawa_bezposrednia/dkim_om_k1.dostawy_bezposrednie_w_miesiacu udzial_w_dostawach_bezposrednich_w_miesiacu
	  from stat.[dot_viesDostawyKM_K1] dkim_k1, --deklaracje VIES dla dostaw podmiotów które są poniżej progu podstawowego wg danych intrastat
	       stat.[dot_viesDostawyKM_ObrotyMies_K1] dkim_om_k1 --miesięczne obroty dla dostaw tych podmiotów, które są kategorii 1 w intrastat
	 where dkim_k1.dostawa_bezposrednia > 0
	   and dkim_om_k1.dostawy_bezposrednie_w_miesiacu > 0
	   and dkim_om_k1.nip = dkim_k1.NIPDostawcy
	   and dkim_k1.NrOkresu = dkim_om_k1.numer_okresu
	 order by dkim_k1.NIPDostawcy, dkim_k1.NrOkresu, dkim_k1.KodKraju;

	truncate table stat.[dot_viesDostawyKM_K1_WgMiesKraj];

	 --wyznaczenie obrotów miesięcznych dla deklaracji VIES, wg kraju, dla podmiotów poniżej progu podstawowego - kategoria intrastat = 1 - dostawy
	 exec stat.DziennikWpisInfo 'wyznaczenie obrotów miesięcznych dla deklaracji VIES, wg kraju, dla podmiotów poniżej progu podstawowego - kategoria intrastat = 1, zapis do tabeli: stat.dot_vies_dostawy_kwartalne_i_miesieczne_kategoria_1_wg_miesiecy_i_krajow - dostawy';
	insert into stat.[dot_viesDostawyKM_K1_WgMiesKraj]
    select dkim_k1.NrOkresu,
	       dkim_k1.KodKraju,
		   sum(dkim_k1.dostawa_bezposrednia) dostawy_bezposrednie_z_danego_kraju_w_danym_miesiacu
	  from stat.[dot_viesDostawyKM_K1] dkim_k1
	 group by dkim_k1.NrOkresu, dkim_k1.KodKraju;

	truncate table stat.[dot_viesDostawyKM_ObrotyMies_K1_Ogolem];

	 --wyznaczenie ogólnych obrotów miesięcznych w VIES dla podmiotów o kategorii 1 w intrastat
	 exec stat.DziennikWpisInfo 'wyznaczenie ogólnych obrotów miesięcznych w VIES dla podmiotów o kategorii 1 w intrastat, zapis do tabeli: stat.dot_vies_dostawy_kwartalne_i_miesieczne_obroty_miesieczne_kategoria_1_ogolem - dostawy';
	insert into stat.[dot_viesDostawyKM_ObrotyMies_K1_Ogolem]
	select dkimom.numer_okresu, 
	       sum(dkimom.dostawy_bezposrednie_w_miesiacu) dostawy_w_miesiacu_ogolem
	  from stat.[dot_viesDostawyKM_ObrotyMies_K1] dkimom
	 group by dkimom.numer_okresu;

	truncate table stat.[dot_viesDostawyKM_K1_StrukturaOgolna];

	 --wyznaczanie struktury ogólnej - jaki jest udział miesięcznych obrotów nabyć z danego kraju, do ogólnej wartości nabyć ze wszystkich krajów, dla nabyć podmiotów poniżej progu podstawowego
	 exec stat.DziennikWpisInfo 'wyznaczanie struktury ogólnej - jaki jest udział miesięcznych obrotów nabyć z danego kraju, do ogólnej wartości nabyć ze wszystkich krajów, dla nabyć podmiotów poniżej progu podstawowego, zapis do tabeli: stat.dot_vies_dostawy_kwartalne_i_miesieczne_kategoria_1_struktura_ogolna - dostawy';
	insert into stat.[dot_viesDostawyKM_K1_StrukturaOgolna]
	select dkim_k1_wmik.RokMc,
	       dkim_k1_wmik.KodKraju,
		   dkim_k1_wmik.dostawy_bezposrednie_z_danego_kraju_w_danym_miesiacu/dkim_om_k1_o.dostawy_w_miesiacu_ogolem dostawy_udzial_miesiecznych_obrotow_z_danym_krajem_wobec_obrotow_ogolem,
		   dkim_om_k1_o.dostawy_w_miesiacu_ogolem/dkim_k1_wmik.dostawy_bezposrednie_z_danego_kraju_w_danym_miesiacu msokp
	  from stat.[dot_viesDostawyKM_K1_WgMiesKraj] dkim_k1_wmik,
	       stat.[dot_viesDostawyKM_ObrotyMies_K1_Ogolem] dkim_om_k1_o
	 where dkim_k1_wmik.dostawy_bezposrednie_z_danego_kraju_w_danym_miesiacu > 0
	   and dkim_om_k1_o.dostawy_w_miesiacu_ogolem > 0
	   and dkim_k1_wmik.RokMc = dkim_om_k1_o.RokMc
	 order by dkim_k1_wmik.RokMc, dkim_k1_wmik.KodKraju, dostawy_udzial_miesiecznych_obrotow_z_danym_krajem_wobec_obrotow_ogolem;       
	 
	 --koniec przetwarzania dla dostaw
end;