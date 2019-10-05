

CREATE procedure stat.nextval
  @p_seq varchar (100),
  @p_nextval integer OUTPUT
as
  --
  declare @v_utworzenie nvarchar (1000)
  select @v_utworzenie = N'if not exists (select * from sys.sysobjects where id = object_id(N''[stat].[' + @p_seq + ']'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1) create table [stat].' + @p_seq + ' (nextval int IDENTITY (1, 1) not null, x varchar (1))'
  exec sys.sp_executesql @v_utworzenie
  --
  declare @v_wstawienie nvarchar (1000)
  select @v_wstawienie = N'insert into [stat].' + @p_seq + ' select '''''
  exec sys.sp_executesql @v_wstawienie
  --
  select @p_nextval = @@IDENTITY