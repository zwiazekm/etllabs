
-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-07-28
-- Description:	Merge z WA_StageHurtownia do WA_Hurtownia.
-- =============================================

CREATE PROCEDURE [akc].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END

	IF @TableName = 'Podmiot' BEGIN
		MERGE INTO akc.Podmiot AS tgt
		USING [WA_StageHurtownia].akc.Podmiot AS src
		ON (tgt.IdKomorki=src.IdKomorki AND tgt.IdPodmiotu=src.IdPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NIP=src.NIP, tgt.REGON=src.REGON, tgt.PESEL=src.PESEL, tgt.PelnaNazwa=src.PelnaNazwa, tgt.Ulica=src.Ulica, tgt.NumerDomu=src.NumerDomu, tgt.NumerLokalu=src.NumerLokalu, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Wojewodztwo=src.Wojewodztwo
		WHEN NOT MATCHED
		THEN INSERT (IdKomorki, IdPodmiotu, NIP, REGON, PESEL, PelnaNazwa, Ulica, NumerDomu, NumerLokalu, KodPocztowy, Miejscowosc, Wojewodztwo)
		VALUES (src.IdKomorki, src.IdPodmiotu, src.NIP, src.REGON, src.PESEL, src.PelnaNazwa, src.Ulica, src.NumerDomu, src.NumerLokalu, src.KodPocztowy, src.Miejscowosc, src.Wojewodztwo);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_Deklaracja' BEGIN
		MERGE INTO akc.AKC3_Deklaracja AS tgt
		USING [WA_StageHurtownia].akc.AKC3_Deklaracja AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IdDokStowarzysz=src.IdDokStowarzysz, tgt.NumerDokumentuStowarzysz=src.NumerDokumentuStowarzysz, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.RokZlozeniaDok=src.RokZlozeniaDok, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.RazemPodatekAkcyzowy=src.RazemPodatekAkcyzowy, tgt.WartoscZnakowAkcyzy=src.WartoscZnakowAkcyzy, tgt.KwotaWplatDziennych=src.KwotaWplatDziennych, tgt.KwotaNadwyzDoRozlicz=src.KwotaNadwyzDoRozlicz, tgt.KwotaNadwyzPoprzedMies=src.KwotaNadwyzPoprzedMies, tgt.DoZaplaty=src.DoZaplaty, tgt.NadwyzWplatDoRozlicz=src.NadwyzWplatDoRozlicz, tgt.DeklaracjaZerowa=src.DeklaracjaZerowa, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IdDokStowarzysz, NumerDokumentuStowarzysz, ZnacznikKorekty, Status, RokZlozeniaDok, DataRejestrDokWSyst, DeklaracjaZaOkres, MiejsceZlozeniaDok, DataZlozeniaDok, DataWplywuDok, TerminPlatnosci, RazemPodatekAkcyzowy, WartoscZnakowAkcyzy, KwotaWplatDziennych, KwotaNadwyzDoRozlicz, KwotaNadwyzPoprzedMies, DoZaplaty, NadwyzWplatDoRozlicz, DeklaracjaZerowa, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IdDokStowarzysz, src.NumerDokumentuStowarzysz, src.ZnacznikKorekty, src.Status, src.RokZlozeniaDok, src.DataRejestrDokWSyst, src.DeklaracjaZaOkres, src.MiejsceZlozeniaDok, src.DataZlozeniaDok, src.DataWplywuDok, src.TerminPlatnosci, src.RazemPodatekAkcyzowy, src.WartoscZnakowAkcyzy, src.KwotaWplatDziennych, src.KwotaNadwyzDoRozlicz, src.KwotaNadwyzPoprzedMies, src.DoZaplaty, src.NadwyzWplatDoRozlicz, src.DeklaracjaZerowa, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_PodatekWedlugGrup' BEGIN
		MERGE INTO akc.AKC3_PodatekWedlugGrup AS tgt
		USING [WA_StageHurtownia].akc.AKC3_PodatekWedlugGrup AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OgolemPodatekOdAlkoholuEtylowego=src.OgolemPodatekOdAlkoholuEtylowego, tgt.OgolemPodatekOdWinaNapojFerment=src.OgolemPodatekOdWinaNapojFerment, tgt.OgolemPodatekOdPiwa=src.OgolemPodatekOdPiwa, tgt.OgolemPodatekOdPaliwSilnik=src.OgolemPodatekOdPaliwSilnik, tgt.OgolemPodatekOdSamochOsob=src.OgolemPodatekOdSamochOsob, tgt.OgolemPodatekOdWyrobTyton=src.OgolemPodatekOdWyrobTyton, tgt.OgolemPodatekOdPozostalychWyrob=src.OgolemPodatekOdPozostalychWyrob, tgt.OgolemPodatekOdEnergiiElektr=src.OgolemPodatekOdEnergiiElektr, tgt.OgolemPodatekOdPaliwOpal=src.OgolemPodatekOdPaliwOpal, tgt.OgolemPodatekOdGazu=src.OgolemPodatekOdGazu
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OgolemPodatekOdAlkoholuEtylowego, OgolemPodatekOdWinaNapojFerment, OgolemPodatekOdPiwa, OgolemPodatekOdPaliwSilnik, OgolemPodatekOdSamochOsob, OgolemPodatekOdWyrobTyton, OgolemPodatekOdPozostalychWyrob, OgolemPodatekOdEnergiiElektr, OgolemPodatekOdPaliwOpal, OgolemPodatekOdGazu)
		VALUES (src.IdDok, src.OgolemPodatekOdAlkoholuEtylowego, src.OgolemPodatekOdWinaNapojFerment, src.OgolemPodatekOdPiwa, src.OgolemPodatekOdPaliwSilnik, src.OgolemPodatekOdSamochOsob, src.OgolemPodatekOdWyrobTyton, src.OgolemPodatekOdPozostalychWyrob, src.OgolemPodatekOdEnergiiElektr, src.OgolemPodatekOdPaliwOpal, src.OgolemPodatekOdGazu);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_Deklaracja' BEGIN
		MERGE INTO akc.AKC4_Deklaracja AS tgt
		USING [WA_StageHurtownia].akc.AKC4_Deklaracja AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IdDokStowarzysz=src.IdDokStowarzysz, tgt.NumerDokumentuStowarzysz=src.NumerDokumentuStowarzysz, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.RokZlozeniaDok=src.RokZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataWplywuDok=src.DataWplywuDok, tgt.Status=src.Status, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.RazemPodatekAkcyzowy=src.RazemPodatekAkcyzowy, tgt.WartoscZnakowAkcyzy=src.WartoscZnakowAkcyzy, tgt.KwotaWplatDziennych=src.KwotaWplatDziennych, tgt.KwotaWplatMiesiecznych=src.KwotaWplatMiesiecznych, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.NadwyzWplatDoRozliczOstatDeklar=src.NadwyzWplatDoRozliczOstatDeklar, tgt.NadwyzWplatDoRozliczPrzedplataAkcOstatDeklar=src.NadwyzWplatDoRozliczPrzedplataAkcOstatDeklar, tgt.DoZaplaty=src.DoZaplaty, tgt.NadwyzWplatDoRozlicz=src.NadwyzWplatDoRozlicz, tgt.NadwyzWplatDoRozliczPrzedplataAkc=src.NadwyzWplatDoRozliczPrzedplataAkc, tgt.CzyKorektaWewnetrzna=src.CzyKorektaWewnetrzna, tgt.CzyKorektaZurzedu=src.CzyKorektaZurzedu, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.DeklaracjaZerowa=src.DeklaracjaZerowa, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji, tgt.DataZlozeniaDok=src.DataZlozeniaDok
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IdDokStowarzysz, NumerDokumentuStowarzysz, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, RokZlozeniaDok, ZnacznikKorekty, DataRejestrDokWSyst, DataWplywuDok, Status, DeklaracjaZaOkres, RazemPodatekAkcyzowy, WartoscZnakowAkcyzy, KwotaWplatDziennych, KwotaWplatMiesiecznych, KwotaPrzedplatyAkcyzy, NadwyzWplatDoRozliczOstatDeklar, NadwyzWplatDoRozliczPrzedplataAkcOstatDeklar, DoZaplaty, NadwyzWplatDoRozlicz, NadwyzWplatDoRozliczPrzedplataAkc, CzyKorektaWewnetrzna, CzyKorektaZurzedu, TerminPlatnosci, DeklaracjaZerowa, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji, DataZlozeniaDok)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IdDokStowarzysz, src.NumerDokumentuStowarzysz, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.RokZlozeniaDok, src.ZnacznikKorekty, src.DataRejestrDokWSyst, src.DataWplywuDok, src.Status, src.DeklaracjaZaOkres, src.RazemPodatekAkcyzowy, src.WartoscZnakowAkcyzy, src.KwotaWplatDziennych, src.KwotaWplatMiesiecznych, src.KwotaPrzedplatyAkcyzy, src.NadwyzWplatDoRozliczOstatDeklar, src.NadwyzWplatDoRozliczPrzedplataAkcOstatDeklar, src.DoZaplaty, src.NadwyzWplatDoRozlicz, src.NadwyzWplatDoRozliczPrzedplataAkc, src.CzyKorektaWewnetrzna, src.CzyKorektaZurzedu, src.TerminPlatnosci, src.DeklaracjaZerowa, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji, src.DataZlozeniaDok);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCEN_Towary' BEGIN
		MERGE INTO akc.AKCEN_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKCEN_Towary AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodCN=src.KodCN, tgt.StawkaPodatku=src.StawkaPodatku, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, KodCN, StawkaPodatku, PodstawObliczPodatku)
		VALUES (src.IdDok, src.KodCN, src.StawkaPodatku, src.PodstawObliczPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCP_Deklaracja' BEGIN
		MERGE INTO akc.AKCP_Deklaracja AS tgt
		USING [WA_StageHurtownia].akc.AKCP_Deklaracja AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IdDokStowarzysz=src.IdDokStowarzysz, tgt.NumerDokumentuStowarzysz=src.NumerDokumentuStowarzysz, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZamkniecia=src.DataZamkniecia, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.CzyKorektaWewnetrzna=src.CzyKorektaWewnetrzna, tgt.CzyKorektaZurzedu=src.CzyKorektaZurzedu, tgt.DoZaplaty=src.DoZaplaty, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IdDokStowarzysz, NumerDokumentuStowarzysz, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, DataRejestrDokWSyst, DataZamkniecia, DeklaracjaZaOkres, DataZlozeniaDok, DataWplywuDok, TerminPlatnosci, CzyKorektaWewnetrzna, CzyKorektaZurzedu, DoZaplaty, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IdDokStowarzysz, src.NumerDokumentuStowarzysz, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.DataRejestrDokWSyst, src.DataZamkniecia, src.DeklaracjaZaOkres, src.DataZlozeniaDok, src.DataWplywuDok, src.TerminPlatnosci, src.CzyKorektaWewnetrzna, src.CzyKorektaZurzedu, src.DoZaplaty, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END
	
	IF @TableName = 'AKCP_Towary' BEGIN
		MERGE INTO akc.AKCP_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKCP_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.MarkaSamochodu=src.MarkaSamochodu, tgt.TypSamochodu=src.TypSamochodu, tgt.ModelSamochodu=src.ModelSamochodu, tgt.NumerVIN=src.NumerVIN, tgt.Pojemnosc=src.Pojemnosc, tgt.RokProdukcji=src.RokProdukcji, tgt.DataSprzedazSamoch=src.DataSprzedazSamoch, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, NazwaGrupyWyrobow, KodCN, MarkaSamochodu, TypSamochodu, ModelSamochodu, NumerVIN, Pojemnosc, RokProdukcji, DataSprzedazSamoch, PodstawObliczPodatku, StawkaPodatku, KwotaPodatku)
		VALUES (src.IdDok, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.MarkaSamochodu, src.TypSamochodu, src.ModelSamochodu, src.NumerVIN, src.Pojemnosc, src.RokProdukcji, src.DataSprzedazSamoch, src.PodstawObliczPodatku, src.StawkaPodatku, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCPA_Deklaracja' BEGIN
		MERGE INTO akc.AKCPA_Deklaracja AS tgt
		USING [WA_StageHurtownia].akc.AKCPA_Deklaracja AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZamkniecia=src.DataZamkniecia, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.CzyKorektaWewnetrzna=src.CzyKorektaWewnetrzna, tgt.CzyKorektaZurzedu=src.CzyKorektaZurzedu, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, [Status], DataRejestrDokWSyst, DataZamkniecia, DeklaracjaZaOkres, DataZlozeniaDok, DataWplywuDok, CzyKorektaWewnetrzna, CzyKorektaZurzedu, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.[Status], src.DataRejestrDokWSyst, src.DataZamkniecia, src.DeklaracjaZaOkres, src.DataZlozeniaDok, src.DataWplywuDok, src.CzyKorektaWewnetrzna, src.CzyKorektaZurzedu, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCPA_Zalacznik' BEGIN
		MERGE INTO akc.AKCPA_Zalacznik AS tgt
		USING [WA_StageHurtownia].akc.AKCPA_Zalacznik AS src
		ON (tgt.IdDok=src.IdDok AND tgt.OznaczenieZalacznika=src.OznaczenieZalacznika AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.NadwyzkaPrzedplatyAkcyzy=src.NadwyzkaPrzedplatyAkcyzy, tgt.PrzedplataAkcyzyDoZaplaty=src.PrzedplataAkcyzyDoZaplaty
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, KwotaPrzedplatyAkcyzy, NadwyzkaPrzedplatyAkcyzy, PrzedplataAkcyzyDoZaplaty)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.KwotaPrzedplatyAkcyzy, src.NadwyzkaPrzedplatyAkcyzy, src.PrzedplataAkcyzyDoZaplaty);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCPA_Towary' BEGIN
		MERGE INTO akc.AKCPA_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKCPA_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.OznaczenieZalacznika=src.OznaczenieZalacznika AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.PodstawaObliczeniaPrzedplaty=src.PodstawaObliczeniaPrzedplaty, tgt.WartoscWgMaksCenyDetal=src.WartoscWgMaksCenyDetal, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPrzedplaty=src.KwotaPrzedplaty
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, KodCN, PodstawaObliczeniaPrzedplaty, WartoscWgMaksCenyDetal, StawkaPodatku, StawkaPodatkuProcent, KwotaPrzedplaty)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.PodstawaObliczeniaPrzedplaty, src.WartoscWgMaksCenyDetal, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPrzedplaty);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCST_Deklaracja' BEGIN
		MERGE INTO akc.AKCST_Deklaracja AS tgt
		USING [WA_StageHurtownia].akc.AKCST_Deklaracja AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IdDokStowarzysz=src.IdDokStowarzysz, tgt.NumerDokumentuStowarzysz=src.NumerDokumentuStowarzysz, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.CzyKorektaWewnetrzna=src.CzyKorektaWewnetrzna, tgt.CzyKorektaZurzedu=src.CzyKorektaZurzedu, tgt.DoZaplaty=src.DoZaplaty, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IdDokStowarzysz, NumerDokumentuStowarzysz, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, DataRejestrDokWSyst, DeklaracjaZaOkres, DataZlozeniaDok, DataWplywuDok, TerminPlatnosci, CzyKorektaWewnetrzna, CzyKorektaZurzedu, DoZaplaty, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IdDokStowarzysz, src.NumerDokumentuStowarzysz, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.DataRejestrDokWSyst, src.DeklaracjaZaOkres, src.DataZlozeniaDok, src.DataWplywuDok, src.TerminPlatnosci, src.CzyKorektaWewnetrzna, src.CzyKorektaZurzedu, src.DoZaplaty, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCU_Deklaracja' BEGIN
		MERGE INTO akc.AKCU_Deklaracja AS tgt
		USING [WA_StageHurtownia].akc.AKCU_Deklaracja AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IdDokStowarzysz=src.IdDokStowarzysz, tgt.NumerDokumentuStowarzysz=src.NumerDokumentuStowarzysz, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.RokZlozeniaDok=src.RokZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.SystemowyNumerDok=src.SystemowyNumerDok, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZamkniecia=src.DataZamkniecia, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.NumerPaczki=src.NumerPaczki, tgt.RazemPodatekAkcyzowy=src.RazemPodatekAkcyzowy, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.KwotaZnakowAkcyzy=src.KwotaZnakowAkcyzy, tgt.DoZaplaty=src.DoZaplaty, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IdDokStowarzysz, NumerDokumentuStowarzysz, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, RokZlozeniaDok, ZnacznikKorekty, Status, SystemowyNumerDok, DataRejestrDokWSyst, DataZamkniecia, DataZlozeniaDok, DataWplywuDok, TerminPlatnosci, NumerPaczki, RazemPodatekAkcyzowy, ZwolnieniaObnizenia, KwotaZnakowAkcyzy, DoZaplaty, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IdDokStowarzysz, src.NumerDokumentuStowarzysz, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.RokZlozeniaDok, src.ZnacznikKorekty, src.Status, src.SystemowyNumerDok, src.DataRejestrDokWSyst, src.DataZamkniecia, src.DataZlozeniaDok, src.DataWplywuDok, src.TerminPlatnosci, src.NumerPaczki, src.RazemPodatekAkcyzowy, src.ZwolnieniaObnizenia, src.KwotaZnakowAkcyzy, src.DoZaplaty, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'ZPNW_Dokument' BEGIN
		MERGE INTO akc.ZPNW_Dokument AS tgt
		USING [WA_StageHurtownia].akc.ZPNW_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZamkniecia=src.DataZamkniecia, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.PrzewidywanaDataDostawy=src.PrzewidywanaDataDostawy, tgt.CzyKorektaWewnetrzna=src.CzyKorektaWewnetrzna, tgt.FormaZabezpieczenia=src.FormaZabezpieczenia, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, DataRejestrDokWSyst, DataZamkniecia, DataZlozeniaDok, PrzewidywanaDataDostawy, CzyKorektaWewnetrzna, FormaZabezpieczenia, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.DataRejestrDokWSyst, src.DataZamkniecia, src.DataZlozeniaDok, src.PrzewidywanaDataDostawy, src.CzyKorektaWewnetrzna, src.FormaZabezpieczenia, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'ZPNW_Towary' BEGIN
		MERGE INTO akc.ZPNW_Towary AS tgt
		USING [WA_StageHurtownia].akc.ZPNW_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OpisWyrobow=src.OpisWyrobow, tgt.KodCN=src.KodCN, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, OpisWyrobow, KodCN, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, KwotaPodatku)
		VALUES (src.IdDok, src.NumerPozycji, src.OpisWyrobow, src.KodCN, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCST_Towary' BEGIN
		MERGE INTO akc.AKCST_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKCST_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.StawkaPodatku=src.StawkaPodatku, tgt.IloscSuszuTyton=src.IloscSuszuTyton, tgt.KwotaPodatkuAkc=src.KwotaPodatkuAkc, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.WartoscZnakowAkcyzy=src.WartoscZnakowAkcyzy, tgt.DoZaplatyPoz=src.DoZaplatyPoz
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, NazwaGrupyWyrobow, KodCN, StawkaPodatku, IloscSuszuTyton, KwotaPodatkuAkc, ZwolnieniaObnizenia, WartoscZnakowAkcyzy, DoZaplatyPoz)
		VALUES (src.IdDok, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.StawkaPodatku, src.IloscSuszuTyton, src.KwotaPodatkuAkc, src.ZwolnieniaObnizenia, src.WartoscZnakowAkcyzy, src.DoZaplatyPoz);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCU_Towary' BEGIN
		MERGE INTO akc.AKCU_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKCU_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodCN=src.KodCN, tgt.OpisTowaru=src.OpisTowaru, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.LiczbaSamochodow=src.LiczbaSamochodow, tgt.DataPowstObowPodatk=src.DataPowstObowPodatk, tgt.TerminPlatnosciPoz=src.TerminPlatnosciPoz, tgt.MarkaSamochodu=src.MarkaSamochodu, tgt.TypSamochodu=src.TypSamochodu, tgt.ModelSamochodu=src.ModelSamochodu, tgt.NumerVIN=src.NumerVIN, tgt.NumerSilnika=src.NumerSilnika, tgt.Pojemnosc=src.Pojemnosc, tgt.RokProdukcji=src.RokProdukcji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, KodCN, OpisTowaru, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, KwotaPodatku, LiczbaSamochodow, DataPowstObowPodatk, TerminPlatnosciPoz, MarkaSamochodu, TypSamochodu, ModelSamochodu, NumerVIN, NumerSilnika, Pojemnosc, RokProdukcji)
		VALUES (src.IdDok, src.NumerPozycji, src.KodCN, src.OpisTowaru, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.KwotaPodatku, src.LiczbaSamochodow, src.DataPowstObowPodatk, src.TerminPlatnosciPoz, src.MarkaSamochodu, src.TypSamochodu, src.ModelSamochodu, src.NumerVIN, src.NumerSilnika, src.Pojemnosc, src.RokProdukcji);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCWW_Towary' BEGIN
		MERGE INTO akc.AKCWW_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKCWW_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodCN=src.KodCN, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, KodCN, NazwaGrupyWyrobow, PodstawObliczPodatku, StawkaPodatku, KwotaPodatku)
		VALUES (src.IdDok, src.NumerPozycji, src.KodCN, src.NazwaGrupyWyrobow, src.PodstawObliczPodatku, src.StawkaPodatku, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCWG_Towary' BEGIN
		MERGE INTO akc.AKCWG_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKCWG_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodCN=src.KodCN, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, KodCN, NazwaGrupyWyrobow, PodstawObliczPodatku, StawkaPodatku, KwotaPodatku)
		VALUES (src.IdDok, src.NumerPozycji, src.KodCN, src.NazwaGrupyWyrobow, src.PodstawObliczPodatku, src.StawkaPodatku, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'PodatekWedlugGier' BEGIN
		MERGE INTO akc.PodatekWedlugGier AS tgt
		USING [WA_StageHurtownia].akc.PodatekWedlugGier AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OgolemPodatekOdGierKasynaSalonyZalA=src.OgolemPodatekOdGierKasynaSalonyZalA, tgt.OgolemPodatekOdGierLiczbowychZalC=src.OgolemPodatekOdGierLiczbowychZalC, tgt.OgolemPodatekOdBingoLoterFantZalD=src.OgolemPodatekOdBingoLoterFantZalD, tgt.OgolemPodatekOdGierNaAutomatZalR=src.OgolemPodatekOdGierNaAutomatZalR
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OgolemPodatekOdGierKasynaSalonyZalA, OgolemPodatekOdGierLiczbowychZalC, OgolemPodatekOdBingoLoterFantZalD, OgolemPodatekOdGierNaAutomatZalR)
		VALUES (src.IdDok, src.OgolemPodatekOdGierKasynaSalonyZalA, src.OgolemPodatekOdGierLiczbowychZalC, src.OgolemPodatekOdBingoLoterFantZalD, src.OgolemPodatekOdGierNaAutomatZalR);
		SET @Merged = 1;
	END

	IF @TableName = 'PKOP_Towary' BEGIN
		MERGE INTO akc.PKOP_Towary AS tgt
		USING [WA_StageHurtownia].akc.PKOP_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaKopaliny=src.NazwaKopaliny, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.SredniaCena=src.SredniaCena, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, NazwaKopaliny, PodstawObliczPodatku, SredniaCena, StawkaPodatku, KwotaPodatku)
		VALUES (src.IdDok, src.NumerPozycji, src.NazwaKopaliny, src.PodstawObliczPodatku, src.SredniaCena, src.StawkaPodatku, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCWW_Deklaracja' BEGIN
		MERGE INTO akc.AKCWW_Deklaracja AS tgt
		USING [WA_StageHurtownia].akc.AKCWW_Deklaracja AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IdDokStowarzysz=src.IdDokStowarzysz, tgt.NumerDokumentuStowarzysz=src.NumerDokumentuStowarzysz, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DeklaracjaZaOkresDo=src.DeklaracjaZaOkresDo, tgt.DeklaracjaZaOkresOd=src.DeklaracjaZaOkresOd, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.CzyKorektaWewnetrzna=src.CzyKorektaWewnetrzna, tgt.CzyKorektaZurzedu=src.CzyKorektaZurzedu, tgt.RazemPodatekAkcyzowy=src.RazemPodatekAkcyzowy, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.DoZaplaty=src.DoZaplaty, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IdDokStowarzysz, NumerDokumentuStowarzysz, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, DataRejestrDokWSyst, DeklaracjaZaOkresDo, DeklaracjaZaOkresOd, DataZlozeniaDok, DataWplywuDok, TerminPlatnosci, CzyKorektaWewnetrzna, CzyKorektaZurzedu, RazemPodatekAkcyzowy, ZwolnieniaObnizenia, DoZaplaty, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IdDokStowarzysz, src.NumerDokumentuStowarzysz, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.DataRejestrDokWSyst, src.DeklaracjaZaOkresDo, src.DeklaracjaZaOkresOd, src.DataZlozeniaDok, src.DataWplywuDok, src.TerminPlatnosci, src.CzyKorektaWewnetrzna, src.CzyKorektaZurzedu, src.RazemPodatekAkcyzowy, src.ZwolnieniaObnizenia, src.DoZaplaty, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'OplataPaliwowa' BEGIN
		MERGE INTO akc.OplataPaliwowa AS tgt
		USING [WA_StageHurtownia].akc.OplataPaliwowa AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IdDokStowarzysz=src.IdDokStowarzysz, tgt.NumerDokumentuStowarzysz=src.NumerDokumentuStowarzysz, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.OkresSprawozdawczy=src.OkresSprawozdawczy, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, MiejsceZlozeniaDok, ZnacznikKorekty, Status, NumerDokumentu, IdDokStowarzysz, NumerDokumentuStowarzysz, DataRejestrDokWSyst, OkresSprawozdawczy, DataZlozeniaDok, DataWplywuDok, TerminPlatnosci, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.NumerDokumentu, src.IdDokStowarzysz, src.NumerDokumentuStowarzysz, src.DataRejestrDokWSyst, src.OkresSprawozdawczy, src.DataZlozeniaDok, src.DataWplywuDok, src.TerminPlatnosci, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'OplataPaliwowa_Towary' BEGIN
		MERGE INTO akc.OplataPaliwowa_Towary AS tgt
		USING [WA_StageHurtownia].akc.OplataPaliwowa_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.GrupaWyrobow=src.GrupaWyrobow, tgt.Symbol=src.Symbol, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.IloscWyrobow=src.IloscWyrobow, tgt.IloscWyrobowWtonach=src.IloscWyrobowWtonach, tgt.KwotaOplatyPaliw=src.KwotaOplatyPaliw
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerPozycji, GrupaWyrobow, Symbol, NazwaGrupyWyrobow, IloscWyrobow, IloscWyrobowWtonach, KwotaOplatyPaliw)
		VALUES (src.IdDok, src.NumerPozycji, src.GrupaWyrobow, src.Symbol, src.NazwaGrupyWyrobow, src.IloscWyrobow, src.IloscWyrobowWtonach, src.KwotaOplatyPaliw);
		SET @Merged = 1;
	END

	IF @TableName = 'POG_Deklaracja' BEGIN
		MERGE INTO akc.POG_Deklaracja AS tgt
		USING [WA_StageHurtownia].akc.POG_Deklaracja AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZamkniecia=src.DataZamkniecia, tgt.OkresSprawozdawczy=src.OkresSprawozdawczy, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.CzyKorektaWewnetrzna=src.CzyKorektaWewnetrzna, tgt.CzyKorektaZurzedu=src.CzyKorektaZurzedu, tgt.RazemPodatekAkcyzowy=src.RazemPodatekAkcyzowy, tgt.NadplataWplatDziennychZOstatDeklar=src.NadplataWplatDziennychZOstatDeklar, tgt.KwotaWplatDziennychOdGierLiczb=src.KwotaWplatDziennychOdGierLiczb, tgt.NadplataWplatDziennychDoRozliczWnastOkres=src.NadplataWplatDziennychDoRozliczWnastOkres, tgt.DoZaplaty=src.DoZaplaty, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, DataRejestrDokWSyst, DataZamkniecia, OkresSprawozdawczy, DataZlozeniaDok, DataWplywuDok, TerminPlatnosci, CzyKorektaWewnetrzna, CzyKorektaZurzedu, RazemPodatekAkcyzowy, NadplataWplatDziennychZOstatDeklar, KwotaWplatDziennychOdGierLiczb, NadplataWplatDziennychDoRozliczWnastOkres, DoZaplaty, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.DataRejestrDokWSyst, src.DataZamkniecia, src.OkresSprawozdawczy, src.DataZlozeniaDok, src.DataWplywuDok, src.TerminPlatnosci, src.CzyKorektaWewnetrzna, src.CzyKorektaZurzedu, src.RazemPodatekAkcyzowy, src.NadplataWplatDziennychZOstatDeklar, src.KwotaWplatDziennychOdGierLiczb, src.NadplataWplatDziennychDoRozliczWnastOkres, src.DoZaplaty, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'POGP_Deklaracja' BEGIN
		MERGE INTO akc.POGP_Deklaracja AS tgt
		USING [WA_StageHurtownia].akc.POGP_Deklaracja AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.OkresSprawozdawczy=src.OkresSprawozdawczy, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.CzyKorektaWewnetrzna=src.CzyKorektaWewnetrzna, tgt.CzyKorektaZurzedu=src.CzyKorektaZurzedu, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPobranegoPodatku=src.KwotaPobranegoPodatku, tgt.KwotaPotraconegoWynagrodz=src.KwotaPotraconegoWynagrodz, tgt.KwotaDoWplaty=src.KwotaDoWplaty, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, DataRejestrDokWSyst, OkresSprawozdawczy, DataZlozeniaDok, DataWplywuDok, TerminPlatnosci, CzyKorektaWewnetrzna, CzyKorektaZurzedu, PodstawObliczPodatku, StawkaPodatkuProcent, KwotaPobranegoPodatku, KwotaPotraconegoWynagrodz, KwotaDoWplaty, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.DataRejestrDokWSyst, src.OkresSprawozdawczy, src.DataZlozeniaDok, src.DataWplywuDok, src.TerminPlatnosci, src.CzyKorektaWewnetrzna, src.CzyKorektaZurzedu, src.PodstawObliczPodatku, src.StawkaPodatkuProcent, src.KwotaPobranegoPodatku, src.KwotaPotraconegoWynagrodz, src.KwotaDoWplaty, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'PKOP_Deklaracja' BEGIN
		MERGE INTO akc.PKOP_Deklaracja AS tgt
		USING [WA_StageHurtownia].akc.PKOP_Deklaracja AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IdDokStowarzysz=src.IdDokStowarzysz, tgt.NumerDokumentuStowarzysz=src.NumerDokumentuStowarzysz, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.KodJednostkiOperatora=src.KodJednostkiOperatora, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.CzyKorektaWewnetrzna=src.CzyKorektaWewnetrzna, tgt.CzyKorektaZurzedu=src.CzyKorektaZurzedu, tgt.DoZaplaty=src.DoZaplaty, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IdDokStowarzysz, NumerDokumentuStowarzysz, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, KodJednostkiOperatora, ZnacznikKorekty, Status, DataRejestrDokWSyst, DeklaracjaZaOkres, DataZlozeniaDok, DataWplywuDok, TerminPlatnosci, CzyKorektaWewnetrzna, CzyKorektaZurzedu, DoZaplaty, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IdDokStowarzysz, src.NumerDokumentuStowarzysz, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.KodJednostkiOperatora, src.ZnacznikKorekty, src.Status, src.DataRejestrDokWSyst, src.DeklaracjaZaOkres, src.DataZlozeniaDok, src.DataWplywuDok, src.TerminPlatnosci, src.CzyKorektaWewnetrzna, src.CzyKorektaZurzedu, src.DoZaplaty, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCWG_Deklaracja' BEGIN
		MERGE INTO akc.AKCWG_Deklaracja AS tgt
		USING [WA_StageHurtownia].akc.AKCWG_Deklaracja AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IdDokStowarzysz=src.IdDokStowarzysz, tgt.NumerDokumentuStowarzysz=src.NumerDokumentuStowarzysz, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.KodJednostkiOperatora=src.KodJednostkiOperatora, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.CzyKorektaWewnetrzna=src.CzyKorektaWewnetrzna, tgt.CzyKorektaZurzedu=src.CzyKorektaZurzedu, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.DoZaplaty=src.DoZaplaty, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IdDokStowarzysz, NumerDokumentuStowarzysz, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, KodJednostkiOperatora, ZnacznikKorekty, Status, DataRejestrDokWSyst, DeklaracjaZaOkres, DataZlozeniaDok, DataWplywuDok, TerminPlatnosci, CzyKorektaWewnetrzna, CzyKorektaZurzedu, RazemObliczonyPodatek, ZwolnieniaObnizenia, DoZaplaty, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IdDokStowarzysz, src.NumerDokumentuStowarzysz, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.KodJednostkiOperatora, src.ZnacznikKorekty, src.Status, src.DataRejestrDokWSyst, src.DeklaracjaZaOkres, src.DataZlozeniaDok, src.DataWplywuDok, src.TerminPlatnosci, src.CzyKorektaWewnetrzna, src.CzyKorektaZurzedu, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.DoZaplaty, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikA' BEGIN
		MERGE INTO akc.AKC3_ZalacznikA AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikA AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.ZapasPoczatkowy=src.ZapasPoczatkowy, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSklad=src.IloscWyrobPrzyjetaNaSklad, tgt.IloscWyprodukWyrobAkc=src.IloscWyprodukWyrobAkc, tgt.IloscWyrobZuzytychDoProd=src.IloscWyrobZuzytychDoProd, tgt.IloscWyrobZeSklad=src.IloscWyrobZeSklad, tgt.IloscWyrobZeSkladWprocedZawiesz=src.IloscWyrobZeSkladWprocedZawiesz, tgt.IloscWyrobZeSkladPozaProcedZawiesz=src.IloscWyrobZeSkladPozaProcedZawiesz, tgt.UbytkiNiedobory=src.UbytkiNiedobory, tgt.ZapasKoncowy=src.ZapasKoncowy, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaPomniejszenia=src.ZwolnieniaPomniejszenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaZnakowAkcyzy=src.KwotaZnakowAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.Nadplata=src.Nadplata
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerAkcyzowy, NumerFormularzaZDokumentu, ZapasPoczatkowy, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSklad, IloscWyprodukWyrobAkc, IloscWyrobZuzytychDoProd, IloscWyrobZeSklad, IloscWyrobZeSkladWprocedZawiesz, IloscWyrobZeSkladPozaProcedZawiesz, UbytkiNiedobory, ZapasKoncowy, KwotaOdpowZapasKoncow, RazemObliczonyPodatek, ZwolnieniaPomniejszenia, OgolemPodatek, KwotaZnakowAkcyzy, PodatekNalezny, Nadplata)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerAkcyzowy, src.NumerFormularzaZDokumentu, src.ZapasPoczatkowy, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSklad, src.IloscWyprodukWyrobAkc, src.IloscWyrobZuzytychDoProd, src.IloscWyrobZeSklad, src.IloscWyrobZeSkladWprocedZawiesz, src.IloscWyrobZeSkladPozaProcedZawiesz, src.UbytkiNiedobory, src.ZapasKoncowy, src.KwotaOdpowZapasKoncow, src.RazemObliczonyPodatek, src.ZwolnieniaPomniejszenia, src.OgolemPodatek, src.KwotaZnakowAkcyzy, src.PodatekNalezny, src.Nadplata);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikB' BEGIN
		MERGE INTO akc.AKC3_ZalacznikB AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikB AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.ZapasPoczatkowy=src.ZapasPoczatkowy, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSklad=src.IloscWyrobPrzyjetaNaSklad, tgt.IloscWyprodukWyrobAkc=src.IloscWyprodukWyrobAkc, tgt.IloscWyrobZuzytychDoProd=src.IloscWyrobZuzytychDoProd, tgt.IloscWyrobZeSklad=src.IloscWyrobZeSklad, tgt.IloscWyrobZeSkladWprocedZawiesz=src.IloscWyrobZeSkladWprocedZawiesz, tgt.IloscWyrobZeSkladPozaProcedZawiesz=src.IloscWyrobZeSkladPozaProcedZawiesz, tgt.UbytkiNiedobory=src.UbytkiNiedobory, tgt.ZapasKoncowy=src.ZapasKoncowy, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaPomniejszenia=src.ZwolnieniaPomniejszenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaZnakowAkcyzy=src.KwotaZnakowAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.Nadplata=src.Nadplata
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerAkcyzowy, NumerFormularzaZDokumentu, ZapasPoczatkowy, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSklad, IloscWyprodukWyrobAkc, IloscWyrobZuzytychDoProd, IloscWyrobZeSklad, IloscWyrobZeSkladWprocedZawiesz, IloscWyrobZeSkladPozaProcedZawiesz, UbytkiNiedobory, ZapasKoncowy, KwotaOdpowZapasKoncow, RazemObliczonyPodatek, ZwolnieniaPomniejszenia, OgolemPodatek, KwotaZnakowAkcyzy, PodatekNalezny, Nadplata)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerAkcyzowy, src.NumerFormularzaZDokumentu, src.ZapasPoczatkowy, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSklad, src.IloscWyprodukWyrobAkc, src.IloscWyrobZuzytychDoProd, src.IloscWyrobZeSklad, src.IloscWyrobZeSkladWprocedZawiesz, src.IloscWyrobZeSkladPozaProcedZawiesz, src.UbytkiNiedobory, src.ZapasKoncowy, src.KwotaOdpowZapasKoncow, src.RazemObliczonyPodatek, src.ZwolnieniaPomniejszenia, src.OgolemPodatek, src.KwotaZnakowAkcyzy, src.PodatekNalezny, src.Nadplata);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikC' BEGIN
		MERGE INTO akc.AKC3_ZalacznikC AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikC AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.ZapasPoczatkowy=src.ZapasPoczatkowy, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSklad=src.IloscWyrobPrzyjetaNaSklad, tgt.IloscWyprodukWyrobAkc=src.IloscWyprodukWyrobAkc, tgt.IloscWyrobZeSklad=src.IloscWyrobZeSklad, tgt.IloscWyrobZeSkladWprocedZawiesz=src.IloscWyrobZeSkladWprocedZawiesz, tgt.IloscWyrobZeSkladPozaProcedZawiesz=src.IloscWyrobZeSkladPozaProcedZawiesz, tgt.UbytkiNiedobory=src.UbytkiNiedobory, tgt.ZapasKoncowy=src.ZapasKoncowy, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaPomniejszenia=src.ZwolnieniaPomniejszenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.IloscWyrobZuzytychDoProd=src.IloscWyrobZuzytychDoProd
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerAkcyzowy, NumerFormularzaZDokumentu, ZapasPoczatkowy, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSklad, IloscWyprodukWyrobAkc, IloscWyrobZeSklad, IloscWyrobZeSkladWprocedZawiesz, IloscWyrobZeSkladPozaProcedZawiesz, UbytkiNiedobory, ZapasKoncowy, KwotaOdpowZapasKoncow, RazemObliczonyPodatek, ZwolnieniaPomniejszenia, OgolemPodatek, IloscWyrobZuzytychDoProd)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerAkcyzowy, src.NumerFormularzaZDokumentu, src.ZapasPoczatkowy, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSklad, src.IloscWyprodukWyrobAkc, src.IloscWyrobZeSklad, src.IloscWyrobZeSkladWprocedZawiesz, src.IloscWyrobZeSkladPozaProcedZawiesz, src.UbytkiNiedobory, src.ZapasKoncowy, src.KwotaOdpowZapasKoncow, src.RazemObliczonyPodatek, src.ZwolnieniaPomniejszenia, src.OgolemPodatek, src.IloscWyrobZuzytychDoProd);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikD' BEGIN
		MERGE INTO akc.AKC3_ZalacznikD AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikD AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.ZapasPoczatkowy=src.ZapasPoczatkowy, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSklad=src.IloscWyrobPrzyjetaNaSklad, tgt.IloscWyprodukWyrobAkc=src.IloscWyprodukWyrobAkc, tgt.IloscWyrobZuzytychDoProd=src.IloscWyrobZuzytychDoProd, tgt.IloscWyrobZeSklad=src.IloscWyrobZeSklad, tgt.IloscWyrobZeSkladWprocedZawiesz=src.IloscWyrobZeSkladWprocedZawiesz, tgt.IloscWyrobZeSkladPozaProcedZawiesz=src.IloscWyrobZeSkladPozaProcedZawiesz, tgt.UbytkiNiedobory=src.UbytkiNiedobory, tgt.ZapasKoncowy=src.ZapasKoncowy, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaPomniejszenia=src.ZwolnieniaPomniejszenia, tgt.OgolemPodatek=src.OgolemPodatek
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerAkcyzowy, NumerFormularzaZDokumentu, ZapasPoczatkowy, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSklad, IloscWyprodukWyrobAkc, IloscWyrobZuzytychDoProd, IloscWyrobZeSklad, IloscWyrobZeSkladWprocedZawiesz, IloscWyrobZeSkladPozaProcedZawiesz, UbytkiNiedobory, ZapasKoncowy, KwotaOdpowZapasKoncow, RazemObliczonyPodatek, ZwolnieniaPomniejszenia, OgolemPodatek)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerAkcyzowy, src.NumerFormularzaZDokumentu, src.ZapasPoczatkowy, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSklad, src.IloscWyprodukWyrobAkc, src.IloscWyrobZuzytychDoProd, src.IloscWyrobZeSklad, src.IloscWyrobZeSkladWprocedZawiesz, src.IloscWyrobZeSkladPozaProcedZawiesz, src.UbytkiNiedobory, src.ZapasKoncowy, src.KwotaOdpowZapasKoncow, src.RazemObliczonyPodatek, src.ZwolnieniaPomniejszenia, src.OgolemPodatek);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikE' BEGIN
		MERGE INTO akc.AKC3_ZalacznikE AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikE AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaPomniejszenia=src.ZwolnieniaPomniejszenia, tgt.KwotaNadwyzBiezMies=src.KwotaNadwyzBiezMies, tgt.PodatekNalezny=src.PodatekNalezny, tgt.KwotaNadwyzPoprzedOkres=src.KwotaNadwyzPoprzedOkres, tgt.RoznicaPodatNaleznAkwotNadwyz=src.RoznicaPodatNaleznAkwotNadwyz, tgt.KwotaNadwyzDoRozliczWnastOkres=src.KwotaNadwyzDoRozliczWnastOkres
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerAkcyzowy, NumerFormularzaZDokumentu, RazemObliczonyPodatek, ZwolnieniaPomniejszenia, KwotaNadwyzBiezMies, PodatekNalezny, KwotaNadwyzPoprzedOkres, RoznicaPodatNaleznAkwotNadwyz, KwotaNadwyzDoRozliczWnastOkres)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerAkcyzowy, src.NumerFormularzaZDokumentu, src.RazemObliczonyPodatek, src.ZwolnieniaPomniejszenia, src.KwotaNadwyzBiezMies, src.PodatekNalezny, src.KwotaNadwyzPoprzedOkres, src.RoznicaPodatNaleznAkwotNadwyz, src.KwotaNadwyzDoRozliczWnastOkres);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikF' BEGIN
		MERGE INTO akc.AKC3_ZalacznikF AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikF AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.ZapasPoczatPapierosy=src.ZapasPoczatPapierosy, tgt.KwotaPodatkuWZawieszeniuPapierosy=src.KwotaPodatkuWZawieszeniuPapierosy, tgt.IloscWyrobPrzyjetaNaSkladPapierosy=src.IloscWyrobPrzyjetaNaSkladPapierosy, tgt.IloscWyprodukWyrobAkcPapierosy=src.IloscWyprodukWyrobAkcPapierosy, tgt.IloscWyrobZeSkladPapierosy=src.IloscWyrobZeSkladPapierosy, tgt.IloscWyrobZeSkladWprocedZawieszPapierosy=src.IloscWyrobZeSkladWprocedZawieszPapierosy, tgt.IloscWyrobZeSkladPozaProcedZawieszPapierosy=src.IloscWyrobZeSkladPozaProcedZawieszPapierosy, tgt.UbytkiNiedoboryPapierosy=src.UbytkiNiedoboryPapierosy, tgt.ZapasKoncowyPapierosy=src.ZapasKoncowyPapierosy, tgt.KwotaOdpowZapasKoncowPapierosy=src.KwotaOdpowZapasKoncowPapierosy, tgt.ZapasPoczatCygara=src.ZapasPoczatCygara, tgt.KwotaPodatkuWZawieszeniuCygara=src.KwotaPodatkuWZawieszeniuCygara, tgt.IloscWyrobPrzyjetaNaSkladCygara=src.IloscWyrobPrzyjetaNaSkladCygara, tgt.IloscWyprodukWyrobAkcCygara=src.IloscWyprodukWyrobAkcCygara, tgt.IloscWyrobZeSkladCygara=src.IloscWyrobZeSkladCygara, tgt.IloscWyrobZeSkladWprocedZawieszCygara=src.IloscWyrobZeSkladWprocedZawieszCygara, tgt.IloscWyrobZeSkladPozaProcedZawieszCygara=src.IloscWyrobZeSkladPozaProcedZawieszCygara, tgt.UbytkiNiedoboryCygara=src.UbytkiNiedoboryCygara, tgt.ZapasKoncowyCygara=src.ZapasKoncowyCygara, tgt.KwotaOdpowZapasKoncowCygara=src.KwotaOdpowZapasKoncowCygara, tgt.ZapasPoczatTyton=src.ZapasPoczatTyton, tgt.KwotaPodatkuWZawieszeniuTyton=src.KwotaPodatkuWZawieszeniuTyton, tgt.IloscWyrobPrzyjetaNaSkladTyton=src.IloscWyrobPrzyjetaNaSkladTyton, tgt.IloscWyprodukWyrobAkcTyton=src.IloscWyprodukWyrobAkcTyton, tgt.IloscWyrobZeSkladTyton=src.IloscWyrobZeSkladTyton, tgt.IloscWyrobZeSkladWprocedZawieszTyton=src.IloscWyrobZeSkladWprocedZawieszTyton, tgt.IloscWyrobZeSkladPozaProcedZawieszTyton=src.IloscWyrobZeSkladPozaProcedZawieszTyton, tgt.UbytkiNiedoboryTyton=src.UbytkiNiedoboryTyton, tgt.ZapasKoncowyTyton=src.ZapasKoncowyTyton, tgt.KwotaOdpowZapasKoncowTyton=src.KwotaOdpowZapasKoncowTyton, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaPomniejszenia=src.ZwolnieniaPomniejszenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaZnakowAkcyzy=src.KwotaZnakowAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.Nadplata=src.Nadplata
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerAkcyzowy, NumerFormularzaZDokumentu, ZapasPoczatPapierosy, KwotaPodatkuWZawieszeniuPapierosy, IloscWyrobPrzyjetaNaSkladPapierosy, IloscWyprodukWyrobAkcPapierosy, IloscWyrobZeSkladPapierosy, IloscWyrobZeSkladWprocedZawieszPapierosy, IloscWyrobZeSkladPozaProcedZawieszPapierosy, UbytkiNiedoboryPapierosy, ZapasKoncowyPapierosy, KwotaOdpowZapasKoncowPapierosy, ZapasPoczatCygara, KwotaPodatkuWZawieszeniuCygara, IloscWyrobPrzyjetaNaSkladCygara, IloscWyprodukWyrobAkcCygara, IloscWyrobZeSkladCygara, IloscWyrobZeSkladWprocedZawieszCygara, IloscWyrobZeSkladPozaProcedZawieszCygara, UbytkiNiedoboryCygara, ZapasKoncowyCygara, KwotaOdpowZapasKoncowCygara, ZapasPoczatTyton, KwotaPodatkuWZawieszeniuTyton, IloscWyrobPrzyjetaNaSkladTyton, IloscWyprodukWyrobAkcTyton, IloscWyrobZeSkladTyton, IloscWyrobZeSkladWprocedZawieszTyton, IloscWyrobZeSkladPozaProcedZawieszTyton, UbytkiNiedoboryTyton, ZapasKoncowyTyton, KwotaOdpowZapasKoncowTyton, RazemObliczonyPodatek, ZwolnieniaPomniejszenia, OgolemPodatek, KwotaZnakowAkcyzy, PodatekNalezny, Nadplata)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerAkcyzowy, src.NumerFormularzaZDokumentu, src.ZapasPoczatPapierosy, src.KwotaPodatkuWZawieszeniuPapierosy, src.IloscWyrobPrzyjetaNaSkladPapierosy, src.IloscWyprodukWyrobAkcPapierosy, src.IloscWyrobZeSkladPapierosy, src.IloscWyrobZeSkladWprocedZawieszPapierosy, src.IloscWyrobZeSkladPozaProcedZawieszPapierosy, src.UbytkiNiedoboryPapierosy, src.ZapasKoncowyPapierosy, src.KwotaOdpowZapasKoncowPapierosy, src.ZapasPoczatCygara, src.KwotaPodatkuWZawieszeniuCygara, src.IloscWyrobPrzyjetaNaSkladCygara, src.IloscWyprodukWyrobAkcCygara, src.IloscWyrobZeSkladCygara, src.IloscWyrobZeSkladWprocedZawieszCygara, src.IloscWyrobZeSkladPozaProcedZawieszCygara, src.UbytkiNiedoboryCygara, src.ZapasKoncowyCygara, src.KwotaOdpowZapasKoncowCygara, src.ZapasPoczatTyton, src.KwotaPodatkuWZawieszeniuTyton, src.IloscWyrobPrzyjetaNaSkladTyton, src.IloscWyprodukWyrobAkcTyton, src.IloscWyrobZeSkladTyton, src.IloscWyrobZeSkladWprocedZawieszTyton, src.IloscWyrobZeSkladPozaProcedZawieszTyton, src.UbytkiNiedoboryTyton, src.ZapasKoncowyTyton, src.KwotaOdpowZapasKoncowTyton, src.RazemObliczonyPodatek, src.ZwolnieniaPomniejszenia, src.OgolemPodatek, src.KwotaZnakowAkcyzy, src.PodatekNalezny, src.Nadplata);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikG' BEGIN
		MERGE INTO akc.AKC3_ZalacznikG AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikG AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaPomniejszenia=src.ZwolnieniaPomniejszenia, tgt.OgolemPodatek=src.OgolemPodatek
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, RazemObliczonyPodatek, ZwolnieniaPomniejszenia, OgolemPodatek)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.RazemObliczonyPodatek, src.ZwolnieniaPomniejszenia, src.OgolemPodatek);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikH' BEGIN
		MERGE INTO akc.AKC3_ZalacznikH AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikH AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaPomniejszenia=src.ZwolnieniaPomniejszenia, tgt.OgolemPodatek=src.OgolemPodatek
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, RazemObliczonyPodatek, ZwolnieniaPomniejszenia, OgolemPodatek)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.RazemObliczonyPodatek, src.ZwolnieniaPomniejszenia, src.OgolemPodatek);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikI' BEGIN
		MERGE INTO akc.AKC3_ZalacznikI AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikI AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.ZapasPoczatkowy=src.ZapasPoczatkowy, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSklad=src.IloscWyrobPrzyjetaNaSklad, tgt.IloscWyprodukWyrobAkc=src.IloscWyprodukWyrobAkc, tgt.IloscWyrobZuzytychDoProd=src.IloscWyrobZuzytychDoProd, tgt.IloscWyrobZeSklad=src.IloscWyrobZeSklad, tgt.IloscWyrobZeSkladWprocedZawiesz=src.IloscWyrobZeSkladWprocedZawiesz, tgt.IloscWyrobZeSkladPozaProcedZawiesz=src.IloscWyrobZeSkladPozaProcedZawiesz, tgt.UbytkiNiedobory=src.UbytkiNiedobory, tgt.ZapasKoncowy=src.ZapasKoncowy, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaPomniejszenia=src.ZwolnieniaPomniejszenia, tgt.OgolemPodatek=src.OgolemPodatek
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerAkcyzowy, NumerFormularzaZDokumentu, ZapasPoczatkowy, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSklad, IloscWyprodukWyrobAkc, IloscWyrobZuzytychDoProd, IloscWyrobZeSklad, IloscWyrobZeSkladWprocedZawiesz, IloscWyrobZeSkladPozaProcedZawiesz, UbytkiNiedobory, ZapasKoncowy, KwotaOdpowZapasKoncow, RazemObliczonyPodatek, ZwolnieniaPomniejszenia, OgolemPodatek)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerAkcyzowy, src.NumerFormularzaZDokumentu, src.ZapasPoczatkowy, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSklad, src.IloscWyprodukWyrobAkc, src.IloscWyrobZuzytychDoProd, src.IloscWyrobZeSklad, src.IloscWyrobZeSkladWprocedZawiesz, src.IloscWyrobZeSkladPozaProcedZawiesz, src.UbytkiNiedobory, src.ZapasKoncowy, src.KwotaOdpowZapasKoncow, src.RazemObliczonyPodatek, src.ZwolnieniaPomniejszenia, src.OgolemPodatek);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikJ' BEGIN
		MERGE INTO akc.AKC3_ZalacznikJ AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikJ AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.ZapasPoczatkowy=src.ZapasPoczatkowy, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSklad=src.IloscWyrobPrzyjetaNaSklad, tgt.IloscWyprodukWyrobAkc=src.IloscWyprodukWyrobAkc, tgt.IloscWyrobZeSklad=src.IloscWyrobZeSklad, tgt.IloscWyrobZeSkladWprocedZawiesz=src.IloscWyrobZeSkladWprocedZawiesz, tgt.IloscWyrobZeSkladPozaProcedZawiesz=src.IloscWyrobZeSkladPozaProcedZawiesz, tgt.UbytkiNiedobory=src.UbytkiNiedobory, tgt.ZapasKoncowy=src.ZapasKoncowy, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaPomniejszenia=src.ZwolnieniaPomniejszenia, tgt.OgolemPodatek=src.OgolemPodatek
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerAkcyzowy, NumerFormularzaZDokumentu, ZapasPoczatkowy, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSklad, IloscWyprodukWyrobAkc, IloscWyrobZeSklad, IloscWyrobZeSkladWprocedZawiesz, IloscWyrobZeSkladPozaProcedZawiesz, UbytkiNiedobory, ZapasKoncowy, KwotaOdpowZapasKoncow, RazemObliczonyPodatek, ZwolnieniaPomniejszenia, OgolemPodatek)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerAkcyzowy, src.NumerFormularzaZDokumentu, src.ZapasPoczatkowy, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSklad, src.IloscWyprodukWyrobAkc, src.IloscWyrobZeSklad, src.IloscWyrobZeSkladWprocedZawiesz, src.IloscWyrobZeSkladPozaProcedZawiesz, src.UbytkiNiedobory, src.ZapasKoncowy, src.KwotaOdpowZapasKoncow, src.RazemObliczonyPodatek, src.ZwolnieniaPomniejszenia, src.OgolemPodatek);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikA_Towary' BEGIN
		MERGE INTO akc.AKC3_ZalacznikA_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikA_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.RodzajSymbolu=src.RodzajKodu, tgt.Symbol=src.KodTowarowy, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, RodzajSymbolu, Symbol, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.RodzajKodu, src.KodTowarowy, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikB_Towary' BEGIN
		MERGE INTO akc.AKC3_ZalacznikB_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikB_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.RodzajSymbolu=src.RodzajKodu, tgt.Symbol=src.KodTowarowy, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, RodzajSymbolu, Symbol, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.RodzajKodu, src.KodTowarowy, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikC_Towary' BEGIN
		MERGE INTO akc.AKC3_ZalacznikC_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikC_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.RodzajSymbolu=src.RodzajKodu, tgt.Symbol=src.KodTowarowy, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, RodzajSymbolu, Symbol, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.RodzajKodu, src.KodTowarowy, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikD_Towary' BEGIN
		MERGE INTO akc.AKC3_ZalacznikD_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikD_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.RodzajSymbolu=src.RodzajKodu, tgt.Symbol=src.KodTowarowy, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, RodzajSymbolu, Symbol, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.RodzajKodu, src.KodTowarowy, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikE_Towary' BEGIN
		MERGE INTO akc.AKC3_ZalacznikE_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikE_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.RodzajSymbolu=src.RodzajKodu, tgt.Symbol=src.KodTowarowy, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, RodzajSymbolu, Symbol, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.RodzajKodu, src.KodTowarowy, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikF_Towary' BEGIN
		MERGE INTO akc.AKC3_ZalacznikF_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikF_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.RodzajSymbolu=src.RodzajKodu, tgt.Symbol=src.KodTowarowy, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, RodzajSymbolu, Symbol, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.RodzajKodu, src.KodTowarowy, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikG_Towary' BEGIN
		MERGE INTO akc.AKC3_ZalacznikG_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikG_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.RodzajSymbolu=src.RodzajKodu, tgt.Symbol=src.KodTowarowy, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, RodzajSymbolu, Symbol, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.RodzajKodu, src.KodTowarowy, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikH_Towary' BEGIN
		MERGE INTO akc.AKC3_ZalacznikH_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikH_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.RodzajSymbolu=src.RodzajKodu, tgt.Symbol=src.KodTowarowy, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, RodzajSymbolu, Symbol, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.RodzajKodu, src.KodTowarowy, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikI_Towary' BEGIN
		MERGE INTO akc.AKC3_ZalacznikI_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikI_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.RodzajSymbolu=src.RodzajKodu, tgt.Symbol=src.KodTowarowy, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, RodzajSymbolu, Symbol, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.RodzajKodu, src.KodTowarowy, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC3_ZalacznikJ_Towary' BEGIN
		MERGE INTO akc.AKC3_ZalacznikJ_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC3_ZalacznikJ_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.RodzajSymbolu=src.RodzajKodu, tgt.Symbol=src.KodTowarowy, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, RodzajSymbolu, Symbol, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.RodzajKodu, src.KodTowarowy, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikA' BEGIN
		MERGE INTO akc.AKC4_ZalacznikA AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikA AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.TypSEED=src.TypSEED, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaZnakowAkcyzy=src.KwotaZnakowAkcyzy, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplatyProdPozaSklad=src.NadwyzkaPrzedplatyProdPozaSklad, tgt.Okres=src.Okres
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, NumerAkcyzowy, TypSEED, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaZnakowAkcyzy, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplatyProdPozaSklad, Okres)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.NumerAkcyzowy, src.TypSEED, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaZnakowAkcyzy, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplatyProdPozaSklad, src.Okres);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikB' BEGIN
		MERGE INTO akc.AKC4_ZalacznikB AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikB AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.TypSEED=src.TypSEED, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaZnakowAkcyzy=src.KwotaZnakowAkcyzy, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplatyProdPozaSklad=src.NadwyzkaPrzedplatyProdPozaSklad, tgt.Okres=src.Okres
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, NumerAkcyzowy, TypSEED, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaZnakowAkcyzy, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplatyProdPozaSklad, Okres)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.NumerAkcyzowy, src.TypSEED, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaZnakowAkcyzy, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplatyProdPozaSklad, src.Okres);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikC' BEGIN
		MERGE INTO akc.AKC4_ZalacznikC AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikC AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.TypSEED=src.TypSEED, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplaty=src.NadwyzkaPrzedplaty, tgt.Okres=src.Okres
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, NumerAkcyzowy, TypSEED, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplaty, Okres)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.NumerAkcyzowy, src.TypSEED, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplaty, src.Okres);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikD' BEGIN
		MERGE INTO akc.AKC4_ZalacznikD AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikD AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.TypSEED=src.TypSEED, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplaty=src.NadwyzkaPrzedplaty, tgt.Okres=src.Okres
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, NumerAkcyzowy, TypSEED, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplaty, Okres)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.NumerAkcyzowy, src.TypSEED, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplaty, src.Okres);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikE' BEGIN
		MERGE INTO akc.AKC4_ZalacznikE AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikE AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.Okres=src.Okres
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, RazemObliczonyPodatek, Okres)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.RazemObliczonyPodatek, src.Okres);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikF' BEGIN
		MERGE INTO akc.AKC4_ZalacznikF AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikF AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.TypSEED=src.TypSEED, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaZnakowAkcyzy=src.KwotaZnakowAkcyzy, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplatyProdPozaSklad=src.NadwyzkaPrzedplatyProdPozaSklad, tgt.Okres=src.Okres
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, NumerAkcyzowy, TypSEED, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaZnakowAkcyzy, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplatyProdPozaSklad, Okres)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.NumerAkcyzowy, src.TypSEED, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaZnakowAkcyzy, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplatyProdPozaSklad, src.Okres);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikH' BEGIN
		MERGE INTO akc.AKC4_ZalacznikH AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikH AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.KwotaPodatku=src.KwotaPodatku, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaWstepWplatMies=src.KwotaWstepWplatMies, tgt.NadplataWplatMiesDoRozliczPoprzedDeklar=src.NadplataWplatMiesDoRozliczPoprzedDeklar, tgt.KwotaZwolOdAkcArt30Ust1=src.KwotaZwolOdAkcArt30Ust1, tgt.DoZaplaty=src.DoZaplaty, tgt.KwotaZwolOdAkcArt30Ust6=src.KwotaZwolOdAkcArt30Ust6, tgt.NadplataWplatMiesDoRozlicz=src.NadplataWplatMiesDoRozlicz, tgt.KwotaZwolOdAkcArt30Ust7=src.KwotaZwolOdAkcArt30Ust7, tgt.Okres=src.Okres, tgt.OkresDo=src.OkresDo
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, KwotaPodatku, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaWstepWplatMies, NadplataWplatMiesDoRozliczPoprzedDeklar, KwotaZwolOdAkcArt30Ust1, DoZaplaty, KwotaZwolOdAkcArt30Ust6, NadplataWplatMiesDoRozlicz, KwotaZwolOdAkcArt30Ust7, Okres, OkresDo)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.KwotaPodatku, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaWstepWplatMies, src.NadplataWplatMiesDoRozliczPoprzedDeklar, src.KwotaZwolOdAkcArt30Ust1, src.DoZaplaty, src.KwotaZwolOdAkcArt30Ust6, src.NadplataWplatMiesDoRozlicz, src.KwotaZwolOdAkcArt30Ust7, src.Okres, src.OkresDo);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikI' BEGIN
		MERGE INTO akc.AKC4_ZalacznikI AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikI AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.TypSEED=src.TypSEED, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplaty=src.NadwyzkaPrzedplaty, tgt.Okres=src.Okres
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, NumerAkcyzowy, TypSEED, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplaty, Okres)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.NumerAkcyzowy, src.TypSEED, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplaty, src.Okres);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikJ' BEGIN
		MERGE INTO akc.AKC4_ZalacznikJ AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikJ AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.TypSEED=src.TypSEED, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplaty=src.NadwyzkaPrzedplaty, tgt.Okres=src.Okres
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, NumerAkcyzowy, TypSEED, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplaty, Okres)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.NumerAkcyzowy, src.TypSEED, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplaty, src.Okres);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikK' BEGIN
		MERGE INTO akc.AKC4_ZalacznikK AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikK AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.TypSEED=src.TypSEED, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplaty=src.NadwyzkaPrzedplaty, tgt.Okres=src.Okres
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, NumerAkcyzowy, TypSEED, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplaty, Okres)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.NumerAkcyzowy, src.TypSEED, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplaty, src.Okres);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikL' BEGIN
		MERGE INTO akc.AKC4_ZalacznikL AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikL AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerFormularzaZDokumentu=src.NumerFormularzaZDokumentu, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.Okres=src.Okres
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznikaSys, NumerFormularzaZDokumentu, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, Okres)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznikaSys, src.NumerFormularzaZDokumentu, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.Okres);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikA_Towary' BEGIN
		MERGE INTO akc.AKC4_ZalacznikA_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikA_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, KodCN, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikB_Towary' BEGIN
		MERGE INTO akc.AKC4_ZalacznikB_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikB_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, KodCN, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikC_Towary' BEGIN
		MERGE INTO akc.AKC4_ZalacznikC_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikC_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, KodCN, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikD_Towary' BEGIN
		MERGE INTO akc.AKC4_ZalacznikD_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikD_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku, tgt.IloscBiokompDodDoPaliw=src.IloscBiokompDodDoPaliw, tgt.ObnizenieBiokompDodDoPaliw=src.ObnizenieBiokompDodDoPaliw, tgt.KwotaObnizenia=src.KwotaObnizenia, tgt.PodatekPoObnizeniu=src.PodatekPoObnizeniu
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, KodCN, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku, IloscBiokompDodDoPaliw, ObnizenieBiokompDodDoPaliw, KwotaObnizenia, PodatekPoObnizeniu)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku, src.IloscBiokompDodDoPaliw, src.ObnizenieBiokompDodDoPaliw, src.KwotaObnizenia, src.PodatekPoObnizeniu);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikE_Towary' BEGIN
		MERGE INTO akc.AKC4_ZalacznikE_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikE_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, KodCN, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikF_Towary' BEGIN
		MERGE INTO akc.AKC4_ZalacznikF_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikF_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, KodCN, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikH_Towary' BEGIN
		MERGE INTO akc.AKC4_ZalacznikH_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikH_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, KodCN, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikI_Towary' BEGIN
		MERGE INTO akc.AKC4_ZalacznikI_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikI_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, KodCN, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikJ_Towary' BEGIN
		MERGE INTO akc.AKC4_ZalacznikJ_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikJ_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, KodCN, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikK_Towary' BEGIN
		MERGE INTO akc.AKC4_ZalacznikK_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikK_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, KodCN, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_ZalacznikL_Towary' BEGIN
		MERGE INTO akc.AKC4_ZalacznikL_Towary AS tgt
		USING [WA_StageHurtownia].akc.AKC4_ZalacznikL_Towary AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznikaSys=src.NumerZalacznikaSys AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.RodzajStawkiPodatAkc=src.RodzajStawkiPodatAkc, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.PodstawObliczPodatkuProcent=src.PodstawObliczPodatkuProcent, tgt.StawkaPodatku=src.StawkaPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, NumerZalacznikaSys, NumerPozycji, NazwaGrupyWyrobow, KodCN, RodzajStawkiPodatAkc, PodstawObliczPodatku, PodstawObliczPodatkuProcent, StawkaPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.NumerZalacznikaSys, src.NumerPozycji, src.NazwaGrupyWyrobow, src.KodCN, src.RodzajStawkiPodatAkc, src.PodstawObliczPodatku, src.PodstawObliczPodatkuProcent, src.StawkaPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'POG_ZalacznikA' BEGIN
		MERGE INTO akc.POG_ZalacznikA AS tgt
		USING [WA_StageHurtownia].akc.POG_ZalacznikA AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.PodatekNalezny=src.PodatekNalezny
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznika, PodatekNalezny)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznika, src.PodatekNalezny);
		SET @Merged = 1;
	END

	IF @TableName = 'POG_ZalacznikC' BEGIN
		MERGE INTO akc.POG_ZalacznikC AS tgt
		USING [WA_StageHurtownia].akc.POG_ZalacznikC AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.PodatekNalezny=src.PodatekNalezny
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznika, PodatekNalezny)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznika, src.PodatekNalezny);
		SET @Merged = 1;
	END

	IF @TableName = 'POG_ZalacznikD' BEGIN
		MERGE INTO akc.POG_ZalacznikD AS tgt
		USING [WA_StageHurtownia].akc.POG_ZalacznikD AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.PodatekNalezny=src.PodatekNalezny
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznika, PodatekNalezny)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznika, src.PodatekNalezny);
		SET @Merged = 1;
	END

	IF @TableName = 'POG_ZalacznikR' BEGIN
		MERGE INTO akc.POG_ZalacznikR AS tgt
		USING [WA_StageHurtownia].akc.POG_ZalacznikR AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.LiczbaAutomatowWycofanych=src.LiczbaAutomatowWycofanych, tgt.LiczbaAutomatowZawieszonych=src.LiczbaAutomatowZawieszonych, tgt.LiczbaAutomatowWprowadzonych=src.LiczbaAutomatowWprowadzonych, tgt.PodatekNalezny=src.PodatekNalezny
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznika, LiczbaAutomatowWycofanych, LiczbaAutomatowZawieszonych, LiczbaAutomatowWprowadzonych, PodatekNalezny)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznika, src.LiczbaAutomatowWycofanych, src.LiczbaAutomatowZawieszonych, src.LiczbaAutomatowWprowadzonych, src.PodatekNalezny);
		SET @Merged = 1;
	END

	IF @TableName = 'POG_ZalacznikA_Gry' BEGIN
		MERGE INTO akc.POG_ZalacznikA_Gry AS tgt
		USING [WA_StageHurtownia].akc.POG_ZalacznikA_Gry AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.RodzajGry=src.RodzajGry, tgt.KodGry=src.KodGry, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznika, NumerPozycji, RodzajGry, KodGry, PodstawObliczPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznika, src.NumerPozycji, src.RodzajGry, src.KodGry, src.PodstawObliczPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'POG_ZalacznikC_Gry' BEGIN
		MERGE INTO akc.POG_ZalacznikC_Gry AS tgt
		USING [WA_StageHurtownia].akc.POG_ZalacznikC_Gry AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.RodzajGry=src.RodzajGry, tgt.KodGry=src.KodGry, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznika, NumerPozycji, RodzajGry, KodGry, PodstawObliczPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznika, src.NumerPozycji, src.RodzajGry, src.KodGry, src.PodstawObliczPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'POG_ZalacznikD_Gry' BEGIN
		MERGE INTO akc.POG_ZalacznikD_Gry AS tgt
		USING [WA_StageHurtownia].akc.POG_ZalacznikD_Gry AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.RodzajGry=src.RodzajGry, tgt.KodGry=src.KodGry, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznika, NumerPozycji, RodzajGry, KodGry, PodstawObliczPodatku, StawkaPodatkuProcent, KwotaPodatku)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznika, src.NumerPozycji, src.RodzajGry, src.KodGry, src.PodstawObliczPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku);
		SET @Merged = 1;
	END

	IF @TableName = 'POG_ZalacznikR_Gry' BEGIN
		MERGE INTO akc.POG_ZalacznikR_Gry AS tgt
		USING [WA_StageHurtownia].akc.POG_ZalacznikR_Gry AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika AND tgt.NumerPozycji=src.NumerPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.LiczbaAutomatWszystkPunktGier=src.LiczbaAutomatWszystkPunktGier, tgt.StawkaPodatkuOdGierNaJednymAutomat=src.StawkaPodatkuOdGierNaJednymAutomat, tgt.ZryczaltowanyPodatek=src.ZryczaltowanyPodatek
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OznaczenieZalacznika, NumerZalacznika, NumerPozycji, LiczbaAutomatWszystkPunktGier, StawkaPodatkuOdGierNaJednymAutomat, ZryczaltowanyPodatek)
		VALUES (src.IdDok, src.OznaczenieZalacznika, src.NumerZalacznika, src.NumerPozycji, src.LiczbaAutomatWszystkPunktGier, src.StawkaPodatkuOdGierNaJednymAutomat, src.ZryczaltowanyPodatek);
		SET @Merged = 1;
	END

	IF @TableName = 'INF_Informacja_A' BEGIN
		MERGE INTO akc.INF_Informacja_A AS tgt
		USING [WA_StageHurtownia].akc.INF_Informacja_A AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajInformacji=src.RodzajInformacji, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.OkresSprawozdawczy=src.OkresSprawozdawczy, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.ZapasPoczatkowy=src.ZapasPoczatkowy, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSklad=src.IloscWyrobPrzyjetaNaSklad, tgt.IloscWyprodukWyrobAkc=src.IloscWyprodukWyrobAkc, tgt.IloscWyrobZuzytychDoProd=src.IloscWyrobZuzytychDoProd, tgt.IloscWyrobZeSklad=src.IloscWyrobZeSklad, tgt.IloscWyrobZeSkladWprocedZawiesz=src.IloscWyrobZeSkladWprocedZawiesz, tgt.IloscWyrobZeSkladPozaProcedZawiesz=src.IloscWyrobZeSkladPozaProcedZawiesz, tgt.UbytkiCalkowZniszcz=src.UbytkiCalkowZniszcz, tgt.ZapasKoncowy=src.ZapasKoncowy, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajInformacji, RodzajDokumentu, NumerDokumentu, NumerZalacznika, NumerAkcyzowy, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, OkresSprawozdawczy, DataRejestrDokWSyst, DataZlozeniaDok, DataWplywuDok, ZapasPoczatkowy, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSklad, IloscWyprodukWyrobAkc, IloscWyrobZuzytychDoProd, IloscWyrobZeSklad, IloscWyrobZeSkladWprocedZawiesz, IloscWyrobZeSkladPozaProcedZawiesz, UbytkiCalkowZniszcz, ZapasKoncowy, KwotaOdpowZapasKoncow, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajInformacji, src.RodzajDokumentu, src.NumerDokumentu, src.NumerZalacznika, src.NumerAkcyzowy, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.OkresSprawozdawczy, src.DataRejestrDokWSyst, src.DataZlozeniaDok, src.DataWplywuDok, src.ZapasPoczatkowy, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSklad, src.IloscWyprodukWyrobAkc, src.IloscWyrobZuzytychDoProd, src.IloscWyrobZeSklad, src.IloscWyrobZeSkladWprocedZawiesz, src.IloscWyrobZeSkladPozaProcedZawiesz, src.UbytkiCalkowZniszcz, src.ZapasKoncowy, src.KwotaOdpowZapasKoncow, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'INF_Informacja_B' BEGIN
		MERGE INTO akc.INF_Informacja_B AS tgt
		USING [WA_StageHurtownia].akc.INF_Informacja_B AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajInformacji=src.RodzajInformacji, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.OkresSprawozdawczy=src.OkresSprawozdawczy, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.ZapasPoczatkowy=src.ZapasPoczatkowy, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSklad=src.IloscWyrobPrzyjetaNaSklad, tgt.IloscWyprodukWyrobAkc=src.IloscWyprodukWyrobAkc, tgt.IloscWyrobZuzytychDoProd=src.IloscWyrobZuzytychDoProd, tgt.IloscWyrobZeSklad=src.IloscWyrobZeSklad, tgt.IloscWyrobZeSkladWprocedZawiesz=src.IloscWyrobZeSkladWprocedZawiesz, tgt.IloscWyrobZeSkladPozaProcedZawiesz=src.IloscWyrobZeSkladPozaProcedZawiesz, tgt.UbytkiCalkowZniszcz=src.UbytkiCalkowZniszcz, tgt.ZapasKoncowy=src.ZapasKoncowy, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajInformacji, RodzajDokumentu, NumerDokumentu, NumerZalacznika, NumerAkcyzowy, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, OkresSprawozdawczy, DataRejestrDokWSyst, DataZlozeniaDok, DataWplywuDok, ZapasPoczatkowy, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSklad, IloscWyprodukWyrobAkc, IloscWyrobZuzytychDoProd, IloscWyrobZeSklad, IloscWyrobZeSkladWprocedZawiesz, IloscWyrobZeSkladPozaProcedZawiesz, UbytkiCalkowZniszcz, ZapasKoncowy, KwotaOdpowZapasKoncow, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajInformacji, src.RodzajDokumentu, src.NumerDokumentu, src.NumerZalacznika, src.NumerAkcyzowy, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.OkresSprawozdawczy, src.DataRejestrDokWSyst, src.DataZlozeniaDok, src.DataWplywuDok, src.ZapasPoczatkowy, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSklad, src.IloscWyprodukWyrobAkc, src.IloscWyrobZuzytychDoProd, src.IloscWyrobZeSklad, src.IloscWyrobZeSkladWprocedZawiesz, src.IloscWyrobZeSkladPozaProcedZawiesz, src.UbytkiCalkowZniszcz, src.ZapasKoncowy, src.KwotaOdpowZapasKoncow, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'INF_Informacja_C' BEGIN
		MERGE INTO akc.INF_Informacja_C AS tgt
		USING [WA_StageHurtownia].akc.INF_Informacja_C AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajInformacji=src.RodzajInformacji, tgt.NumerDokumentu=src.NumerDokumentu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.OkresSprawozdawczy=src.OkresSprawozdawczy, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.ZapasPoczatkowy=src.ZapasPoczatkowy, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSklad=src.IloscWyrobPrzyjetaNaSklad, tgt.IloscWyprodukWyrobAkc=src.IloscWyprodukWyrobAkc, tgt.IloscWyrobZuzytychDoProd=src.IloscWyrobZuzytychDoProd, tgt.IloscWyrobZeSklad=src.IloscWyrobZeSklad, tgt.IloscWyrobZeSkladWprocedZawiesz=src.IloscWyrobZeSkladWprocedZawiesz, tgt.IloscWyrobZeSkladPozaProcedZawiesz=src.IloscWyrobZeSkladPozaProcedZawiesz, tgt.UbytkiCalkowZniszcz=src.UbytkiCalkowZniszcz, tgt.ZapasKoncowy=src.ZapasKoncowy, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajInformacji, NumerDokumentu, RodzajDokumentu, NumerZalacznika, NumerAkcyzowy, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, OkresSprawozdawczy, DataRejestrDokWSyst, DataZlozeniaDok, DataWplywuDok, ZapasPoczatkowy, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSklad, IloscWyprodukWyrobAkc, IloscWyrobZuzytychDoProd, IloscWyrobZeSklad, IloscWyrobZeSkladWprocedZawiesz, IloscWyrobZeSkladPozaProcedZawiesz, UbytkiCalkowZniszcz, ZapasKoncowy, KwotaOdpowZapasKoncow, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajInformacji, src.NumerDokumentu, src.RodzajDokumentu, src.NumerZalacznika, src.NumerAkcyzowy, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.OkresSprawozdawczy, src.DataRejestrDokWSyst, src.DataZlozeniaDok, src.DataWplywuDok, src.ZapasPoczatkowy, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSklad, src.IloscWyprodukWyrobAkc, src.IloscWyrobZuzytychDoProd, src.IloscWyrobZeSklad, src.IloscWyrobZeSkladWprocedZawiesz, src.IloscWyrobZeSkladPozaProcedZawiesz, src.UbytkiCalkowZniszcz, src.ZapasKoncowy, src.KwotaOdpowZapasKoncow, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'INF_Informacja_D' BEGIN
		MERGE INTO akc.INF_Informacja_D AS tgt
		USING [WA_StageHurtownia].akc.INF_Informacja_D AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajInformacji=src.RodzajInformacji, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.OkresSprawozdawczy=src.OkresSprawozdawczy, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.ZapasPoczatkowy=src.ZapasPoczatkowy, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSklad=src.IloscWyrobPrzyjetaNaSklad, tgt.IloscWyprodukWyrobAkc=src.IloscWyprodukWyrobAkc, tgt.IloscWyrobZuzytychDoProd=src.IloscWyrobZuzytychDoProd, tgt.IloscWyrobZeSklad=src.IloscWyrobZeSklad, tgt.IloscWyrobZeSkladWprocedZawiesz=src.IloscWyrobZeSkladWprocedZawiesz, tgt.IloscWyrobZeSkladPozaProcedZawiesz=src.IloscWyrobZeSkladPozaProcedZawiesz, tgt.UbytkiCalkowZniszcz=src.UbytkiCalkowZniszcz, tgt.ZapasKoncowy=src.ZapasKoncowy, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajInformacji, RodzajDokumentu, NumerDokumentu, NumerZalacznika, NumerAkcyzowy, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, OkresSprawozdawczy, DataRejestrDokWSyst, DataZlozeniaDok, DataWplywuDok, ZapasPoczatkowy, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSklad, IloscWyprodukWyrobAkc, IloscWyrobZuzytychDoProd, IloscWyrobZeSklad, IloscWyrobZeSkladWprocedZawiesz, IloscWyrobZeSkladPozaProcedZawiesz, UbytkiCalkowZniszcz, ZapasKoncowy, KwotaOdpowZapasKoncow, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajInformacji, src.RodzajDokumentu, src.NumerDokumentu, src.NumerZalacznika, src.NumerAkcyzowy, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.OkresSprawozdawczy, src.DataRejestrDokWSyst, src.DataZlozeniaDok, src.DataWplywuDok, src.ZapasPoczatkowy, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSklad, src.IloscWyprodukWyrobAkc, src.IloscWyrobZuzytychDoProd, src.IloscWyrobZeSklad, src.IloscWyrobZeSkladWprocedZawiesz, src.IloscWyrobZeSkladPozaProcedZawiesz, src.UbytkiCalkowZniszcz, src.ZapasKoncowy, src.KwotaOdpowZapasKoncow, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'INF_Informacja_F' BEGIN
		MERGE INTO akc.INF_Informacja_F AS tgt
		USING [WA_StageHurtownia].akc.INF_Informacja_F AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajInformacji=src.RodzajInformacji, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.OkresSprawozdawczy=src.OkresSprawozdawczy, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.ZapasPoczatkowyPapierosySzt=src.ZapasPoczatkowyPapierosySzt, tgt.KwotaOdpowZapasPoczatkPapierosy=src.KwotaOdpowZapasPoczatkPapierosy, tgt.IloscWyrobPrzyjetaNaSkladPapierosySzt=src.IloscWyrobPrzyjetaNaSkladPapierosySzt, tgt.IloscWyprodukWyrobAkcPapierosySzt=src.IloscWyprodukWyrobAkcPapierosySzt, tgt.IloscWyrobZeSkladPapierosySzt=src.IloscWyrobZeSkladPapierosySzt, tgt.IloscWyrobZeSkladWprocedZawieszPapierosySzt=src.IloscWyrobZeSkladWprocedZawieszPapierosySzt, tgt.IloscWyrobZeSkladPozaProcedZawieszPapierosySzt=src.IloscWyrobZeSkladPozaProcedZawieszPapierosySzt, tgt.UbytkiCalkowZniszczPapierosySzt=src.UbytkiCalkowZniszczPapierosySzt, tgt.ZapasKoncowyPapierosySzt=src.ZapasKoncowyPapierosySzt, tgt.KwotaOdpowZapasKoncowPapierosy=src.KwotaOdpowZapasKoncowPapierosy, tgt.ZapasPoczatCygaraSzt=src.ZapasPoczatCygaraSzt, tgt.KwotaOdpowZapasPoczatkCygara=src.KwotaOdpowZapasPoczatkCygara, tgt.IloscWyrobPrzyjetaNaSkladCygaraSzt=src.IloscWyrobPrzyjetaNaSkladCygaraSzt, tgt.IloscWyprodukWyrobAkcCygaraSzt=src.IloscWyprodukWyrobAkcCygaraSzt, tgt.IloscWyrobZeSkladCygaraSzt=src.IloscWyrobZeSkladCygaraSzt, tgt.IloscWyrobZeSkladWprocedZawieszCygaraSzt=src.IloscWyrobZeSkladWprocedZawieszCygaraSzt, tgt.IloscWyrobZeSkladPozaProcedZawieszCygaraSzt=src.IloscWyrobZeSkladPozaProcedZawieszCygaraSzt, tgt.UbytkiCalkowZniszczCygaraSzt=src.UbytkiCalkowZniszczCygaraSzt, tgt.ZapasKoncowyCygaraSzt=src.ZapasKoncowyCygaraSzt, tgt.KwotaOdpowZapasKoncowCygara=src.KwotaOdpowZapasKoncowCygara, tgt.ZapasPoczatTytonKg=src.ZapasPoczatTytonKg, tgt.KwotaOdpowZapasPoczatkTyton=src.KwotaOdpowZapasPoczatkTyton, tgt.IloscWyrobPrzyjetaNaSkladTytonKg=src.IloscWyrobPrzyjetaNaSkladTytonKg, tgt.IloscWyprodukWyrobAkcTytonKg=src.IloscWyprodukWyrobAkcTytonKg, tgt.IloscWyrobZeSkladTytonKg=src.IloscWyrobZeSkladTytonKg, tgt.IloscWyrobZeSkladWprocedZawieszTytonKg=src.IloscWyrobZeSkladWprocedZawieszTytonKg, tgt.IloscWyrobZeSkladPozaProcedZawieszTytonKg=src.IloscWyrobZeSkladPozaProcedZawieszTytonKg, tgt.UbytkiCalkowZniszczTytonKg=src.UbytkiCalkowZniszczTytonKg, tgt.ZapasKoncowyTytonKg=src.ZapasKoncowyTytonKg, tgt.KwotaOdpowZapasKoncowTyton=src.KwotaOdpowZapasKoncowTyton, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajInformacji, RodzajDokumentu, NumerDokumentu, NumerZalacznika, NumerAkcyzowy, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, OkresSprawozdawczy, DataRejestrDokWSyst, DataZlozeniaDok, DataWplywuDok, ZapasPoczatkowyPapierosySzt, KwotaOdpowZapasPoczatkPapierosy, IloscWyrobPrzyjetaNaSkladPapierosySzt, IloscWyprodukWyrobAkcPapierosySzt, IloscWyrobZeSkladPapierosySzt, IloscWyrobZeSkladWprocedZawieszPapierosySzt, IloscWyrobZeSkladPozaProcedZawieszPapierosySzt, UbytkiCalkowZniszczPapierosySzt, ZapasKoncowyPapierosySzt, KwotaOdpowZapasKoncowPapierosy, ZapasPoczatCygaraSzt, KwotaOdpowZapasPoczatkCygara, IloscWyrobPrzyjetaNaSkladCygaraSzt, IloscWyprodukWyrobAkcCygaraSzt, IloscWyrobZeSkladCygaraSzt, IloscWyrobZeSkladWprocedZawieszCygaraSzt, IloscWyrobZeSkladPozaProcedZawieszCygaraSzt, UbytkiCalkowZniszczCygaraSzt, ZapasKoncowyCygaraSzt, KwotaOdpowZapasKoncowCygara, ZapasPoczatTytonKg, KwotaOdpowZapasPoczatkTyton, IloscWyrobPrzyjetaNaSkladTytonKg, IloscWyprodukWyrobAkcTytonKg, IloscWyrobZeSkladTytonKg, IloscWyrobZeSkladWprocedZawieszTytonKg, IloscWyrobZeSkladPozaProcedZawieszTytonKg, UbytkiCalkowZniszczTytonKg, ZapasKoncowyTytonKg, KwotaOdpowZapasKoncowTyton, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajInformacji, src.RodzajDokumentu, src.NumerDokumentu, src.NumerZalacznika, src.NumerAkcyzowy, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.OkresSprawozdawczy, src.DataRejestrDokWSyst, src.DataZlozeniaDok, src.DataWplywuDok, src.ZapasPoczatkowyPapierosySzt, src.KwotaOdpowZapasPoczatkPapierosy, src.IloscWyrobPrzyjetaNaSkladPapierosySzt, src.IloscWyprodukWyrobAkcPapierosySzt, src.IloscWyrobZeSkladPapierosySzt, src.IloscWyrobZeSkladWprocedZawieszPapierosySzt, src.IloscWyrobZeSkladPozaProcedZawieszPapierosySzt, src.UbytkiCalkowZniszczPapierosySzt, src.ZapasKoncowyPapierosySzt, src.KwotaOdpowZapasKoncowPapierosy, src.ZapasPoczatCygaraSzt, src.KwotaOdpowZapasPoczatkCygara, src.IloscWyrobPrzyjetaNaSkladCygaraSzt, src.IloscWyprodukWyrobAkcCygaraSzt, src.IloscWyrobZeSkladCygaraSzt, src.IloscWyrobZeSkladWprocedZawieszCygaraSzt, src.IloscWyrobZeSkladPozaProcedZawieszCygaraSzt, src.UbytkiCalkowZniszczCygaraSzt, src.ZapasKoncowyCygaraSzt, src.KwotaOdpowZapasKoncowCygara, src.ZapasPoczatTytonKg, src.KwotaOdpowZapasPoczatkTyton, src.IloscWyrobPrzyjetaNaSkladTytonKg, src.IloscWyprodukWyrobAkcTytonKg, src.IloscWyrobZeSkladTytonKg, src.IloscWyrobZeSkladWprocedZawieszTytonKg, src.IloscWyrobZeSkladPozaProcedZawieszTytonKg, src.UbytkiCalkowZniszczTytonKg, src.ZapasKoncowyTytonKg, src.KwotaOdpowZapasKoncowTyton, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'INF_Informacja_I' BEGIN
		MERGE INTO akc.INF_Informacja_I AS tgt
		USING [WA_StageHurtownia].akc.INF_Informacja_I AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajInformacji=src.RodzajInformacji, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.OkresSprawozdawczy=src.OkresSprawozdawczy, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.ZapasPoczatkowyTysL=src.ZapasPoczatkowyTysL, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSkladTysL=src.IloscWyrobPrzyjetaNaSkladTysL, tgt.IloscWyprodukWyrobAkcTysL=src.IloscWyprodukWyrobAkcTysL, tgt.IloscWyrobZuzytychDoProdTysL=src.IloscWyrobZuzytychDoProdTysL, tgt.IloscWyrobZeSkladTysL=src.IloscWyrobZeSkladTysL, tgt.IloscWyrobZeSkladWprocedZawieszTysL=src.IloscWyrobZeSkladWprocedZawieszTysL, tgt.IloscWyrobZeSkladPozaProcedZawieszTysL=src.IloscWyrobZeSkladPozaProcedZawieszTysL, tgt.UbytkiCalkowZniszczTysL=src.UbytkiCalkowZniszczTysL, tgt.ZapasKoncowyTysL=src.ZapasKoncowyTysL, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.ZapasPoczatkowyTysKg=src.ZapasPoczatkowyTysKg, tgt.IloscWyrobPrzyjetaNaSkladTysKg=src.IloscWyrobPrzyjetaNaSkladTysKg, tgt.IloscWyprodukWyrobAkcTysKg=src.IloscWyprodukWyrobAkcTysKg, tgt.IloscWyrobZuzytychDoProdTysKg=src.IloscWyrobZuzytychDoProdTysKg, tgt.IloscWyrobZeSkladTysKg=src.IloscWyrobZeSkladTysKg, tgt.IloscWyrobZeSkladWprocedZawieszTysKg=src.IloscWyrobZeSkladWprocedZawieszTysKg, tgt.IloscWyrobZeSkladPozaProcedZawieszTysKg=src.IloscWyrobZeSkladPozaProcedZawieszTysKg, tgt.UbytkiCalkowZniszczTysKg=src.UbytkiCalkowZniszczTysKg, tgt.ZapasKoncowyTysKg=src.ZapasKoncowyTysKg, tgt.ZapasPoczatkowyGJ=src.ZapasPoczatkowyGJ, tgt.IloscWyrobPrzyjetaNaSkladGJ=src.IloscWyrobPrzyjetaNaSkladGJ, tgt.IloscWyprodukWyrobAkcGJ=src.IloscWyprodukWyrobAkcGJ, tgt.IloscWyrobZuzytychDoProdGJ=src.IloscWyrobZuzytychDoProdGJ, tgt.IloscWyrobZeSkladGJ=src.IloscWyrobZeSkladGJ, tgt.IloscWyrobZeSkladWprocedZawieszGJ=src.IloscWyrobZeSkladWprocedZawieszGJ, tgt.IloscWyrobZeSkladPozaProcedZawieszGJ=src.IloscWyrobZeSkladPozaProcedZawieszGJ, tgt.UbytkiCalkowZniszczGJ=src.UbytkiCalkowZniszczGJ, tgt.ZapasKoncowyGJ=src.ZapasKoncowyGJ, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajInformacji, RodzajDokumentu, NumerDokumentu, NumerZalacznika, NumerAkcyzowy, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, OkresSprawozdawczy, DataRejestrDokWSyst, DataZlozeniaDok, DataWplywuDok, ZapasPoczatkowyTysL, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSkladTysL, IloscWyprodukWyrobAkcTysL, IloscWyrobZuzytychDoProdTysL, IloscWyrobZeSkladTysL, IloscWyrobZeSkladWprocedZawieszTysL, IloscWyrobZeSkladPozaProcedZawieszTysL, UbytkiCalkowZniszczTysL, ZapasKoncowyTysL, KwotaOdpowZapasKoncow, ZapasPoczatkowyTysKg, IloscWyrobPrzyjetaNaSkladTysKg, IloscWyprodukWyrobAkcTysKg, IloscWyrobZuzytychDoProdTysKg, IloscWyrobZeSkladTysKg, IloscWyrobZeSkladWprocedZawieszTysKg, IloscWyrobZeSkladPozaProcedZawieszTysKg, UbytkiCalkowZniszczTysKg, ZapasKoncowyTysKg, ZapasPoczatkowyGJ, IloscWyrobPrzyjetaNaSkladGJ, IloscWyprodukWyrobAkcGJ, IloscWyrobZuzytychDoProdGJ, IloscWyrobZeSkladGJ, IloscWyrobZeSkladWprocedZawieszGJ, IloscWyrobZeSkladPozaProcedZawieszGJ, UbytkiCalkowZniszczGJ, ZapasKoncowyGJ, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajInformacji, src.RodzajDokumentu, src.NumerDokumentu, src.NumerZalacznika, src.NumerAkcyzowy, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.OkresSprawozdawczy, src.DataRejestrDokWSyst, src.DataZlozeniaDok, src.DataWplywuDok, src.ZapasPoczatkowyTysL, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSkladTysL, src.IloscWyprodukWyrobAkcTysL, src.IloscWyrobZuzytychDoProdTysL, src.IloscWyrobZeSkladTysL, src.IloscWyrobZeSkladWprocedZawieszTysL, src.IloscWyrobZeSkladPozaProcedZawieszTysL, src.UbytkiCalkowZniszczTysL, src.ZapasKoncowyTysL, src.KwotaOdpowZapasKoncow, src.ZapasPoczatkowyTysKg, src.IloscWyrobPrzyjetaNaSkladTysKg, src.IloscWyprodukWyrobAkcTysKg, src.IloscWyrobZuzytychDoProdTysKg, src.IloscWyrobZeSkladTysKg, src.IloscWyrobZeSkladWprocedZawieszTysKg, src.IloscWyrobZeSkladPozaProcedZawieszTysKg, src.UbytkiCalkowZniszczTysKg, src.ZapasKoncowyTysKg, src.ZapasPoczatkowyGJ, src.IloscWyrobPrzyjetaNaSkladGJ, src.IloscWyprodukWyrobAkcGJ, src.IloscWyrobZuzytychDoProdGJ, src.IloscWyrobZeSkladGJ, src.IloscWyrobZeSkladWprocedZawieszGJ, src.IloscWyrobZeSkladPozaProcedZawieszGJ, src.UbytkiCalkowZniszczGJ, src.ZapasKoncowyGJ, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'INF_Informacja_J' BEGIN
		MERGE INTO akc.INF_Informacja_J AS tgt
		USING [WA_StageHurtownia].akc.INF_Informacja_J AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajInformacji=src.RodzajInformacji, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.OkresSprawozdawczy=src.OkresSprawozdawczy, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.ZapasPoczatkowyTysKg=src.ZapasPoczatkowyTysKg, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSkladTysKg=src.IloscWyrobPrzyjetaNaSkladTysKg, tgt.IloscWyprodukWyrobAkcTysKg=src.IloscWyprodukWyrobAkcTysKg, tgt.IloscWyrobZuzytychDoProdTysKg=src.IloscWyrobZuzytychDoProdTysKg, tgt.IloscWyrobZeSkladTysKg=src.IloscWyrobZeSkladTysKg, tgt.IloscWyrobZeSkladWprocedZawieszTysKg=src.IloscWyrobZeSkladWprocedZawieszTysKg, tgt.IloscWyrobZeSkladPozaProcedZawieszTysKg=src.IloscWyrobZeSkladPozaProcedZawieszTysKg, tgt.UbytkiCalkowZniszczTysKg=src.UbytkiCalkowZniszczTysKg, tgt.ZapasKoncowyTysKg=src.ZapasKoncowyTysKg, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.ZapasPoczatkowyGJ=src.ZapasPoczatkowyGJ, tgt.IloscWyrobPrzyjetaNaSkladGJ=src.IloscWyrobPrzyjetaNaSkladGJ, tgt.IloscWyprodukWyrobAkcGJ=src.IloscWyprodukWyrobAkcGJ, tgt.IloscWyrobZuzytychDoProdGJ=src.IloscWyrobZuzytychDoProdGJ, tgt.IloscWyrobZeSkladGJ=src.IloscWyrobZeSkladGJ, tgt.IloscWyrobZeSkladWprocedZawieszGJ=src.IloscWyrobZeSkladWprocedZawieszGJ, tgt.IloscWyrobZeSkladPozaProcedZawieszGJ=src.IloscWyrobZeSkladPozaProcedZawieszGJ, tgt.UbytkiCalkowZniszczGJ=src.UbytkiCalkowZniszczGJ, tgt.ZapasKoncowyGJ=src.ZapasKoncowyGJ, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajInformacji, RodzajDokumentu, NumerDokumentu, NumerZalacznika, NumerAkcyzowy, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, OkresSprawozdawczy, DataRejestrDokWSyst, DataZlozeniaDok, DataWplywuDok, ZapasPoczatkowyTysKg, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSkladTysKg, IloscWyprodukWyrobAkcTysKg, IloscWyrobZuzytychDoProdTysKg, IloscWyrobZeSkladTysKg, IloscWyrobZeSkladWprocedZawieszTysKg, IloscWyrobZeSkladPozaProcedZawieszTysKg, UbytkiCalkowZniszczTysKg, ZapasKoncowyTysKg, KwotaOdpowZapasKoncow, ZapasPoczatkowyGJ, IloscWyrobPrzyjetaNaSkladGJ, IloscWyprodukWyrobAkcGJ, IloscWyrobZuzytychDoProdGJ, IloscWyrobZeSkladGJ, IloscWyrobZeSkladWprocedZawieszGJ, IloscWyrobZeSkladPozaProcedZawieszGJ, UbytkiCalkowZniszczGJ, ZapasKoncowyGJ, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajInformacji, src.RodzajDokumentu, src.NumerDokumentu, src.NumerZalacznika, src.NumerAkcyzowy, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.OkresSprawozdawczy, src.DataRejestrDokWSyst, src.DataZlozeniaDok, src.DataWplywuDok, src.ZapasPoczatkowyTysKg, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSkladTysKg, src.IloscWyprodukWyrobAkcTysKg, src.IloscWyrobZuzytychDoProdTysKg, src.IloscWyrobZeSkladTysKg, src.IloscWyrobZeSkladWprocedZawieszTysKg, src.IloscWyrobZeSkladPozaProcedZawieszTysKg, src.UbytkiCalkowZniszczTysKg, src.ZapasKoncowyTysKg, src.KwotaOdpowZapasKoncow, src.ZapasPoczatkowyGJ, src.IloscWyrobPrzyjetaNaSkladGJ, src.IloscWyprodukWyrobAkcGJ, src.IloscWyrobZuzytychDoProdGJ, src.IloscWyrobZeSkladGJ, src.IloscWyrobZeSkladWprocedZawieszGJ, src.IloscWyrobZeSkladPozaProcedZawieszGJ, src.UbytkiCalkowZniszczGJ, src.ZapasKoncowyGJ, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'INF_Informacja_K' BEGIN
		MERGE INTO akc.INF_Informacja_K AS tgt
		USING [WA_StageHurtownia].akc.INF_Informacja_K AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NumerZalacznika=src.NumerZalacznika)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajInformacji=src.RodzajInformacji, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.NumerAkcyzowy=src.NumerAkcyzowy, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.OkresSprawozdawczy=src.OkresSprawozdawczy, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.ZapasPoczatkowy=src.ZapasPoczatkowy, tgt.KwotaOdpowZapasPoczatk=src.KwotaOdpowZapasPoczatk, tgt.IloscWyrobPrzyjetaNaSklad=src.IloscWyrobPrzyjetaNaSklad, tgt.IloscWyprodukWyrobAkc=src.IloscWyprodukWyrobAkc, tgt.IloscWyrobZuzytychDoProd=src.IloscWyrobZuzytychDoProd, tgt.IloscWyrobZeSklad=src.IloscWyrobZeSklad, tgt.IloscWyrobZeSkladWprocedZawiesz=src.IloscWyrobZeSkladWprocedZawiesz, tgt.IloscWyrobZeSkladPozaProcedZawiesz=src.IloscWyrobZeSkladPozaProcedZawiesz, tgt.UbytkiCalkowZniszcz=src.UbytkiCalkowZniszcz, tgt.ZapasKoncowy=src.ZapasKoncowy, tgt.KwotaOdpowZapasKoncow=src.KwotaOdpowZapasKoncow, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajInformacji, RodzajDokumentu, NumerDokumentu, NumerZalacznika, NumerAkcyzowy, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, OkresSprawozdawczy, DataRejestrDokWSyst, DataZlozeniaDok, DataWplywuDok, ZapasPoczatkowy, KwotaOdpowZapasPoczatk, IloscWyrobPrzyjetaNaSklad, IloscWyprodukWyrobAkc, IloscWyrobZuzytychDoProd, IloscWyrobZeSklad, IloscWyrobZeSkladWprocedZawiesz, IloscWyrobZeSkladPozaProcedZawiesz, UbytkiCalkowZniszcz, ZapasKoncowy, KwotaOdpowZapasKoncow, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajInformacji, src.RodzajDokumentu, src.NumerDokumentu, src.NumerZalacznika, src.NumerAkcyzowy, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.OkresSprawozdawczy, src.DataRejestrDokWSyst, src.DataZlozeniaDok, src.DataWplywuDok, src.ZapasPoczatkowy, src.KwotaOdpowZapasPoczatk, src.IloscWyrobPrzyjetaNaSklad, src.IloscWyprodukWyrobAkc, src.IloscWyrobZuzytychDoProd, src.IloscWyrobZeSklad, src.IloscWyrobZeSkladWprocedZawiesz, src.IloscWyrobZeSkladPozaProcedZawiesz, src.UbytkiCalkowZniszcz, src.ZapasKoncowy, src.KwotaOdpowZapasKoncow, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'AKC4_PodatekWedlugGrup' BEGIN
		MERGE INTO akc.AKC4_PodatekWedlugGrup AS tgt
		USING [WA_StageHurtownia].akc.AKC4_PodatekWedlugGrup AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OgolemPodatekOdAlkoholuEtylowego=src.OgolemPodatekOdAlkoholuEtylowego, tgt.OgolemPodatekOdWinaNapojFerment=src.OgolemPodatekOdWinaNapojFerment, tgt.OgolemPodatekOdPiwa=src.OgolemPodatekOdPiwa, tgt.OgolemPodatekOdPaliwSilnik=src.OgolemPodatekOdPaliwSilnik, tgt.OgolemPodatekOdSamochOsob=src.OgolemPodatekOdSamochOsob, tgt.OgolemPodatekOdWyrobTyton=src.OgolemPodatekOdWyrobTyton, tgt.OgolemPodatekOdEnergiiElektr=src.OgolemPodatekOdEnergiiElektr, tgt.OgolemPodatekOdPaliwOpal=src.OgolemPodatekOdPaliwOpal, tgt.OgolemPodatekOdGazu=src.OgolemPodatekOdGazu, tgt.OgolemPodatekOdOlejSmar=src.OgolemPodatekOdOlejSmar, tgt.OgolemPodatekOdWyrobGazow=src.OgolemPodatekOdWyrobGazow
		WHEN NOT MATCHED
		THEN INSERT (IdDok, OgolemPodatekOdAlkoholuEtylowego, OgolemPodatekOdWinaNapojFerment, OgolemPodatekOdPiwa, OgolemPodatekOdPaliwSilnik, OgolemPodatekOdSamochOsob, OgolemPodatekOdWyrobTyton, OgolemPodatekOdEnergiiElektr, OgolemPodatekOdPaliwOpal, OgolemPodatekOdGazu, OgolemPodatekOdOlejSmar, OgolemPodatekOdWyrobGazow)
		VALUES (src.IdDok, src.OgolemPodatekOdAlkoholuEtylowego, src.OgolemPodatekOdWinaNapojFerment, src.OgolemPodatekOdPiwa, src.OgolemPodatekOdPaliwSilnik, src.OgolemPodatekOdSamochOsob, src.OgolemPodatekOdWyrobTyton, src.OgolemPodatekOdEnergiiElektr, src.OgolemPodatekOdPaliwOpal, src.OgolemPodatekOdGazu, src.OgolemPodatekOdOlejSmar, src.OgolemPodatekOdWyrobGazow);
		SET @Merged = 1;
	END

	IF @TableName = 'AKCEN_Deklaracja' BEGIN
		MERGE INTO akc.AKCEN_Deklaracja AS tgt
		USING [WA_StageHurtownia].akc.AKCEN_Deklaracja AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKomorki=src.IdKomorki, tgt.IdPodmiotu=src.IdPodmiotu, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.IdDokStowarzysz=src.IdDokStowarzysz, tgt.NumerDokumentuStowarzysz=src.NumerDokumentuStowarzysz, tgt.IzbaCelnaZlozeniaDok=src.IzbaCelnaZlozeniaDok, tgt.MiejsceZlozeniaDok=src.MiejsceZlozeniaDok, tgt.ZnacznikKorekty=src.ZnacznikKorekty, tgt.Status=src.Status, tgt.DataRejestrDokWSyst=src.DataRejestrDokWSyst, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.KwotaPodatkuAkc=src.KwotaPodatkuAkc, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.DoZaplaty=src.DoZaplaty, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdKomorki, IdPodmiotu, RodzajDokumentu, NumerDokumentu, IdDokStowarzysz, NumerDokumentuStowarzysz, IzbaCelnaZlozeniaDok, MiejsceZlozeniaDok, ZnacznikKorekty, Status, DataRejestrDokWSyst, DeklaracjaZaOkres, DataZlozeniaDok, DataWplywuDok, TerminPlatnosci, KwotaPodatkuAkc, ZwolnieniaObnizenia, DoZaplaty, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji)
		VALUES (src.IdDok, src.IdKomorki, src.IdPodmiotu, src.RodzajDokumentu, src.NumerDokumentu, src.IdDokStowarzysz, src.NumerDokumentuStowarzysz, src.IzbaCelnaZlozeniaDok, src.MiejsceZlozeniaDok, src.ZnacznikKorekty, src.Status, src.DataRejestrDokWSyst, src.DeklaracjaZaOkres, src.DataZlozeniaDok, src.DataWplywuDok, src.TerminPlatnosci, src.KwotaPodatkuAkc, src.ZwolnieniaObnizenia, src.DoZaplaty, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji);
		SET @Merged = 1;
	END

		IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END