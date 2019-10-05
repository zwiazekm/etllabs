CREATE procedure [stat].dop_czesciowe_usuniecie_danych
  @p_data_od datetime,
  @p_data_do datetime,
  @p_rodzaj_danych varchar (100),
  @p_typ varchar
as
  --
  exec stat.DziennikWpisInfo 'start: dop_czesciowe_usuniecie_danych'
  --
  -- Czesciowe czyszczenie tabel
  if year (@p_data_od) != year (@p_data_do)
    begin
      if @p_rodzaj_danych = 'INTR'
        begin
          if @p_typ = 'P'
            delete from stat.dgt_import_intr where im_RokMc between year(@p_data_do)*100+1 and year(@p_data_do)*100+12
          else
            delete from stat.dgt_eksport_intr where ek_RokMc between year(@p_data_do)*100+1 and year(@p_data_do)*100+12
        end
      if @p_rodzaj_danych = 'SAD'
        begin
          if @p_typ = 'P'
            delete from stat.dgt_import_sad where im_RokMc between year(@p_data_do)*100+1 and year(@p_data_do)*100+12
          else
            delete from stat.dgt_eksport_sad where ek_RokMc between year(@p_data_do)*100+1 and year(@p_data_do)*100+12
        end
    end
  --
  exec stat.DziennikWpisInfo 'stop: dop_czesciowe_usuniecie_danych'