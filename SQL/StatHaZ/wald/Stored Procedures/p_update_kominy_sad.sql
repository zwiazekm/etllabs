

CREATE  PROCEDURE [wald].p_update_kominy_sad
AS

--zasilenie archiwalnych tabel kominowych
/*
INSERT INTO wald.wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD_ARCH  		SELECT * FROM wald.wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD
INSERT INTO wald.wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD_ARCH  		SELECT * FROM wald.wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD
INSERT INTO wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD_ARCH  	SELECT * FROM wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD
INSERT INTO wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_SZT_SAD_ARCH  	SELECT * FROM wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_SZT_SAD
INSERT INTO wald.wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD_ARCH  	SELECT * FROM wald.wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD

*/
/*przerzucenie rekordów do uzunięcia z tabel tworzących widoki top_200
do tabel które zasilą w update błędne dane*/

--przerzucenie kominów dla SADu
UPDATE wald.wal_dgt_kopia_v2_sad_dpdz_tow
SET 	wald.wal_dgt_kopia_v2_sad_dpdz_tow.stat= wald.wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD.stat,
	wald.wal_dgt_kopia_v2_sad_dpdz_tow.koment = wald.wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD.koment,
	wald.wal_dgt_kopia_v2_sad_dpdz_tow.uname=wald.wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD.uname
FROM wald.wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD
WHERE 	(wald.wal_dgt_kopia_v2_sad_dpdz_tow.idDokNr = wald.wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD.idDokNr) AND
	(wald.wal_dgt_kopia_v2_sad_dpdz_tow.[PozId] = wald.wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD.PozId)AND
	(wald.wal_dgt_kopia_v2_sad_dpdz_tow_ILOSC_SAD.stat = 'T')

UPDATE wald.wal_dgt_kopia_v2_sad_dpdz_tow
SET 	wald.wal_dgt_kopia_v2_sad_dpdz_tow.stat= wald.wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD.stat,
	wald.wal_dgt_kopia_v2_sad_dpdz_tow.koment = wald.wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD.koment,
	wald.wal_dgt_kopia_v2_sad_dpdz_tow.uname=wald.wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD.uname
FROM wald.wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD
WHERE 	(wald.wal_dgt_kopia_v2_sad_dpdz_tow.idDokNr = wald.wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD.idDokNr) AND
	(wald.wal_dgt_kopia_v2_sad_dpdz_tow.[PozId] = wald.wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD.PozId)AND
	(wald.wal_dgt_kopia_v2_sad_dpdz_tow_MASA_SAD.stat = 'T')

UPDATE wald.wal_dgt_kopia_v2_sad_dpdz_tow
SET 	wald.wal_dgt_kopia_v2_sad_dpdz_tow.stat= wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD.stat,
	wald.wal_dgt_kopia_v2_sad_dpdz_tow.koment = wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD.koment,
	wald.wal_dgt_kopia_v2_sad_dpdz_tow.uname=wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD.uname
FROM wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD
WHERE 	(wald.wal_dgt_kopia_v2_sad_dpdz_tow.idDokNr = wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD.idDokNr) AND
	(wald.wal_dgt_kopia_v2_sad_dpdz_tow.[PozId] = wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD.PozId)AND
	(wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD.stat = 'T')

UPDATE wald.wal_dgt_kopia_v2_sad_dpdz_tow
SET 	wald.wal_dgt_kopia_v2_sad_dpdz_tow.stat= wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_SZT_SAD.stat,
	wald.wal_dgt_kopia_v2_sad_dpdz_tow.koment = wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_SZT_SAD.koment,
	wald.wal_dgt_kopia_v2_sad_dpdz_tow.uname=wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_SZT_SAD.uname
FROM wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_SZT_SAD
WHERE 	(wald.wal_dgt_kopia_v2_sad_dpdz_tow.idDokNr = wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_SZT_SAD.idDokNr) AND
	(wald.wal_dgt_kopia_v2_sad_dpdz_tow.[PozId] = wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_SZT_SAD.PozId)AND
	(wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_SZT_SAD.stat = 'T')

UPDATE wald.wal_dgt_kopia_v2_sad_dpdz_tow
SET 	wald.wal_dgt_kopia_v2_sad_dpdz_tow.stat= wald.wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD.stat,
	wald.wal_dgt_kopia_v2_sad_dpdz_tow.koment = wald.wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD.koment,
	wald.wal_dgt_kopia_v2_sad_dpdz_tow.uname=wald.wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD.uname
FROM wald.wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD
WHERE 	(wald.wal_dgt_kopia_v2_sad_dpdz_tow.idDokNr = wald.wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD.idDokNr) AND
	(wald.wal_dgt_kopia_v2_sad_dpdz_tow.[PozId] = wald.wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD.PozId)AND
	(wald.wal_dgt_kopia_v2_sad_dpdz_tow_WARTOSC_SAD.stat = 'T')


--Update kominy z wal_dgt_kopia_v2_sad_dpdz_tow do blednych danych


DECLARE k_zew CURSOR
  KEYSET  
   FOR
    SELECT  idDokNr,[PozId],koment,uname
      FROM       wald.wal_dgt_kopia_v2_sad_dpdz_tow 
    	WHERE stat='T'

OPEN k_zew

DECLARE @idDokNr int
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
    INTO @idDokNr, @pozid,@koment,@uname

INSERT INTO [wald].dgt_bledne_dane
values (NULL,
case
when @koment like '%masa%' then 'masanetto'
when @koment like'%ilość%' then 'iloscuzupelniajacajm'
when @koment like'%ilosc%' then 'iloscuzupelniajacajm'
when @koment like'%ilosć%' then 'iloscuzupelniajacajm'
when @koment like'%ilośc%' then 'iloscuzupelniajacajm'
when @koment like'%ilości%' then 'iloscuzupelniajacajm'
when @koment like'%szt%' then 'iloscuzupelniajacajm'
when @koment like'%jedn%' then 'iloscuzupelniajacajm'
when @koment like '%fakt%' then 'wartoscstatystyczna'
when @koment like '%stat%' then 'wartoscstatystyczna'
else 'UWAGA!!' end,
'dgv_kopia_v2_sad_dpdz_tow',NULL,NULL,@idDokNr,NULL,@pozid,NULL,'T',@koment,'S',@uname)
--INSERT INTO [wald].V1_dgt_bledne_dane_GUS
--values (NULL,NULL,'dgv_kopia_v2_sad_dpdz_tow',NULL,NULL,@idDokNr,NULL,@pozid,NULL,'T',@koment)


  SET @licznik = @licznik + 1

END

INSERT INTO wald.raport 
SELECT 'U' AS Akcja, 'Update kominy: SAD' AS Opis, CONVERT(VARCHAR,@licznik_do) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

CLOSE k_zew
DEALLOCATE k_zew