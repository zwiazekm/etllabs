-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-08-19
-- Description:	Merge z [$(WA_StageHurtownia)] do WA_Hurtownia.
-- =============================================

CREATE PROCEDURE [fk].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END

	IF @TableName = 'Podmiot' BEGIN
		MERGE INTO fk.Podmiot AS tgt
		USING [WA_StageHurtownia].fk.Podmiot AS src
		ON (tgt.IdPodmiotu=src.IdPodmiotu AND tgt.IdKomorki=src.IdKomorki)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Gmina=src.Gmina, tgt.KodPocztowy=src.KodPocztowy, tgt.Kraj=src.Kraj, tgt.Miejscowosc=src.Miejscowosc, tgt.NazwaKrotka=src.NazwaKrotka, tgt.NazwaPelna=src.NazwaPelna, tgt.NIP=src.NIP, tgt.NumerDomu=src.NumerDomu, tgt.NumerLokalu=src.NumerLokalu, tgt.NumerPaszportu=src.NumerPaszportu, tgt.PESEL=src.PESEL, tgt.Powiat=src.Powiat, tgt.REGON=src.REGON, tgt.RodzajPodmiotu=src.RodzajPodmiotu, tgt.Ulica=src.Ulica, tgt.Wojewodztwo=src.Wojewodztwo
		WHEN NOT MATCHED
		THEN INSERT (IdPodmiotu, IdKomorki, Gmina, KodPocztowy, Kraj, Miejscowosc, NazwaKrotka, NazwaPelna, NIP, NumerDomu, NumerLokalu, NumerPaszportu, PESEL, Powiat, REGON, RodzajPodmiotu, Ulica, Wojewodztwo)
		VALUES (src.IdPodmiotu, src.IdKomorki, src.Gmina, src.KodPocztowy, src.Kraj, src.Miejscowosc, src.NazwaKrotka, src.NazwaPelna, src.NIP, src.NumerDomu, src.NumerLokalu, src.NumerPaszportu, src.PESEL, src.Powiat, src.REGON, src.RodzajPodmiotu, src.Ulica, src.Wojewodztwo);
		SET @Merged = 1;
	END
	
	IF @TableName = 'Decyzja65' BEGIN
		MERGE INTO fk.Decyzja65 AS tgt
		USING [WA_StageHurtownia].fk.Decyzja65 AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdPodmiotu=src.IdPodmiotu, tgt.IdKomorki=src.IdKomorki, tgt.IDRodzajuDokumentu=src.IDRodzajuDokumentu, tgt.NumerDecyzji=src.NumerDecyzji, tgt.DataDecyzji=src.DataDecyzji, tgt.OdsetkiZaplacone=src.OdsetkiZaplacone, tgt.Status=src.Status, tgt.NumerDokumentuSprawy=src.NumerDokumentuSprawy
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPodmiotu, IdKomorki, IDRodzajuDokumentu, NumerDecyzji, DataDecyzji, OdsetkiZaplacone, Status, NumerDokumentuSprawy)
		VALUES (src.IdDok, src.IdPodmiotu, src.IdKomorki, src.IDRodzajuDokumentu, src.NumerDecyzji, src.DataDecyzji, src.OdsetkiZaplacone, src.Status, src.NumerDokumentuSprawy);
		SET @Merged = 1;
	END

	IF @TableName = 'EwidencjaNaleznosci' BEGIN
		MERGE INTO fk.EwidencjaNaleznosci AS tgt
		USING [WA_StageHurtownia].fk.EwidencjaNaleznosci AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPodmiotu=src.IdPodmiotu AND tgt.IdKomorki=src.IdKomorki)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KwotaDecyzji=src.KwotaDecyzji, tgt.IdJednostki=src.IdJednostki, tgt.KwotaNaleznosci=src.KwotaNaleznosci, tgt.SaldoNaEwidencji=src.SaldoNaEwidencji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPodmiotu, IdKomorki, KwotaDecyzji, IdJednostki, KwotaNaleznosci, SaldoNaEwidencji)
		VALUES (src.IdDok, src.IdPodmiotu, src.IdKomorki, src.KwotaDecyzji, src.IdJednostki, src.KwotaNaleznosci, src.SaldoNaEwidencji);
		SET @Merged = 1;
	END

	IF @TableName = 'Wplaty' BEGIN
		MERGE INTO fk.Wplaty AS tgt
		USING [WA_StageHurtownia].fk.Wplaty AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdDokStowarzysz=src.IdDokStowarzysz, tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.Korekta=src.Korekta, tgt.Kwota=src.Kwota
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, IdDokStowarzysz, RodzajNaleznosci, Korekta, Kwota)
		VALUES (src.IdDok, src.NumerPozycji, src.IdDokStowarzysz, src.RodzajNaleznosci, src.Korekta, src.Kwota);
		SET @Merged = 1;
	END

	IF @TableName = 'Mandaty' BEGIN
		MERGE INTO fk.Mandaty AS tgt
		USING [WA_StageHurtownia].fk.Mandaty AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.IdJednostki=src.IdJednostki, tgt.IdRodzajuDokumentu=src.IdRodzajuDokumentu, tgt.Status=src.Status, tgt.DataKsiegowania=src.DataKsiegowania, tgt.DataUkarania=src.DataUkarania, tgt.DataWystawieniaDokumentu=src.DataWystawieniaDokumentu, tgt.DataZamkniecia=src.DataZamkniecia, tgt.RodzajMandatu=src.RodzajMandatu, tgt.SymbolDokumentu=src.SymbolDokumentu, tgt.TerminPlatnosci=src.TerminPlatnosci
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, IdJednostki, IdRodzajuDokumentu, Status, DataKsiegowania, DataUkarania, DataWystawieniaDokumentu, DataZamkniecia, RodzajMandatu, SymbolDokumentu, TerminPlatnosci)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.IdJednostki, src.IdRodzajuDokumentu, src.Status, src.DataKsiegowania, src.DataUkarania, src.DataWystawieniaDokumentu, src.DataZamkniecia, src.RodzajMandatu, src.SymbolDokumentu, src.TerminPlatnosci);
		SET @Merged = 1;
	END

	IF @TableName = 'PozycjeDokumentu' BEGIN
		MERGE INTO fk.PozycjeDokumentu AS tgt
		USING [WA_StageHurtownia].fk.PozycjeDokumentu AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TypOplaty=src.TypOplaty, tgt.KwotaNaleznosci=src.KwotaNaleznosci
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, TypOplaty, KwotaNaleznosci)
		VALUES (src.IdDok, src.NumerPozycji, src.TypOplaty, src.KwotaNaleznosci);
		SET @Merged = 1;
	END

	IF @TableName = 'Uszczuplenia' BEGIN
		MERGE INTO fk.Uszczuplenia AS tgt
		USING [WA_StageHurtownia].fk.Uszczuplenia AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycjiUszczuplenia=src.NumerPozycjiUszczuplenia)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.KwotaUszczuplenia=src.KwotaUszczuplenia
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycjiUszczuplenia, RodzajNaleznosci, KwotaUszczuplenia)
		VALUES (src.IdDok, src.NumerPozycjiUszczuplenia, src.RodzajNaleznosci, src.KwotaUszczuplenia);
		SET @Merged = 1;
	END

	IF @TableName = 'KwalifikacjePrawne' BEGIN
		MERGE INTO fk.KwalifikacjePrawne AS tgt
		USING [WA_StageHurtownia].fk.KwalifikacjePrawne AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycjiKwalifikacji=src.NumerPozycjiKwalifikacji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKwalifikacji=src.IdKwalifikacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycjiKwalifikacji, IdKwalifikacji)
		VALUES (src.IdDok, src.NumerPozycjiKwalifikacji, src.IdKwalifikacji);
		SET @Merged = 1;
	END

	IF @TableName = 'Slowniki' BEGIN
		MERGE INTO fk.Slowniki AS tgt
		USING [WA_StageHurtownia].fk.Slowniki AS src
		ON (tgt.IdRodzajuSlownika=src.IdRodzajuSlownika AND tgt.IdSlownika=src.IdSlownika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaKwalifikacji=src.NazwaKwalifikacji
		WHEN NOT MATCHED
		THEN INSERT (IdRodzajuSlownika, IdSlownika, NazwaKwalifikacji)
		VALUES (src.IdRodzajuSlownika, src.IdSlownika, src.NazwaKwalifikacji);
		SET @Merged = 1;
	END

	IF @TableName = 'SprawyDluzne' BEGIN
		MERGE INTO fk.SprawyDluzne AS tgt
		USING [WA_StageHurtownia].fk.SprawyDluzne AS src
		ON (tgt.IdDokumentuSprawy=src.IdDokumentuSprawy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.IdJednostki=src.IdJednostki, tgt.IdRodzajuDokumentu=src.IdRodzajuDokumentu, tgt.SymbolDokumentu=src.SymbolDokumentu, tgt.DataWystawieniaDokumentu=src.DataWystawieniaDokumentu, tgt.DataPowstaniaZadluzenia=src.DataPowstaniaZadluzenia, tgt.DataSplaceniaZadluzenia=src.DataSplaceniaZadluzenia, tgt.StatusSprawy=src.StatusSprawy, tgt.DataSkierowaniaDoDluznika=src.DataSkierowaniaDoDluznika, tgt.PrzyczynyZadluzenia=src.PrzyczynyZadluzenia
		WHEN NOT MATCHED
		THEN INSERT (IdDokumentuSprawy, IdKomorki, IdPodmiotu, IdJednostki, IdRodzajuDokumentu, SymbolDokumentu, DataWystawieniaDokumentu, DataPowstaniaZadluzenia, DataSplaceniaZadluzenia, StatusSprawy, DataSkierowaniaDoDluznika, PrzyczynyZadluzenia)
		VALUES (src.IdDokumentuSprawy, src.IdKomorki, src.IdPodmiotu, src.IdJednostki, src.IdRodzajuDokumentu, src.SymbolDokumentu, src.DataWystawieniaDokumentu, src.DataPowstaniaZadluzenia, src.DataSplaceniaZadluzenia, src.StatusSprawy, src.DataSkierowaniaDoDluznika, src.PrzyczynyZadluzenia);
		SET @Merged = 1;
	END

	IF @TableName = 'PodmiotDluzny' BEGIN
		MERGE INTO fk.PodmiotDluzny AS tgt
		USING [WA_StageHurtownia].fk.PodmiotDluzny AS src
		ON (tgt.IdPodmiotu=src.IdPodmiotu AND tgt.IdKomorki=src.IdKomorki)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodPocztowy=src.KodPocztowy, tgt.Kraj=src.Kraj, tgt.Miejscowosc=src.Miejscowosc, tgt.NazwaKrotka=src.NazwaKrotka, tgt.NIP=src.NIP, tgt.NumerDomu=src.NumerDomu, tgt.NumerLokalu=src.NumerLokalu, tgt.PESEL=src.PESEL, tgt.REGON=src.REGON, tgt.Ulica=src.Ulica
		WHEN NOT MATCHED
		THEN INSERT (IdPodmiotu, IdKomorki, KodPocztowy, Kraj, Miejscowosc, NazwaKrotka, NIP, NumerDomu, NumerLokalu, PESEL, REGON, Ulica)
		VALUES (src.IdPodmiotu, src.IdKomorki, src.KodPocztowy, src.Kraj, src.Miejscowosc, src.NazwaKrotka, src.NIP, src.NumerDomu, src.NumerLokalu, src.PESEL, src.REGON, src.Ulica);
		SET @Merged = 1;
	END

	IF @TableName = 'PodmiotSolidarny' BEGIN
		MERGE INTO fk.PodmiotSolidarny AS tgt
		USING [WA_StageHurtownia].fk.PodmiotSolidarny AS src
		ON (tgt.IdDokumentuSprawy=src.IdDokumentuSprawy AND tgt.IdPodmiotu=src.IdPodmiotu AND tgt.IdKomorki=src.IdKomorki)
		WHEN NOT MATCHED
		THEN INSERT (IdDokumentuSprawy, IdPodmiotu, IdKomorki)
		VALUES (src.IdDokumentuSprawy, src.IdPodmiotu, src.IdKomorki);
		SET @Merged = 1;
	END

	IF @TableName = 'SprawozdanieMeldunkowe' BEGIN
		MERGE INTO fk.SprawozdanieMeldunkowe AS tgt
		USING [WA_StageHurtownia].fk.SprawozdanieMeldunkowe AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdJednostki=src.IdJednostki, tgt.IdRodzajuDokumentu=src.IdRodzajuDokumentu, tgt.SymbolDokumentu=src.SymbolDokumentu, tgt.DataWystawieniaDokumentu=src.DataWystawieniaDokumentu, tgt.Status=src.Status, tgt.DataZamkniecia=src.DataZamkniecia, tgt.DataWykonania=src.DataWykonania, tgt.DataDo=src.DataDo, tgt.OkresOd=src.OkresOd, tgt.OkresDo=src.OkresDo
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdJednostki, IdRodzajuDokumentu, SymbolDokumentu, DataWystawieniaDokumentu, Status, DataZamkniecia, DataWykonania, DataDo, OkresOd, OkresDo)
		VALUES (src.IdDok, src.IdJednostki, src.IdRodzajuDokumentu, src.SymbolDokumentu, src.DataWystawieniaDokumentu, src.Status, src.DataZamkniecia, src.DataWykonania, src.DataDo, src.OkresOd, src.OkresDo);
		SET @Merged = 1;
	END

	IF @TableName = 'ZestawienieWZPW' BEGIN
		MERGE INTO fk.ZestawienieWZPW AS tgt
		USING [WA_StageHurtownia].fk.ZestawienieWZPW AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Dzial=src.Dzial, tgt.Rozdzial=src.Rozdzial, tgt.Paragraf=src.Paragraf, tgt.KwotaWZPWPlan=src.KwotaWZPWPlan, tgt.KwotaWZPWWykonana=src.KwotaWZPWWykonana, tgt.KwotaWZPWSaldo=src.KwotaWZPWSaldo, tgt.KwotaWZPWProcentoweWykonanie=src.KwotaWZPWProcentoweWykonanie, tgt.WZPWOpis=src.WZPWOpis
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, Dzial, Rozdzial, Paragraf, KwotaWZPWPlan, KwotaWZPWWykonana, KwotaWZPWSaldo, KwotaWZPWProcentoweWykonanie, WZPWOpis)
		VALUES (src.IdDok, src.NumerPozycji, src.Dzial, src.Rozdzial, src.Paragraf, src.KwotaWZPWPlan, src.KwotaWZPWWykonana, src.KwotaWZPWSaldo, src.KwotaWZPWProcentoweWykonanie, src.WZPWOpis);
		SET @Merged = 1;
	END

	IF @TableName = 'ZestawienieWZPD' BEGIN
		MERGE INTO fk.ZestawienieWZPD AS tgt
		USING [WA_StageHurtownia].fk.ZestawienieWZPD AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Dzial=src.Dzial, tgt.Rozdzial=src.Rozdzial, tgt.Paragraf=src.Paragraf, tgt.KwotaWZPDPlan=src.KwotaWZPDPlan, tgt.KwotaWZPDWykonana=src.KwotaWZPDWykonana, tgt.KwotaWZPDSaldo=src.KwotaWZPDSaldo, tgt.KwotaWZPDProcentoweWykonanie=src.KwotaWZPDProcentoweWykonanie, tgt.WZPDOpis=src.WZPDOpis
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, Dzial, Rozdzial, Paragraf, KwotaWZPDPlan, KwotaWZPDWykonana, KwotaWZPDSaldo, KwotaWZPDProcentoweWykonanie, WZPDOpis)
		VALUES (src.IdDok, src.NumerPozycji, src.Dzial, src.Rozdzial, src.Paragraf, src.KwotaWZPDPlan, src.KwotaWZPDWykonana, src.KwotaWZPDSaldo, src.KwotaWZPDProcentoweWykonanie, src.WZPDOpis);
		SET @Merged = 1;
	END

	IF @TableName = 'ZestawienieWBPD' BEGIN
		MERGE INTO fk.ZestawienieWBPD AS tgt
		USING [WA_StageHurtownia].fk.ZestawienieWBPD AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Dzial=src.Dzial, tgt.Rozdzial=src.Rozdzial, tgt.Paragraf=src.Paragraf, tgt.Tytul=src.Tytul, tgt.KwotaWBPDWykonania=src.KwotaWBPDWykonania, tgt.WBPDOpisParagrafu=src.WBPDOpisParagrafu, tgt.WBPDOpisTytulu=src.WBPDOpisTytulu
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, Dzial, Rozdzial, Paragraf, Tytul, KwotaWBPDWykonania, WBPDOpisParagrafu, WBPDOpisTytulu)
		VALUES (src.IdDok, src.NumerPozycji, src.Dzial, src.Rozdzial, src.Paragraf, src.Tytul, src.KwotaWBPDWykonania, src.WBPDOpisParagrafu, src.WBPDOpisTytulu);
		SET @Merged = 1;
	END

	IF @TableName = 'ZestawienieWBPW' BEGIN
		MERGE INTO fk.ZestawienieWBPW AS tgt
		USING [WA_StageHurtownia].fk.ZestawienieWBPW AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Dzial=src.Dzial, tgt.Rozdzial=src.Rozdzial, tgt.Paragraf=src.Paragraf, tgt.Tytul=src.Tytul, tgt.KwotaWBPWWykonania=src.KwotaWBPWWykonania, tgt.WBPWOpisParagrafu=src.WBPWOpisParagrafu, tgt.WBPWOpisTytulu=src.WBPWOpisTytulu
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, Dzial, Rozdzial, Paragraf, Tytul, KwotaWBPWWykonania, WBPWOpisParagrafu, WBPWOpisTytulu)
		VALUES (src.IdDok, src.NumerPozycji, src.Dzial, src.Rozdzial, src.Paragraf, src.Tytul, src.KwotaWBPWWykonania, src.WBPWOpisParagrafu, src.WBPWOpisTytulu);
		SET @Merged = 1;
	END

	IF @TableName = 'Zadluzenie' BEGIN
		MERGE INTO fk.Zadluzenie AS tgt
		USING [WA_StageHurtownia].fk.Zadluzenie AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.NumerSprawy=src.NumerSprawy, tgt.DataWystawieniaDokumentu=src.DataWystawieniaDokumentu, tgt.NumerTytuluWykonawczego=src.NumerTytuluWykonawczego, tgt.DataSkierowaniaDoEgzekucji=src.DataSkierowaniaDoEgzekucji, tgt.DataZakonczeniaEgzekucji=src.DataZakonczeniaEgzekucji, tgt.SposobZakonczeniaEgzekucji=src.SposobZakonczeniaEgzekucji, tgt.KwotaNaleznosci=src.KwotaNaleznosci
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, NumerSprawy, DataWystawieniaDokumentu, NumerTytuluWykonawczego, DataSkierowaniaDoEgzekucji, DataZakonczeniaEgzekucji, SposobZakonczeniaEgzekucji, KwotaNaleznosci)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.NumerSprawy, src.DataWystawieniaDokumentu, src.NumerTytuluWykonawczego, src.DataSkierowaniaDoEgzekucji, src.DataZakonczeniaEgzekucji, src.SposobZakonczeniaEgzekucji, src.KwotaNaleznosci);
		SET @Merged = 1;
	END

			IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END

END