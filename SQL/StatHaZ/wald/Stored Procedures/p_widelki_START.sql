----------------------------------------------------------------------------------
-- procedura utworzona w trakcie realizacji projektu Waldemar 2.
-- uruchamia procedury wyliczajace widełki cenowe dla importu i eksportu
----------------------------------------------------------------------------------

CREATE PROCEDURE [wald].p_widelki_START
@zakres INT,             		--do rozszerzania lub zawężania widełek
@zbior_z_ktorego_liczyc_widelki	NVARCHAR(200)
AS

DECLARE @zbior  NVARCHAR(200)
DECLARE @rok NVARCHAR(8)

SET @rok=SUBSTRING(@zbior_z_ktorego_liczyc_widelki, 3,4)

SET @zbior=@zbior_z_ktorego_liczyc_widelki

DECLARE @sql2 NVARCHAR(4000)
SET @sql2='SELECT dbid FROM master.dbo.sysdatabases where name='''+@zbior+''''
exec sp_executesql @sql2
IF (SELECT @@ROWCOUNT)=0 BEGIN SELECT 'NIEPOPRAWNA NAZWA ZBIORU!' RETURN END

truncate table [wald].widelki_IMPORT
truncate table [wald].widelki_EKSPORT
truncate table [wald].widelki_zbior_roczny_import
truncate table [wald].widelki_zbior_roczny_eksport

DROP INDEX wald.widelki_zbior_roczny_eksport.IDX_widelki_zbior_roczny_eksport_pcn_kp_zkp
DROP INDEX wald.widelki_zbior_roczny_import.IDX_widelki_zbior_roczny_import_pcn_kp_zkp
 
DECLARE @sql1 NVARCHAR(4000)
SET @sql1='INSERT INTO [wald].widelki_zbior_roczny_import SELECT  * FROM '+@zbior+'.wald.dgt_import_sad_sads_intr_agr
			  WHERE im_odbiorca NOT IN (''22222222222222'',''33333333333333'',''44444444444444'',''55555555555555'') --AND im_znacznik_kategorii_progowej NOT IN (''3'',''4'') 
			  AND CONVERT(BIGINT,im_wartosc_stat_zl)<>0 AND CONVERT(BIGINT, im_masa_netto)+CONVERT(INT, im_ilosc)<>0
           INSERT INTO [wald].widelki_zbior_roczny_eksport SELECT  * FROM '+@zbior+'.wald.dgt_eksport_sad_sads_intr_agr
			  WHERE ek_odbiorca NOT IN (''22222222222222'',''33333333333333'',''44444444444444'',''55555555555555'') --AND ek_znacznik_kategorii_progowej NOT IN (''3'',''4'') 
			  AND CONVERT(BIGINT,ek_wartosc_stat_zl)<>0 AND CONVERT(BIGINT, ek_masa_netto)+CONVERT(INT, ek_ilosc)<>0
			  ' 

exec sys.sp_executesql @sql1



CREATE  CLUSTERED  INDEX IDX_widelki_zbior_roczny_eksport_pcn_kp_zkp ON 
wald.widelki_zbior_roczny_eksport(ek_pcn, ek_kraj_przeznaczenia, ek_znacznik_kategorii_progowej)

CREATE  CLUSTERED  INDEX IDX_widelki_zbior_roczny_import_pcn_kp_zkp ON 
wald.widelki_zbior_roczny_import(im_pcn, im_kraj_pochodzenia, im_znacznik_kategorii_progowej) ON [PRIMARY]
  
DECLARE @sql NVARCHAR(4000)


if exists (select * from sysindexes where name='widelki_IMPORT_cn_znak_kraj')
begin 
--drop index widelki_import.widelki_IMPORT_cn_znak_kraj
DROP INDEX [widelki_IMPORT_cn_znak_kraj] ON [wald].[widelki_IMPORT]
end


EXEC [wald].p_widelki_IMPORT_INTR_MASA @zakres, @rok
EXEC [wald].p_widelki_IMPORT_INTR_UJM @zakres, @rok
EXEC [wald].p_widelki_IMPORT_SAD_UJM @zakres, @rok 
EXEC [wald].p_widelki_EKSPORT_INTR_MASA @zakres, @rok
EXEC [wald].p_widelki_EKSPORT_INTR_UJM @zakres, @rok
EXEC [wald].p_widelki_EKSPORT_SAD_UJM @zakres, @rok

--EXEC dbo.p_widelki_MAPOWANIE 

select 'pamiętaj uruchomić mapowanie kodów towarowych'


CREATE  CLUSTERED  INDEX [widelki_IMPORT_cn_znak_kraj] ON [wald].[widelki_IMPORT]
	([kod_towarowy], [kraj_poch], [znak]) ON [PRIMARY];