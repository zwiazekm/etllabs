-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-28
-- Description:	Procedura czyści wszystkie tabele znajdujące się w WA_StageHurtownia przygotowując je do zasilenia (przyrostowego) z systemu DSC
-- =============================================

CREATE PROCEDURE [dsc].[TruncateAllStageDSC]
AS
BEGIN
	SET NOCOUNT ON;
			TRUNCATE TABLE dsc.TypJednostkiOrganizacyjnej;
			TRUNCATE TABLE dsc.Stanowisko;
			TRUNCATE TABLE dsc.Slownik;
			TRUNCATE TABLE dsc.Pracownik;
			TRUNCATE TABLE dsc.Umowa;
			TRUNCATE TABLE dsc.RodzajWyksztalcenia;
			TRUNCATE TABLE dsc.StopienSluzbowy;
			TRUNCATE TABLE dsc.StatusZatrudnienia;
			TRUNCATE TABLE dsc.Zatrudnienie;
			TRUNCATE TABLE dsc.WymiarEtatu;
			TRUNCATE TABLE dsc.JednostkaOrganizacyjna;
	END