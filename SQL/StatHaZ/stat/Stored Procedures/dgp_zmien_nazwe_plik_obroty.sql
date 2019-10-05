CREATE PROCEDURE [stat].dgp_zmien_nazwe_plik_obroty
            @kat varchar(512), 
            @zrd_plik varchar(255), 
            @p_data_do datetime
as
begin

  if ((select [value] from stat.[params] where "section" = 'DTS_Tab_kont' and keyword = 'Obroty') != '10') return -1;

  declare @rr    varchar(4)
  declare @mm    varchar(2)
  declare @cmd   varchar(4096)
  declare @nplik varchar(255)
  set @rr = FORMAT(datepart(yy, @p_data_do), '0000')
  set @mm = FORMAT(datepart(mm, @p_data_do), '00')
  set @nplik = @kat + '\obroty_' + @mm + @rr + '.xls'
  set @cmd = 'move /Y ' + @kat + '\obroty_mm_rrrr.xls' + ' ' + @nplik

  exec master.dbo.xp_cmdshell @cmd;
  return 0;

end