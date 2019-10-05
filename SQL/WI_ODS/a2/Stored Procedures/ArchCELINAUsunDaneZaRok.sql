--========================================
--Author: Tomasz Pióro
--Date: 2014-08-11
--Description: Procedura usuwania danych za konkretny rok w systemie CELINA.
--========================================

CREATE PROCEDURE [a2].[ArchCELINAUsunDaneZaRok]
	@Rok int
AS
	DECLARE @DataOd DATE = DATEFROMPARTS(@Rok+0, 1, 1);
	DECLARE @DataDo DATE = DATEFROMPARTS(@Rok+1, 1, 1);

	SET XACT_ABORT ON;
	BEGIN TRANSACTION;

	DELETE ds FROM cel.v2_sad_gwar_niew_kraj ds
	INNER JOIN cel.v2_sad_gwarancja g ON g.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_sad_gwarancje gw ON gw.idDokNr = g.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = gw.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_transport_zamkniecie ds
	INNER JOIN cel.v2_transport tr ON tr.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = tr.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_transport ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_zamkniecie ds
	INNER JOIN cel.v2_dok_sad s ON s.idDokNr =ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = s.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_war_tow_korekta ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_towar_wrazliwy ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_szczegoly_wartosci ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_opakowanie ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_kontyngent ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_kontener AS ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_info_dodatkowaWPT ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_dpdz_srodek ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_dpdz_oplata ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_dpdz_kod_dodatkowy_UE ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_dpdz_kod_dodatkowy_PL ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_dpdz_info_dodatkowa ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_dpdz_ilosc_towaru ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_dok_wymaganyWPT ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_dok_poprzedni_WPT ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_dok_poprzedni ds
	INNER JOIN cel.v2_sad_dpdz_tow t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_pwd_zamkniecie ds
	INNER JOIN cel.v2_dok_pwd p ON p.[idDokNr] = ds.[idDokNr]
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = p.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_kontener_zamkniecie ds
	INNER JOIN cel.v2_kontener k ON k.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = k.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_kontener ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_dpdz ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_dyrektywy ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_zrodl AS ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_sad AS ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_pzc ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_pwd AS ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_ppzc ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_powiazania AS ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_poprz ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_pod ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_operacje ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_ds_odbiorca ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_ds_dok_wymagany ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_wymagany ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_pwd_kontener ds
	INNER JOIN cel.v2_towar t ON t.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_towar ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE o FROM [cel].[v2_pod_oplata] o
	INNER JOIN [cel].[v2_dok_info] d ON d.[idDokNr] = o.[idDokNr]
	WHERE d.[DataPrzyjecia] >= @DataOd and d.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_odbiorca ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_nadawca ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_UC ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_transport ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_gwarancja ds
	INNER JOIN cel.v2_sad_gwarancje i ON i.idDokNr = ds.idDokNr
	INNER JOIN cel.v2_dok_info n ON n.[idDokNr] = i.idDokNr
	WHERE n.[DataPrzyjecia] >= @DataOd and n.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_sad_gwarancje as ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE t FROM cel.v2_sad_dpdz_dok_wymagany t
	INNER JOIN cel.v2_sad_dpdz_tow dp ON dp.idDokNr = t.idDokNr
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = dp.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE t FROM cel.v2_sad_dpdz_tow t
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = t.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_ds ds
	INNER JOIN cel.v2_dok_info i ON i.idDokNr = ds.idDokNr
	WHERE i.[DataPrzyjecia] >= @DataOd and i.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.v2_dok_info ds
	WHERE ds.[DataPrzyjecia] >= @DataOd and ds.[DataPrzyjecia] < @DataDo;

	DELETE ds FROM cel.zamkn_celne ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.towar_oplaty ds
	INNER JOIN cel.towar t ON t.id_dok = ds.id_dok
	INNER JOIN cel.dok_info i ON i.id_dok = t.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.towar ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.st_PrzyWy ds
	INNER JOIN cel.dok_st s ON s.id_dok = ds.id_dok
	INNER JOIN cel.dok_info i ON i.id_dok = s.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.ProcPU ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.PozwolPU ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.numer_rej ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.kontenery ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.dok_tranzyt ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.dok_st ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.dok_sadg ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.dok_pw ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.dok_psp ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.dok_powiazania ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.dok_operacje ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.dok_inny ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.dok_dyrektywy ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE d FROM cel.[dok_info] d
	WHERE d.[DataPrzyjEwid] >= @DataOd and d.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.dok_dhu ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	DELETE ds FROM cel.dok_dp ds
	INNER JOIN cel.dok_info i ON i.id_dok = ds.id_dok
	WHERE i.[DataPrzyjEwid] >= @DataOd and i.[DataPrzyjEwid] < @DataDo;

	COMMIT TRANSACTION;

RETURN 0