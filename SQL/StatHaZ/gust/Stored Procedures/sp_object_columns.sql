



CREATE  procedure [gust].sp_object_columns
  @p_nazwa_obiektu varchar (100)
as
  declare @v_column_name varchar (100)
  declare @v_column_names varchar (8000)
  select @v_column_names = ''

  declare c1 cursor for
    select c.name
      from syscolumns c, 
           sysobjects o 
     where c.id = o.id 
       and o.name = @p_nazwa_obiektu

  open c1
  fetch c1
    into @v_column_name
  while (@@FETCH_STATUS = 0)
  begin
    select @v_column_names = @v_column_names + ', ' + @v_column_name
--select @v_column_names
    fetch c1
      into @v_column_name
  end

  select substring (@v_column_names, 3, len (@v_column_names))

  close c1
  deallocate c1