CREATE PROCEDURE [stat].dgp_czyszczenie_intr_agr_ver_2
@p_data_od datetime,
@p_data_do datetime,
@p_typ varchar(1)
as
declare @v_komunikat varchar(255)
set @v_komunikat = 'dgp_czyszczenie_intr_agr_ver_2 '+convert(varchar(10),@p_data_od,105)+' : ' +convert(varchar(10),@p_data_do,105)
print @v_komunikat
exec stat.DziennikWpisInfo @v_komunikat, @@PROCID
if @p_typ = 'P'
begin
  update [stat].dgt_import_intr_agr
     set --im_masa_netto = case when ltrim(isnull(nazwa_jm,'')) = '' then im_masa_netto   else 0 end, 
         im_ilosc = case when ltrim(isnull(nazwa_jm,'')) <> '' then  im_ilosc           else 0 end 
    from tbl_sl_taryfa_cn8
    where im_pcn = kod_cn
	and im_RokMc BETWEEN dbo.[KonwertujDateNaRokMc](@p_data_od) AND dbo.[KonwertujDateNaRokMc](@p_data_do)
end 
if @p_typ = 'W'
begin
  update [stat].dgt_eksport_intr_agr
     set --ek_masa_netto = case when ltrim(isnull(nazwa_jm,'')) = '' then ek_masa_netto   else 0 end, 
         ek_ilosc = case when ltrim(isnull(nazwa_jm,'')) <> '' then  ek_ilosc           else 0 end 
    from tbl_sl_taryfa_cn8
    where ek_pcn = kod_cn
	and ek_RokMc BETWEEN dbo.[KonwertujDateNaRokMc](@p_data_od) AND dbo.[KonwertujDateNaRokMc](@p_data_do)
end