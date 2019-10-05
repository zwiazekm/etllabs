create  view [stat].dgv_kopia_sl_mapowania as
select *
from [stat].dgt_kopia_sl_mapowania
where generacjaId = 1