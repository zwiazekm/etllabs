create procedure [wald].p_przesl_powt_imp_GUS
as
--2.IMPORT:
--dodanie nie przesyłanych wcześniej rowków do tabeli "arch"
insert into wald.agregaty_import_przeslane_z_GUS_arch
select * from wald.agregaty_import_przeslane_z_GUS

--dodanie rowków uznanych za dobre, w danym miesiącu, do tabeli "duble"
insert into wald.agregaty_import_przeslane_z_GUS_duble
select 	wald.agregaty_import_przeslane_z_GUS.pcn_p,
	wald.agregaty_import_przeslane_z_GUS.kraj_poch,
	wald.agregaty_import_przeslane_z_GUS.kraj_wys,
	wald.agregaty_import_przeslane_z_GUS.regon,
	wald.agregaty_import_przeslane_z_GUS.mies,
	wald.agregaty_import_przeslane_z_GUS.rok,
	wald.agregaty_import_przeslane_z_GUS.tranzak,
	wald.agregaty_import_przeslane_z_GUS.trans,
	wald.agregaty_import_przeslane_z_GUS.war_dos,
	wald.agregaty_import_przeslane_z_GUS.urz_cel,
	wald.agregaty_import_przeslane_z_GUS.[proc],
	wald.agregaty_import_przeslane_z_GUS.prog,
	wald.agregaty_import_przeslane_z_GUS.masa_net,
	wald.agregaty_import_przeslane_z_GUS.ilosc,
	wald.agregaty_import_przeslane_z_GUS.wart_zl,
	wald.agregaty_import_przeslane_z_GUS.wart_dol,
	wald.agregaty_import_przeslane_z_GUS.wart_euro,
	wald.agregaty_import_przeslane_z_GUS.komentarz,
	wald.agregaty_import_przeslane_z_GUS.propozycja,
	wald.agregaty_import_przeslane_z_GUS.uwagi_CAAC as powód_zwrotu
from 	wald.agregaty_import_przeslane_z_GUS
where	wald.agregaty_import_przeslane_z_GUS.uwagi_CAAC is not null
	
--oczyszczenie tabeli
truncate table wald.agregaty_import_przeslane_z_GUS