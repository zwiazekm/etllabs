--========================================
--Author: Tomasz Pióro
--Date: 2014-08-12
--Description: Procedura usuwania danych za konkretny rok w systemie EMCS.
--========================================

CREATE PROCEDURE [a2].[ArchEMCSUsunDaneZaRok]
	@Rok int
AS
	DECLARE @DataOd DATE = DATEFROMPARTS(@Rok+0, 1, 1);
	DECLARE @DataDo DATE = DATEFROMPARTS(@Rok+1, 1, 1);

	SET XACT_ABORT ON;
	BEGIN TRANSACTION;

	DELETE t FROM [emcs].[TFILE] t
	WHERE t.CREATEDON <= @DataOd and t.CREATEDON < @DataDo;

	COMMIT TRANSACTION;

RETURN 0