


create PROCEDURE [stat].dgp_eksport_intr_generacja
  @p_data_od datetime,
  @p_data_do datetime
as
  declare @v_komunikat varchar(255)
  set @v_komunikat = 'dgp_eksport_intr_generacja '+convert(varchar(10),@p_data_od,105)+' : ' +convert(varchar(10),@p_data_do,105)
  print @v_komunikat
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
  if exists (select 1 from sys.sysindexes i , sysobjects o 
                 where i.name like 'idx_dgt_eksport_intr_ek_nip' and o.name = 'dgt_eksport_intr' and i.id = o.id)
  begin  
    drop index stat.dgt_eksport_intr.idx_dgt_eksport_intr_ek_nip
  end
  -- ... wyczyszczenie tabeli do ktorej beda ladowane dane
  truncate table [stat].dgt_eksport_intr
  ------------------------------------------------------------------------------
  -- Wywołanie odpowiednich wersji procedur
  exec [stat].dgp_procedura_wersja 'dgp_eksport_intr_generacja', @v_data_od, @p_data_do
  --
  ------------------------------------------------------------------------------

  -- ... utworzenie wczesniej usunietego indeksu
  exec stat.DziennikWpisInfo 'start: dgp_eksport_intr_generacja_ver_1 - indeksy'
  create index idx_dgt_eksport_intr_ek_nip on stat.dgt_eksport_intr (ek_nip) on StatIndeksy
  -- czesciowe usuniecie danych
  exec [stat].dop_czesciowe_usuniecie_danych @p_data_od, @p_data_do, 'INTR', 'W'