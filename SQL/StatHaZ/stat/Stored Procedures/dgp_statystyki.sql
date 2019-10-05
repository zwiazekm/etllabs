CREATE PROCEDURE [stat].dgp_statystyki AS
  --
  exec stat.DziennikWpisInfo 'start: dgp_statystyki'
  --
  declare @v_pierwsze_wejscie varchar (1)
  declare @v_polecenie nvarchar (2000)
  --
  declare c_tabele cursor for
    select 'UPDATE STATISTICS [' + SCHEMA_NAME(schema_id) + '].[' + name + ']' from sys.tables
  --
  open c_tabele
  fetch c_tabele
    into @v_polecenie
  --
  while (@@FETCH_STATUS = 0) or (@v_pierwsze_wejscie = 'T')
  begin
--    print @v_polecenie
    exec sys.sp_executesql @v_polecenie
    --
    fetch c_tabele
      into @v_polecenie
    --
    set @v_pierwsze_wejscie = 'N'
  end
  --
  close c_tabele
  deallocate c_tabele
  --
  exec stat.DziennikWpisInfo 'stop: dgp_statystyki'