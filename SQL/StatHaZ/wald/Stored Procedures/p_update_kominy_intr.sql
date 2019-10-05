

CREATE  PROCEDURE [wald].p_update_kominy_intr
AS

--zasilenie archiwalnych tabel kominowych
/*
INSERT INTO wald.wal_dgt_kopia_istat_dekl_wynik_poz_ILOSC_INTR_ARCH 		SELECT * FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_ILOSC_INTR
INSERT INTO wald.wal_dgt_kopia_istat_dekl_wynik_poz_MASA_INTR_ARCH		SELECT * FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_MASA_INTR
INSERT INTO wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_FAKT_INTR_ARCH 	SELECT * FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_FAKT_INTR
INSERT INTO wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_KG_INTR_ARCH		SELECT * FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_KG_INTR
INSERT INTO wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR_ARCH	SELECT * FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR
INSERT INTO wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR_ARCH	SELECT * FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR
*/

/*przerzucenie rekordów do usunięcia z tabel tworzących widoki top_200
do tabeli zasilającej błedne dane*/

--przerzucenie rekordów dla INTRASTATu
UPDATE wald.wal_dgt_kopia_istat_dekl_wynik_poz
SET 	wald.wal_dgt_kopia_istat_dekl_wynik_poz.stat = wald.wal_dgt_kopia_istat_dekl_wynik_poz_ILOSC_INTR.stat,
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.koment = wald.wal_dgt_kopia_istat_dekl_wynik_poz_ILOSC_INTR.koment,
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.uname=wald.wal_dgt_kopia_istat_dekl_wynik_poz_ILOSC_INTR.uname
FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_ILOSC_INTR
WHERE 	(wald.wal_dgt_kopia_istat_dekl_wynik_poz.id_dok = wald.wal_dgt_kopia_istat_dekl_wynik_poz_ILOSC_INTR.id_dok)AND
	(wald.wal_dgt_kopia_istat_dekl_wynik_poz.[PozId] = wald.wal_dgt_kopia_istat_dekl_wynik_poz_ILOSC_INTR.pozid)AND
	(wald.wal_dgt_kopia_istat_dekl_wynik_poz_ILOSC_INTR.stat = 'T')

UPDATE wald.wal_dgt_kopia_istat_dekl_wynik_poz
SET 	wald.wal_dgt_kopia_istat_dekl_wynik_poz.stat = wald.wal_dgt_kopia_istat_dekl_wynik_poz_MASA_INTR.stat,
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.koment = wald.wal_dgt_kopia_istat_dekl_wynik_poz_MASA_INTR.koment,
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.uname=wald.wal_dgt_kopia_istat_dekl_wynik_poz_MASA_INTR.uname
FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_MASA_INTR
WHERE 	(wald.wal_dgt_kopia_istat_dekl_wynik_poz.id_dok = wald.wal_dgt_kopia_istat_dekl_wynik_poz_MASA_INTR.id_dok)AND
	(wald.wal_dgt_kopia_istat_dekl_wynik_poz.[PozId] = wald.wal_dgt_kopia_istat_dekl_wynik_poz_MASA_INTR.pozid)AND
	(wald.wal_dgt_kopia_istat_dekl_wynik_poz_MASA_INTR.stat = 'T')

UPDATE wald.wal_dgt_kopia_istat_dekl_wynik_poz
SET 	wald.wal_dgt_kopia_istat_dekl_wynik_poz.stat = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_FAKT_INTR.stat,
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.koment = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_FAKT_INTR.koment,
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.uname=wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_FAKT_INTR.uname
FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_FAKT_INTR
WHERE 	(wald.wal_dgt_kopia_istat_dekl_wynik_poz.id_dok = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_FAKT_INTR.id_dok)AND
	(wald.wal_dgt_kopia_istat_dekl_wynik_poz.[PozId] = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_FAKT_INTR.pozid)AND
	(wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_FAKT_INTR.stat = 'T')

UPDATE wald.wal_dgt_kopia_istat_dekl_wynik_poz
SET 	wald.wal_dgt_kopia_istat_dekl_wynik_poz.stat = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_KG_INTR.stat,
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.koment = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_KG_INTR.koment,
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.uname=wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_KG_INTR.uname
FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_KG_INTR
WHERE 	(wald.wal_dgt_kopia_istat_dekl_wynik_poz.id_dok = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_KG_INTR.id_dok)AND
	(wald.wal_dgt_kopia_istat_dekl_wynik_poz.[PozId] = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_KG_INTR.pozid)AND
	(wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_KG_INTR.stat = 'T')

UPDATE wald.wal_dgt_kopia_istat_dekl_wynik_poz
SET 	wald.wal_dgt_kopia_istat_dekl_wynik_poz.stat = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR.stat,
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.koment = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR.koment,
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.uname=wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR.uname
FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR
WHERE 	(wald.wal_dgt_kopia_istat_dekl_wynik_poz.id_dok = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR.id_dok)AND
	(wald.wal_dgt_kopia_istat_dekl_wynik_poz.[PozId] = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR.pozid)AND
	(wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_STAT_INTR.stat = 'T')

UPDATE wald.wal_dgt_kopia_istat_dekl_wynik_poz
SET 	wald.wal_dgt_kopia_istat_dekl_wynik_poz.stat = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR.stat,
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.koment = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR.koment,
	wald.wal_dgt_kopia_istat_dekl_wynik_poz.uname=wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR.uname
FROM wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR
WHERE 	(wald.wal_dgt_kopia_istat_dekl_wynik_poz.id_dok = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR.id_dok)AND
	(wald.wal_dgt_kopia_istat_dekl_wynik_poz.[PozId] = wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR.pozid)AND
	(wald.wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR.stat = 'T')


--Update kominy z wal_dgt_kopia_istat_dekl_wynik_poz do blednych danych


DECLARE k_zew CURSOR
  KEYSET  
   FOR
    SELECT  id_dok,[PozId],koment,uname
      FROM       [wald].wal_dgt_kopia_istat_dekl_wynik_poz
    	WHERE stat='T'

OPEN k_zew

DECLARE @idDok varchar(50)
DECLARE @pozid int
DECLARE @koment varchar(50)
DECLARE @uname varchar(50)
DECLARE @licznik int
DECLARE @licznik_do int
SET @licznik = 1
SET @licznik_do=@@CURSOR_ROWS

WHILE @licznik <=@licznik_do
BEGIN

  FETCH k_zew
    INTO @idDok, @pozid,@koment,@uname

INSERT INTO [wald].dgt_bledne_dane
values (NULL,
case
when @koment like '%masa%' then 'masa_netto'
when @koment like'%ilość%' then 'uzup_jm'
when @koment like'%ilosc%' then 'uzup_jm'
when @koment like'%ilosć%' then 'uzup_jm'
when @koment like'%ilośc%' then 'uzup_jm'
when @koment like'%ilości%' then 'uzup_jm'
when @koment like'%szt%' then 'uzup_jm'
when @koment like'%jedn%' then 'uzup_jm'
when @koment like '%fakt%' then 'wartosc_faktury'
when @koment like '%stat%' then 'wartosc_stat'
else 'UWAGA!!' end,
'dgv_kopia_istat_dekl_wynik_poz',NULL,NULL,NULL,@idDok,NULL,@pozid,'T',@koment,'I',@uname)
--INSERT INTO [wald].V1_dgt_bledne_dane_GUS
--values (NULL,NULL,'dgv_kopia_istat_dekl_wynik_poz',NULL,NULL,NULL,@idDok,NULL,@pozid,'T',@koment)




  SET @licznik = @licznik + 1

END

INSERT INTO wald.raport 
SELECT 'U' AS Akcja, 'Update kominy: INTR' AS Opis, CONVERT(VARCHAR,@licznik_do) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

CLOSE k_zew
DEALLOCATE k_zew