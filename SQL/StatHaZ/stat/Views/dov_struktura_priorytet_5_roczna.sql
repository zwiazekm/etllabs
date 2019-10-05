create  view stat.dov_struktura_priorytet_5_roczna
as
select sum(udzial_w_obrotach) udzial_w_obrotach , 
       nip, 
       rok, 
       kod_towarowy, 
       kraj_przezn_wysyl, 
       kraj_pochodzenia, 
       rodzaj_transakcji,  
       typ 
from [stat].dot_struktura_priorytet_5_roczna
group by nip, rok, kod_towarowy, kraj_przezn_wysyl, kraj_pochodzenia, rodzaj_transakcji, typ