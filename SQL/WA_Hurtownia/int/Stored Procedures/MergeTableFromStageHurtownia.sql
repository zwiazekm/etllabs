-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2014-07-31
-- Description:	
-- =============================================

CREATE PROCEDURE [int].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END

	IF @TableName = 'INTRASTAT_DokumentZrodlowy' BEGIN
		MERGE INTO int.INTRASTAT_DokumentZrodlowy AS tgt
		USING [WA_StageHurtownia].int.INTRASTAT_DokumentZrodlowy AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Symbol=src.Symbol, tgt.Rodzaj=src.Rodzaj, tgt.RodzajPid=src.RodzajPid, tgt.SposobWprowadzania=src.SposobWprowadzania, tgt.DataWprowadzenia=src.DataWprowadzenia, tgt.Uzytkownik=src.Uzytkownik, tgt.IdDeklWynikowej=src.IdDeklWynikowej, tgt.IdJednostki=src.IdJednostki, tgt.REGON=src.REGON
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Symbol, Rodzaj, RodzajPid, SposobWprowadzania, DataWprowadzenia, Uzytkownik, IdDeklWynikowej, IdJednostki, REGON)
		VALUES (src.IdDok, src.Symbol, src.Rodzaj, src.RodzajPid, src.SposobWprowadzania, src.DataWprowadzenia, src.Uzytkownik, src.IdDeklWynikowej, src.IdJednostki, src.REGON);
        SET @Merged = 1;
	END
	IF @TableName = 'INTRASTAT_DeklaracjaWynikowa' BEGIN
		MERGE INTO int.INTRASTAT_DeklaracjaWynikowa AS tgt
		USING [WA_StageHurtownia].int.INTRASTAT_DeklaracjaWynikowa AS src
		ON (tgt.IdDeklWynikowej=src.IdDeklWynikowej)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Status=src.Status, tgt.NIP=src.NIP, tgt.REGON=src.REGON, tgt.Typ=src.Typ, tgt.TypPid=src.TypPid, tgt.Rok=src.Rok, tgt.Miesiac=src.Miesiac, tgt.NrWersji=src.NrWersji
		WHEN NOT MATCHED
		THEN INSERT (IdDeklWynikowej, Status, NIP, REGON, Typ, TypPid, Rok, Miesiac, NrWersji)
		VALUES (src.IdDeklWynikowej, src.Status, src.NIP, src.REGON, src.Typ, src.TypPid, src.Rok, src.Miesiac, src.NrWersji);
        SET @Merged = 1;
	END
	IF @TableName = 'INTRASTAT_Towar' BEGIN
		MERGE INTO int.INTRASTAT_Towar AS tgt
		USING [WA_StageHurtownia].int.INTRASTAT_Towar AS src
		ON (tgt.IdDeklWynikowej=src.IdDeklWynikowej AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Status=src.Status, tgt.Komentarz=src.Komentarz, tgt.OpisTowaru=src.OpisTowaru, tgt.KrajPrzeznaczeniaWysylki=src.KrajPrzeznaczeniaWysylki, tgt.KrajPrzeznaczeniaWysylkiPid=src.KrajPrzeznaczeniaWysylkiPid, tgt.WarunkiDostawy=src.WarunkiDostawy, tgt.WarunkiDostawyPid=src.WarunkiDostawyPid, tgt.RodzajTransakcji=src.RodzajTransakcji, tgt.RodzajTransakcjiPid=src.RodzajTransakcjiPid, tgt.RodzajTransportu=src.RodzajTransportu, tgt.RodzajTransportuPid=src.RodzajTransportuPid, tgt.KodTowarowy=src.KodTowarowy, tgt.KodTowarowyPid=src.KodTowarowyPid, tgt.KrajPochodzenia=src.KrajPochodzenia, tgt.KrajPochodzeniaPid=src.KrajPochodzeniaPid, tgt.MasaNetto=src.MasaNetto, tgt.IloscUjm=src.IloscUjm, tgt.WartoscFaktury=src.WartoscFaktury, tgt.WartoscStatystyczna=src.WartoscStatystyczna
		WHEN NOT MATCHED
		THEN INSERT (IdDeklWynikowej, IdPozycji, Status, Komentarz, OpisTowaru, KrajPrzeznaczeniaWysylki, KrajPrzeznaczeniaWysylkiPid, WarunkiDostawy, WarunkiDostawyPid, RodzajTransakcji, RodzajTransakcjiPid, RodzajTransportu, RodzajTransportuPid, KodTowarowy, KodTowarowyPid, KrajPochodzenia, KrajPochodzeniaPid, MasaNetto, IloscUjm, WartoscFaktury, WartoscStatystyczna)
		VALUES (src.IdDeklWynikowej, src.IdPozycji, src.Status, src.Komentarz, src.OpisTowaru, src.KrajPrzeznaczeniaWysylki, src.KrajPrzeznaczeniaWysylkiPid, src.WarunkiDostawy, src.WarunkiDostawyPid, src.RodzajTransakcji, src.RodzajTransakcjiPid, src.RodzajTransportu, src.RodzajTransportuPid, src.KodTowarowy, src.KodTowarowyPid, src.KrajPochodzenia, src.KrajPochodzeniaPid, src.MasaNetto, src.IloscUjm, src.WartoscFaktury, src.WartoscStatystyczna);
        SET @Merged = 1;
	END
	IF @TableName = 'INTRASTAT_Podmiot' BEGIN
		MERGE INTO int.INTRASTAT_Podmiot AS tgt
		USING [WA_StageHurtownia].int.INTRASTAT_Podmiot AS src
		ON (tgt.IdPodmiotu=src.IdPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NIP=src.NIP, tgt.REGON=src.REGON
		WHEN NOT MATCHED
		THEN INSERT (IdPodmiotu, NIP, REGON)
		VALUES (src.IdPodmiotu, src.NIP, src.REGON);
        SET @Merged = 1;
	END

	IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END