
CREATE PROCEDURE [wald].p_sprawdzanie_dubli_przed_caac AS

TRUNCATE TABLE [wald].tbl_info_bledy_z_GUS
--IMPORT
select		pcn_p,
		kraj_poch,
		kraj_wys,
		regon,
		mies,
		rok,
		tranzak,
		trans,
		war_dos,
		urz_cel,
		[proc],
		prog,
		masa_net,
		ilosc,
		wart_zl
into #tymczasowa
	from wald.agregaty_import_przeslane_z_GUS


select  distinct *
into #tymczasowa2
from #tymczasowa
			
if

((select count (*) from wald.agregaty_import_przeslane_z_GUS) - (select count (*) from #tymczasowa2)) = 0

insert into tbl_info_bledy_z_GUS
select
'DANE W PLIKU WSADOWYM POPRAWNE - IMPORT' as Opis

--print 'DANE W IMPORCIE OK :)'

else

insert into tbl_info_bledy_z_GUS
select
'DUBLE W PLIKU WSADOWYM - WYMAGANA KONTROLA PLIKU - IMPORT' as Opis

--print 'DUBLE W PLIKU WEJŚCIOWYM (IMPORT) - PRZEJRZEĆ CZY NIE MA REKORDU Z BŁĘDEM DWÓCH RODZAJÓW'

--EKSPORT
select		pcn_p,
		kraj_przezn,
		regon,
		mies,
		rok,
		tranzak,
		trans,
		war_dos,
		urz_cel,
		[proc],
		prog,
		masa_net,
		ilosc,
		wart_zl
into #tymczasowa3
	from wald.agregaty_eksport_przeslane_z_GUS


select  distinct *
into #tymczasowa4
from #tymczasowa3
			
if

((select count (*) from wald.agregaty_eksport_przeslane_z_GUS) - (select count (*) from #tymczasowa4)) = 0

insert into tbl_info_bledy_z_GUS
select
'DANE W PLIKU WSADOWYM POPRAWNE - EKSPORT' as Opis

--print 'DANE W EKSPORCIE OK'

else

insert into tbl_info_bledy_z_GUS
select
'DUBLE W PLIKU WSADOWYM - WYMAGANA KONTROLA PLIKU - EKSPORT' as Opis

--print 'DUBLE W PLIKU WEJŚCIOWYM (EKSPORT) - PRZEJRZEĆ CZY NIE MA REKORDU Z BŁĘDEM DWÓCH RODZAJÓW'