CREATE   VIEW wald.CN_MASA_WARTOSC_ILOSC_ECS
AS


select     
stat, 
koment, 
case when left(gi_cn_code,6) = left(convert(varchar,convert(int,gi_net_mass)),6) then 'podobieństwo kodu towarowego i masy netto' 
when left(gi_cn_code,6) = left(convert(varchar,convert(int,gi_quantity_suppl_unit)),6) then 'podobieństwo kodu towarowego i ilości'
when left(gi_cn_code,6) = left(convert(varchar,convert(int,vog_statistical_value)),6) then 'podobieństwo kodu towarowego i wartości statystycznej' else null end as typ_blad,
declcoexport_decl_id AS id_dok, 
[id] AS poz_id, 
gi_desc AS opis_towaru, 
gi_cn_code AS kod_towarowy, 
gi_net_mass AS masa_netto, 
gi_quantity_suppl_unit AS uzup_jm, 
vog_statistical_value AS wartosc_stat, 
generacjaId
from wald.wal_dgt_kopia_ecs_exp_goods_item
where 
(left(gi_cn_code, 6) = left(convert(varchar,convert(int,gi_net_mass)),6) or
left(gi_cn_code, 6) = left(convert(varchar,convert(int,gi_quantity_suppl_unit)),6) or
left(gi_cn_code, 6) = left(convert(varchar,convert(int,vog_statistical_value)),6)) and
convert(varchar,declcoexport_decl_id)+convert(varchar,id) not in (select convert(varchar,id_dok)+convert(varchar,poz_id) from wald.top_widoki_arch)

union

select     
stat, 
koment, 
case when right(gi_cn_code,6) = right(convert(int,gi_net_mass),6) then 'podobieństwo kodu towarowego i masy netto' 
when right(gi_cn_code,6) = right(convert(int,gi_quantity_suppl_unit),6) then 'podobieństwo kodu towarowego i ilości'
when right(gi_cn_code,6) = right(convert(int,vog_statistical_value),6) then 'podobieństwo kodu towarowego i wartości statystycznej'  else null end as typ_blad,
declcoexport_decl_id AS id_dok, 
[id] AS poz_id, 
gi_desc AS opis_towaru, 
gi_cn_code AS kod_towarowy, 
gi_net_mass AS masa_netto, 
gi_quantity_suppl_unit AS uzup_jm, 
vog_statistical_value AS wartosc_stat, 
generacjaId
from wald.wal_dgt_kopia_ecs_exp_goods_item
where
(right(gi_cn_code, 6) = right(convert(varchar,convert(int,gi_net_mass)),6) or
right(gi_cn_code, 6) = right(convert(varchar,convert(int,gi_quantity_suppl_unit)),6) or
right(gi_cn_code, 6) = right(convert(varchar,convert(int,vog_statistical_value)),6)) and
convert(varchar,declcoexport_decl_id)+convert(varchar,id) not in (select convert(varchar,id_dok)+convert(varchar,poz_id) from wald.top_widoki_arch)

union

select   
stat, 
koment, 
case when convert(varchar,convert(int,gi_net_mass)) in (select kod_cn from tbl_sl_taryfa_cn8_wszystkie_lata) then 'podobieństwo masy netto do kodu towarowego ze słownika wszystkich kodów' 
when convert(varchar,convert(int,gi_quantity_suppl_unit)) in (select kod_cn from tbl_sl_taryfa_cn8_wszystkie_lata) then 'podobieństwo ilości do kodu towarowego ze słownika wszystkich kodów'
when convert(varchar,convert(int,vog_statistical_value)) in (select kod_cn from tbl_sl_taryfa_cn8_wszystkie_lata) then 'podobieństwo wartości statystycznej do kodu towarowego ze słownika wszystkich kodów'  
else null end as typ_blad,
declcoexport_decl_id AS id_dok, 
[id] AS poz_id, 
gi_desc AS opis_towaru, 
gi_cn_code AS kod_towarowy, 
gi_net_mass AS masa_netto, 
gi_quantity_suppl_unit AS uzup_jm, 
vog_statistical_value AS wartosc_stat, 
generacjaId
from         wald.wal_dgt_kopia_ecs_exp_goods_item
where
(convert(varchar,convert(int,gi_net_mass)) in (select kod_cn from tbl_sl_taryfa_cn8_wszystkie_lata) or
convert(varchar,convert(int,gi_quantity_suppl_unit)) in (select kod_cn from tbl_sl_taryfa_cn8_wszystkie_lata) or
convert(varchar,convert(int,vog_statistical_value)) in (select kod_cn from tbl_sl_taryfa_cn8_wszystkie_lata)) and
convert(varchar,declcoexport_decl_id)+convert(varchar,id) not in (select convert(varchar,id_dok)+convert(varchar,poz_id) from top_widoki_arch)