CREATE PROCEDURE [stat].dgp_eksport_intr_doszacowanie_generacja
  @p_data_od datetime,
  @p_data_do datetime
as
  declare @v_komunikat varchar(255)
  set @v_komunikat = 'dgp_eksport_intr_doszacowanie_generacja '+convert(varchar(10),@p_data_od,105)+' : ' +convert(varchar(10),@p_data_do,105)
  print @v_komunikat
  --
  -- Generacja danych
  truncate table [stat].dgt_eksport_intr_agr
  ------------------------------------------------------------------------------------------
  -- Wywołanie odpowiedniej wersji procedury
  --
  exec [stat].dgp_procedura_wersja 'dgp_eksport_intr_doszacowanie_generacja', @p_data_od, @p_data_do
  --
  -------------------------------------------------------------------------------------------

  -- ... czesciowe usuniecie danych
  exec [stat].dop_czesciowe_usuniecie_danych @p_data_od, @p_data_do, 'INTR', 'W'
  --
  exec stat.DziennikWpisInfo 'stop: dgp_eksport_intr_doszacowanie_generacja'
  --