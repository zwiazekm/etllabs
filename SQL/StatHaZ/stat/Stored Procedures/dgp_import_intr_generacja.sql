CREATE PROCEDURE [stat].dgp_import_intr_generacja
  @p_data_od datetime,
  @p_data_do datetime
as
  declare @v_komunikat varchar(255)
  set @v_komunikat = 'dgp_import_intr_generacja '+convert(varchar(10),@p_data_od,105)+' : ' +convert(varchar(10),@p_data_do,105)
  print @v_komunikat
  --
  --
  -- Ustawienie poczatkowej daty
  print '-- ... ustawienie poczatkowej daty'
  declare @v_data_od datetime
  if     year (@p_data_od) = year (@p_data_do)
     and year (@p_data_do) != 2004
    begin
      select @v_data_od = convert (datetime, convert (varchar, year (@p_data_do)) + '0101', 112)
    end
  else
    begin
      -- ... ... dla roku 2004 i pierwszych 2 miesiecy roku 2005 procedury doszacowania
      --         beda generowane od 06.2004
      if    year (@p_data_do) = 2004
         or (     year (@p_data_do) = 2005
              and month (@p_data_do) <= 2)
        begin
           select @v_data_od = convert (datetime, convert (varchar, case when year (@p_data_do) = 2004 then year (@p_data_do) else year (@p_data_do) - 1 end) + '0501', 112)
        end
      else
        -- ... ... od roku 2006 i pierwszych 2 miesiecy danego roku procedury doszacowania
        --         beda generowane od stycznia roku poprzedniego
        if     year (@p_data_do) >= 2006
           and month (@p_data_do) <= 2
          begin
            select @v_data_od = convert (datetime, convert (varchar, year (dateadd (year, -1, @p_data_do))) + '0101', 112)
          end
        else
          -- ... ... od roku 2006 i kolejnych miesiecy powyzej pierwszych 2 danego roku procedury doszacowania
          --         beda generowane od stycznia danego roku
          select @v_data_od = convert (datetime, convert (varchar, year (@p_data_do)) + '0101', 112)
    end
  print '@v_data_biez = ' + convert (varchar, @v_data_od, 111)
  --
  -- Generacja danych
  -- ... usuniecie indeksow tabeli do ktorej beda ladowane dane w celu przyspieszenia operacji
  ALTER INDEX idx_dgt_import_intr_ek_nip ON [stat].[dgt_import_intr] DISABLE;
  ALTER INDEX idx_dgt_import_intr_im_kraj_pochodzenia ON [stat].[dgt_import_intr] DISABLE;
  ALTER INDEX idx_dgt_import_intr_im_kraj_wysylki ON [stat].[dgt_import_intr] DISABLE;

  -- ... wyczyszczenie tabeli do ktorej beda ladowane dane
  truncate table [stat].[dgt_import_intr];

  ----------------------------------------------------------------------------
  -- Uruchomienie odpowiedniej wersji procedury
  --
  exec [stat].dgp_procedura_wersja 'dgp_import_intr_generacja', @v_data_od, @p_data_do
  --
  ----------------------------------------------------------------------------

  -- Przebudowa indeksów
  DECLARE @LogId bigint;
  exec @LogId = [stat].dgp_wstaw_info 'start: dgp_import_intr_generacja - przebudowa indeksów', @@PROCID;

  ALTER INDEX [idx_dgt_import_intr_im_kraj_pochodzenia] ON [stat].[dgt_import_intr] REBUILD PARTITION = ALL 
  ALTER INDEX [idx_dgt_import_intr_ek_nip] ON [stat].[dgt_import_intr] REBUILD PARTITION = ALL 
  ALTER INDEX [idx_dgt_import_intr_im_kraj_wysylki] ON [stat].[dgt_import_intr] REBUILD PARTITION = ALL 

  EXEC stat.DziennikCzas @LogId;

  -- czesciowe usuniecie danych
  exec [stat].dop_czesciowe_usuniecie_danych @v_data_od, @p_data_do, 'INTR', 'P'
  --
  exec stat.DziennikWpisInfo 'stop: dgp_import_intr_generacja', @@PROCID;
--