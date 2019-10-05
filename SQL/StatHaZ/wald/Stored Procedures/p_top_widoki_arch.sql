CREATE  procedure [wald].p_top_widoki_arch as
insert into wald.top_widoki_arch 

--esc
select convert(varchar,id_dok), convert(varchar,poz_id), generacjaId from wald.CN_MASA_WARTOSC_ILOSC_ECS
union

-- intr
select convert(varchar,id_dok), convert(varchar,[PozId]), generacjaId from wald.CN_MASA_WARTOSC_ILOSC_Intr
union
select convert(varchar,id_dok), convert(varchar,[PozId]), generacjaId from wald.CN_MASA_WARTOSC_ILOSC_Intr_6znaki_LEFT
union
select convert(varchar,id_dok), convert(varchar,[PozId]), generacjaId from wald.CN_MASA_WARTOSC_ILOSC_Intr_6znaki_RIGHT
union
select convert(varchar,id_dok), convert(varchar,[PozId]), generacjaId from wald.CN_MASA_WARTOSC_ILOSC_Intr_SLOWNIK_CN
union

--sad
select convert(varchar,idDokNr), convert(varchar,[PozId]), generacjaId from wald.CN_MASA_WARTOSC_ILOSC_Sad
union
select convert(varchar,idDokNr), convert(varchar,[PozId]), generacjaId from wald.CN_MASA_WARTOSC_ILOSC_Sad_6znaki_LEFT
union
select convert(varchar,idDokNr), convert(varchar,[PozId]), generacjaId from wald.CN_MASA_WARTOSC_ILOSC_Sad_6znaki_RIGHT
union
select convert(varchar,idDokNr), convert(varchar,[PozId]), generacjaId from wald.CN_MASA_WARTOSC_ILOSC_Sad_SLOWNIK_CN