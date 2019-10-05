CREATE function [stat].dof_wspolczynnik_f (
  @p_typ varchar,
  @p_RokMc integer
) returns real
as  
begin
  -- Pobranie kursu USD i EUR     --KNO: what???????
  declare @v_return real
  
  select @v_return = (select f
                        from [stat].dot_wspolczynnik_f
                       where typ = @p_typ
                         and RokMc = @p_RokMc
                     )
  return case when isnull (@v_return, 0) = 0 then 1 else @v_return end
end