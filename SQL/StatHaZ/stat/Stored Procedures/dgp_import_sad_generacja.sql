CREATE  PROCEDURE [stat].dgp_import_sad_generacja
  @p_data_od datetime,
  @p_data_do datetime
as
  declare @v_komunikat varchar(255)
  set @v_komunikat = 'dgp_import_sad_generacja '+convert(varchar(10),@p_data_od,112)+' : ' +convert(varchar(10),@p_data_do,112)
  print @v_komunikat
  --
  declare @v_rowcount bigint
  declare @v_info varchar (1000)
  --
  exec stat.DziennikWpisInfo 'start: dgp_import_sad_generacja'
  --
  truncate table [stat].dgt_import_sad
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
  -- ... usuniecie indeksow w celu przyspieszenia operacji
  if exists (select 1 from sys.sysindexes where name like 'dgt_import_sad_pcn_idx')
      drop index dgt_import_sad_pcn_idx ON stat.dgt_import_sad;
  if exists (select 1 from sys.sysindexes where name like 'dgt_import_sad_wart_stat_zl')
      drop index dgt_import_sad_wart_stat_zl ON stat.dgt_import_sad;
  if exists (select 1 from sys.sysindexes where name like 'dgt_import_sad_im_pcnp_idx')
      drop index dgt_import_sad_im_pcnp_idx ON stat.dgt_import_sad;
  if exists (select 1 from sys.sysindexes where name like 'dgt_import_sad_im_kraj_pochodzenia_idx')
      drop index dgt_import_sad_im_kraj_pochodzenia_idx ON stat.dgt_import_sad;
  if exists (select 1 from sys.sysindexes where name like 'dgt_import_sad_im_kraj_wysylki_idx')
      drop index dgt_import_sad_im_kraj_wysylki_idx ON stat.dgt_import_sad;
  --
  ----------------------------------------------------------------------------
  -- Wywołanie odpowiedniej wersji procedury
  --
  exec [stat].dgp_procedura_wersja 'dgp_import_sad_generacja', @p_data_od, @p_data_do
  --
  ----------------------------------------------------------------------------
  --
  -- Formatowanie danych
  update [stat].dgt_import_sad 
  set im_kod_transportu_w =  isnull ([Rodzaj],' ')   
  from   dgv_kopia_v2_sad_transport, dgt_import_sad 
  where  im_iddoknr = idDokNr and [Wewn_Granica] = 'W'
  --

  exec stat.DziennikWpisInfo 'start: dgp_import_sad_generacja - indeksy'
  create index dgt_import_sad_pcn_idx on stat.dgt_import_sad (im_pcn) on StatIndeksy
  create index dgt_import_sad_wart_stat_zl on stat.dgt_import_sad (im_wartosc_stat_zl) on StatIndeksy
  create index dgt_import_sad_im_pcnp_idx on stat.dgt_import_sad (im_pcnp) on StatIndeksy
  create index dgt_import_sad_im_kraj_pochodzenia_idx on stat.dgt_import_sad (im_kraj_pochodzenia) on StatIndeksy
  create index dgt_import_sad_im_kraj_wysylki_idx on stat.dgt_import_sad (im_kraj_wysylki) on StatIndeksy
  --
  -- czesciowe usuniecie danych
  exec [stat].dop_czesciowe_usuniecie_danych @v_data_od, @p_data_do, 'SAD', 'P'
  --
  exec stat.DziennikWpisInfo 'stop: dgp_import_sad_generacja'