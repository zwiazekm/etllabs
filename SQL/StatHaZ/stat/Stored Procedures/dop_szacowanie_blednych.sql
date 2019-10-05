CREATE PROCEDURE [stat].dop_szacowanie_blednych
@p_date_to date
as
	declare @v_id_dok varchar(30)
	declare @v_status varchar(1)
	declare @v_nip varchar(10)
	declare @v_regon varchar(14)
	declare @v_typ varchar(1)
	declare @v_RokMc int 

	declare @v_pozid int
	declare @v_komentarz varchar(255)
	declare @v_opis_towaru varchar(255)
	declare @v_kraj_przezn_wysyl varchar(2)
    declare @v_warunki_dostawy varchar(3)
	declare @v_rodzaj_transakcji varchar(2)
	declare @v_rodzaj_transportu varchar(2) 
	declare @v_kod_towarowy varchar(8)
	declare @v_kraj_pochodzenia varchar(2)
	declare @v_masa_netto numeric(15,6)
	declare @v_uzup_jm numeric(15,6)
	declare @v_wartosc_fakt numeric(15,6)
	declare @v_wartosc_stat numeric(15,6)

	declare @v_logic varchar(255)
	declare @v_formal varchar(255)

	select @v_logic = [value] from stat.params where section = 'GEN' and keyword = 'L';
	select @v_formal = [value] from stat.params where section = 'GEN' and keyword = 'F';

	--declare @v_year int
 --   declare @v_month int
	--set @v_year=year(@p_date_to)-2000
	--set @v_month=month(@p_date_to)
	declare @RokMc int = dbo.[KonwertujDateNaRokMc](@p_date_to)

  	exec stat.DziennikWpisInfo 'start', @@PROCID;
  
-- tabela pomocnicza
  	create table #struktura (
		id_dok varchar(30),
		typ char(1),
   		nip varchar(10),
		regon varchar(14),
		RokMc int,
		[status] char(1),
		pozid smallint,
		status_poz char(1),
		komentarz varchar(255),
		opis_towaru varchar(255),
		kraj_przezn_wysyl char(2),
    	warunki_dostawy varchar(3),
		rodzaj_transakcji varchar(2),
		rodzaj_transportu varchar(2) ,
		kod_towarowy varchar(8),
    	kraj_pochodzenia char(2),
		masa_netto decimal(11,0),
		uzup_jm decimal(11,0),
		wartosc_fakt decimal(15,0),
		wartosc_stat decimal(15,0)
  	)
-- wypełnienie tabeli danymi które należy doszacować
	exec stat.DziennikWpisInfo 'start: wypelnienie struktury', @@PROCID;

	insert into #struktura
	select a.id_dok,
		a.typ, 
		a.nip_zobowiazanego, 
		a.regon_zobowiazanego,
		a.RokMc, 
		a.[Status],
		b.pozid,
		b.[Status],
		b.komentarz,
		b.opis_towaru,
		b.kraj_przezn_wysyl, 
		b.warunki_dostawy,
		b.rodzaj_transakcji,
		b.rodzaj_transportu,
		b.kod_towarowy, 
		b.kraj_pochodzenia, 
		null masa_netto, 
		null uzup_jm,
		convert(decimal(15,0), x.wartosc_faktury * (case when a.typ='P' then z.wspolczynnik_K_przywoz else z.wspolczynnik_K_wywoz end)),
		convert(decimal(15,0), x.wartosc_stat * (case when a.typ='P' then z.wspolczynnik_K_przywoz else z.wspolczynnik_K_wywoz end))
	from stat.dgv_kopia_istat_dekl_wynik_dok a, 
		stat.dgv_kopia_istat_dekl_wynik_poz b, 
		stat.dot_struktura_miesieczna_nip x, 
		stat.dot_mies_wspolczynnik_k z
	where a.[Status] <> 'U' and
		a.RokMc = @RokMc AND
-- pozycje o statusie "błąd formalny" i "błąd logiczny"
		b.[Status] in ('Q', 'U') and
		a.id_dok = b.id_dok and
-- dla których istnieje analogiczna struktura w roku ubiegłym
		a.nip_zobowiazanego = x.nip and
		a.RokMc-100 = x.RokMc and
		b.kod_towarowy = x.kod_towarowy and
		b.kraj_pochodzenia = x.kraj_pochodzenia and
		b.kraj_przezn_wysyl = x.kraj_przezn_wysyl and
		b.rodzaj_transakcji = x.rodzaj_transakcji and
		a.RokMc = z.RokMc and
-- błędy formalne i logiczne które uwzględniamy należą do odpowiednich (zdefiniowanych w parametrach) grup
		exists (select 1 from stat.dgv_kopia_istat_dekl_wynik_blad d
				where ((d.typ = 'F' and
					charindex(d.kod, @v_formal) > 0) or
					(d.typ = 'L' and
					charindex(d.kod, @v_logic) > 0)) and
					d.id_dok = b.id_dok and d.pozid = b.pozid) and
-- dla szacowanych deklaracji istnieje przynajmniej jedna zatwierdzona pozycja
		exists (select 1 from stat.dgv_kopia_istat_dekl_wynik_poz c 
				where c.[Status] = 'Y' and c.id_dok = a.id_dok) and
-- dla podmiotów o priorytecie większym od 1
		exists (select 1 from stat.dgv_kopia_intr_dane_pod e
				where e.nip = a.nip_zobowiazanego and
					exists (select f.id_pod from stat.dot_priorytet f
						where f.priorytet > 1 and
							f.id_pod = e.id_pod and
							f.rodzaj_prior = a.typ and
							a.RokMc between f.WaznaOdRokMc and f.WaznaDoRokMc
							))
	exec stat.DziennikWpisInfo 'stop: wypelnienie struktury', @@PROCID;

-- szacowanie wartości fakturowej
	exec stat.DziennikWpisInfo 'start: obliczanie wartosci fakturowej i statystycznej', @@PROCID;

	update #struktura
	set wartosc_fakt = convert(decimal(15,0), #struktura.wartosc_fakt - b.wartosc_faktury),
		wartosc_stat = convert(decimal(15,0), #struktura.wartosc_stat - b.wartosc_stat)
	from stat.dot_struktura_miesieczna_nip b
	where #struktura.typ = b.typ and
		#struktura.nip = b.nip and
		#struktura.RokMc = b.RokMc and
		#struktura.kod_towarowy = b.kod_towarowy and
		#struktura.kraj_pochodzenia = b.kraj_pochodzenia and
		#struktura.kraj_przezn_wysyl = b.kraj_przezn_wysyl and
		#struktura.rodzaj_transakcji = b.rodzaj_transakcji 

	exec stat.DziennikWpisInfo 'stop: obliczanie wartosci fakturowej i statystycznej', @@PROCID;

-- szacowanie masy oraz ilości w uzupełniającej jednostce miary	
	exec stat.DziennikWpisInfo 'start: szacowanie masy i ilości na podstawie dot_struktura_miesieczna_nip', @@PROCID;

--	exec stat.DziennikWpisInfo 'dop_szacowanie_blednych: szacowanie masy i ilości na podstawie dot_struktura_miesieczna_nip'

	update #struktura
	set #struktura.masa_netto = convert(decimal(11,0), (case when b.avg_cena_za_kilogram > 0 then #struktura.wartosc_stat / (b.avg_cena_za_kilogram * (case when #struktura.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end)) else null end)),
        	#struktura.uzup_jm = convert(decimal(11,0), (case when b.avg_cena_za_sztuke > 0 then #struktura.wartosc_stat / (b.avg_cena_za_sztuke * (case when #struktura.typ='P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end)) else null end))
        from stat.dot_struktura_miesieczna_nip b, stat.dot_wspolczynnik_k c
        where #struktura.typ = b.typ and
		#struktura.nip = b.nip and
		#struktura.RokMc/100-1 = b.RokMc/100 and
		#struktura.kod_towarowy = b.kod_towarowy and
    		#struktura.kraj_pochodzenia = b.kraj_pochodzenia and
    		#struktura.kraj_przezn_wysyl = b.kraj_przezn_wysyl and
    		#struktura.rodzaj_transakcji = b.rodzaj_transakcji and
           	#struktura.kod_towarowy = c.kod_towarowy and
           	#struktura.RokMc = c.RokMc

	exec stat.DziennikWpisInfo 'stop: szacowanie masy i ilości na podstawie dot_struktura_miesieczna_nip', @@PROCID;
  	
	exec stat.DziennikWpisInfo 'start: szacowanie masy na podstawie dot_struktura_miesieczna', @@PROCID;

	update #struktura
	set #struktura.masa_netto = convert(decimal(11,0), (case when b.avg_cena_za_kilogram > 0 then #struktura.wartosc_stat / (b.avg_cena_za_kilogram * (case when #struktura.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end)) else null end))
        from stat.dot_struktura_miesieczna b, dot_wspolczynnik_k c
        where #struktura.masa_netto is null and
		#struktura.typ = b.typ and
           	#struktura.RokMc/100-1 = b.RokMc/100 and
           	#struktura.kod_towarowy = b.kod_towarowy and
    		#struktura.kraj_pochodzenia = b.kraj_pochodzenia and
    		#struktura.kraj_przezn_wysyl = b.kraj_przezn_wysyl and
    		#struktura.rodzaj_transakcji = b.rodzaj_transakcji and
		#struktura.kod_towarowy = c.kod_towarowy and
           	#struktura.RokMc = c.RokMc

	exec stat.DziennikWpisInfo 'stop: szacowanie masy na podstawie dot_struktura_miesieczna', @@PROCID;

	exec stat.DziennikWpisInfo 'start: szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna', @@PROCID;

	update #struktura
	set #struktura.uzup_jm = convert(decimal(11,0), (case when b.avg_cena_za_sztuke > 0 then #struktura.wartosc_stat / (b.avg_cena_za_sztuke * (case when #struktura.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end)) else null end))
        from stat.dot_struktura_miesieczna b, stat.dot_wspolczynnik_k c
        where #struktura.uzup_jm is null and
		#struktura.typ = b.typ and
           	#struktura.RokMc/100-1 = b.RokMc/100 and
           	#struktura.kod_towarowy = b.kod_towarowy and
    		#struktura.kraj_pochodzenia = b.kraj_pochodzenia and
    		#struktura.kraj_przezn_wysyl = b.kraj_przezn_wysyl and
    		#struktura.rodzaj_transakcji = b.rodzaj_transakcji and
		#struktura.kod_towarowy = c.kod_towarowy and
           	#struktura.RokMc = c.RokMc

	exec stat.DziennikWpisInfo 'stop: szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna', @@PROCID;

	exec stat.DziennikWpisInfo 'start: szacowanie masy na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;

        update #struktura
        set #struktura.masa_netto = convert(decimal(11,0), (case when b.avg_cena_za_kilogram > 0 then #struktura.wartosc_stat / (b.avg_cena_za_kilogram * (case when #struktura.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end)) else null end))
        from stat.dot_struktura_miesieczna_agr_rodztran b, 
			stat.dot_wspolczynnik_k c
        where #struktura.masa_netto is null and 
		#struktura.typ = b.typ and
           	#struktura.RokMc/100-1 = b.RokMc/100 and
           	#struktura.kod_towarowy = b.kod_towarowy and
    		#struktura.kraj_pochodzenia = b.kraj_pochodzenia and
    		#struktura.kraj_przezn_wysyl = b.kraj_przezn_wysyl and
           	#struktura.kod_towarowy = c.kod_towarowy and
           	#struktura.RokMc = c.RokMc

	exec stat.DziennikWpisInfo 'stop: szacowanie masy na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;

	exec stat.DziennikWpisInfo 'start: szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;

        update #struktura
        set #struktura.uzup_jm = convert(decimal(11,0), (case when b.avg_cena_za_sztuke > 0 then #struktura.wartosc_stat / (b.avg_cena_za_sztuke * (case when #struktura.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end)) else null end))
        from stat.dot_struktura_miesieczna_agr_rodztran b, stat.dot_wspolczynnik_k c
        where #struktura.uzup_jm is null and
		#struktura.typ = b.typ and
           	#struktura.RokMc-100 = b.RokMc and
           	#struktura.kod_towarowy = b.kod_towarowy and
    		#struktura.kraj_pochodzenia = b.kraj_pochodzenia and
    		#struktura.kraj_przezn_wysyl = b.kraj_przezn_wysyl and
           	#struktura.kod_towarowy = c.kod_towarowy and
           	#struktura.RokMc = c.RokMc

	exec stat.DziennikWpisInfo 'stop: szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_rodztran', @@PROCID;

	exec stat.DziennikWpisInfo 'start: szacowanie masy na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;
              
        update #struktura
        set #struktura.masa_netto = convert(decimal(11,0), (case when b.avg_cena_za_kilogram > 0 then #struktura.wartosc_stat / (b.avg_cena_za_kilogram * (case when #struktura.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end)) else null end))
        from stat.dot_struktura_miesieczna_agr_kraje b, stat.dot_wspolczynnik_k c
        where #struktura.masa_netto is null and
		#struktura.typ = b.typ and
           	#struktura.RokMc-100 = b.RokMc and
           	#struktura.kod_towarowy = b.kod_towarowy and
           	#struktura.kod_towarowy = c.kod_towarowy and
           	#struktura.RokMc = c.RokMc

	exec stat.DziennikWpisInfo 'stop: szacowanie masy na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;

	exec stat.DziennikWpisInfo 'start: szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;

	update #struktura
        set #struktura.uzup_jm = convert(decimal(11,0), (case when b.avg_cena_za_sztuke > 0 then #struktura.wartosc_stat / (b.avg_cena_za_sztuke * (case when #struktura.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end)) else null end))
        from stat.dot_struktura_miesieczna_agr_kraje b, stat.dot_wspolczynnik_k c
        where #struktura.uzup_jm is null and
		#struktura.typ = b.typ and
           	#struktura.RokMc-100 = b.RokMc and
           	#struktura.kod_towarowy = b.kod_towarowy and
           	#struktura.kod_towarowy = c.kod_towarowy and
           	#struktura.RokMc = c.RokMc
        
	exec stat.DziennikWpisInfo 'stop: szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_kraje', @@PROCID;

	exec stat.DziennikWpisInfo 'start: szacowanie masy na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
     
        update #struktura
        set #struktura.masa_netto = convert(decimal(11,0), (case when b.avg_cena_za_kilogram > 0 then #struktura.wartosc_stat / (b.avg_cena_za_kilogram * (case when #struktura.typ = 'P' then c.wspolczynnik_Kcnkg_przywoz else c.wspolczynnik_Kcnkg_wywoz end)) else null end))
        from stat.dot_struktura_miesieczna_agr_miesiac b, stat.dot_wspolczynnik_k c
        where #struktura.masa_netto is null and
		#struktura.typ = b.typ and
           	#struktura.RokMc/100-1 = b.rok and
           	#struktura.kod_towarowy = b.kod_towarowy and
           	#struktura.kod_towarowy = c.kod_towarowy and
           	#struktura.RokMc = c.RokMc
        
	exec stat.DziennikWpisInfo 'stop: szacowanie masy na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;

	exec stat.DziennikWpisInfo 'start: szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;

        update #struktura
        set #struktura.uzup_jm = convert(decimal(11,0), (case when b.avg_cena_za_sztuke > 0 then #struktura.wartosc_stat / (b.avg_cena_za_sztuke * (case when #struktura.typ = 'P' then c.wspolczynnik_Kcnj_przywoz else c.wspolczynnik_Kcnj_wywoz end)) else null end))
        from stat.dot_struktura_miesieczna_agr_miesiac b, stat.dot_wspolczynnik_k c
        where #struktura.uzup_jm is null and
		#struktura.typ = b.typ and
           	#struktura.RokMc/100-1 = b.rok and
           	#struktura.kod_towarowy = b.kod_towarowy and
           	#struktura.kod_towarowy = c.kod_towarowy and
           	#struktura.RokMc = c.RokMc
  --
	exec stat.DziennikWpisInfo 'stop: szacowanie ilości w uzupełniającej jednostce miary na podstawie dot_struktura_miesieczna_agr_miesiac', @@PROCID;
--        exec stat.DziennikWpisInfo 'dop_szacowanie_blednych: koniec szacowania na podstawie struktury ubiegłorocznej'
-- aktualizacja statusu pozycji które powinny mieć ilość w uzupełniającej jednostce miary a nie mają
	update #struktura
	set status = 'E'
	where uzup_jm is null and 
		exists (select 1 from tbl_sl_taryfa_cn8 
		where #struktura.kod_towarowy = tbl_sl_taryfa_cn8.kod_cn and
			tbl_sl_taryfa_cn8.nazwa_jm is not null)
--

-- przepisanie do błędnych danych
	insert into [stat].dgt_bledne_dane (bd_RokMc, bd_rodzaj, bd_tabela, bd_bledna_wartosc, bd_nowa_wartosc, bd_id_dok, bd_id_dok_pozid, bd_do_usuniecia, bd_koment, bd_status, bd_autor)
	select RokMc as bd_RokMc, 
		'uzup_jm' as bd_rodzaj, 
		'dgv_kopia_istat_dekl_wynik_poz' as bd_tabela, 
		convert(varchar(100), (select a.uzup_jm from stat.dgv_kopia_istat_dekl_wynik_poz a where a.id_dok = #struktura.id_dok and a.pozid = #struktura.pozid)) as bd_bledna_wartosc,
		convert(varchar(100), (select a.uzup_jm from stat.dgv_kopia_istat_dekl_wynik_poz a where a.id_dok = #struktura.id_dok and a.pozid = #struktura.pozid)) as bd_nowa_wartosc,
		id_dok as bd_id_dok,
		pozid as bd_id_dok_pozid,
		'N' as bd_do_usuniecia,
		'Nie udało się doszacować ilości w uzupełniającej jednostce miary'  as bd_koment,
		'S' as bd_status, 
		'AUTO_GEN' as bd_autor
	from #struktura
	where status = 'E' and
		not exists (select 1 from stat.dgt_bledne_dane a 
			where a.bd_RokMc = #struktura.RokMc and
				a.bd_id_dok = #struktura.id_dok and
				a.bd_id_dok_pozid = #struktura.pozid and
				a.bd_rodzaj = 'uzup_jm' and
				a.bd_autor = 'AUTO_GEN')
  --
-- aktualizacja statusu dla pozycji które powinny mieć masę netto a nie mają
	update #struktura
	set status = 'F'
	where masa_netto is null
  --
-- przepisanie do błędnych danych
	insert into [stat].dgt_bledne_dane (bd_RokMc, bd_rodzaj, bd_tabela, bd_bledna_wartosc, bd_nowa_wartosc, bd_id_dok, bd_id_dok_pozid, bd_do_usuniecia, bd_koment, bd_status, bd_autor)
	select RokMc as bd_RokMc, 
		'masa_netto' as bd_rodzaj, 
		'dgv_kopia_istat_dekl_wynik_poz' as bd_tabela, 
		convert(varchar(100), (select a.masa_netto from stat.dgv_kopia_istat_dekl_wynik_poz a where a.id_dok = #struktura.id_dok and a.pozid = #struktura.pozid)) as bd_bledna_wartosc,
		convert(varchar(100), (select a.masa_netto from stat.dgv_kopia_istat_dekl_wynik_poz a where a.id_dok = #struktura.id_dok and a.pozid = #struktura.pozid)) as bd_nowa_wartosc,
		id_dok as bd_id_dok,
		pozid as bd_id_dok_pozid,
		'N' as bd_do_usuniecia,
		'Nie udało się doszacować masy netto'  as bd_koment,
		'S' as bd_status, 
		'AUTO_GEN' as bd_autor
	from #struktura
	where status = 'F' and
		not exists (select 1 from dgt_bledne_dane a 
			where a.bd_RokMc = #struktura.RokMc and
				a.bd_id_dok = #struktura.id_dok and
				a.bd_id_dok_pozid = #struktura.pozid and
				a.bd_rodzaj = 'masa_netto' and
				a.bd_autor = 'AUTO_GEN')
  --
-- aktualizacja statusu dla pozycji które mają ujemną wartość fakturową
	update #struktura
	set status = 'G'
	where wartosc_fakt < 0
  --
-- przepisanie do błędnych danych
	insert into [stat].dgt_bledne_dane (bd_RokMc, bd_rodzaj, bd_tabela, bd_bledna_wartosc, bd_nowa_wartosc, bd_id_dok, bd_id_dok_pozid, bd_do_usuniecia, bd_koment, bd_status, bd_autor)
	select RokMc as bd_RokMc, 
		'wartosc_faktury' as bd_rodzaj, 
		'dgv_kopia_istat_dekl_wynik_poz' as bd_tabela, 
		convert(varchar(100), (select a.wartosc_faktury from stat.dgv_kopia_istat_dekl_wynik_poz a where a.id_dok = #struktura.id_dok and a.pozid = #struktura.pozid)) as bd_bledna_wartosc,
		convert(varchar(100), (select a.wartosc_faktury from stat.dgv_kopia_istat_dekl_wynik_poz a where a.id_dok = #struktura.id_dok and a.pozid = #struktura.pozid)) as bd_nowa_wartosc,
		id_dok as bd_id_dok,
		pozid as bd_id_dok_pozid,
		'N' as bd_do_usuniecia,
		'Wartość faktury jest mniejsza od zera'  as bd_koment,
		'S' as bd_status, 
		'AUTO_GEN' as bd_autor
	from #struktura
	where status = 'G' and
		not exists (select 1 from stat.dgt_bledne_dane a 
			where a.bd_RokMc = #struktura.RokMc and
				a.bd_id_dok = #struktura.id_dok and
				a.bd_id_dok_pozid = #struktura.pozid and
				a.bd_rodzaj = 'wartosc_faktury' and
				a.bd_autor = 'AUTO_GEN')
  --
-- aktualizacja statusu dla pozycji które mają ujemną wartość statystyczną
	update #struktura
	set status = 'H'
	where wartosc_stat <= 0
  --
-- przepisanie do błędnych danych
	insert into [stat].dgt_bledne_dane (bd_RokMc, bd_rodzaj, bd_tabela, bd_bledna_wartosc, bd_nowa_wartosc, bd_id_dok, bd_id_dok_pozid, bd_do_usuniecia, bd_koment, bd_status, bd_autor)
	select RokMc as bd_RokMc, 
		'wartosc_statystyczna' as bd_rodzaj, 
		'dgv_kopia_istat_dekl_wynik_poz' as bd_tabela, 
		convert(varchar(100), (select a.wartosc_stat from stat.dgv_kopia_istat_dekl_wynik_poz a where a.id_dok = #struktura.id_dok and a.pozid = #struktura.pozid)) as bd_bledna_wartosc,
		convert(varchar(100), (select a.wartosc_stat from stat.dgv_kopia_istat_dekl_wynik_poz a where a.id_dok = #struktura.id_dok and a.pozid = #struktura.pozid)) as bd_nowa_wartosc,
		id_dok as bd_id_dok,
		pozid as bd_id_dok_pozid,
		'N' as bd_do_usuniecia,
		'Wartość statystyczna jest mniejsza od zera'  as bd_koment,
		'S' as bd_status, 
		'AUTO_GEN' as bd_autor
	from #struktura
	where status = 'H' and
		not exists (select 1 from dgt_bledne_dane a 
			where a.bd_RokMc = #struktura.RokMc and
				a.bd_id_dok = #struktura.id_dok and
				a.bd_id_dok_pozid = #struktura.pozid and
				a.bd_rodzaj = 'wartosc_statystyczna' and
				a.bd_autor = 'AUTO_GEN')
  --
-- przepisanie nagłówków pozycji które udało się doszacować do struktury docelowej
	declare cr_head cursor for select id_dok, [status], nip, regon, typ, RokMc from #struktura where status not in ('E', 'F', 'G', 'H')
	open cr_head
	while (1=1)
	begin
		fetch cr_head into @v_id_dok, @v_status, @v_nip, @v_regon, @v_typ, @v_RokMc
    		if @@FETCH_STATUS = 0
			if(select count(id) from stat.dot_dekl_wynik_dok where id = @v_id_dok) = 0
			begin
				insert into stat.dot_dekl_wynik_dok values (@v_id_dok, @v_status, @v_nip, @v_regon, @v_typ, @v_RokMc, 1)
			end
    		if @@FETCH_STATUS <> 0
			break
	end
	close cr_head
	deallocate cr_head

-- przepisanie pozycji które udało się doszacować do struktury docelowej
	declare cr_pos cursor for select id_dok, pozid, status_poz, komentarz, opis_towaru, kraj_przezn_wysyl, warunki_dostawy, rodzaj_transakcji,
					rodzaj_transportu, kod_towarowy, kraj_pochodzenia, masa_netto, uzup_jm, wartosc_fakt, wartosc_stat 
				from #struktura where status not in ('E', 'F', 'G', 'H')

	open cr_pos
	while(1=1)
	begin
		fetch cr_pos into @v_id_dok, @v_pozid, @v_status, @v_komentarz, @v_opis_towaru, @v_kraj_przezn_wysyl, @v_warunki_dostawy, @v_rodzaj_transakcji, 
					@v_rodzaj_transportu, @v_kod_towarowy, @v_kraj_pochodzenia, @v_masa_netto, @v_uzup_jm, @v_wartosc_fakt, @v_wartosc_stat
		if @@FETCH_STATUS = 0
		begin
			insert into dot_dekl_wynik_poz (id, pozid, status, komentarz, opis_towaru, kraj_przezn_wysyl, warunki_dostawy, rodzaj_transakcji,
					rodzaj_transportu, kod_towarowy, kraj_pochodzenia, masa_netto, uzup_jm, wartosc_faktury, wartosc_statystyczna, wskaznik_progowy)
			values (@v_id_dok, @v_pozid, @v_status, @v_komentarz, @v_opis_towaru, @v_kraj_przezn_wysyl, @v_warunki_dostawy, @v_rodzaj_transakcji, 
				@v_rodzaj_transportu, @v_kod_towarowy, @v_kraj_pochodzenia, @v_masa_netto, @v_uzup_jm, @v_wartosc_fakt, @v_wartosc_stat, '4')
		end
		if @@FETCH_STATUS <> 0 
			break
	end
	close cr_pos
	deallocate cr_pos	

	drop table #struktura;

  	exec stat.DziennikWpisInfo 'stop: dop_szacowanie_blednych', @@PROCID;