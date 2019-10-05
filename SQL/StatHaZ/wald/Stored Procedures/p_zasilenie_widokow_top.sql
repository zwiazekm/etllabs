CREATE PROCEDURE [wald].[p_zasilenie_widokow_top]
@ilosc_rekordow int
as

/*zasila widoki top ilością wierszy zdefiniowaną w parametrze,odpalać po walidacji żeby uaktualnić dane*/

set rowcount @ilosc_rekordow

-- top ilosc intrastat

truncate table [wald].wal_dgt_kopia_istat_dekl_wynik_poz_ILOSC_INTR
insert into [wald].wal_dgt_kopia_istat_dekl_wynik_poz_ILOSC_INTR
select *
from [wald].wal_dgt_kopia_istat_dekl_wynik_poz wp
where convert(varchar,wp.id_dok)+'_'+convert(varchar,wp.[PozId]) not in (select convert(varchar,id_dok)+'_'+convert(varchar,pozid) from [wald].wal_dgt_kopia_istat_dekl_wynik_poz_ILOSC_INTR_ARCH)
order by wp.uzup_jm desc

-- top ilosc sad

truncate table [wald].wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD
insert into [wald].wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD
select *
from [wald].wal_dgt_kopia_v2_sad_dpdz_tow dp
where convert(varchar,dp.idDokNr)+'_'+convert(varchar,dp.[PozId]) not in (select convert(varchar,idDokNr)+'_'+convert(varchar,PozId) from wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD_ARCH)
order by IloscUzupelniajacaJm desc

-- top ilosc ecs

truncate table [wald].wal_dgt_kopia_ecs_exp_goods_item_ILOSC_ECS
insert into [wald].wal_dgt_kopia_ecs_exp_goods_item_ILOSC_ECS
select *
from [wald].wal_dgt_kopia_ecs_exp_goods_item gi
where convert(varchar,gi.declcoexport_decl_id)+'_'+convert(varchar,gi.[id]) not in (select convert(varchar,declcoexport_decl_id)+'_'+convert(varchar,[id]) from wal_dgt_kopia_ecs_exp_goods_item_ILOSC_ECS_ARCH)
order by gi_quantity_suppl_unit desc

-- top masa netto intrastat

truncate table [wald].wal_dgt_kopia_istat_dekl_wynik_poz_MASA_INTR
insert into [wald].wal_dgt_kopia_istat_dekl_wynik_poz_MASA_INTR
select *
from [wald].wal_dgt_kopia_istat_dekl_wynik_poz wp
where convert(varchar,wp.id_dok)+'_'+convert(varchar,wp.[PozId]) not in (select convert(varchar,id_dok)+'_'+convert(varchar,pozid) from [wald].wal_dgt_kopia_istat_dekl_wynik_poz_MASA_INTR_ARCH)
order by masa_netto desc

-- top masa netto sad 

truncate table [wald].wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD
insert into [wald].wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD
select *
from [wald].wal_dgt_kopia_v2_sad_dpdz_tow dp
where convert(varchar,dp.idDokNr)+'_'+convert(varchar,dp.[PozId]) not in (select convert(varchar,idDokNr)+'_'+convert(varchar,PozId) from [wald].wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD_ARCH)
order by MasaNetto desc

-- top masa netto ecs

truncate table [wald].wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS
insert into [wald].wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS
select *
from [wald].wal_dgt_kopia_ecs_exp_goods_item gi
where convert(varchar,gi.declcoexport_decl_id)+'_'+convert(varchar,gi.[id]) not in (select convert(varchar,declcoexport_decl_id)+'_'+convert(varchar,[id]) from [wald].wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS_ARCH)
order by gi_net_mass desc

-- top wartosc na kg intrastat

truncate table [wald].wal_dgt_kopia_istat_dekl_wynik_poz_WART_KG_INTR
insert into [wald].wal_dgt_kopia_istat_dekl_wynik_poz_WART_KG_INTR
select *,
	cast((wp.wartosc_faktury/(case wp.masa_netto 
	when 0 then null 
	else wp.masa_netto end)) as numeric(32,2)) as wart_kg
from 
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp
where convert(varchar,wp.id_dok)+'_'+convert(varchar,wp.[PozId]) not in (select convert(varchar,id_dok)+'_'+convert(varchar,pozid) from [wald].wal_dgt_kopia_istat_dekl_wynik_poz_WART_KG_INTR_ARCH)
order by 
	cast((wp.wartosc_faktury/(case wp.masa_netto 
	when 0 then null 
	else wp.masa_netto end)) as numeric(32,2)) desc

-- top wartosc jm intrastat

truncate table [wald].wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR
insert into [wald].wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR
select *,
	cast((wp.wartosc_faktury/(case wp.uzup_jm 
	when 0 then null 
	else wp.uzup_jm end)) as numeric(32,2)) as wart_jm
from 
[wald].wal_dgt_kopia_istat_dekl_wynik_poz wp
where convert(varchar,wp.id_dok)+'_'+convert(varchar,wp.[PozId]) not in (select convert(varchar,id_dok)+'_'+convert(varchar,pozid) from [wald].wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR_ARCH)
order by
cast((wp.wartosc_faktury/(case wp.uzup_jm 
		when 0 then null else wp.uzup_jm end)) as numeric(32,2)) desc

-- top wartosc kg sad

truncate table [wald].wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD
insert into [wald].wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD
select  *,
	cast((WartoscStatystyczna / (case MasaNetto 
	when 0 then null 
	else MasaNetto end))as numeric(38,2)) as wart_kg
from 
[wald].wal_dgt_kopia_v2_sad_dpdz_tow dt
where convert(varchar,dt.idDokNr)+'_'+convert(varchar,dt.[PozId]) not in (select convert(varchar,idDokNr)+'_'+convert(varchar,PozId) from [wald].wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD_ARCH)
order by 
cast((WartoscStatystyczna / (case MasaNetto 
	when 0 then null 
	else MasaNetto end))as numeric(38,2)) desc

-- top wartosc jm sad

truncate table [wald].wal_dgt_kopia_v2_sad_dpdz_tow_WART_SZT_SAD
insert into [wald].wal_dgt_kopia_v2_sad_dpdz_tow_WART_SZT_SAD
select *,
	cast(WartoscStatystyczna / (case [IloscUzupelniajacaJm]
	when 0 then null
	else [IloscUzupelniajacaJm] end)as numeric(38,2)) as wart_jm
from 
[wald].wal_dgt_kopia_v2_sad_dpdz_tow dt
where convert(varchar,dt.idDokNr)+'_'+convert(varchar,dt.[PozId]) not in (select convert(varchar,idDokNr)+'_'+convert(varchar,PozId) from [wald].wal_dgt_kopia_v2_sad_dpdz_tow_WART_SZT_SAD_ARCH)
order by 	
cast(WartoscStatystyczna / (case Iloscuzupelniajacajm
	when 0 then null
	else Iloscuzupelniajacajm end)as numeric(38,2)) desc

-- top wartosc kg ecs

truncate table [wald].wal_dgt_kopia_ecs_exp_goods_item_WART_KG_ECS
insert into [wald].wal_dgt_kopia_ecs_exp_goods_item_WART_KG_ECS
select *,
	cast(vog_statistical_value / (case gi_net_mass 
	when 0 then null 
	else gi_net_mass end) as numeric(38, 2)) as wart_kg 
from 
[wald].wal_dgt_kopia_ecs_exp_goods_item ec
where  convert(varchar,ec.declcoexport_decl_id)+'_'+convert(varchar,ec.[id]) not in (select convert(varchar,declcoexport_decl_id)+'_'+convert(varchar,[id]) from [wald].wal_dgt_kopia_ecs_exp_goods_item_WART_KG_ECS_ARCH)
order by
cast(vog_statistical_value / (case gi_net_mass 
	when 0 then null 
	else gi_net_mass end) as numeric(38, 2)) desc

-- top wartosc jm ecs

truncate table [wald].wal_dgt_kopia_ecs_exp_goods_item_WART_SZT_ECS
insert into [wald].wal_dgt_kopia_ecs_exp_goods_item_WART_SZT_ECS
select*,
	cast(vog_statistical_value / (case gi_quantity_suppl_unit 
	when 0 then null 
	else gi_quantity_suppl_unit end) as numeric(38, 2)) as wart_jm
from 
[wald].wal_dgt_kopia_ecs_exp_goods_item ec
where convert(varchar,ec.declcoexport_decl_id)+'_'+convert(varchar,ec.[id]) not in (select convert(varchar,declcoexport_decl_id)+'_'+convert(varchar,[id]) from [wald].wal_dgt_kopia_ecs_exp_goods_item_WART_SZT_ECS_ARCH)
order by
cast(vog_statistical_value / (case gi_quantity_suppl_unit 
	when 0 then null 
	else gi_quantity_suppl_unit end) as numeric(38, 2))  desc

-- top wartosc fakturowa intrastat

truncate table [wald].wal_dgt_kopia_istat_dekl_wynik_poz_WART_FAKT_INTR
insert into [wald].wal_dgt_kopia_istat_dekl_wynik_poz_WART_FAKT_INTR
select *
from [wald].wal_dgt_kopia_istat_dekl_wynik_poz wp
where convert(varchar,wp.id_dok)+'_'+convert(varchar,wp.[PozId]) not in (select convert(varchar,id_dok)+'_'+convert(varchar,pozid) from [wald].wal_dgt_kopia_istat_dekl_wynik_poz_WART_FAKT_INTR_ARCH)
order by wartosc_faktury desc

-- top wartosc sad 
 
truncate table [wald].wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD
insert into [wald].wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD
select *
from [wald].wal_dgt_kopia_v2_sad_dpdz_tow dt
where convert(varchar,dt.idDokNr)+'_'+convert(varchar,dt.[PozId]) not in (select convert(varchar,idDokNr)+'_'+convert(varchar,PozId) from [wald].wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD_ARCH)
order by WartoscStatystyczna desc

-- top wartosc statystyczna intrastat

truncate table [wald].wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR
insert into [wald].wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR
select *
from [wald].wal_dgt_kopia_istat_dekl_wynik_poz wp
where convert(varchar,wp.id_dok)+'_'+convert(varchar,wp.[PozId]) not in (select convert(varchar,id_dok)+'_'+convert(varchar,pozid) from [wald].wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR_ARCH)
order by wartosc_stat desc

-- top wartosc statystyczna ecs

truncate table [wald].wal_dgt_kopia_ecs_exp_goods_item_WART_STAT_ECS
insert into [wald].wal_dgt_kopia_ecs_exp_goods_item_WART_STAT_ECS
select *
from [wald].wal_dgt_kopia_ecs_exp_goods_item ec
where convert(varchar,ec.declcoexport_decl_id)+'_'+convert(varchar,ec.[id]) not in (select convert(varchar,declcoexport_decl_id)+'_'+convert(varchar,[id]) from [wald].wal_dgt_kopia_ecs_exp_goods_item_WART_STAT_ECS_ARCH)
order by vog_statistical_value desc

set rowcount 0