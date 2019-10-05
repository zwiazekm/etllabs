-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE etl.gus005_UdzialDoszacowanIloscDeklPoz
	@RokMcOd int, @RokMcDo int
AS
BEGIN
	SET NOCOUNT ON;

	with zbiorczo as (
		select dok.typ     typ,
			   dok.RokMc,
			   count(distinct dok.id_dok)    ilosc_dok,
			   count(distinct poz.id_dok + convert(varchar,poz.pozid))    ilosc_poz
		FROM stat.dgv_kopia_istat_dekl_wynik_dok as dok
		INNER JOIN stat.dgv_kopia_istat_dekl_wynik_poz as poz ON dok.id_dok = poz.id_dok
		where dok.[Status] != 'U' AND poz.[Status] = 'Y'
		GROUP BY dok.typ, dok.RokMc
		UNION ALL 
		select dok.typ  as   typ,
			   dok.RokMc,
			   count(distinct dok.id_dok)    ilosc_dok,
			   0    ilosc_poz
		from stat.dgv_kopia_istat_dekl_wynik_dok as dok
		where dok.[Status] != 'U' 
			and not exists (select 1 from stat.dgv_kopia_istat_dekl_wynik_poz poz where dok.id_dok = poz.id_dok)
		group by dok.typ, dok.RokMc
	) 

	select typ,
			RokMc % 100 as miesiac,
			RokMc / 100 as rok,
		   sum(ilosc_dok) ilosc_dok,
		   sum(ilosc_poz) ilosc_poz
	from zbiorczo
	where RokMc between @RokMcOd and @RokMcDo
	group by typ, RokMc

END