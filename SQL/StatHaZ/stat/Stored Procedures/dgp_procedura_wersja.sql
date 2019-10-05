CREATE PROCEDURE [stat].dgp_procedura_wersja
@p_procedura varchar(255),
@p_data_od datetime,
@p_data_do datetime,
@p_typ varchar(1) = ''
as
begin
  declare @v_data_od datetime
  declare @v_data_do datetime
  declare @v_data_od_old datetime
  declare @v_data_do_old datetime
  declare @v_wersja varchar(255)
  declare @v_komunikat varchar(255)
  declare @v_polecenie nvarchar(4000)
  declare @v_i int
  --
  declare c_wersja cursor  for
    select 'stat.' + wersja_procedury, data_od, data_do
      from dgt_procedura_wersja 
     where nazwa_procedury = @p_procedura
       and @p_data_od <= data_do and @p_data_do >= data_od
     order by  data_od
  -- 
  -- Sprawdzenie poprawanosci wpisów w tabeli dgt_procedura_wersja dla wybranej procedury
  --
  open c_wersja
  fetch c_wersja into @v_wersja, @v_data_od, @v_data_do
  -- Sprawdzenie czy jest wpis dla procedury
  if @@FETCH_STATUS <> 0 
  begin
    RAISERROR('Brak wpisu w tabeli dgt_procedura_wersja dla procedury: %s',16,1, @p_procedura)
    close c_wersja
    deallocate c_wersja
    return
  end
  -- Sprawdzenie daty początkowej
  if @v_data_od > @p_data_od
  begin
    RAISERROR('Zakres poza defincją w tabeli dgt_procedura_wersja dla procedury: %s',16,1,@p_procedura)
    close c_wersja
    deallocate c_wersja
    return
  end
  --
  set @v_i = 0 

  while @@FETCH_STATUS = 0
  begin  
    set @v_i = @v_i + 1
    --
    set @v_data_od_old = @v_data_od
    set @v_data_do_old = @v_data_do
    --
    fetch c_wersja into @v_wersja, @v_data_od, @v_data_do
    --
    if @v_i > 1 and @@FETCH_STATUS = 0
    begin
       -- sprawdzenie ciągłości zakresów dat
      if datediff(dd,@v_data_do_old, @v_data_od) <> 1
      begin
        RAISERROR('Brak ciągłości w tabeli dgt_procedura_wersja dla procedury : %s',16,1, @p_procedura)
        close c_wersja
        deallocate c_wersja
        return
      end
      -- sprawdzenie czy okresy zaczynają się od początku miesiąca
      if datepart(dd,@v_data_od) <> 1 or datepart(dd,dateadd(dd,-1,@v_data_do)) <> 1
      begin
        RAISERROR('Okresy nie zaczynają się od początku miesiąca dla procedury : %s',16,1, @p_procedura)
        close c_wersja
        deallocate c_wersja
        return
      end
    end
  end
  close c_wersja
  -- Sprawdzenie daty końcowej
  if @v_data_do_old < @p_data_do
  begin
    RAISERROR('Zakres poza defincją w tabeli dgt_procedura_wersja dla procedury: %s',16,1, @p_procedura)
    close c_wersja
    deallocate c_wersja
    return
  end
  --------------------------------------------------------
  open c_wersja
  fetch c_wersja into @v_wersja, @v_data_od, @v_data_do
  while @@FETCH_STATUS = 0
  begin
    --ustawienie warunków granicznych
    if @v_data_od < @p_data_od 
      set @v_data_od = @p_data_od
    if @v_data_do > @p_data_do 
      set @v_data_do = @p_data_do
    --
    -- specyficzne wywołania procedur
    if @p_procedura = 'dgp_czyszczenie_intr_agr'
    begin
      set @v_polecenie = N'exec '+@v_wersja+' @data_od, @data_do, @typ'
      exec stat.DziennikWpisInfo @v_polecenie
      print @v_polecenie
      exec sys.sp_executesql @v_polecenie, N'@data_od datetime, @data_do datetime, @typ varchar', 
                                        @v_data_od, @v_data_do, @p_typ
    end
    else
    begin
      set @v_polecenie = N'exec '+@v_wersja+' @data_od, @data_do'
      print @v_polecenie
      exec stat.DziennikWpisInfo @v_polecenie
      exec sys.sp_executesql @v_polecenie, N'@data_od datetime, @data_do datetime', @v_data_od, @v_data_do
    end
  --  print @v_wersja
    fetch c_wersja into @v_wersja, @v_data_od, @v_data_do
  end 
  close c_wersja
  deallocate c_wersja
end