CREATE PROCEDURE [etl].[gus005_UdzialDoszacowanZapisPodmiotow]
AS

	select a.typ, a.rok, a.miesiac, a.ilosc_rzecz_doszac, b.ilosc_rzecz from 
	 (select typ, rok, miesiac, count(distinct nip) as ilosc_rzecz_doszac
	  from (
			select okr.typ      typ,
				   okr.RokMc % 100 as miesiac,
				   okr.RokMc / 100 as rok,
				   pod.nip      nip
			from stat.dgv_kopia_intr_dane_pod pod, 
    			 stat.dot_okres_sprawozd okr
			where pod.id_pod = okr.id_pod
					  and okr.[status] in ('P','B')
			union 
			select dosz.typ               typ,
				   dosz.RokMc % 100 as  miesiac,
				   dosz.RokMc / 100 as  rok,
				   dosz.nip_zobowiazanego nip
		  from stat.dot_dekl_wynik_dok dosz
		  where exists (select 1 from stat.dot_dekl_wynik_poz poz where poz.id = dosz.id and wskaznik_progowy = '4')
			) as podm
		group by typ, rok, miesiac, rok) a, 
	   (select okr.typ      typ,
				   okr.RokMc % 100 as miesiac,
				   okr.RokMc / 100 as rok,
				   count(distinct nip) as ilosc_rzecz
			from stat.dgv_kopia_intr_dane_pod pod, 
    			 stat.dot_okres_sprawozd okr
			where pod.id_pod = okr.id_pod
					  and okr.[status] in ('P','B')
		group by typ, okr.RokMc % 100, okr.RokMc / 100
			) b
	where a.typ = b.typ and a.rok = b.rok and a.miesiac=b.miesiac
	order by 1, 2, 3

RETURN 0