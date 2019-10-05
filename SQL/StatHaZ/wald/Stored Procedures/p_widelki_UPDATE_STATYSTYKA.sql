CREATE PROCEDURE [wald].p_widelki_UPDATE_STATYSTYKA
AS

EXEC wald.p_widelki_DO_ARCHIWUM

UPDATE	[stat].dgt_kopia_istat_dekl_wynik_poz
SET		uzup_jm=pr.nowa_wartosc
FROM 		[stat].dgt_kopia_istat_dekl_wynik_poz poz INNER JOIN v_widelki_POPRAWIONE_REKORDY_INTR_UJM pr 
			ON poz.id_dok=pr.id_dok and poz.pozid=pr.id_dok_pozid

--SELECT	'intr ujm - zaktualizowano '+CONVERT(VARCHAR,(SELECT @@ROWCOUNT))+' rekordów'

UPDATE	[stat].dgt_kopia_istat_dekl_wynik_poz
SET		masa_netto=pr.nowa_wartosc
FROM 		[stat].dgt_kopia_istat_dekl_wynik_poz poz INNER JOIN v_widelki_POPRAWIONE_REKORDY_INTR_MASA pr 
			ON poz.id_dok=pr.id_dok and poz.pozid=pr.id_dok_pozid

--SELECT	'intr masa - zaktualizowano '+CONVERT(VARCHAR,(SELECT @@ROWCOUNT))+' rekordów'

UPDATE	[stat].dgt_kopia_v2_sad_dpdz_tow
SET		[IloscUzupelniajacaJm]=pr.nowa_wartosc
FROM		[stat].dgt_kopia_v2_sad_dpdz_tow tow INNER JOIN v_widelki_POPRAWIONE_REKORDY_SAD_UJM pr
			ON tow.[IdDokNr]=pr.[idDokNr] AND tow.[PozId]=pr.[idDokNr_pozid]

--SELECT 'sad ujm - zaktualizowano '+CONVERT(VARCHAR,(SELECT @@ROWCOUNT))+' rekordów'

--ECS
UPDATE	[stat].dgt_kopia_ecs_exp_goods_item
SET		gi_quantity_suppl_unit=pr.nowa_wartosc
FROM		[stat].dgt_kopia_ecs_exp_goods_item gi INNER JOIN v_widelki_POPRAWIONE_REKORDY_SAD_UJM pr
			ON gi.declcoexport_decl_id=pr.[idDokNr] AND gi.[id]=pr.[idDokNr_pozid]

--SELECT 'ecs ujm - zaktualizowano '+CONVERT(VARCHAR,(SELECT @@ROWCOUNT))+' rekordów'