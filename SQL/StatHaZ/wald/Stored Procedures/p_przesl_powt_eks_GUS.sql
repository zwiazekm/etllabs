CREATE procedure [wald].p_przesl_powt_eks_GUS
as
--2.EKSPORT:
--dodanie nie przysyłanych wcześniej rowków do tabeli "arch"
insert into wald.agregaty_eksport_przeslane_z_GUS_arch
select * from wald.agregaty_eksport_przeslane_z_GUS

--dodanie rowków uznanych za dobre, w danym miesiącu, do tabeli "duble"
insert into wald.agregaty_eksport_przeslane_z_GUS_duble
select 	wald.agregaty_eksport_przeslane_z_GUS.pcn_p,
	wald.agregaty_eksport_przeslane_z_GUS.kraj_przezn,
	wald.agregaty_eksport_przeslane_z_GUS.regon,
	wald.agregaty_eksport_przeslane_z_GUS.mies,
	wald.agregaty_eksport_przeslane_z_GUS.rok,
	wald.agregaty_eksport_przeslane_z_GUS.tranzak,
	wald.agregaty_eksport_przeslane_z_GUS.trans,
	wald.agregaty_eksport_przeslane_z_GUS.war_dos,
	wald.agregaty_eksport_przeslane_z_GUS.urz_cel,
	wald.agregaty_eksport_przeslane_z_GUS.[proc],
	wald.agregaty_eksport_przeslane_z_GUS.prog,
	wald.agregaty_eksport_przeslane_z_GUS.masa_net,
	wald.agregaty_eksport_przeslane_z_GUS.ilosc,
	wald.agregaty_eksport_przeslane_z_GUS.wart_zl,
	wald.agregaty_eksport_przeslane_z_GUS.wart_dol,
	wald.agregaty_eksport_przeslane_z_GUS.wart_euro,
	wald.agregaty_eksport_przeslane_z_GUS.komentarz,
	wald.agregaty_eksport_przeslane_z_GUS.propozycja,
	wald.agregaty_eksport_przeslane_z_GUS.uwagi_CAAC as powód_zwrotu
from 	wald.agregaty_eksport_przeslane_z_GUS
where	wald.agregaty_eksport_przeslane_z_GUS.uwagi_CAAC is not null
	
--oczyszczenie tabeli
truncate table wald.agregaty_eksport_przeslane_z_GUS