-- =============================================
-- Autor:		    Krzysztof Nagły
-- Data utworzenia: 11.06.2014
-- Opis:            Procedura rozkładająca wartości obrotów dla krajów wg wyznaczonych struktur
-- =============================================
CREATE PROCEDURE [stat].[dop_vies7aib_intrRozlozenieWartosciObrotowDlaKrajow]
	--@p_data_do datetime,
	@p_rok int,
	@p_miesiac int,
	@p_typ varchar(1)
AS
begin
  declare @srednia_miesieczna_statyst_przywozow int;
  declare @nr_sekwencji int;
  declare @identyfikator varchar(35);

  select @srednia_miesieczna_statyst_przywozow = case when @p_typ = 'P' then o_r.sr_mies_stat_przywoz else o_r.sr_mies_stat_wywoz end
    from stat.dot_obroty_roczne o_r
   where o_r.nip = '0000000000'
     and o_r.rok = @p_rok - 1;

  exec [stat].nextval 'dwd_seq', @nr_sekwencji output

  select @identyfikator = 'ISTD/' + replace(replace(replace(replace(convert(varchar,GETDATE(),121),'-',''),' ',''),':',''),'.','') + RIGHT('0000000000000' + convert(varchar,@nr_sekwencji),13);

  insert into stat.dot_dekl_wynik_dok
    select @identyfikator id,
	       'Y' status,
		   '0000000000' nip_zobowiazanego,
		   '00000000000000' regon_zobowiazanego,
		   @p_typ typ,
		   @p_rok * 100 + @p_miesiac as RokMc,
		   1 numer;
  
  --truncate

  insert into stat.dot_dekl_wynik_poz_tmp
    select @identyfikator id,
	       null pozid,
		   'Y' as [status],
		   null komentarz,
		   null opis_towaru,
		   spa.kraj_przezn_wysylki,
		   null warunki_dostawy,
		   spa.rodzaj_transakcji,
		   null rodzaj_transportu,
		   spa.kod_towarowy,
		   spa.kraj_pochodzenia,
		   null masa_netto,
		   null uzup_jm,
		   ROUND(@srednia_miesieczna_statyst_przywozow*spa.udzial_w_obrotach,0) wartosc_faktury,
		   ROUND(@srednia_miesieczna_statyst_przywozow*spa.udzial_w_obrotach,0) wartosc_statystyczna,
		   '3' wsk_progowy,
		   null nr_grp
      from dot_struktura_ponizej_asymilacji spa
	 where spa.RokMc = dbo.KonwertujMiRNaRokMc(@p_rok, @p_miesiac)                    --można też zbiorczo
	   and spa.typ = @p_typ;

	exec stat.dop_vies7cid_intrWyznaczenieIlosciIMasy;

	delete from stat.dot_dekl_wynik_poz_tmp
	 where uzup_jm is null
	   and exists (select 1
	                 from tbl_sl_taryfa_cn8
					where stat.dot_dekl_wynik_poz_tmp.kod_towarowy = tbl_sl_taryfa_cn8.kod_cn
					  and tbl_sl_taryfa_cn8.nazwa_jm is not null);

	insert into stat.dot_dekl_wynik_poz(id,pozid,status,komentarz,opis_towaru,kraj_przezn_wysyl,warunki_dostawy,rodzaj_transakcji,rodzaj_transportu,kod_towarowy,kraj_pochodzenia,masa_netto,uzup_jm,wartosc_faktury,wartosc_statystyczna,wskaznik_progowy,nr_grp)
	  select pt.id,
	         pt.pozid,
			 pt.[status],
			 pt.komentarz,
			 pt.opis_towaru,
			 pt.kraj_przezn_wysylki,
			 pt.warunki_dostawy,
			 pt.rodzaj_transakcji,
			 pt.rodzaj_transportu,
			 pt.kod_towarowy,
			 pt.kraj_pochodzenia,
			 pt.masa_netto,
			 pt.uzup_jm,
			 pt.wartosc_faktury,
			 pt.wartosc_statystyczna,
			 pt.wskaznik_progowy,
			 pt.nr_grp
	    from stat.dot_dekl_wynik_poz_tmp pt;

	truncate table stat.dot_dekl_wynik_poz_tmp;
	--truncate table stat.dot_struktura_ponizej_asymilacji;
end;