CREATE  PROCEDURE [stat].dgp_czyszczenie_intr_agr
@p_data_od datetime,
@p_data_do datetime,
@p_typ varchar(1)
as
  declare @v_komunikat varchar(255)
  set @v_komunikat = 'dgp_czyszczenie_intr_agr '+convert(varchar(10),@p_data_od,105)+' : ' +convert(varchar(10),@p_data_do,105)
  print @v_komunikat
  exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
  exec [stat].dgp_procedura_wersja 'dgp_czyszczenie_intr_agr', @p_data_od, @p_data_do, @p_typ