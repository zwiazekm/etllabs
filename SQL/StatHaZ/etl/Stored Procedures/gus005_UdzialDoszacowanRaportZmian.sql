CREATE PROCEDURE [etl].[gus005_UdzialDoszacowanRaportZmian]
AS
	select [dbo].[KonwertujOkresNaMMYY] (bd_RokMc) as bd_mmrr,
		   bd_rodzaj        ,
		   bd_tabela        ,
		   bd_bledna_wartosc,
		   bd_nowa_wartosc  ,
		   bd_iddoknr       ,
		   bd_id_dok        ,
		   bd_iddoknr_pozid ,
		   bd_id_dok_pozid  ,
		   bd_do_usuniecia  ,
		   bd_koment        
	from stat.dgt_bledne_dane
	where bd_autor = 'gus'
RETURN 0