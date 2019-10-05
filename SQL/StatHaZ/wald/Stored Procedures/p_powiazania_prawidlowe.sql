
CREATE procedure [wald].p_powiazania_prawidlowe
as
-----------------------------------------
--kod_towarowy => kraj_pochodzenia
--Intrastat
truncate table wald.tbl_sprawdzenie_powiazan

declare @liczba_cn int
declare @badany_cn varchar(8)
declare @licznik int

set @licznik = 1
set @liczba_cn =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_prawidl = 'kraj_poch'))

declare kursor cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_prawidl = 'kraj_poch')
open kursor

while @licznik <= @liczba_cn

begin
fetch kursor into @badany_cn

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	POZ.kod_towarowy,
	POZ.kraj_pochodzenia,
	POZ.id_dok,
	POZ.[PozId],
	null,
	null,
	'niespełniony warunek: '+POW.opis_pow,
	null
	from
	wald.wal_dgt_kopia_istat_dekl_wynik_poz POZ,
	wald.tbl_powiazan_prawidlowych POW

	where
	(substring (POZ.kod_towarowy,1,4) = @badany_cn)and
	(POZ.kraj_pochodzenia not in(	select wart_pow_prawidl
					from wald.tbl_powiazan_prawidlowych
					where 	(wart_start = @badany_cn)and
						(rodz_wart_start = 'kod_towarowy')and
						(rodz_wart_pow_prawidl = 'kraj_poch')))and
	(POZ.kraj_pochodzenia is not null)and
	(POZ.kraj_pochodzenia <>'')and
	(POW.wart_start = substring (POZ.kod_towarowy,1,4))and
	(POW.rodz_wart_start = 'kod_towarowy')and
	(POW.rodz_wart_pow_prawidl = 'kraj_poch')

set @licznik = @licznik+1
end										

close kursor
deallocate kursor

--Sad

declare @liczba_cnS int
declare @badany_cnS varchar(8)
declare @licznikS int

set @licznikS = 1
set @liczba_cnS =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_prawidl = 'kraj_poch'))
declare kursorS cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_prawidl = 'kraj_poch')
open kursorS

while @licznikS <= @liczba_cnS

begin
fetch kursorS into @badany_cnS

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	TOW.KodTowarowy,
	TOW.[KrajPochodzenia],
	null,
	null,
	TOW.idDokNr,
	TOW.[PozId],
	'niespełniony warunek: '+POW.opis_pow,
	null
	from
	wald.wal_dgt_kopia_v2_sad_dpdz_tow TOW,
	wald.tbl_powiazan_prawidlowych POW

	where
	(substring (TOW.KodTowarowy,1,4) = @badany_cnS)and
	(TOW.[KrajPochodzenia] not in(	select wart_pow_prawidl
					from wald.tbl_powiazan_prawidlowych
					where 	(wart_start = @badany_cnS)and
						(rodz_wart_start = 'kod_towarowy')and
						(rodz_wart_pow_prawidl = 'kraj_poch')))and
	(TOW.[KrajPochodzenia] is not null)and
	(TOW.[KrajPochodzenia] <>'')and
	(POW.wart_start = substring (TOW.KodTowarowy,1,4))and
	(POW.rodz_wart_start = 'kod_towarowy')and
	(POW.rodz_wart_pow_prawidl = 'kraj_poch')

set @licznikS = @licznikS+1
end										

close kursorS
deallocate kursorS
-----------------------------------------
--kod_towarowy => kraj_przeznaczenia
--Intrastat
declare @liczba_cnI int
declare @badany_cnI varchar(8)
declare @licznikI int

set @licznikI = 1
set @liczba_cnI =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_prawidl = 'kraj_przezn'))

declare kursorI cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_prawidl = 'kraj_przezn')
open kursorI

while @licznikI <= @liczba_cnI

begin
fetch kursorI into @badany_cnI

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	POZ.kod_towarowy,
	POZ.kraj_przezn_wysyl,
	POZ.id_dok,
	POZ.[PozId],
	null,
	null,
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_istat_dekl_wynik_poz POZ,
	wald.wal_dgt_kopia_istat_dekl_wynik_dok DOK,
	wald.tbl_powiazan_prawidlowych POW

	where
	(POZ.id_dok = DOK.id_dok)and
	(DOK.typ = 'W')and
	(substring (POZ.kod_towarowy,1,4) = @badany_cnI)and
	(POZ.kraj_przezn_wysyl not in(	select wart_pow_prawidl
					from wald.tbl_powiazan_prawidlowych
					where 	(wart_start = @badany_cnI)and
						(rodz_wart_start = 'kod_towarowy')and
						(rodz_wart_pow_prawidl = 'kraj_przezn')))and
	(POZ.kraj_przezn_wysyl is not null)and
	(POZ.kraj_przezn_wysyl <>'')and
	(POW.wart_start = substring (POZ.kod_towarowy,1,4))and
	(POW.rodz_wart_start = 'kod_towarowy')and
	(POW.rodz_wart_pow_prawidl = 'kraj_przezn')

set @licznikI = @licznikI+1
end										

close kursorI
deallocate kursorI

--Sad

declare @liczba_cn2S int
declare @badany_cn2S varchar(8)
declare @licznik2S int

set @licznik2S = 1
set @liczba_cn2S =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_prawidl = 'kraj_przezn'))
declare kursor2S cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_prawidl = 'kraj_przezn')
open kursor2S

while @licznik2S <= @liczba_cn2S

begin
fetch kursor2S into @badany_cn2S

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	TOW.KodTowarowy,
	DSA.KrajPrzeznaczenia,
	null,
	null,
	DSA.idDokNr,
	null,
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_v2_sad_dpdz_tow TOW,
	wald.wal_dgt_kopia_v2_dok_sad DSA,
	wald.tbl_powiazan_prawidlowych POW

	where
	(TOW.idDokNr = DSA.idDokNr)and
	(substring (TOW.KodTowarowy,1,4) = @badany_cn2S)and
	(DSA.KrajPrzeznaczenia not in(	select wart_pow_prawidl
					from wald.tbl_powiazan_prawidlowych
					where 	(wart_start = @badany_cn2S)and
						(rodz_wart_start = 'kod_towarowy')and
						(rodz_wart_pow_prawidl = 'kraj_przezn')))and
	(DSA.KrajPrzeznaczenia is not null)and
	(DSA.KrajPrzeznaczenia <>'')and
	(POW.wart_start = substring (TOW.KodTowarowy,1,4))and
	(POW.rodz_wart_start = 'kod_towarowy')and
	(POW.rodz_wart_pow_prawidl = 'kraj_przezn')

set @licznik2S = @licznik2S+1
end										

close kursor2S
deallocate kursor2S
-----------------------------------------
--kod_towarowy => kraj_wysylki
--Intrastat
declare @liczba_cn1I int
declare @badany_cn1I varchar(8)
declare @licznik1I int

set @licznik1I = 1
set @liczba_cn1I =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_prawidl = 'kraj_wysylki'))

declare kursor1I cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_prawidl = 'kraj_wysylki')
open kursor1I

while @licznik1I <= @liczba_cn1I

begin
fetch kursor1I into @badany_cn1I

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	POZ.kod_towarowy,
	POZ.kraj_przezn_wysyl,
	POZ.id_dok,
	POZ.[PozId],
	null,
	null,
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_istat_dekl_wynik_poz POZ,
	wald.wal_dgt_kopia_istat_dekl_wynik_dok DOK,
	wald.tbl_powiazan_prawidlowych POW

	where
	(POZ.id_dok = DOK.id_dok)and
	(DOK.typ = 'P')and
	(substring (POZ.kod_towarowy,1,4) = @badany_cn1I)and
	(POZ.kraj_przezn_wysyl not in(	select wart_pow_prawidl
					from wald.tbl_powiazan_prawidlowych
					where 	(wart_start = @badany_cn1I)and
						(rodz_wart_start = 'kod_towarowy')and
						(rodz_wart_pow_prawidl = 'kraj_wysylki')))and
	(POZ.kraj_przezn_wysyl is not null)and
	(POZ.kraj_przezn_wysyl <>'')and
	(POW.wart_start = substring (POZ.kod_towarowy,1,4))and
	(POW.rodz_wart_start = 'kod_towarowy')and
	(POW.rodz_wart_pow_prawidl = 'kraj_wysylki')

set @licznik1I = @licznik1I+1
end										

close kursor1I
deallocate kursor1I

--Sad

declare @liczba_cn3S int
declare @badany_cn3S varchar(8)
declare @licznik3S int

set @licznik3S = 1
set @liczba_cn3S =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_prawidl = 'kraj_wysylki'))
declare kursor3S cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_prawidl = 'kraj_wysylki')
open kursor3S

while @licznik3S <= @liczba_cn3S

begin
fetch kursor3S into @badany_cn3S

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	TOW.KodTowarowy,
	DSA.KrajWysylki,
	null,
	null,
	DSA.idDokNr,
	null,
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_v2_sad_dpdz_tow TOW,
	wald.wal_dgt_kopia_v2_dok_sad DSA,
	wald.tbl_powiazan_prawidlowych POW

	where
	(TOW.idDokNr = DSA.idDokNr)and
	(substring (TOW.KodTowarowy,1,4) = @badany_cn3S)and
	(DSA.KrajWysylki not in(	select wart_pow_prawidl
					from wald.tbl_powiazan_prawidlowych
					where 	(wart_start = @badany_cn3S)and
						(rodz_wart_start = 'kod_towarowy')and
						(rodz_wart_pow_prawidl = 'kraj_wysylki')))and
	(DSA.KrajWysylki is not null)and
	(DSA.KrajWysylki <>'')and
	(DSA.KrajWysylki <>'PL')and
	(POW.wart_start = substring (TOW.KodTowarowy,1,4))and
	(POW.rodz_wart_start = 'kod_towarowy')and
	(POW.rodz_wart_pow_prawidl = 'kraj_wysylki')

set @licznik3S = @licznik3S+1
end										

close kursor3S
deallocate kursor3S
-----------------------------------------
--kod_towarowy_8 => rodz_transportu
--Intrastat
declare @liczba_cn2I int
declare @badany_cn2I varchar(8)
declare @licznik2I int

set @licznik2I = 1
set @liczba_cn2I =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'kod_towarowy_8')and
		(rodz_wart_pow_prawidl = 'rodz_transportu'))

declare kursor2I cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'kod_towarowy_8')and
		(rodz_wart_pow_prawidl = 'rodz_transportu')
open kursor2I

while @licznik2I <= @liczba_cn2I

begin
fetch kursor2I into @badany_cn2I

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	POZ.kod_towarowy,
	POZ.rodzaj_transportu,
	POZ.id_dok,
	POZ.[PozId],
	null,
	null,
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_istat_dekl_wynik_poz POZ,
	wald.tbl_powiazan_prawidlowych POW

	where
	(POZ.kod_towarowy = @badany_cn2I)and
	(POZ.rodzaj_transportu not in(	select wart_pow_prawidl
					from wald.tbl_powiazan_prawidlowych
					where 	(wart_start = @badany_cn2I)and
						(rodz_wart_start = 'kod_towarowy_8')and
						(rodz_wart_pow_prawidl = 'rodz_transportu')))and
	(POZ.rodzaj_transportu is not null)and
	(POZ.rodzaj_transportu <>'')and
	(POW.wart_start = POZ.kod_towarowy)and
	(POW.rodz_wart_start = 'kod_towarowy_8')and
	(POW.rodz_wart_pow_prawidl = 'rodz_transportu')

set @licznik2I = @licznik2I+1
end										

close kursor2I
deallocate kursor2I

--Sad

declare @liczba_cn4S int
declare @badany_cn4S varchar(8)
declare @licznik4S int

set @licznik4S = 1
set @liczba_cn4S =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'kod_towarowy_8')and
		(rodz_wart_pow_prawidl = 'rodz_transportu'))
declare kursor4S cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'kod_towarowy_8')and
		(rodz_wart_pow_prawidl = 'rodz_transportu')
open kursor4S

while @licznik4S <= @liczba_cn4S

begin
fetch kursor4S into @badany_cn4S

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	TOW.KodTowarowy,
	TRS.Rodzaj,
	null,
	null,
	TOW.idDokNr,
	TOW.[PozId],
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_v2_sad_dpdz_tow TOW,
	wald.wal_dgt_kopia_v2_sad_transport TRS,
	wald.tbl_powiazan_prawidlowych POW

	where
	(TOW.idDokNr = TRS.idDokNr)and
	(TOW.KodTowarowy = @badany_cn4S)and
	(TRS.Wewn_Granica = 'G')and
	(TRS.Rodzaj not in(	select wart_pow_prawidl
					from wald.tbl_powiazan_prawidlowych
					where 	(wart_start = @badany_cn4S)and
						(rodz_wart_start = 'kod_towarowy_8')and
						(rodz_wart_pow_prawidl = 'rodz_transportu')))and
	(TRS.Rodzaj is not null)and
	(TRS.Rodzaj <>'')and
	(POW.wart_start = TOW.KodTowarowy)and
	(POW.rodz_wart_start = 'kod_towarowy_8')and
	(POW.rodz_wart_pow_prawidl = 'rodz_transportu')

set @licznik4S = @licznik4S+1
end										

close kursor4S
deallocate kursor4S
-----------------------------------------
--kraj_pochodzenia => kod_towarowy
--Intrastat
declare @liczba_krajow int
declare @badany_kraj varchar(2)
declare @licznik3I int

set @licznik3I = 1
set @liczba_krajow =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'kraj_poch')and
		(rodz_wart_pow_prawidl = 'kod_towarowy'))

declare kursor3I cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'kraj_poch')and
		(rodz_wart_pow_prawidl = 'kod_towarowy')
open kursor3I

while @licznik3I <= @liczba_krajow

begin
fetch kursor3I into @badany_kraj

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	POZ.kraj_pochodzenia,
	POZ.kod_towarowy,
	POZ.id_dok,
	POZ.[PozId],
	null,
	null,
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_istat_dekl_wynik_poz POZ,
	wald.tbl_powiazan_prawidlowych POW

	where
	(POZ.kraj_pochodzenia = @badany_kraj)and
	((substring (POZ.kod_towarowy,1,4))not in(	select wart_pow_prawidl
							from wald.tbl_powiazan_prawidlowych
							where 	(wart_start = @badany_kraj)and
								(rodz_wart_start = 'kraj_poch')and
								(rodz_wart_pow_prawidl = 'kod_towarowy')))and
	(POZ.kod_towarowy is not null)and
	(POZ.kod_towarowy <>'')and
	(POW.wart_start = POZ.kraj_pochodzenia)and
	(POW.rodz_wart_start = 'kraj_poch')and
	(POW.rodz_wart_pow_prawidl = 'kod_towarowy')

set @licznik3I = @licznik3I+1
end										

close kursor3I
deallocate kursor3I

--Sad

declare @liczba_krajowS int
declare @badany_krajS varchar(2)
declare @licznik5S int

set @licznik5S = 1
set @liczba_krajowS =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'kraj_poch')and
		(rodz_wart_pow_prawidl = 'kod_towarowy'))
declare kursor5S cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'kraj_poch')and
		(rodz_wart_pow_prawidl = 'kod_towarowy')
open kursor5S

while @licznik5S <= @liczba_krajowS

begin
fetch kursor5S into @badany_krajS

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	TOW.[KrajPochodzenia],
	TOW.KodTowarowy,
	null,
	null,
	TOW.idDokNr,
	TOW.[PozId],
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_v2_sad_dpdz_tow TOW,
	wald.tbl_powiazan_prawidlowych POW

	where
	(TOW.[KrajPochodzenia] = @badany_krajS)and
	((substring (TOW.KodTowarowy,1,4)) not in(	select wart_pow_prawidl
							from wald.tbl_powiazan_prawidlowych
							where 	(wart_start = @badany_krajS)and
								(rodz_wart_start = 'kraj_poch')and
								(rodz_wart_pow_prawidl = 'kod_towarowy')))and
	(TOW.KodTowarowy is not null)and
	(TOW.KodTowarowy <>'')and
	(POW.wart_start = TOW.[KrajPochodzenia])and
	(POW.rodz_wart_start = 'kraj_poch')and
	(POW.rodz_wart_pow_prawidl = 'kod_towarowy')

set @licznik5S = @licznik5S+1
end										

close kursor5S
deallocate kursor5S
-----------------------------------------
--rodz_transportu => kod_towarowy
--Intrastat
declare @liczba_kodow_tr int
declare @badany_kod_tr varchar(1)
declare @licznik4I int

set @licznik4I = 1
set @liczba_kodow_tr =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'rodz_transportu')and
		(rodz_wart_pow_prawidl = 'kod_towarowy'))

declare kursor4I cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'rodz_transportu')and
		(rodz_wart_pow_prawidl = 'kod_towarowy')
open kursor4I

while @licznik4I <= @liczba_kodow_tr

begin
fetch kursor4I into @badany_kod_tr

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	POZ.rodzaj_transportu,
	POZ.kod_towarowy,
	POZ.id_dok,
	POZ.[PozId],
	null,
	null,
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_istat_dekl_wynik_poz POZ,
	wald.tbl_powiazan_prawidlowych POW

	where
	(POZ.rodzaj_transportu = @badany_kod_tr)and
	((substring (POZ.kod_towarowy,1,4))not in(	select wart_pow_prawidl
							from wald.tbl_powiazan_prawidlowych
							where 	(wart_start = @badany_kod_tr)and
								(rodz_wart_start = 'rodz_transportu')and
								(rodz_wart_pow_prawidl = 'kod_towarowy')))and
	(POZ.kod_towarowy is not null)and
	(POZ.kod_towarowy <>'')and
	(POW.wart_start = POZ.rodzaj_transportu)and
	(POW.rodz_wart_start = 'rodz_transportu')and
	(POW.rodz_wart_pow_prawidl = 'kod_towarowy')

set @licznik4I = @licznik4I+1
end										

close kursor4I
deallocate kursor4I

--Sad

declare @liczba_kodow_trS int
declare @badany_kod_trS varchar(1)
declare @licznik6S int

set @licznik6S = 1
set @liczba_kodow_trS =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'rodz_transportu')and
		(rodz_wart_pow_prawidl = 'kod_towarowy'))
declare kursor6S cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'rodz_transportu')and
		(rodz_wart_pow_prawidl = 'kod_towarowy')
open kursor6S

while @licznik6S <= @liczba_kodow_trS

begin
fetch kursor6S into @badany_kod_trS

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	TRS.Rodzaj,
	TOW.KodTowarowy,
	null,
	null,
	TOW.idDokNr,
	TOW.[PozId],
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_v2_sad_dpdz_tow TOW,
	wald.wal_dgt_kopia_v2_sad_transport TRS,
	wald.tbl_powiazan_prawidlowych POW

	where
	(TRS.Rodzaj = @badany_kod_trS)and
	(TRS.Wewn_Granica = 'G')and
	(TRS.idDokNr = TOW.idDokNr)and
	((substring (TOW.KodTowarowy,1,4)) not in(	select wart_pow_prawidl
							from wald.tbl_powiazan_prawidlowych
							where 	(wart_start = @badany_kod_trS)and
								(rodz_wart_start = 'rodz_transportu')and
								(rodz_wart_pow_prawidl = 'kod_towarowy')))and
	(TOW.KodTowarowy is not null)and
	(TOW.KodTowarowy <>'')and
	(POW.wart_start = TRS.Rodzaj)and
	(POW.rodz_wart_start = 'rodz_transportu')and
	(POW.rodz_wart_pow_prawidl = 'kod_towarowy')

set @licznik6S = @licznik6S+1
end										

close kursor6S
deallocate kursor6S
-----------------------------------------
--rodz_transportu => kraj_przeznaczenia
--Intrastat
declare @liczba_kodow_trI int
declare @badany_kod_trI varchar(1)
declare @licznik5I int

set @licznik5I = 1
set @liczba_kodow_trI =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'rodz_transportu')and
		(rodz_wart_pow_prawidl = 'kraj_przezn'))

declare kursor5I cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'rodz_transportu')and
		(rodz_wart_pow_prawidl = 'kraj_przezn')
open kursor5I

while @licznik5I <= @liczba_kodow_trI

begin
fetch kursor5I into @badany_kod_trI

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	POZ.rodzaj_transportu,
	POZ.kraj_przezn_wysyl,
	POZ.id_dok,
	POZ.[PozId],
	null,
	null,
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_istat_dekl_wynik_poz POZ,
	wald.wal_dgt_kopia_istat_dekl_wynik_dok DOK,
	wald.tbl_powiazan_prawidlowych POW

	where
	(POZ.rodzaj_transportu = @badany_kod_trI)and
	(POZ.id_dok = DOK.id_dok)and
	(DOK.typ = 'W')and
	((POZ.kraj_przezn_wysyl)not in(	select wart_pow_prawidl
					from wald.tbl_powiazan_prawidlowych
					where 	(wart_start = @badany_kod_trI)and
						(rodz_wart_start = 'rodz_transportu')and
						(rodz_wart_pow_prawidl = 'kraj_przezn')))and
	(POZ.kraj_przezn_wysyl is not null)and
	(POZ.kraj_przezn_wysyl <>'')and
	(POW.wart_start = POZ.rodzaj_transportu)and
	(POW.rodz_wart_start = 'rodz_transportu')and
	(POW.rodz_wart_pow_prawidl = 'kraj_przezn')

set @licznik5I = @licznik5I+1
end										

close kursor5I
deallocate kursor5I

--Sad

declare @liczba_kodow_tr1S int
declare @badany_kod_tr1S varchar(1)
declare @licznik7S int

set @licznik7S = 1
set @liczba_kodow_tr1S =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'rodz_transportu')and
		(rodz_wart_pow_prawidl = 'kraj_przezn'))
declare kursor7S cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'rodz_transportu')and
		(rodz_wart_pow_prawidl = 'kraj_przezn')
open kursor7S

while @licznik7S <= @liczba_kodow_tr1S

begin
fetch kursor7S into @badany_kod_tr1S

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	TRS.Rodzaj,
	DSA.KrajPrzeznaczenia,
	null,
	null,
	DSA.idDokNr,
	null,
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_v2_sad_transport TRS,
	wald.wal_dgt_kopia_v2_dok_sad DSA,
	wald.tbl_powiazan_prawidlowych POW

	where
	(TRS.Rodzaj = @badany_kod_tr1S)and
	(TRS.Wewn_Granica = 'G')and
	(TRS.idDokNr = DSA.idDokNr)and
	((DSA.KrajPrzeznaczenia) not in(select wart_pow_prawidl
					from wald.tbl_powiazan_prawidlowych
					where 	(wart_start = @badany_kod_tr1S)and
						(rodz_wart_start = 'rodz_transportu')and
						(rodz_wart_pow_prawidl = 'kraj_przezn')))and
	(DSA.KrajPrzeznaczenia is not null)and
	(DSA.KrajPrzeznaczenia <>'')and
	(POW.wart_start = TRS.Rodzaj)and
	(POW.rodz_wart_start = 'rodz_transportu')and
	(POW.rodz_wart_pow_prawidl = 'kraj_przezn')

set @licznik7S = @licznik7S+1
end										

close kursor7S
deallocate kursor7S
-----------------------------------------
--rodz_transportu => kraj_wysylki
--Intrastat
declare @liczba_kodow_tr1I int
declare @badany_kod_tr1I varchar(1)
declare @licznik6I int

set @licznik6I = 1
set @liczba_kodow_tr1I =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'rodz_transportu')and
		(rodz_wart_pow_prawidl = 'kraj_wysylki'))

declare kursor6I cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'rodz_transportu')and
		(rodz_wart_pow_prawidl = 'kraj_wysylki')
open kursor6I

while @licznik6I <= @liczba_kodow_tr1I

begin
fetch kursor6I into @badany_kod_tr1I

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	POZ.rodzaj_transportu,
	POZ.kraj_przezn_wysyl,
	POZ.id_dok,
	POZ.[PozId],
	null,
	null,
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_istat_dekl_wynik_poz POZ,
	wald.wal_dgt_kopia_istat_dekl_wynik_dok DOK,
	wald.tbl_powiazan_prawidlowych POW

	where
	(POZ.rodzaj_transportu = @badany_kod_tr1I)and
	(POZ.id_dok = DOK.id_dok)and
	(DOK.typ = 'P')and
	((POZ.kraj_przezn_wysyl)not in(	select wart_pow_prawidl
					from wald.tbl_powiazan_prawidlowych
					where 	(wart_start = @badany_kod_tr1I)and
						(rodz_wart_start = 'rodz_transportu')and
						(rodz_wart_pow_prawidl = 'kraj_wysylki')))and
	(POZ.kraj_przezn_wysyl is not null)and
	(POZ.kraj_przezn_wysyl <>'')and
	(POW.wart_start = POZ.rodzaj_transportu)and
	(POW.rodz_wart_start = 'rodz_transportu')and
	(POW.rodz_wart_pow_prawidl = 'kraj_wysylki')

set @licznik6I = @licznik6I+1
end										

close kursor6I
deallocate kursor6I

--Sad

declare @liczba_kodow_tr2S int
declare @badany_kod_tr2S varchar(1)
declare @licznik8S int

set @licznik8S = 1
set @liczba_kodow_tr2S =(select count(distinct wart_start)
		from wald.tbl_powiazan_prawidlowych
		where 	(rodz_wart_start = 'rodz_transportu')and
		(rodz_wart_pow_prawidl = 'kraj_wysylki'))
declare kursor8S cursor for
	select distinct wart_start
	from wald.tbl_powiazan_prawidlowych
	where 	(rodz_wart_start = 'rodz_transportu')and
		(rodz_wart_pow_prawidl = 'kraj_wysylki')
open kursor8S

while @licznik8S <= @liczba_kodow_tr2S

begin
fetch kursor8S into @badany_kod_tr2S

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	TRS.Rodzaj,
	DSA.KrajWysylki,
	null,
	null,
	DSA.idDokNr,
	null,
	'niespełniony warunek: '+POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_v2_sad_transport TRS,
	wald.wal_dgt_kopia_v2_dok_sad DSA,
	wald.tbl_powiazan_prawidlowych POW

	where
	(TRS.Rodzaj = @badany_kod_tr2S)and
	(TRS.Wewn_Granica = 'G')and
	(TRS.idDokNr = DSA.idDokNr)and
	((DSA.KrajWysylki) not in(	select wart_pow_prawidl
					from wald.tbl_powiazan_prawidlowych
					where 	(wart_start = @badany_kod_tr2S)and
						(rodz_wart_start = 'rodz_transportu')and
						(rodz_wart_pow_prawidl = 'kraj_wysylki')))and
	(DSA.KrajWysylki is not null)and
	(DSA.KrajWysylki <>'')and
	(DSA.KrajWysylki <>'PL')and
	(POW.wart_start = TRS.Rodzaj)and
	(POW.rodz_wart_start = 'rodz_transportu')and
	(POW.rodz_wart_pow_prawidl = 'kraj_wysylki')

set @licznik8S = @licznik8S+1
end										

close kursor8S
deallocate kursor8S
-----------------------------------------