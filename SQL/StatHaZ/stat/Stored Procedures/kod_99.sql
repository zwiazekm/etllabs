CREATE PROCEDURE stat.kod_99 as

-- usuwanie 99 ze zbiorów
delete
from
stat.dgt_eksport_sad_sads_intr_agr
where
(ek_pcn like '9930%'
or ek_pcn like '9931%')

delete
from
stat.dgt_eksport_intr_agr
where
(ek_pcn like '9930%'
or ek_pcn like '9931%')

delete
from
stat.dgt_eksport_sad_sads_agr
where
(ek_pcn like '9930%'
or ek_pcn like '9931%')

delete
from
stat.dgt_import_sad_sads_intr_agr
where
(im_pcn like '9930%'
or im_pcn like '9931%')

delete
from
stat.dgt_import_intr_agr
where
(im_pcn like '9930%'
or im_pcn like '9931%')

delete
from
stat.dgt_import_sad_sads_agr
where
(im_pcn like '9930%'
or im_pcn like '9931%')
-- koniec usuwania


--czyszczenie tabel pośrednich
truncate table stat.eksport_intr_agr993
truncate table stat.eksport_sad_sads_intr_agr993
truncate table stat.import_intr_agr993
truncate table stat.import_sad_sads_intr_agr993
--koniec czyszczenia tabel pośrednich

-- zasilenie tabel pośrednich

insert into stat.eksport_intr_agr993
SELECT     
poz.kod_towarowy AS ek_pcn, 
'' AS ek_zp, 
poz.kod_towarowy AS ek_pcnp, 
'QR' AS ek_kraj_przeznaczenia, 
'44444444444444' AS ek_odbiorca, 
'4444444444' AS ek_nip, 
dok.RokMc,
'11' AS ek_rodzaj_transakcji, 
'' AS ek_kod_transportu, 
'' AS ek_kod_warunkow_dostawy, 
'49' AS ek_kod_izby_celnej, 
'0000' AS ek_kod_procedury_celnej, 
'1' AS ek_znacznik_kategorii_progowej, 
SUM(poz.masa_netto) AS ek_masa_netto, 
SUM(poz.uzup_jm) AS ek_ilosc, 
SUM(poz.wartosc_stat) AS ek_wartosc_stat_zl, 
convert(decimal(10,0),(SUM(poz.wartosc_stat)/kusd.kurs)) AS ek_wartosc_stat_usd, 
convert(decimal(10,0),(SUM(poz.wartosc_stat)/keur.kurs)) AS ek_wartosc_stat_euro, 
isnull(SUM(poz.wartosc_faktury),SUM(poz.wartosc_stat)) AS ek_wartosc_faktury, 
'' AS ek_iddoknr, 
'' AS ek_id_dok, 
'' AS ek_iddoknr_pozid, 
'' AS ek_id_dok_pozid, 
'' AS ek_id
FROM       [wald].wal_dgt_kopia_istat_dekl_wynik_poz AS poz 
INNER JOIN [wald].wal_dgt_kopia_istat_dekl_wynik_dok AS dok ON poz.id_dok = dok.id_dok 
INNER JOIN gust.kurs_usd_zbior kusd on kusd.RokMc = dok.RokMc
INNER JOIN gust.kurs_eur_zbior keur on keur.RokMc = dok.RokMc
WHERE  
	(poz.kod_towarowy LIKE '9930%' OR poz.kod_towarowy LIKE '9931%') AND 
	(dok.typ = 'W')
GROUP BY 
poz.kod_towarowy, dok.RokMc, kusd.kurs, keur.kurs


insert into [stat].eksport_sad_sads_intr_agr993
SELECT     
poz.kod_towarowy AS ek_pcn, 
'' AS ek_zp, 
poz.kod_towarowy AS ek_pcnp, 
'QR' AS ek_kraj_przeznaczenia, 
'44444444444444' AS ek_odbiorca, 
dok.RokMc,
'11' AS ek_rodzaj_transakcji, 
'' AS ek_kod_transportu, 
'' AS ek_kod_warunkow_dostawy, 
'49' AS ek_kod_izby_celnej, 
'0000' AS ek_kod_procedury_celnej, 
'1' AS ek_znacznik_kategorii_progowej, 
SUM(poz.masa_netto) AS ek_masa_netto, 
SUM(poz.uzup_jm) AS ek_ilosc, 
SUM(poz.wartosc_stat) AS ek_wartosc_stat_zl, 
convert(decimal(10,0),(SUM(poz.wartosc_stat)/kusd.kurs)) AS ek_wartosc_stat_usd, 
convert(decimal(10,0),(SUM(poz.wartosc_stat)/keur.kurs)) AS ek_wartosc_stat_euro
FROM         
[wald].wal_dgt_kopia_istat_dekl_wynik_poz poz 
INNER JOIN [wald].wal_dgt_kopia_istat_dekl_wynik_dok dok ON poz.id_dok = dok.id_dok
inner join gust.kurs_usd_zbior kusd on kusd.RokMc = dok.RokMc
inner join gust.kurs_eur_zbior keur on keur.RokMc = dok.RokMc
WHERE     
	(poz.kod_towarowy LIKE '9930%' OR poz.kod_towarowy LIKE '9931%') AND (dok.typ = 'W')
GROUP BY poz.kod_towarowy, dok.RokMc, kusd.kurs, keur.kurs
--koniec zasilenia tabel pośrednich


-- import danych do zbiorów
insert into [stat].dgt_eksport_intr_agr
SELECT     ek_pcn, 
RIGHT('               ' + ISNULL(ek_zp, ''), 15), 
ek_pcnp, ek_kraj_przeznaczenia, 
ek_odbiorca, ek_nip, 
ek_RokMc, 
ek_rodzaj_transakcji, 
RIGHT('               ' + ISNULL(ek_kod_transportu, ''), 15), 
RIGHT('               ' + ISNULL(ek_kod_warunkow_dostawy, ''), 15), 
ek_kod_izby_celnej, 
ek_kod_procedury_celnej, 
ek_znacznik_kategorii_progowej, 
RIGHT('               ' + ISNULL(ek_masa_netto, '0'), 15), 
RIGHT('               ' + ISNULL(ek_ilosc, '0'), 15), 
RIGHT('               ' + ISNULL(ek_wartosc_stat_zl, '0'), 15), 
RIGHT('               ' + ISNULL(ek_wartosc_stat_usd, '0'), 15), 
RIGHT('               ' + ISNULL(ek_wartosc_stat_euro, '0'), 15), 
RIGHT('               ' + ISNULL(ek_wartosc_faktury, '0'), 15),
NULL as ek_iddoknr, 
NULL as ek_id_dok, 
NULL as ek_iddoknr_pozid, 
NULL as ek_id_dok_pozid
FROM         
stat.eksport_intr_agr993


insert into [stat].dgt_eksport_sad_sads_intr_agr
SELECT     
ek_pcn, 
RIGHT('               ' + ISNULL(ek_zp, ''), 15) AS ek_zp, 
ek_pcnp, ek_kraj_przeznaczenia, 
ek_odbiorca, 
ek_RokMc, 
ek_rodzaj_transakcji, 
RIGHT('               ' + ISNULL(ek_kod_transportu, ''), 15) AS ek_kod_transportu, 
RIGHT('               ' + ISNULL(ek_kod_warunkow_dostawy, ''), 15) 
                      AS ek_kod_warunkow_dostawy, 
ek_kod_izby_celnej, ek_kod_procedury_celnej, 
ek_znacznik_kategorii_progowej, 
RIGHT('               ' + ISNULL(ek_masa_netto, '0'), 15) AS ek_masa_netto, 
RIGHT('               ' + ISNULL(ek_ilosc, '0'), 15) AS ek_ilosc, 
RIGHT('               ' + ISNULL(ek_wartosc_stat_zl, '0'), 15) AS ek_watosc_stat_zl, 
RIGHT('               ' + ISNULL(ek_wartosc_stat_usd, '0'), 15) AS ek_wartosc_stat_usd, 
RIGHT('               ' + ISNULL(ek_wartosc_stat_euro, '0'), 15) AS ek_wartosc_stat_euro
FROM         
stat.eksport_sad_sads_intr_agr993
-- koniec importu danych do zbioru


--sprawdzenie
SELECT *
FROM         stat.dgt_eksport_intr_agr
WHERE     (ek_odbiorca LIKE '4444444%')
order by  ek_RokMc

SELECT * 
FROM         stat.dgt_eksport_sad_sads_agr
WHERE     (ek_odbiorca LIKE '4444444%')
order by  ek_RokMc

SELECT * 
FROM         stat.dgt_eksport_sad_sads_intr_agr
WHERE     (ek_odbiorca LIKE '4444444%')
order by  ek_RokMc

SELECT * 
FROM         stat.dgt_import_intr_agr
WHERE     (im_odbiorca LIKE '4444444%')

SELECT * 
FROM         stat.dgt_import_sad_sads_agr
WHERE     (im_odbiorca LIKE '4444444%')

SELECT * 
FROM         stat.dgt_import_sad_sads_intr_agr
WHERE     (im_odbiorca LIKE '4444444%')