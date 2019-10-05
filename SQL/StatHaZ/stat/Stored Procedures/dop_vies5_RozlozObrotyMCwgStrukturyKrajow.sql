-- =============================================
-- Autor:		    Krzysztof Nagły
-- Data utworzenia: 04.06.2014
-- Opis: Krok 5, Rozłożenie wartości handlu za szacowany miesiąc roku poprzedniego, wg struktury handlu z krajami, wyznaczonej na podstawie VIES - wersja dla miesiąca
-- =============================================

create procedure stat.dop_vies5_RozlozObrotyMCwgStrukturyKrajow 
@p_miesiac int = 1 
as

begin
    --dla poszczególnych miesięcy z osobna
	exec stat.DziennikWpisInfo 'Rozłożenie wartości handlu za szacowany miesiąc roku poprzedniego, wg struktury handlu z krajami, wyznaczonej na podstawie VIES';


	--początek liczenia obrotów wg kraju na miesiąc dla nabyć
	exec stat.DziennikWpisInfo 'wyliczenie obrotów wg kraju na miesiąc, zapisane do tabeli: stat.dot_vies_nabycia_obroty_wg_kraju_na_miesiac - dla nabyć';

	--truncate table stat.[dot_viesNabyciaObrotyWgKrajuNaMies];

	insert into stat.[dot_viesNabyciaObrotyWgKrajuNaMies]
	select nkim_om_k1_o.RokMc,
	       nkim_k1_so.KodKraju,
		   nkim_om_k1_o.nabycia_w_miesiacu_ogolem * nkim_k1_so.udzial_miesiecznych_obrotow_z_danym_krajem_wobec_obrotow_ogolem AS wartoscObrotowWgKrajuNaMiesiac
	  from stat.[dot_viesNabyciaKM_ObrotyMies_K1_Ogolem] nkim_om_k1_o,
	       stat.[dot_viesNabyciaKM_K1_StrukturaOgolna] nkim_k1_so
	 where nkim_om_k1_o.RokMc = nkim_k1_so.RokMc
	   and nkim_om_k1_o.RokMc % 100 = @p_miesiac;

	--koniec liczenia obrotów wg kraju na miesiąc dla nabyć


	--początek liczenia obrotów wg kraju na miesiąc dla dostaw
	exec stat.DziennikWpisInfo 'wyliczenie obrotów wg kraju na miesiąc, zapisane do tabeli: stat.dot_vies_dostawy_obroty_wg_kraju_na_miesiac - dla dostaw';

	--truncate table stat.[dot_viesDostawyObrotyWgKrajuNaMies];

	insert into stat.[dot_viesDostawyObrotyWgKrajuNaMies]
	select dkim_k1_so.RokMc,
	       dkim_k1_so.KodKraju,
		   dkim_om_k1_o.dostawy_w_miesiacu_ogolem * dkim_k1_so.udzial_miesiecznych_obrotow_z_danym_krajem_wobec_obrotow_ogolem AS wartoscObrotowWgKrajuNaMiesiac
	  from stat.[dot_viesDostawyKM_ObrotyMies_K1_Ogolem] dkim_om_k1_o,
	       stat.[dot_viesDostawyKM_K1_StrukturaOgolna] dkim_k1_so
	 where dkim_om_k1_o.RokMc = dkim_k1_so.RokMc
	   and dkim_om_k1_o.RokMc % 100 = @p_miesiac;

	--koniec liczenia obrotów wg kraju na miesiąc dla dostaw
end;