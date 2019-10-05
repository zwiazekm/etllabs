CREATE FUNCTION [stat].sf_object_columns (
  @NazwaTabeli sysname
) returns varchar(4000)
as  
begin
  declare @v_return varchar (4000)
  = (
	SELECT LTRIM(STUFF((select ', [' + c.name + ']'
      from sys.syscolumns c
      inner join sys.sysobjects o on o.id = c.id
	  where o.id = OBJECT_ID(@NazwaTabeli)
            FOR XML PATH('')) ,1,1,' ')) 
	);

  return @v_return;
end