

CREATE PROCEDURE [stat].dgp_wersja_konf
  @p_procedura varchar(255),
  @p_wersja varchar(255),
  @p_data_od datetime,
  @p_data_do datetime,
  @p_wymuszenie varchar(1) = 'N'
as
  declare @v_data_od datetime
  declare @v_data_do datetime
  declare @v_wersja varchar(255)
  declare @v_zakres varchar(1)
  declare @v_i int
  set @v_zakres = 'N'
  declare @v_new   varchar(1)
  --
  --  sprawdzenie zakresu dat
  if datepart(dd,@p_data_od) <> 1 or datepart(dd,dateadd(dd,1,@p_data_do)) <> 1 or @p_data_do < @p_data_od
  begin
    RAISERROR('Błędny zakres dat od - do', 16,1)
    return
  end
  declare c_wersja2 cursor  for
    select wersja_procedury, data_od, data_do
      from dgt_procedura_wersja 
     where nazwa_procedury = @p_procedura
     order by  data_od
  --
  create table #procedura_wersja 
    (nazwa_procedury varchar(255) not null,
     wersja_procedury varchar(255) not null,
     data_od datetime not null,
     data_do datetime not null)
  -- 
  -- Sprawdzenie poprawanosci wpisów w tabeli dgt_procedura_wersja dla wybranej procedury
  --
  open c_wersja2
  fetch c_wersja2 into @v_wersja, @v_data_od, @v_data_do
  --
  -- Brak wpisów dla danej procedury
  --
  if @@FETCH_STATUS <> 0 
  begin
    insert into [stat].dgt_procedura_wersja (nazwa_procedury, wersja_procedury, data_od, data_do)
      values (@p_procedura, @p_wersja, @p_data_od, @p_data_do)
    close c_wersja2
    deallocate c_wersja2
    return
  end
  -- 
  -- Sprawdzenie czy jest bieżący zakres jest powiązany już z istniejącymi
  if (select datediff(dd,isnull(max(data_do),dateadd(dd,-1,@p_data_od)),@p_data_od)
        from dgt_procedura_wersja
       where nazwa_procedury = @p_procedura and data_do < @p_data_od) <> 1
    or
      (select datediff(dd,@p_data_do,isnull(min(data_od),dateadd(dd,1,@p_data_do)))
        from dgt_procedura_wersja
       where nazwa_procedury = @p_procedura and data_od > @p_data_do) <> 1
  begin
    RAISERROR('Brak powiązania z istniejącymi wpisami', 16,1)
    close c_wersja2
    deallocate c_wersja2
    return
  end 
  --
  -- Sprawdzenie czy nie ma już wpisów w danym zakresie dat gdy nie ma wymuszenia
  if exists (select 1 
               from dgt_procedura_wersja 
              where nazwa_procedury = @p_procedura and (@p_data_od between data_od and data_do 
                                                      or @p_data_do between data_od and data_do))
    or
     exists (select 1 
               from dgt_procedura_wersja 
             having min(data_od) between @p_data_od and @p_data_do 
                and max(data_od) between @p_data_od and @p_data_do)

  begin
    if @p_wymuszenie <> 'T'
    begin
      RAISERROR('Podany zakre zachodzi na już istniejący, użyj parametru @p_wymuszenie aby nadpisać zakres', 16,1)
      close c_wersja2
      deallocate c_wersja2
      return
    end
    else
      set @v_zakres = 'T'
  end 
  if @v_zakres <> 'T'    
  begin
    insert into [stat].dgt_procedura_wersja (nazwa_procedury, wersja_procedury, data_od, data_do)
      values (@p_procedura, @p_wersja, @p_data_od, @p_data_do)
    close c_wersja2
    deallocate c_wersja2
    return
  end
  --
  -- Gdy włączone wymuszenie to przebudowujemy istniejące wpisy
  --
  else
  begin
    set @v_i = 0
    while @@FETCH_STATUS = 0 
    begin
      set @v_new = 'N'
      set @v_i = @v_i+1
      -- sprawdzenie zakresu
      -- początkowa data przed istniejącym zakresem
      if @v_i = 1 and @p_data_od < @v_data_od
      begin
        insert into #procedura_wersja (nazwa_procedury, wersja_procedury, data_od, data_do)
            values (@p_procedura, @p_wersja, @p_data_od, @p_data_do)
        while @@FETCH_STATUS = 0 and @v_data_do < @p_data_do
          fetch c_wersja2 into @v_wersja, @v_data_od, @v_data_do
        if @v_data_do > @p_data_do
          insert into #procedura_wersja (nazwa_procedury, wersja_procedury, data_od, data_do)
              values (@p_procedura, @v_wersja, dateadd(dd,1,@p_data_do), @v_data_do)   
        set @v_new = 'T'      
      end
      --       
      -- data od w istniejącym zakresie
      if @p_data_od >= @v_data_od and @p_data_od <= @v_data_do
      begin
        if @p_data_od <> @v_data_od 
          insert into #procedura_wersja (nazwa_procedury, wersja_procedury, data_od, data_do)
              values (@p_procedura, @v_wersja, @v_data_od, dateadd(dd,-1,@p_data_od))
        insert into #procedura_wersja (nazwa_procedury, wersja_procedury, data_od, data_do)
            values (@p_procedura, @p_wersja, @p_data_od, @p_data_do) 
        while @@FETCH_STATUS = 0 and @v_data_do < @p_data_do
          fetch c_wersja2 into @v_wersja, @v_data_od, @v_data_do
        if @v_data_do > @p_data_do
          insert into #procedura_wersja (nazwa_procedury, wersja_procedury, data_od, data_do)
              values (@p_procedura, @v_wersja, dateadd(dd,1,@p_data_do), @v_data_do) 
        set @v_new = 'T'
      end
      -- Czy przepisujmy istniejący
      if @v_new = 'N'
      begin
         insert into #procedura_wersja (nazwa_procedury, wersja_procedury, data_od, data_do)
              values (@p_procedura, @v_wersja, @v_data_od, @v_data_do) 
      end
      fetch c_wersja2 into @v_wersja, @v_data_od, @v_data_do
    end
    -- przepisanie danych z tabeli tymczasowej
    delete dgt_procedura_wersja where nazwa_procedury = @p_procedura
    --
    insert into [stat].dgt_procedura_wersja (nazwa_procedury, wersja_procedury, data_od, data_do)
        select  nazwa_procedury, wersja_procedury, data_od, data_do from #procedura_wersja
  end
close c_wersja2
deallocate c_wersja2