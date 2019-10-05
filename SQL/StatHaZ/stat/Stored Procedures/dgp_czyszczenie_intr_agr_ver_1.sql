



create  PROCEDURE [stat].dgp_czyszczenie_intr_agr_ver_1
@p_data_od datetime,
@p_data_do datetime,
@p_typ varchar(1)
as
declare @v_komunikat varchar(255)
set @v_komunikat = 'dgp_czyszczenie_intr_agr_ver_1 '+convert(varchar(10),@p_data_od,105)+' : ' +convert(varchar(10),@p_data_do,105)
print @v_komunikat
exec stat.DziennikWpisInfo @v_komunikat, @@PROCID