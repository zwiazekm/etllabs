
CREATE procedure [wald].p_przygotowanie_danych_dla_widelek
(
@rok nvarchar(255)
)as

truncate table [wald].widelki_zbior_roczny_eksport
truncate table [wald].widelki_zbior_roczny_import
truncate table [wald].tbl_przejsc_widelki 

declare @dane_exp nvarchar(4000)
declare @dane_imp nvarchar(4000)
declare @tbl_przejsc_widelki nvarchar(4000)

set @dane_exp = 'insert into [wald].widelki_zbior_roczny_eksport select * 
		from '+'z_'+@rok+'_roczny.wald.dgt_eksport_sad_sads_intr_agr'
set @dane_imp = 'insert into [wald].widelki_zbior_roczny_import select * 
		from '+'z_'+@rok+'_roczny.wald.dgt_import_sad_sads_intr_agr'
set @tbl_przejsc_widelki = 'insert into [wald].tbl_przejsc_widelki select * 
		from [wald].tbl_przejsc_'+CONVERT(NVARCHAR,(CONVERT(INT,@rok)+1))
		
exec sys.sp_executesql @dane_exp
exec sys.sp_executesql @dane_imp
exec sys.sp_executesql @tbl_przejsc_widelki

exec [wald].p_raport_przygotowanie_danych_dla_widelek
exec [wald].p_mapowanie_zbioru_do_widelek