--========================================
--Author: Tomasz Pióro
--Date: 2014-08-07
--Description: Procedura usuwania danych za konkretny rok w systemie Intrastat.
--========================================

CREATE PROCEDURE [a2].[ArchIntrastatUsunDaneZaRok]
	@Rok int
AS
	DECLARE @DataOd DATE = DATEFROMPARTS(@Rok+0, 1, 1);
	DECLARE @DataDo DATE = DATEFROMPARTS(@Rok+1, 1, 1);

	SET XACT_ABORT ON;
	BEGIN TRANSACTION;

	DELETE FROM int.intr_okres_sprawozd WHERE [rok] = @Rok;

	DELETE i FROM int.istat_zmiana_danych i
	INNER JOIN int.istat_zdarzenie iz ON iz.id_zdarzenia = i.id_zdarzenia
	INNER JOIN int.istat_dekl_wynik_dok ist ON ist.id_dok = iz.id_dok_dekl_wynik
	WHERE ist.[rok] = @Rok;

	DELETE i FROM int.istat_zdarzenie i
	INNER JOIN int.istat_dekl_wynik_dok d ON d.[id_dok] = i.[id_dok_dekl_wynik]
	WHERE d.[rok] = @Rok;

	DELETE i FROM int.istat_dekl_wynik_blad i
	INNER JOIN int.istat_dekl_wynik_dok d ON d.id_dok = i.id_dok
	WHERE d.[rok] = @Rok;

	DELETE i FROM int.istat_dekl_wynik_poz i
	INNER JOIN int.istat_dekl_wynik_dok d ON d.id_dok = i.id_dok
	WHERE d.[rok] = @Rok;

	DELETE FROM int.istat_dekl_wynik_dok WHERE [rok] = @Rok;

	DELETE FROM int.istat_dok_zrodlowy WHERE istat_dok_zrodlowy.data_wpr_zrd >= @DataOd and istat_dok_zrodlowy.data_wpr_zrd < @DataDo;

	DELETE FROM int.intr_ustalenia WHERE [rok] = @Rok;

	DELETE FROM int.intr_rdin WHERE [rok] = @Rok;

	DELETE FROM int.dokumenty WHERE dokumenty.dat_wystaw_dok >= @DataOd AND dokumenty.dat_wystaw_dok < @DataDo;

	COMMIT TRANSACTION;

RETURN 0