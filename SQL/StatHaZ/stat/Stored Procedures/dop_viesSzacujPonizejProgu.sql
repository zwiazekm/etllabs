---- =============================================
---- Autor:		    Krzysztof Nagły
---- Data utworzenia: 05.06.2014
---- Opis: Procedura główna, zbiorcza dla procedur uczestniczących w szacowaniu danych dla podmiotów poniżej progu podstawowego
---- =============================================
--create procedure stat.dop_viesSzacujPonizejProgu 
--@p_data_od datetime, 
--@p_data_do datetime 
--as
--begin
--    declare @rok int = year(@p_data_od);
--	declare @prog_podstawowy_przywozy int;
--	declare @prog_podstawowy_wywozy int;
--	declare @slownik_progow_przywozy varchar(5) = 'ikapp';
--	declare @slownik_progow_wywozy varchar(5) = 'ikapw';
--	declare @miesiac int = month(@p_data_od);
--	declare @nr_progu_przywozy int = 1;
--	declare @nr_progu_wywozy int = 1;
--	declare @tekst varchar(1024);
	
--	if (YEAR(@p_data_od) <> YEAR(@p_data_do)) or (@p_data_od > @p_data_do)
--	  begin
--	    select @tekst = 'Nie ustawiono prawidłowych parametrów na wejściu procedury: stat.dop_viesSzacujPonizejProgu . Data_od i data_do powinny być w obrębie jednego roku, ponadto data_od ma być datą wcześniejszą od data_do.';
--		raiserror(@tekst,16,1);
--		return;
--	  end;
--	else
--	  begin
--		exec stat.DziennikWpisInfo 'Początek procedury (krok 1 i 2): stat.dop_vies_polacz_kwartalne_z_miesiecznymi';

--		exec stat.dop_vies1i2_PolaczKwartalneZMiesiecznymi @rok;

--		exec stat.DziennikWpisInfo 'Koniec procedury: stat.dop_vies_polacz_kwartalne_z_miesiecznymi';

--		exec stat.DziennikWpisInfo 'Początek procedury (krok 3): stat.dop_wybierz_podmioty_ponizej_progu_w_vies';
 
-- 		select @prog_podstawowy_przywozy = ikap.kwota2
--		  from stat.dgv_kopia_slowniki ikap
--		 where ikap.id_rodz_slow = @slownik_progow_przywozy
--		   and ikap.data_od <= datefromparts(@rok,1,1)
--		   and ikap.data_do >= datefromparts(@rok,12,31)
--		   and ikap.symbol = @nr_progu_przywozy;

--		select @prog_podstawowy_wywozy = ikap.kwota2
--		  from stat.dgv_kopia_slowniki ikap
--		 where ikap.id_rodz_slow = @slownik_progow_wywozy
--		   and ikap.data_od <= datefromparts(@rok,1,1)
--		   and ikap.data_do >= datefromparts(@rok,12,31)
--		   and ikap.symbol = @nr_progu_wywozy;

--		exec stat.dop_vies3_WybierzPodmiotyPonizejProgu @rok,@prog_podstawowy_przywozy,@prog_podstawowy_wywozy;

--		exec stat.DziennikWpisInfo 'Koniec procedury: stat.dop_wybierz_podmioty_ponizej_progu_w_vies';

--		exec stat.DziennikWpisInfo 'Początek procedury (krok 4): stat.dop_vies_struktury_handlu_w_podziale_na_kraje';

--		exec stat.dop_vies4_StrukturyHandluPdzialNaKraje;

--		exec stat.DziennikWpisInfo 'Koniec procedury: stat.dop_vies_struktury_handlu_w_podziale_na_kraje';

--		exec stat.DziennikWpisInfo 'Poczatek procedury (krok 5): stat.dop_vies_rozloz_obroty_w_zadanym_miesiacu_wg_struktury_krajow';
--		exec stat.DziennikWpisInfo 'Krok 5 połączony w pętli z krokiem 6 - początek pętli';

--		--czyszczenie tabel z procedur, które będą wywołane w pętli
--		exec stat.DziennikWpisInfo 'Czyszczenie tabel uzupełnianych wewnątrz procedur, które są wywoływane w pętli';
--		truncate table stat.[dot_viesNabyciaObrotyWgKrajuNaMies]; --z kroku 5
--		truncate table stat.[dot_viesDostawyObrotyWgKrajuNaMies]; --z kroku 5

--		truncate table stat.[dot_viesIstatAnalizaSzacowaniePodprNabycia]; --z kroku 6a
--		truncate table stat.[dot_viesIstatAnalizaSzacowaniePodprDostawy]; --z kroku 6a

--		truncate table [stat].[dot_viesNabyciaListaPodmWgMSOKP];  --z kroku 6b
--		truncate table [stat].[dot_viesDostawyListaPodmWgMSOKP];  --z kroku 6b

--		truncate table [stat].[dot_struktura_ponizej_asymilacji];  --z kroku 6c

--		truncate table [stat].[dot_dekl_wynik_poz_tmp]; --z kroku 7
--		exec stat.DziennikWpisInfo 'Koniec czyszczenia tabel i początek właściwej pętli';

--		while @miesiac<=MONTH(@p_data_do)
--		begin
--		    set @tekst = 'Przebieg = ' + CONVERT(varchar,@miesiac);
--			exec stat.DziennikWpisInfo 'Wywołanie procedury stat.dop_vies_rozloz_obroty_w_zadanym_miesiacu_wg_struktury_krajow dla: ';
--			exec stat.DziennikWpisInfo @tekst;
--			exec stat.dop_vies5_RozlozObrotyMCwgStrukturyKrajow @miesiac;
--			exec stat.DziennikWpisInfo 'Koniec wywołania procedury stat.dop_vies_rozloz_obroty_w_zadanym_miesiacu_wg_struktury_krajow dla: ';
--			exec stat.DziennikWpisInfo @tekst;

--			exec stat.DziennikWpisInfo 'Poczatek procedury (krok 6a): stat.dop_vies_intr_szczegolowa_struktura_obrotow_z_krajami_z_vies ';
--			exec stat.DziennikWpisInfo @tekst;
--			exec stat.DziennikWpisInfo 'dla przywozów';
--			exec stat.dop_vies6a_intrSzczegolowaStrukturaObrZKrajamiVIES @rok,@miesiac,'P';
--			exec stat.DziennikWpisInfo 'dla wywozów';
--			exec stat.dop_vies6a_intrSzczegolowaStrukturaObrZKrajamiVIES @rok,@miesiac,'W';

--			exec stat.DziennikWpisInfo 'Koniec procedury: stat.dop_vies_intr_szczegolowa_struktura_obrotow_z_krajami_z_vies (w tym przebiegu)';

--			exec stat.DziennikWpisInfo 'Poczatek procedury (krok 6b): stat.dop_vies6b_IntrSporzadzListePodmWgMSOKP ';
--			exec stat.DziennikWpisInfo @tekst;
--			exec stat.DziennikWpisInfo 'dla przywozów';
--			exec stat.dop_vies6b_IntrSporzadzListePodmWgMSOKP @miesiac,'P';
--			exec stat.DziennikWpisInfo 'dla wywozów';
--			exec stat.dop_vies6b_IntrSporzadzListePodmWgMSOKP @miesiac,'W';
--			exec stat.DziennikWpisInfo 'Koniec procedury (krok 6b): stat.dop_vies6b_IntrSporzadzListePodmWgMSOKP ';
		
--			exec stat.DziennikWpisInfo 'Poczatek procedury (krok 6c): stat.dop_vies6c_intrUtworzSzczegolowaStruktureObrotow ';
--			exec stat.DziennikWpisInfo @tekst;
--			exec stat.DziennikWpisInfo 'dla przywozów';
--			exec stat.dop_vies6c_intrUtworzSzczegolowaStruktureObrotow @rok, @miesiac, 'P';
--			exec stat.DziennikWpisInfo 'dla wywozów';
--			exec stat.dop_vies6c_intrUtworzSzczegolowaStruktureObrotow @rok, @miesiac, 'W';
--			exec stat.DziennikWpisInfo 'Koniec procedury (krok 6c): stat.dop_vies6c_intrUtworzSzczegolowaStruktureObrotow ';

--			exec stat.DziennikWpisInfo 'Początek procedur (krok 7): stat.dop_vies7a_intrRozlozenieWartosciObrotowDlaKrajow';
--			exec stat.DziennikWpisInfo @tekst;
--			exec stat.DziennikWpisInfo 'dla przywozów';
--			exec stat.[dop_vies7aib_intrRozlozenieWartosciObrotowDlaKrajow] @rok, @miesiac, 'P';
--			exec stat.DziennikWpisInfo 'dla wywozów';
--			exec stat.[dop_vies7aib_intrRozlozenieWartosciObrotowDlaKrajow] @rok, @miesiac, 'W';
--			exec stat.DziennikWpisInfo 'Koniec procedur (krok 7): stat.dop_vies7a_intrRozlozenieWartosciObrotowDlaKrajow';

--			set @miesiac +=1;
--		end; --while
--		exec stat.DziennikWpisInfo 'Koniec pętli';

--		exec stat.DziennikWpisInfo 'Koniec procedury: stat.dop_vies_rozloz_obroty_w_zadanym_miesiacu_wg_struktury_krajow';
--	end; --if
--end;