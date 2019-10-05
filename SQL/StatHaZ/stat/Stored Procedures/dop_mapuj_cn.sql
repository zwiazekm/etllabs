CREATE    procedure [stat].dop_mapuj_cn 
@p_year int
as
begin
	declare @v_id bigint
	declare @v_nip_zobowiazanego varchar (10)
      	--declare @v_miesiac int
      	--declare @v_rok int
		declare @v_RokMc int

      	declare @v_kod_towarowy varchar (8)
      	declare @v_kraj_pochodzenia varchar (2)
      	declare @v_kraj_przezn_wysyl varchar (2)
      	declare @v_ile_poz int
      	declare @v_rodzaj_transakcji varchar (2)
      	declare @v_typ varchar (1)
      	declare @v_wartosc_faktury numeric(15, 0)
      	declare @v_wartosc_stat numeric(15, 0) 
      	declare @v_masa_netto numeric(11, 0) 
      	declare @v_uzup_jm numeric(11, 0) 
      	declare @v_cena_za_kilogram numeric(15, 6) 
      	declare @v_cena_za_sztuke numeric(15, 6)

	declare @v_ilosc int
	declare @v_suma_wart_fakt numeric(15,0)
	declare @v_suma_wart_stat numeric(15,0)
      	declare @v_suma_masa_netto numeric(11,0) 
      	declare @v_suma_ilosc_uzup_jm numeric(11,0) 
	
	declare @v_cn varchar(8)
	declare @v_cnt int 
	
	declare @v_fetch_cn int
	declare @v_fetch_mapping int

	declare cr_cn cursor for select id, nip_zobowiazanego, RokMc, kod_towarowy, kraj_pochodzenia, kraj_przezn_wysyl,
					ile_poz, rodzaj_transakcji, typ, wartosc_faktury, wartosc_stat, masa_netto, uzup_jm, cena_za_kilogram, cena_za_sztuke 
				from tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran	
				where exists (select 1 from stat.dot_mapowanie_cn where stary_cn = kod_towarowy and rok=@p_year)

	open cr_cn
	while (1=1)
	begin
		fetch cr_cn into @v_id, @v_nip_zobowiazanego, @v_RokMc, @v_kod_towarowy, @v_kraj_pochodzenia, @v_kraj_przezn_wysyl,
				@v_ile_poz, @v_rodzaj_transakcji, @v_typ, @v_wartosc_faktury, @v_wartosc_stat, @v_masa_netto, @v_uzup_jm, 
				@v_cena_za_kilogram, @v_cena_za_sztuke

		set @v_fetch_cn = @@FETCH_STATUS
		if @v_fetch_cn = 0
		begin
			select @v_ilosc = count(stary_cn) from stat.dot_mapowanie_cn where stary_cn = @v_kod_towarowy and rok = @p_year

			if @v_ilosc = 1
			begin 
				update tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran
				set kod_towarowy = (select nowy_cn from stat.dot_mapowanie_cn where stary_cn = kod_towarowy)
				where id = @v_id and kod_towarowy = @v_kod_towarowy
			end
			else
			begin print @v_kod_towarowy print @v_ilosc
				set @v_suma_wart_fakt = @v_wartosc_faktury
				set @v_suma_wart_stat = @v_wartosc_stat
      				set @v_suma_masa_netto = @v_masa_netto
      				set @v_suma_ilosc_uzup_jm = @v_uzup_jm

				set @v_wartosc_faktury = @v_suma_wart_fakt / @v_ilosc
				set @v_wartosc_stat = @v_suma_wart_stat / @v_ilosc
				set @v_masa_netto = @v_suma_masa_netto / @v_ilosc
				set @v_uzup_jm = @v_suma_ilosc_uzup_jm / @v_ilosc
				set @v_cnt = 0

				declare cr_mapping cursor for select nowy_cn from stat.dot_mapowanie_cn where stary_cn = @v_kod_towarowy and rok = @p_year
				open cr_mapping
				while (1=1)
				begin
					fetch cr_mapping into @v_cn
					set @v_fetch_mapping = @@fetch_status
					if @v_fetch_mapping = 0 
					begin
						if @v_cnt = 0 
						begin
							update tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran
							set kod_towarowy = @v_cn,
								wartosc_faktury = @v_wartosc_faktury,
      								wartosc_stat = @v_wartosc_stat,
      								masa_netto = @v_masa_netto,
      								uzup_jm = @v_uzup_jm
							where id = @v_id and kod_towarowy = @v_kod_towarowy
						end
						else
						begin
							if @v_cnt = @v_ilosc - 1
							begin
								set @v_wartosc_faktury = @v_suma_wart_fakt - (@v_cnt * @v_wartosc_faktury)
								set @v_wartosc_stat = @v_suma_wart_stat - (@v_cnt * @v_wartosc_stat)
								set @v_masa_netto = @v_suma_masa_netto - (@v_cnt * @v_masa_netto)
								set @v_uzup_jm = @v_suma_ilosc_uzup_jm - (@v_cnt * @v_uzup_jm)

								insert into tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran (nip_zobowiazanego, RokMc, kod_towarowy, kraj_pochodzenia, kraj_przezn_wysyl,
									ile_poz, rodzaj_transakcji, typ, wartosc_faktury, wartosc_stat, masa_netto, uzup_jm, cena_za_kilogram, cena_za_sztuke)
								values (@v_nip_zobowiazanego, @v_RokMc, @v_cn, @v_kraj_pochodzenia, @v_kraj_przezn_wysyl, 
      									1, @v_rodzaj_transakcji, @v_typ, @v_wartosc_faktury, @v_wartosc_stat, @v_masa_netto, @v_uzup_jm, @v_cena_za_kilogram, @v_cena_za_sztuke)
							end
							else
							begin
								insert into tmp.struktura_towarowa_dla_nip_rok_miesiac_kraje_rodztran (nip_zobowiazanego, RokMc, kod_towarowy, kraj_pochodzenia, kraj_przezn_wysyl,
									ile_poz, rodzaj_transakcji, typ, wartosc_faktury, wartosc_stat, masa_netto, uzup_jm, cena_za_kilogram, cena_za_sztuke)
								values (@v_nip_zobowiazanego, @v_RokMc, @v_cn, @v_kraj_pochodzenia, @v_kraj_przezn_wysyl, 
      									1, @v_rodzaj_transakcji, @v_typ, @v_wartosc_faktury, @v_wartosc_stat, @v_masa_netto, @v_uzup_jm, @v_cena_za_kilogram, @v_cena_za_sztuke)
							end
						end
						set @v_cnt = @v_cnt + 1
					end	
					if @v_fetch_mapping <> 0
						break
				end
				close cr_mapping
				deallocate cr_mapping
			end

		end
		if @v_fetch_cn <> 0
			break
	end
	close cr_cn
	deallocate cr_cn
end