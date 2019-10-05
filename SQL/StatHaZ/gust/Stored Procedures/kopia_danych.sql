CREATE PROCEDURE [gust].kopia_danych
  @p_data_od   datetime,
  @p_data_do   datetime,
  @p_operacja  varchar (30)
     
as

  exec stat.DziennikWpisInfo 'start: kopia_danych_zrodlowych', @@PROCID;
  --------------------------------------------------------------------------------------------------
  -- Parametry:
  --   @p_data_od   - okres od
  --   @p_data_do   - okres do
  --   @p_operacja  - parametr definiujacy czy tworzymy widoki do kopiowania danych (kopie)
  --                   czy widoki na kopie ustawione na dane okresy (okresy)
  --------------------------------------------------------------------------------------------------
  --
  -- deklaracja zmiennych
  declare @v_pierwsze_wejscie varchar (1)
  declare @v_baza             varchar (100)
  declare @v_tabela           varchar (100)
  declare @v_lista_kolumn     varchar (3000)
  declare @v_polecenie        nvarchar (4000)
  declare @v_okres_od         varchar (8)
  declare @v_okres_do         varchar (8)
  declare @v_komunikat        varchar (1000)
  --
  -- lista kopiowanych tabel
  begin
    declare c_tabele cursor for
      select 'gust.' baza, 'tbl_dane_zrodlowe' tabela
 end
   
  --
  -- ustawienie okresow
  set @v_okres_od = '''' + left (convert (varchar, @p_data_od, 112), 6) + ''''
  set @v_okres_do = '''' + left (convert (varchar, @p_data_do, 112), 6) + ''''
  --
  -- kursor po tabelach
  open c_tabele
  fetch c_tabele
    into @v_baza, @v_tabela

  --
  -- tworzenie widoku do kopiowania tabeli zrodlowej
  if @p_operacja = 'kopia'
  begin
   while (@@FETCH_STATUS = 0) or (@v_pierwsze_wejscie = 'T')
    begin
      --
      -- usuniecie danych z danego okresu
      set @v_polecenie = 'delete from gust.kopia_' + @v_tabela + ' where okres_od = ' + @v_okres_od + ' and okres_do = ' + @v_okres_do + ' and flaga <> ' + '''' + 'A' + '''' + ' and flaga <> ' + '''' + 'B' + ''''
      print @v_polecenie
      exec sp_executesql @v_polecenie
      --

      -- usuniecie pomocniczych widokow do kopiowania danych z danego okresu
	  set @v_polecenie = 'IF object_id(N''gust.widok_' + @v_tabela + '_kopia'', ''V'') IS NOT NULL ' + 
						'DROP VIEW gust.widok_' + @v_tabela + '_kopia;'
      print @v_polecenie
      exec sp_executesql @v_polecenie
      --

      -- pobranie listy kolumn dane tabeli 
      set @v_lista_kolumn = stat.sf_object_columns (@v_baza + @v_tabela);
      --
      -- stworzenie pomocniczych widokow do kopiowania danych z danego okresu - kopiowanie zalatwia DTS
      set @v_polecenie = 'CREATE VIEW gust.widok_' + @v_tabela + '_kopia as
                          select ' + @v_lista_kolumn + ', ' +
                                   + @v_okres_od + ' okres_od, '
                                   + @v_okres_do + ' okres_do from ' + @v_tabela 

      print @v_polecenie
      exec sp_executesql @v_polecenie
      -- 
      -- kopiowanie danych
      set @v_polecenie = 'insert into gust.kopia_' + @v_tabela + ' (' + @v_lista_kolumn + ', okres_od, okres_do) select ' + @v_lista_kolumn + ', okres_od, okres_do from gust.widok_insert_danych;'
      print @v_polecenie
      exec sp_executesql @v_polecenie
      -- wstawienie informacji do tbl_info
      set @v_komunikat = 'kopia_danych  ' + @v_tabela + '=' + convert (varchar, @@ROWCOUNT)
      exec stat.DziennikWpisInfo @v_komunikat
      --
      fetch c_tabele
        into @v_baza, @v_tabela
      --
      set @v_pierwsze_wejscie = 'N'
    end
  end
  --
-- tworzenie widoku na okresy kopii tabeli zrodlowej
  if @p_operacja = 'okresy'
  begin
    while (@@FETCH_STATUS = 0) or (@v_pierwsze_wejscie = 'T')
    begin
      --
      -- usuniecie
      set @v_polecenie = 'DROP VIEW gust.widok_kopia_' + @v_tabela
      --print @v_polecenie
      exec sp_executesql @v_polecenie

      -- tworzenie
      set @v_polecenie = 'CREATE VIEW gust.widok_kopia_' + @v_tabela + ' as
                          select *
                            from gust.kopia_'  + @v_tabela + '
                           where okres_od = ' + @v_okres_od + '
                             and okres_do = ' + @v_okres_do 
      --print @v_polecenie
      exec sp_executesql @v_polecenie
--
fetch c_tabele
        into @v_baza, @v_tabela
      --
      set @v_pierwsze_wejscie = 'N'
    end
  end
  --  
  
close c_tabele
  deallocate c_tabele
  --
  exec stat.DziennikWpisInfo 'stop: kopia_danych', @@PROCID;