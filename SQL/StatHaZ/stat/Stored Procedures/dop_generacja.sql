CREATE PROCEDURE [stat].dop_generacja
  @p_data_od   date,
  @p_data_do   date,
  @p_algorytmy varchar (100) = 'pierwsze', -- pierwsze, pierwsze_kolejne
  @p_prog numeric = 0 -- próg do łączenia pozycji doszacowanych
as
  declare @v_przesuniecie numeric
  declare @v_data_biez    datetime
  declare @v_data_pom     datetime
  declare @v_data_od     datetime
  declare @v_rok_do      int
  declare @id			 int
  --
  declare @info varchar(1000) = 'Start: @p_data_od=' + convert (varchar, @p_data_od, 111) + ', @p_data_do=' + convert (varchar, @p_data_do, 111) + ', @p_algorytmy=' + @p_algorytmy + ', @p_prog=' + convert(varchar(10), @p_prog);
  exec @id = [stat].DziennikWpisInfo @info, @@PROCID;
  --

    -- Ladowanie danych poczatkowych
    exec [stat].dop_przepisanie_danych @p_data_od, @p_data_do
    
    exec [stat].dop_wyznaczenie_kategorii_priorytetow_okresow @p_data_od, @p_data_do
    exec [stat].dop_wylicz_wspolczynnik_f
    -- Wyznaczenie wartosci statystycznej
    exec [stat].dop_wyznaczenie_wartosci_statystycznej @p_data_do
    --
    exec [stat].dgp_import_intr_generacja @p_data_od, @p_data_do
    --
    exec [stat].dgp_eksport_intr_generacja @p_data_od, @p_data_do


  --
  -- Doszacowanie danych
  select @v_przesuniecie = 0
  -- ... ustawienie poczatkowej daty

  print '-- ... ustawienie poczatkowej daty'

  select @v_data_biez = convert (datetime, convert (varchar, year (@p_data_do)) + '0101', 112)
  exec [stat].dop_generacja_danych_poczatkowych @p_data_do
  print '@v_data_biez = ' + convert (varchar, @v_data_biez, 111)

  -- Doszacowanie nową metodą podmiotów powyżej asymilacji
  -- Przygotowanie danych struktury  
  set @v_rok_do = year(@p_data_do)

--************************************

  --exec [stat].dop_struktura_miesieczna 2012,1,'T','T'

--************************************

  exec [stat].dop_struktura_miesieczna @v_rok_do,0,'T','N'
  --
  -- Wyliczenie wspólczynników K
  exec [stat].dop_wspolczynnik_k @p_data_do
  -- 
  -- Szacownie podmiotów powyżej asymilacji strukturą ubiegłoroczną  
  exec [stat].dop_powyzej_asymilacji @p_data_do
  --
  -- Szacownie deklaracji zawierających błedy formalne lub logiczne
  exec [stat].dop_szacowanie_blednych @p_data_do
  --
  --
  -- ... doszacowywanie danych na kolejne miesiace
  print '-- ... doszacowywanie danych na kolejne miesiace'
  while left (convert (varchar, @v_data_biez, 112), 6) <= left (convert (varchar, @p_data_do, 112), 6)
  begin
    -- ... wywolanie poszczegolnych procedur doszacowania
    --  wywołanie kolejnych terminów - przygotowana struktura do wywoałania procedur
    --
    if     (    (     year (@p_data_do) = year (@v_data_biez)
                  and month (@p_data_do) - month (@v_data_biez) >= 1)
             or (     year (@p_data_do) > year (@v_data_biez)
                  and (    (     month (@p_data_do) = 1
                             and month (@v_data_biez) <= 11)
                        or (     month (@p_data_do) = 2
                             and month (@v_data_biez) <= 12)
                      )
                 )
           )
       and @p_algorytmy = 'pierwsze_kolejne'
      begin
        print 'pierwsze_kolejne'
        -- ... ... kolejny termin
        select @v_data_pom = @v_data_biez
      end
    --
    if    (    (     year (@p_data_do) = year (@v_data_biez)
                 and month (@p_data_do) - month (@v_data_biez) >= 1)
            or (     year (@p_data_do) > year (@v_data_biez)
                 and (    (     month (@p_data_do) = 1
                            and month (@v_data_biez) <= 11)
                       or (     month (@p_data_do) = 2
                            and month (@v_data_biez) <= 12)
                     )
               )
           )
       and @p_algorytmy = 'pierwsze'
      begin
        print 'pierwsze'
        -- ... ... kolejny termin
        select @v_data_pom = @v_data_biez
        exec [stat].dop_pierwszy_termin_ponizej_asymilacji @v_data_pom, 'P'
        exec [stat].dop_pierwszy_termin_ponizej_asymilacji @v_data_pom, 'W'
        exec [stat].dop_pierwszy_termin_powyzej_asymilacji @v_data_pom, 'P', @p_prog
        exec [stat].dop_pierwszy_termin_powyzej_asymilacji @v_data_pom, 'W', @p_prog
      end
    --
    if    (     year (@p_data_do) = year (@v_data_biez)
            and month (@p_data_do) - month (@v_data_biez) = 0)
       or (     year (@p_data_do) > year (@v_data_biez)
            and month (@p_data_do) = 1
            and month (@v_data_biez) = 12)
      begin
        -- ... ... pierwszy termin
        select @v_data_pom = @v_data_biez
        exec [stat].dop_pierwszy_termin_ponizej_asymilacji @v_data_pom, 'P'
        exec [stat].dop_pierwszy_termin_ponizej_asymilacji @v_data_pom, 'W'
        exec [stat].dop_pierwszy_termin_powyzej_asymilacji @v_data_pom, 'P', @p_prog
        exec [stat].dop_pierwszy_termin_powyzej_asymilacji @v_data_pom, 'W', @p_prog
      end
      -- Grupowanie danych doszacownych gdy podano prog większy od zera
      -- wywołanie przeniesione do dop_pierwszy_termin_powyzej_asymilacji
    -- ... wypelnienie tabel na zakonczenie generacji
    print '-- ... wypelnienie tabel na zakonczenie generacji'
    -- ... przejscie do nastepnego miesiaca
    print '-- ... przejscie do nastepnego miesiaca'
    select @v_data_biez = dateadd (month, 1, @v_data_biez)
  end

  -- koniec
  print '-- koniec'
  --
  exec stat.DziennikWpisInfo 'stop',  @@PROCID;
  exec [stat].DziennikCzas @id;