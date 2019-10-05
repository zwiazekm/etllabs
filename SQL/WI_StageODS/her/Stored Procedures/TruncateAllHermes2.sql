-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-21
-- Description:	Procedura czyści wszystkie tabele przygotowując je do zasilenia (przyrostowego) z systemu Hermes2.
-- =============================================
CREATE PROCEDURE [her].[TruncateAllHermes2]
AS
BEGIN
	SET NOCOUNT ON;
		TRUNCATE TABLE her.ad_org_typ;
		TRUNCATE TABLE her.ad_org_etat;
		TRUNCATE TABLE her.ka_dp25;
		TRUNCATE TABLE her.ad_kat_org;
		TRUNCATE TABLE her.ka_dp001;
		TRUNCATE TABLE her.ka_dp002;
		TRUNCATE TABLE her.ka_dp004;
		TRUNCATE TABLE her.ka_dp010f;
		TRUNCATE TABLE her.ka_sl001;
		TRUNCATE TABLE her.ka_dp020;
		TRUNCATE TABLE her.ka_dp020wym;
END