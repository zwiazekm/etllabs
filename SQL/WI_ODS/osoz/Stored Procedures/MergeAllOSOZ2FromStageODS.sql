
-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2014-05-29
-- Description:	
-- =============================================

CREATE PROCEDURE [osoz].[MergeAllOSOZ2FromStageODS]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [osoz].[MergeTableFromStageODS] 'kontrahenci';
	EXEC [osoz].[MergeTableFromStageODS] 'pozwolenia';
	EXEC [osoz].[MergeTableFromStageODS] 'sl_waluty';
	EXEC [osoz].[MergeTableFromStageODS] 'sl_kraje_ue';
	EXEC [osoz].[MergeTableFromStageODS] 'struktura_organizacyjna';
	EXEC [osoz].[MergeTableFromStageODS] 'towary_potencjalnie_wrazliwe';
	EXEC [osoz].[MergeTableFromStageODS] 'gwaranci';
	EXEC [osoz].[MergeTableFromStageODS] 'forma_zabezpieczenia';
	EXEC [osoz].[MergeTableFromStageODS] 'gwarancje';
	EXEC [osoz].[MergeTableFromStageODS] 'zabezpieczenia';
	EXEC [osoz].[MergeTableFromStageODS] 'zwrot_kwoty_zabezpieczenia';
	EXEC [osoz].[MergeTableFromStageODS] 'zezwolenia_gry_hazardowe';
	EXEC [osoz].[MergeTableFromStageODS] 'rodzaje_dzialalnosci_dla_koncesji_zezwolen';
	EXEC [osoz].[MergeTableFromStageODS] 'towary';
	EXEC [osoz].[MergeTableFromStageODS] 'zabezpieczenia_towary';
	EXEC [osoz].[MergeTableFromStageODS] 'zabezpieczenia_generalne_procedury';
	EXEC [osoz].[MergeTableFromStageODS] 'procedury_celne';
	EXEC [osoz].[MergeTableFromStageODS] 'procedury_pdr';
	EXEC [osoz].[MergeTableFromStageODS] 'zabezpieczenia_generalne_procedury_procedury';
	EXEC [osoz].[MergeTableFromStageODS] 'sl_ograniczenie_waznosci';
	EXEC [osoz].[MergeTableFromStageODS] 'zabezpieczenia_sl_ograniczenie_waznosci';
	EXEC [osoz].[MergeTableFromStageODS] 'sl_nazwy_seed';
	EXEC [osoz].[MergeTableFromStageODS] 'status_kontrahenta';
	EXEC [osoz].[MergeTableFromStageODS] 'zabezpieczenia_status_kontrahenta';
	EXEC [osoz].[MergeTableFromStageODS] 'decyzje_w_sprawie_zwolnienia';
	EXEC [osoz].[MergeTableFromStageODS] 'decyzcje_zwolnienia_seed';
	EXEC [osoz].[MergeTableFromStageODS] 'dokumenty_obciazajace';
	EXEC [osoz].[MergeTableFromStageODS] 'uzycia_zabezpieczenia';
	EXEC [osoz].[MergeTableFromStageODS] 'procedury_akcyzowe';
	EXEC [osoz].[MergeTableFromStageODS] 'zabezpieczenia_procedury_akcyzowe';
	EXEC [osoz].[MergeTableFromStageODS] 'hipoteki';
	EXEC [osoz].[MergeTableFromStageODS] 'zabezpieczenie_forma_zabezpieczenia_gier';
	EXEC [osoz].[MergeTableFromStageODS] 'uzupelnienia_kwoty';
	EXEC [osoz].[MergeTableFromStageODS] 'pokwitowania';
	EXEC [osoz].[MergeTableFromStageODS] 'kwoty_na_zabezpieczeniach';
	EXEC [osoz].[MergeTableFromStageODS] 'inna_forma';
	EXEC [osoz].[MergeTableFromStageODS] 'dokumenty_windykacyjne';
	EXEC [osoz].[MergeTableFromStageODS] 'potwierdzenia';
	EXEC [osoz].[MergeTableFromStageODS] 'potwierdzenia_na_zabezpieczeniu';
	EXEC [osoz].[MergeTableFromStageODS] 'gwarancje_na_pokwitowaniach';
	EXEC [osoz].[MergeTableFromStageODS] 'zaswiadczenia_tc';
	EXEC [osoz].[MergeTableFromStageODS] 'gwarancje_na_zabezpieczeniach';
	EXEC [osoz].[MergeTableFromStageODS] 'pokwitowania_procedury_akcyzowe';
	EXEC [osoz].[MergeTableFromStageODS] 'pokwitowanie_seed';
	EXEC [osoz].[MergeTableFromStageODS] 'zabezpieczenia_procedury_celne';
	EXEC [osoz].[MergeTableFromStageODS] 'zabezpieczenia_struktury_organizacyjne';
END