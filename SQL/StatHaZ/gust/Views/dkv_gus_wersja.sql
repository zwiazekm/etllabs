CREATE VIEW gust.dkv_gus_wersja as
select convert(varchar(30),autor)        kto,
       convert(datetime,data_utworzenia) kiedy,
       convert(varchar(10),wersja)       wersja
-- from GUS_XLS...Wersja$
from gust.dkt_gus_import_wersja