-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2014-07-25
-- Description:	Procedura czyści wszystkie tabele zab przygotowując je do zasilenia (przyrostowego) z systemu WI_ODS
-- =============================================
CREATE PROCEDURE [zab].[TruncateAllStageZab]
AS
BEGIN

	SET NOCOUNT ON;

		TRUNCATE TABLE zab.Zabezpieczenia;
		TRUNCATE TABLE zab.Podmiot;
		TRUNCATE TABLE zab.StatusPodmiotu;
		TRUNCATE TABLE zab.Gwaranci;
		TRUNCATE TABLE zab.Gwarancja;
		TRUNCATE TABLE zab.Hipoteka;
		TRUNCATE TABLE zab.Potwierdzenie;
		TRUNCATE TABLE zab.OgraniczenieWaznosciZabezp;
		TRUNCATE TABLE zab.PokwitowaniePotwierdzenie;
		TRUNCATE TABLE zab.ProceduryAkcyzoweNaZabezp;
		TRUNCATE TABLE zab.StatusPodmiotuNaZabezp;
		TRUNCATE TABLE zab.WlasciwoscMiejscowa;
		TRUNCATE TABLE zab.ZlozenieZabezpieczenia;
		TRUNCATE TABLE zab.ProceduryCelne;
		TRUNCATE TABLE zab.ProceduryCelneNaZabezp;
END