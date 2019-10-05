﻿
CREATE function [stat].f_dubel_dgt_bledne_dane (@bd_pk int, @txt varchar(100))
returns bit
as begin
declare @ret bit
if @txt is null
set @ret=1
else if exists(select top 1 1  from [stat].dgt_bledne_dane where bd_pk!=@bd_pk and (bd_rodzaj+bd_id_dok+convert(varchar,bd_id_dok_pozid))=@txt)
set @ret=0
else
set @ret=1
return @ret
end