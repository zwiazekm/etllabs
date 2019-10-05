-- =============================================
-- Autor:		    Krzysztof Nagły
-- Data utworzenia: 04.06.2014
-- Opis:            Krok 6a, procedura wybiera dane podmiotów w intrastat takich, ktore prowadziły handel z krajami, z listy krajów dla podmiotów PPP z bazy VIES w danym miesiącu
-- =============================================

create procedure stat.dop_vies6a_intrSzczegolowaStrukturaObrZKrajamiVIES 
@p_RokMc int,
@p_typ varchar 
as

begin
    exec stat.DziennikWpisInfo 'Przygotowanie szczegółowej struktury obrotów dla handlu z krajami, których wartość obrotów wyliczono z VIES, w oparciu o strukturę handlu wyznaczoną na podstawie podmiotów deklarujących w szacowanym miesiącu w INTRASTAT obroty z danymi krajami';
	exec stat.DziennikWpisInfo 'Podmioty są posortowane rosnąco, których zsumowana wartość obrotów nie przekroczy obrotu wyznaczonego dla procesu szacowania w przypadku danego kraju';

	if upper(@p_typ) = 'P'
	  begin
	  
		exec stat.DziennikWpisInfo 'Analiza dla nabyć, wypełnianie tabeli stat.dot_vies_istat_analiza_szacowanie_podprogowych_nabycia';

		--truncate table stat.[dot_viesIstatAnalizaSzacowaniePodprNabycia];

		insert into stat.[dot_viesIstatAnalizaSzacowaniePodprNabycia]
			select dok.nip_zobowiazanego nip,
				   poz.kraj_przezn_wysyl kod_kraju,
				   poz.rodzaj_transakcji,
				   poz.kod_towarowy,
				   poz.kraj_pochodzenia,
				   SUM(poz.wartosc_faktury) nabycia_bezposr,
				   dok.RokMc 
			  from stat.dgt_kopia_istat_dekl_wynik_dok dok,
				   stat.dgt_kopia_istat_dekl_wynik_poz poz
			 where dok.id_dok = poz.id_dok
			   and dok.[Status] <> 'U'
			   and poz.[Status] = 'Y'
			   and dok.RokMc = @p_RokMc
			   and dok.typ = 'P'  --przywóz
			   and poz.kraj_pochodzenia in (select stro.KodKraju
											  from stat.[dot_viesNabyciaKM_K1_StrukturaOgolna] stro
											 where stro.RokMc = @p_RokMc)
			  -- and dok.nip_zobowiazanego is not null
			  -- and poz.kraj_przezn_wysyl is not null
			  -- and poz.rodzaj_transakcji is not null
			   and poz.kod_towarowy is not null
			  -- and poz.kraj_pochodzenia is not null
			  -- and dok.miesiac is not null
			 group by dok.nip_zobowiazanego, poz.kraj_przezn_wysyl, poz.rodzaj_transakcji, poz.kod_towarowy, poz.kraj_pochodzenia, dok.RokMc
			 order by nabycia_bezposr;

		 exec stat.DziennikWpisInfo 'Koniec analizy dla nabyć';

	 end;
   else
	 begin
		exec stat.DziennikWpisInfo 'Analiza dla dostaw, wypełnianie tabeli stat.dot_vies_istat_analiza_szacowanie_podprogowych_dostawy';

		--truncate table stat.[dot_viesIstatAnalizaSzacowaniePodprDostawy];

	  insert into stat.[dot_viesIstatAnalizaSzacowaniePodprDostawy]
		select dok.nip_zobowiazanego nip,
			   poz.kraj_przezn_wysyl kod_kraju,
			   poz.rodzaj_transakcji,
			   poz.kod_towarowy,
			   poz.kraj_pochodzenia,
			   SUM(poz.wartosc_faktury) dostawy_bezposr,
			   dok.RokMc
		  from stat.dgt_kopia_istat_dekl_wynik_dok dok,
			   stat.dgt_kopia_istat_dekl_wynik_poz poz
		 where dok.id_dok = poz.id_dok
		   and dok.[Status] <> 'U'
		   and poz.[Status] = 'Y'
		   and dok.RokMc = @p_RokMc
		   and dok.typ = 'W' --wywóz
		   and poz.kraj_przezn_wysyl in (select stro.KodKraju
										   from stat.[dot_viesDostawyKM_K1_StrukturaOgolna] stro
									      where stro.RokMc = @p_RokMc)
		   --and dok.nip_zobowiazanego is not null
		   --and poz.kraj_przezn_wysyl is not null
		   --and poz.rodzaj_transakcji is not null
		   and poz.kod_towarowy is not null
		   --and poz.kraj_pochodzenia is not null
		   --and dok.miesiac is not null
		 group by dok.nip_zobowiazanego, poz.kraj_przezn_wysyl, poz.rodzaj_transakcji, poz.kod_towarowy, poz.kraj_pochodzenia, dok.RokMc
		 order by dostawy_bezposr;
		
		 exec stat.DziennikWpisInfo 'Koniec analizy dla dostaw';

	 end; --if
end;