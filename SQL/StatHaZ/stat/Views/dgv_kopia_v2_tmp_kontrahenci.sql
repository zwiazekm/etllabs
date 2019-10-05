CREATE view [stat].dgv_kopia_v2_tmp_kontrahenci as
select *
from [stat].dgt_kopia_v2_tmp_kontrahenci
where generacjaId = 1