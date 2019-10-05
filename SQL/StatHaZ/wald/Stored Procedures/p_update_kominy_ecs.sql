

CREATE  PROCEDURE [wald].p_update_kominy_ecs
AS

--zasilenie archiwalnych tabel kominowych
/*
INSERT INTO wald.wal_dgt_kopia_ecs_exp_goods_item_ILOSC_ECS_ARCH 		SELECT * FROM wald.wal_dgt_kopia_ecs_exp_goods_item_ILOSC_ECS
INSERT INTO wald.wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS_ARCH 		SELECT * FROM wald.wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS
INSERT INTO wald.wal_dgt_kopia_ecs_exp_goods_item_WART_KG_ECS_ARCH 		SELECT * FROM wald.wal_dgt_kopia_ecs_exp_goods_item_WART_KG_ECS
INSERT INTO wald.wal_dgt_kopia_ecs_exp_goods_item_WART_STAT_ECS_ARCH 	SELECT * FROM wald.wal_dgt_kopia_ecs_exp_goods_item_WART_STAT_ECS
INSERT INTO wald.wal_dgt_kopia_ecs_exp_goods_item_WART_SZT_ECS_ARCH 	SELECT * FROM wald.wal_dgt_kopia_ecs_exp_goods_item_WART_SZT_ECS 

*/
/*przerzucenie rekordów do usunięcia z tabel tworzących widoki top
do tabeli zasilającej błedne dane*/

--przerzucenie rekordów dla ECS
UPDATE wald.wal_dgt_kopia_ecs_exp_goods_item
SET 	wald.wal_dgt_kopia_ecs_exp_goods_item.stat = wald.wal_dgt_kopia_ecs_exp_goods_item_ILOSC_ECS.stat,
	wald.wal_dgt_kopia_ecs_exp_goods_item.koment = wald.wal_dgt_kopia_ecs_exp_goods_item_ILOSC_ECS.koment,
	wald.wal_dgt_kopia_ecs_exp_goods_item.uname=wald.wal_dgt_kopia_ecs_exp_goods_item_ILOSC_ECS.uname
FROM   wald.wal_dgt_kopia_ecs_exp_goods_item_ILOSC_ECS
WHERE 	(wald.wal_dgt_kopia_ecs_exp_goods_item.[id] = wald.wal_dgt_kopia_ecs_exp_goods_item_ILOSC_ECS.[id])AND
	(wald.wal_dgt_kopia_ecs_exp_goods_item.declcoexport_decl_id = wald.wal_dgt_kopia_ecs_exp_goods_item_ILOSC_ECS.declcoexport_decl_id)AND
	(wald.wal_dgt_kopia_ecs_exp_goods_item_ILOSC_ECS.stat = 'T')

UPDATE wald.wal_dgt_kopia_ecs_exp_goods_item
SET 	wald.wal_dgt_kopia_ecs_exp_goods_item.stat = wald.wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS.stat,
	wald.wal_dgt_kopia_ecs_exp_goods_item.koment = wald.wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS.koment,
	wald.wal_dgt_kopia_ecs_exp_goods_item.uname=wald.wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS.uname
FROM   wald.wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS
WHERE 	(wald.wal_dgt_kopia_ecs_exp_goods_item.[id] = wald.wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS.[id])AND
	(wald.wal_dgt_kopia_ecs_exp_goods_item.declcoexport_decl_id = wald.wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS.declcoexport_decl_id)AND
	(wald.wal_dgt_kopia_ecs_exp_goods_item_MASA_ECS.stat = 'T')

UPDATE wald.wal_dgt_kopia_ecs_exp_goods_item
SET 	wald.wal_dgt_kopia_ecs_exp_goods_item.stat = wald.wal_dgt_kopia_ecs_exp_goods_item_WART_KG_ECS.stat,
	wald.wal_dgt_kopia_ecs_exp_goods_item.koment = wald.wal_dgt_kopia_ecs_exp_goods_item_WART_KG_ECS.koment,
	wald.wal_dgt_kopia_ecs_exp_goods_item.uname=wald.wal_dgt_kopia_ecs_exp_goods_item_WART_KG_ECS.uname
FROM  wald.wal_dgt_kopia_ecs_exp_goods_item_WART_KG_ECS
WHERE	(wald.wal_dgt_kopia_ecs_exp_goods_item.[id] = wald.wal_dgt_kopia_ecs_exp_goods_item_WART_KG_ECS.[id])AND
	(wald.wal_dgt_kopia_ecs_exp_goods_item.declcoexport_decl_id = wald.wal_dgt_kopia_ecs_exp_goods_item_WART_KG_ECS.declcoexport_decl_id)AND
	(wald.wal_dgt_kopia_ecs_exp_goods_item_WART_KG_ECS.stat = 'T')

UPDATE wald.wal_dgt_kopia_ecs_exp_goods_item
SET 	wald.wal_dgt_kopia_ecs_exp_goods_item.stat = wald.wal_dgt_kopia_ecs_exp_goods_item_WART_STAT_ECS.stat,
	wald.wal_dgt_kopia_ecs_exp_goods_item.koment = wald.wal_dgt_kopia_ecs_exp_goods_item_WART_STAT_ECS.koment,
	wald.wal_dgt_kopia_ecs_exp_goods_item.uname=wald.wal_dgt_kopia_ecs_exp_goods_item_WART_STAT_ECS.uname
FROM   wald.wal_dgt_kopia_ecs_exp_goods_item_WART_STAT_ECS
WHERE 	(wald.wal_dgt_kopia_ecs_exp_goods_item.[id] = wald.wal_dgt_kopia_ecs_exp_goods_item_WART_STAT_ECS.[id])AND
	(wald.wal_dgt_kopia_ecs_exp_goods_item.declcoexport_decl_id = wald.wal_dgt_kopia_ecs_exp_goods_item_WART_STAT_ECS.declcoexport_decl_id)AND
	(wald.wal_dgt_kopia_ecs_exp_goods_item_WART_STAT_ECS.stat = 'T')

UPDATE wald.wal_dgt_kopia_ecs_exp_goods_item
SET 	wald.wal_dgt_kopia_ecs_exp_goods_item.stat = wald.wal_dgt_kopia_ecs_exp_goods_item_WART_SZT_ECS.stat,
	wald.wal_dgt_kopia_ecs_exp_goods_item.koment = wald.wal_dgt_kopia_ecs_exp_goods_item_WART_SZT_ECS.koment,
	wald.wal_dgt_kopia_ecs_exp_goods_item.uname=wald.wal_dgt_kopia_ecs_exp_goods_item_WART_SZT_ECS.uname
FROM  wald.wal_dgt_kopia_ecs_exp_goods_item_WART_SZT_ECS
WHERE 	(wald.wal_dgt_kopia_ecs_exp_goods_item.[id] = wald.wal_dgt_kopia_ecs_exp_goods_item_WART_SZT_ECS.[id])AND
	(wald.wal_dgt_kopia_ecs_exp_goods_item.declcoexport_decl_id = wald.wal_dgt_kopia_ecs_exp_goods_item_WART_SZT_ECS.declcoexport_decl_id)AND
	(wald.wal_dgt_kopia_ecs_exp_goods_item_WART_SZT_ECS.stat = 'T')

--Update kominy z wal_dgt_kopia_ecs_exp_goods_item do blednych danych

DECLARE k_zew CURSOR
  KEYSET  
   FOR
    SELECT  [id],declcoexport_decl_id,koment,uname
      FROM       [wald].wal_dgt_kopia_ecs_exp_goods_item
    	WHERE stat='T'

OPEN k_zew

DECLARE @id varchar(50)
DECLARE @declcoexport_decl_id int
DECLARE @koment varchar(50)
DECLARE @uname varchar(50)
DECLARE @licznik int
DECLARE @licznik_do int
SET @licznik = 1
SET @licznik_do=@@CURSOR_ROWS

WHILE @licznik <=@licznik_do
BEGIN

  FETCH k_zew
    INTO @id, @declcoexport_decl_id,@koment,@uname

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
'dgv_kopia_v2_sad_dpdz_tow',NULL,NULL,@declcoexport_decl_id,NULL,@id,NULL,'T',@koment,'E',@uname)

/**INSERT INTO [wald].dgt_bledne_dane
SELECT
NULL,
NULL,
'wal_dgt_kopia_v2_sad_dpdz_tow',
NULL,
NULL,
NULL,
@id,
NULL,
@declcoexport_decl_id,
'T',
@koment,
'I'
FROM
[wald].wal_dgt_kopia_istat_dekl_wynik_poz**/

  SET @licznik = @licznik + 1

END

INSERT INTO wald.raport 
SELECT 'U' AS Akcja, 'Update kominy: ECS' AS Opis, CONVERT(VARCHAR,@licznik_do) AS Ilosc, GETDATE() AS Data, (suser_sname()) AS Operator

CLOSE k_zew
DEALLOCATE k_zew