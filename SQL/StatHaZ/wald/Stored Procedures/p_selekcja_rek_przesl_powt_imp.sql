
CREATE procedure [wald].p_selekcja_rek_przesl_powt_imp
as
--1.IMPORT:
--wyszukiwanie rowków przysłanych powtórnie i wrzucanie ich do tabeli "duble"
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
	wald.agregaty_import_przeslane_z_GUS."proc",
	wald.agregaty_import_przeslane_z_GUS.prog,
	wald.agregaty_import_przeslane_z_GUS.masa_net,
	wald.agregaty_import_przeslane_z_GUS.ilosc,
	wald.agregaty_import_przeslane_z_GUS.wart_zl,
	wald.agregaty_import_przeslane_z_GUS.wart_dol,
	wald.agregaty_import_przeslane_z_GUS.wart_euro,
	wald.agregaty_import_przeslane_z_GUS.komentarz,
	wald.agregaty_import_przeslane_z_GUS.propozycja,
	(case 	when wald.agregaty_import_przeslane_z_GUS_arch.uwagi_CAAC is not null
		then wald.agregaty_import_przeslane_z_GUS_arch.uwagi_CAAC
		else 'rekord przyjęty w CAAC '+(case	when substring (convert (varchar(10), wald.agregaty_import_przeslane_z_GUS_arch.GUS_zglosil,112),1,6)= '200701' then 'w styczniu 2007'
							when substring (convert (varchar(10), wald.agregaty_import_przeslane_z_GUS_arch.GUS_zglosil,112),1,6)= '200702' then 'w lutym 2007'
							when substring (convert (varchar(10), wald.agregaty_import_przeslane_z_GUS_arch.GUS_zglosil,112),1,6)= '200703' then 'w marcu 2007'
							when substring (convert (varchar(10), wald.agregaty_import_przeslane_z_GUS_arch.GUS_zglosil,112),1,6)= '200704' then 'w kwietniu 2007'
							when substring (convert (varchar(10), wald.agregaty_import_przeslane_z_GUS_arch.GUS_zglosil,112),1,6)= '200705' then 'w maju 2007'
							when substring (convert (varchar(10), wald.agregaty_import_przeslane_z_GUS_arch.GUS_zglosil,112),1,6)= '200706' then 'w czerwcu 2007'
							when substring (convert (varchar(10), wald.agregaty_import_przeslane_z_GUS_arch.GUS_zglosil,112),1,6)= '200707' then 'w lipcu 2007'
							when substring (convert (varchar(10), wald.agregaty_import_przeslane_z_GUS_arch.GUS_zglosil,112),1,6)= '200708' then 'w sierpniu 2007'
							when substring (convert (varchar(10), wald.agregaty_import_przeslane_z_GUS_arch.GUS_zglosil,112),1,6)= '200709' then 'we wrześniu 2007'
							when substring (convert (varchar(10), wald.agregaty_import_przeslane_z_GUS_arch.GUS_zglosil,112),1,6)= '200710' then 'w październiku 2007'
							when substring (convert (varchar(10), wald.agregaty_import_przeslane_z_GUS_arch.GUS_zglosil,112),1,6)= '200711' then 'w listopadzie 2007'
							when substring (convert (varchar(10), wald.agregaty_import_przeslane_z_GUS_arch.GUS_zglosil,112),1,6)= '200712' then 'w grudniu 2007'
							end)end) as powód_zwrotu
from	wald.agregaty_import_przeslane_z_GUS,wald.agregaty_import_przeslane_z_GUS_arch
where	(wald.agregaty_import_przeslane_z_GUS.pcn_p = wald.agregaty_import_przeslane_z_GUS_arch.pcn_p) and
	(wald.agregaty_import_przeslane_z_GUS.kraj_poch = wald.agregaty_import_przeslane_z_GUS_arch.kraj_poch) and
	(wald.agregaty_import_przeslane_z_GUS.kraj_wys = wald.agregaty_import_przeslane_z_GUS_arch.kraj_wys) and
	(wald.agregaty_import_przeslane_z_GUS.regon = wald.agregaty_import_przeslane_z_GUS_arch.regon) and
	(wald.agregaty_import_przeslane_z_GUS.mies = wald.agregaty_import_przeslane_z_GUS_arch.mies) and
	(wald.agregaty_import_przeslane_z_GUS.rok = wald.agregaty_import_przeslane_z_GUS_arch.rok) and
	(wald.agregaty_import_przeslane_z_GUS.tranzak = wald.agregaty_import_przeslane_z_GUS_arch.tranzak) and
	(wald.agregaty_import_przeslane_z_GUS.trans = wald.agregaty_import_przeslane_z_GUS_arch.trans) and
	(wald.agregaty_import_przeslane_z_GUS.war_dos = wald.agregaty_import_przeslane_z_GUS_arch.war_dos) and
	(wald.agregaty_import_przeslane_z_GUS.urz_cel = wald.agregaty_import_przeslane_z_GUS_arch.urz_cel) and
	(wald.agregaty_import_przeslane_z_GUS."proc" = wald.agregaty_import_przeslane_z_GUS_arch."proc") and
	(wald.agregaty_import_przeslane_z_GUS.prog = wald.agregaty_import_przeslane_z_GUS_arch.prog) and
	(wald.agregaty_import_przeslane_z_GUS.masa_net = wald.agregaty_import_przeslane_z_GUS_arch.masa_net) and
	(wald.agregaty_import_przeslane_z_GUS.ilosc = wald.agregaty_import_przeslane_z_GUS_arch.ilosc) and
	(wald.agregaty_import_przeslane_z_GUS.wart_zl = wald.agregaty_import_przeslane_z_GUS_arch.wart_zl) and
	(wald.agregaty_import_przeslane_z_GUS.wart_dol = wald.agregaty_import_przeslane_z_GUS_arch.wart_dol) and
	(wald.agregaty_import_przeslane_z_GUS.wart_euro = wald.agregaty_import_przeslane_z_GUS_arch.wart_euro)

--usunięcie rowków przeznaczonych do zwrotu (przeniesionych do "dubli")
delete 	wald.agregaty_import_przeslane_z_GUS
from 	wald.agregaty_import_przeslane_z_GUS_duble
where 	(wald.agregaty_import_przeslane_z_GUS.pcn_p = wald.agregaty_import_przeslane_z_GUS_duble.pcn_p) and
	(wald.agregaty_import_przeslane_z_GUS.kraj_poch = wald.agregaty_import_przeslane_z_GUS_duble.kraj_poch) and
	(wald.agregaty_import_przeslane_z_GUS.kraj_wys = wald.agregaty_import_przeslane_z_GUS_duble.kraj_wys) and
	(wald.agregaty_import_przeslane_z_GUS.regon = wald.agregaty_import_przeslane_z_GUS_duble.regon) and
	(wald.agregaty_import_przeslane_z_GUS.mies = wald.agregaty_import_przeslane_z_GUS_duble.mies) and
	(wald.agregaty_import_przeslane_z_GUS.rok = wald.agregaty_import_przeslane_z_GUS_duble.rok) and
	(wald.agregaty_import_przeslane_z_GUS.tranzak = wald.agregaty_import_przeslane_z_GUS_duble.tranzak) and
	(wald.agregaty_import_przeslane_z_GUS.trans = wald.agregaty_import_przeslane_z_GUS_duble.trans) and
	(wald.agregaty_import_przeslane_z_GUS.war_dos = wald.agregaty_import_przeslane_z_GUS_duble.war_dos) and
	(wald.agregaty_import_przeslane_z_GUS.urz_cel = wald.agregaty_import_przeslane_z_GUS_duble.urz_cel) and
	(wald.agregaty_import_przeslane_z_GUS."proc" = wald.agregaty_import_przeslane_z_GUS_duble."proc") and
	(wald.agregaty_import_przeslane_z_GUS.prog = wald.agregaty_import_przeslane_z_GUS_duble.prog) and
	(wald.agregaty_import_przeslane_z_GUS.masa_net = wald.agregaty_import_przeslane_z_GUS_duble.masa_net) and
	(wald.agregaty_import_przeslane_z_GUS.ilosc = wald.agregaty_import_przeslane_z_GUS_duble.ilosc) and
	(wald.agregaty_import_przeslane_z_GUS.wart_zl = wald.agregaty_import_przeslane_z_GUS_duble.wart_zl) and
	(wald.agregaty_import_przeslane_z_GUS.wart_dol = wald.agregaty_import_przeslane_z_GUS_duble.wart_dol) and
	(wald.agregaty_import_przeslane_z_GUS.wart_euro = wald.agregaty_import_przeslane_z_GUS_duble.wart_euro)

INSERT INTO wald.raport 
SELECT 'G' AS Akcja, 'Rekordy przesłane ponownie przez GUS: IMPORT' AS Opis, CONVERT(VARCHAR,@@ROWCOUNT) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator