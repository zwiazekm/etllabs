CREATE PROCEDURE [stat].dop_grupowanie_doszacowan
  @p_prog numeric,
  @p_data_do date,
  @p_typ  char(1),
  @p_wspolczynnik_k numeric(15,6)
as
	--	
	declare @v_il_powyzej numeric
  declare @v_pk         numeric
  declare @v_i          numeric
  declare @v_info       varchar (1000)
  declare @v_nip varchar(30)
  declare @v_open smallint
  declare @v_stat_old numeric
  declare @v_stat_new numeric
  declare @v_proporcja numeric(15,6)
  set @v_open = 0
  --
  create table #suma_grup
               (suma decimal(18,0),
              nr_grp int)
  -- 
  create index idx_suma_grup on #suma_grup(nr_grp)
  --
  set @v_info = 'start: dop_grupowanie_doszacowan: ' + convert(varchar,@p_data_do) 
              + ' - ' + @p_typ + ' - ' + convert(varchar,@p_wspolczynnik_k) + ' - ' + convert(varchar,@p_prog)
  --
	exec stat.DziennikWpisInfo  @v_info 
	if @p_prog = 0 
	begin
 	 exec stat.DziennikWpisInfo 'stop: dop_grupowanie_doszacowan - prog = 0'
	end
	--
  -- Wybór podmiotów z danego miesiaca i typu
  --
  declare c_nip cursor  for select distinct nip_zobowiazanego 
                              from stat.dot_dekl_wynik_dok 
                             where nip_zobowiazanego <> '0000000000'
                               and RokMc = dbo.KonwertujDateNaRokMc(@p_data_do)
                               and typ = @p_typ
  --
  open c_nip
  --
  -- Wybór po nipach
  --
  FETCH NEXT FROM c_nip INTO @v_nip
  WHILE @@fetch_status = 0                                                                 
  BEGIN 
   print '-----' + @v_nip
   --
	--

   --
   -- Obliczenie ilosci pozycji powyzej progu
    select @v_il_powyzej =  (select count(*) 
                               from  dot_dekl_wynik_poz 
                          	  where wskaznik_progowy = 4 and isnull(wartosc_statystyczna,0) >= @p_prog
                                and exists (select 1 
                                              from stat.dot_dekl_wynik_dok dok 
                                             where dot_dekl_wynik_poz.id = dok.id
                                               and typ = @p_typ 
                                               and nip_zobowiazanego = @v_nip
											   and RokMc = dbo.KonwertujDateNaRokMc(@p_data_do)
											   ))
    print @v_il_powyzej
    if @v_open = 1
      begin
        close c_dot_dekl_wynik_poz
        close c_dot_dekl_wynik_poz_pow
        deallocate c_dot_dekl_wynik_poz
      	deallocate c_dot_dekl_wynik_poz_pow
        set @v_open = 0
      end
    --
    -- Gdy nie ma żadnej deklaracji powyżej progu
    if  @v_il_powyzej = 0 
      begin
        FETCH NEXT FROM c_nip INTO @v_nip
        continue
      end


  --Wybor deklaracji ponizej progu
	declare  c_dot_dekl_wynik_poz cursor for select pk 
																					   from stat.dot_dekl_wynik_poz 
																					  where wskaznik_progowy = 4 and isnull(wartosc_statystyczna,0) < @p_prog
                                              and exists (select 1 
                                                           from stat.dot_dekl_wynik_dok dok 
                                                          where dot_dekl_wynik_poz.id = dok.id
                                                            and nip_zobowiazanego = @v_nip
                                                            and typ = @p_typ 
                                                            and RokMc = dbo.KonwertujDateNaRokMc(@p_data_do) )
																				 order by wartosc_statystyczna desc, 
                                                  rodzaj_transakcji, kod_towarowy, 
                                                  kraj_pochodzenia, kraj_przezn_wysyl
	--
	-- Wybor deklaracji powyzej progu
	declare  c_dot_dekl_wynik_poz_pow cursor for select pk 
																							   from stat.dot_dekl_wynik_poz 
																								 where wskaznik_progowy = 4 and isnull(wartosc_statystyczna,0) >= @p_prog
                                                   and exists (select 1 
                                                                 from stat.dot_dekl_wynik_dok dok 
                                                                where dot_dekl_wynik_poz.id = dok.id
                                                                  and typ = @p_typ
                                                                  and nip_zobowiazanego = @v_nip
                                                                  and RokMc = dbo.KonwertujDateNaRokMc(@p_data_do)
																  )
    																							order by wartosc_statystyczna desc,
                                                  rodzaj_transakcji, kod_towarowy, 
                                                  kraj_pochodzenia, kraj_przezn_wysyl
    set @v_open = 1
    --
    --set @v_info = 'start:  @v_il_powyzej - @v_il_powyzej: ' + convert (varchar,  @v_il_powyzej)
    --exec stat.DziennikWpisInfo @v_info
    --print @v_info
    --
    --exec stat.DziennikWpisInfo 'start: dop_grupowanie_doszacowan: oznaczenie pozycji ponizej progu'
    --
    open c_dot_dekl_wynik_poz
  	--
  	FETCH NEXT FROM c_dot_dekl_wynik_poz INTO @v_pk
  	--
  	-- przypisanie grupy do pozycji ponizej progu
  	set @v_i = @v_il_powyzej
  	--
    print @v_pk
  	WHILE @@FETCH_STATUS = 0
    BEGIN      
    print @v_pk
  	-- 
     update dot_dekl_wynik_poz 
         set nr_grp =  @v_i
       where pk = @v_pk
  	--   
      FETCH NEXT FROM c_dot_dekl_wynik_poz INTO @v_pk
  	--    
  		set @v_i = @v_i - 1
      if @v_i = 0  set @v_i =  @v_il_powyzej
  	--
    END
  	-- Zamkniecie kursora
--  	close c_dot_dekl_wynik_poz
  	
  	--
  	--exec stat.DziennikWpisInfo 'start: dop_grupowanie_doszacowan: sumowanie do pozycji powyzej progu'
  	set @v_i = 0
  	--
  	open c_dot_dekl_wynik_poz_pow
  	--
    -- Utworzenie tabeli tymczasowej
    truncate table #suma_grup;
      insert into #suma_grup
      select sum(isnull(wartosc_statystyczna,0)) suma, 
             nr_grp
        from stat.dot_dekl_wynik_poz 
       where nr_grp is not null
         and exists (select 1 
                       from stat.dot_dekl_wynik_dok dok 
                      where dot_dekl_wynik_poz.id = dok.id
                        and typ = @p_typ
                        and nip_zobowiazanego = @v_nip
						and dok.RokMc = dbo.KonwertujDateNaRokMc(@p_data_do) )
    group by nr_grp
    order by nr_grp ;
    --
  	FETCH NEXT FROM c_dot_dekl_wynik_poz_pow INTO @v_pk
  	--
  	-- Do kolejnych pozycji powyzej progu dodajemy sume z grup pozycji ponizej progu
    set @v_i = @v_il_powyzej + 1
  	WHILE @@FETCH_STATUS = 0
  	--
    BEGIN
      set @v_i = @v_i - 1
      set @v_stat_new = null;
      select @v_stat_new = suma from #suma_grup where #suma_grup.nr_grp = @v_i;  
      select @v_stat_old = wartosc_statystyczna from stat.dot_dekl_wynik_poz where pk = @v_pk;
      set @v_stat_new = @v_stat_old + @v_stat_new
      if isnull(@v_stat_new,0) > 0 
      begin
        set @v_proporcja = convert(numeric(15,6),@v_stat_old/@v_stat_new)        
        update dot_dekl_wynik_poz 
            set wartosc_statystyczna = @v_stat_new,
                wartosc_faktury = wartosc_faktury * @v_proporcja,
                masa_netto = masa_netto * @v_proporcja,
                uzup_jm = uzup_jm * @v_proporcja
          where pk = @v_pk
      end
      -- aktualizacja masy, ilości, wartosci fakturowej
      --  
      FETCH NEXT FROM c_dot_dekl_wynik_poz_pow INTO @v_pk
     END
  	-- Zamkniecie kursora
--	  close c_dot_dekl_wynik_poz_pow
  FETCH NEXT FROM c_nip INTO @v_nip
--  deallocate c_dot_dekl_wynik_poz
	--deallocate c_dot_dekl_wynik_poz_pow
  END
 --
  -- Zamkniecie kursora
  close c_nip
  -- 
  deallocate c_nip
  if @v_open = 1
      begin
        close c_dot_dekl_wynik_poz
        close c_dot_dekl_wynik_poz_pow
        deallocate c_dot_dekl_wynik_poz
    	  deallocate c_dot_dekl_wynik_poz_pow
      end
  drop table #suma_grup
  exec stat.DziennikWpisInfo 'stop: dop_grupowanie_doszacowan'