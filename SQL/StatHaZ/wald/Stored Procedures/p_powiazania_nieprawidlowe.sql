
CREATE procedure [wald].p_powiazania_nieprawidlowe as

--kod_towarowy => kraj_pochodzenia
--Intrastat

--truncate table wald.tbl_sprawdzenie_powiazan

declare @liczba_cnI int
declare @badany_cnI varchar(8)
declare @licznikI int

set @licznikI = 1
set @liczba_cnI =(select count(distinct wart_start)
		from wald.tbl_powiazan_nieprawidl
		where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_nieprawidl = 'kraj_poch'))

declare kursorI cursor for
	select distinct wart_start
	from wald.tbl_powiazan_nieprawidl
	where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_nieprawidl = 'kraj_poch')
open kursorI

while @licznikI <= @liczba_cnI

begin
fetch kursorI into @badany_cnI

insert into wald.tbl_sprawdzenie_powiazan

select distinct
	POZ.kod_towarowy,
	POZ.kraj_pochodzenia,
	POZ.id_dok,
	POZ.[PozId],
	null,
	null,
	POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_istat_dekl_wynik_poz POZ,
	wald.tbl_powiazan_nieprawidl POW

	where
	(substring (POZ.kod_towarowy,1,4) = @badany_cnI)and
	(POZ.kraj_pochodzenia in(	select wart_pow_nieprawidl
					from wald.tbl_powiazan_nieprawidl
					where 	(wart_start = @badany_cnI)and
						(rodz_wart_start = 'kod_towarowy')and
						(rodz_wart_pow_nieprawidl = 'kraj_poch')))and
	(POW.wart_start = substring (POZ.kod_towarowy,1,4))and
	(POW.rodz_wart_start = 'kod_towarowy')and
	(POW.rodz_wart_pow_nieprawidl = 'kraj_poch')
set @licznikI = @licznikI+1
end										

close kursorI
deallocate kursorI

--Sad

declare @liczba_cnS int
declare @badany_cnS varchar(8)
declare @licznikS int

set @licznikS = 1
set @liczba_cnS =(select count(distinct wart_start)
		from wald.tbl_powiazan_nieprawidl
		where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_nieprawidl = 'kraj_poch'))
declare kursorS cursor for
	select distinct wart_start
	from wald.tbl_powiazan_nieprawidl
	where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_nieprawidl = 'kraj_poch')
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
	POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_v2_sad_dpdz_tow TOW,
	wald.tbl_powiazan_nieprawidl POW

	where
	(substring (TOW.KodTowarowy,1,4) = @badany_cnS)and
	(TOW.[KrajPochodzenia] in(select wart_pow_nieprawidl
				from wald.tbl_powiazan_nieprawidl
				where 	(wart_start = @badany_cnS)and
					(rodz_wart_start = 'kod_towarowy')and
					(rodz_wart_pow_nieprawidl = 'kraj_poch')))and
	(POW.wart_start = substring (TOW.KodTowarowy,1,4))and
	(POW.rodz_wart_start = 'kod_towarowy')and
	(POW.rodz_wart_pow_nieprawidl = 'kraj_poch')

set @licznikS = @licznikS+1
end										

close kursorS
deallocate kursorS
-----------------------------------------
--kod_towarowy => kraj_przeznaczenia
--Intrastat
declare @liczba_cn1I int
declare @badany_cn1I varchar(8)
declare @licznik1I int

set @licznik1I = 1
set @liczba_cn1I =(select count(distinct wart_start)
		from wald.tbl_powiazan_nieprawidl
		where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_nieprawidl = 'kraj_przezn'))

declare kursor1I cursor for
	select distinct wart_start
	from wald.tbl_powiazan_nieprawidl
	where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_nieprawidl = 'kraj_przezn')
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
	POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_istat_dekl_wynik_poz POZ,
	wald.wal_dgt_kopia_istat_dekl_wynik_dok DOK,
	wald.tbl_powiazan_nieprawidl POW

	where
	(POZ.id_dok = DOK.id_dok)and
	(DOK.typ = 'W')and
	(substring (POZ.kod_towarowy,1,4) = @badany_cn1I)and
	(POZ.kraj_przezn_wysyl in(	select wart_pow_nieprawidl
					from wald.tbl_powiazan_nieprawidl

					where 	(wart_start = @badany_cn1I)and
						(rodz_wart_start = 'kod_towarowy')and
						(rodz_wart_pow_nieprawidl = 'kraj_przezn')))and
	(POW.wart_start = substring (POZ.kod_towarowy,1,4))and
	(POW.rodz_wart_start = 'kod_towarowy')and
	(POW.rodz_wart_pow_nieprawidl = 'kraj_przezn')
set @licznik1I = @licznik1I+1
end										

close kursor1I
deallocate kursor1I

--Sad

declare @liczba_cn1S int
declare @badany_cn1S varchar(8)
declare @licznik1S int

set @licznik1S = 1
set @liczba_cn1S =(select count(distinct wart_start)
		from wald.tbl_powiazan_nieprawidl
		where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_nieprawidl = 'kraj_przezn'))
declare kursor1S cursor for
	select distinct wart_start
	from wald.tbl_powiazan_nieprawidl
	where 	(rodz_wart_start = 'kod_towarowy')and
		(rodz_wart_pow_nieprawidl = 'kraj_przezn')
open kursor1S

while @licznik1S <= @liczba_cn1S

begin
fetch kursor1S into @badany_cn1S

insert into wald.tbl_sprawdzenie_powiazan
	select distinct
	TOW.KodTowarowy,
	DSA.KrajPrzeznaczenia,
	null,
	null,
	TOW.idDokNr,
	TOW.[PozId],
	POW.opis_pow,
	null

	from
	wald.wal_dgt_kopia_v2_sad_dpdz_tow TOW,
	wald.wal_dgt_kopia_v2_dok_sad DSA,
	wald.tbl_powiazan_nieprawidl POW

	where
	(TOW.idDokNr = DSA.idDokNr)and
	(substring (TOW.KodTowarowy,1,4) = @badany_cn1S)and
	(DSA.KrajPrzeznaczenia in(	select wart_pow_nieprawidl
					from wald.tbl_powiazan_nieprawidl
					where 	(wart_start = @badany_cn1S)and
						(rodz_wart_start = 'kod_towarowy')and
						(rodz_wart_pow_nieprawidl = 'kraj_przezn')))and
	(POW.wart_start = substring (TOW.KodTowarowy,1,4))and
	(POW.rodz_wart_start = 'kod_towarowy')and
	(POW.rodz_wart_pow_nieprawidl = 'kraj_przezn')

set @licznik1S = @licznik1S+1
end										

close kursor1S
deallocate kursor1S


-----------------------------------------