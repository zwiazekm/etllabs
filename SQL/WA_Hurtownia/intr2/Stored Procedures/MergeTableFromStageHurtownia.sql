
-- =============================================
-- Author:	
-- Create date: 2014-07-31
-- Description:	
-- =============================================

CREATE PROCEDURE [intr2].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END
	--INTRASTAT_DeklaracjaWynikowa
IF @TableName = 'INTRASTAT_DeklaracjaWynikowa' BEGIN
MERGE INTO intr2.INTRASTAT_DeklaracjaWynikowa AS tgt
USING WA_StageHurtownia.intr2.INTRASTAT_DeklaracjaWynikowa AS src
ON (tgt.IdDeklWynikowej=src.IdDeklWynikowej)
WHEN MATCHED
THEN UPDATE SET
tgt.Status=src.Status, tgt.Typ=src.Typ, tgt.TypPid=src.TypPid, tgt.Rok=src.Rok, tgt.Miesiac=src.Miesiac, tgt.Numer=src.Numer, tgt.NIP=src.NIP, tgt.REGON=src.REGON, tgt.Wersja=src.Wersja, tgt.Symbol=src.Symbol, tgt.IdSprawy=src.IdSprawy, tgt.DataUtworzenia=src.DataUtworzenia
WHEN NOT MATCHED
THEN INSERT (IdDeklWynikowej, Status, Typ, TypPid, Rok, Miesiac, Numer, NIP, REGON, Wersja, Symbol, IdSprawy, DataUtworzenia)
VALUES (src.IdDeklWynikowej, src.Status, src.Typ, src.TypPid, src.Rok, src.Miesiac, src.Numer, src.NIP, src.REGON, src.Wersja, src.Symbol, src.IdSprawy, src.DataUtworzenia);
  SET @Merged = 1;
	END	
	--INTRASTAT_DokumentZrodlowy
IF @TableName = 'INTRASTAT_DokumentZrodlowy' BEGIN
MERGE INTO intr2.INTRASTAT_DokumentZrodlowy AS tgt
USING WA_StageHurtownia.intr2.INTRASTAT_DokumentZrodlowy AS src
ON (tgt.IdDok=src.IdDok)
WHEN MATCHED
THEN UPDATE SET
tgt.Symbol=src.Symbol, tgt.Rodzaj=src.Rodzaj, tgt.RodzajPid=src.RodzajPid, tgt.SposobWprowadzania=src.SposobWprowadzania, tgt.DataWprowadzenia=src.DataWprowadzenia, tgt.IdDeklWynikowej=src.IdDeklWynikowej, tgt.REGON=src.REGON, tgt.NIP=src.NIP, tgt.Status=src.Status, tgt.Wersja=src.Wersja, tgt.IdOsoby=src.IdOsoby, tgt.IdPodmiotu=src.IdPodmiotu, tgt.IdPodmiotuPosredniczacego=src.IdPodmiotuPosredniczacego, tgt.NumerWlasny=src.NumerWlasny
WHEN NOT MATCHED
THEN INSERT (IdDok, Symbol, Rodzaj, RodzajPid, SposobWprowadzania, DataWprowadzenia, IdDeklWynikowej, REGON, NIP, Status, Wersja, IdOsoby, IdPodmiotu, IdPodmiotuPosredniczacego, NumerWlasny)
VALUES (src.IdDok, src.Symbol, src.Rodzaj, src.RodzajPid, src.SposobWprowadzania, src.DataWprowadzenia, src.IdDeklWynikowej, src.REGON, src.NIP, src.Status, src.Wersja, src.IdOsoby, src.IdPodmiotu, src.IdPodmiotuPosredniczacego, src.NumerWlasny);
	  SET @Merged = 1;
	END	
	--INTRASTAT_Podmiot
IF @TableName = 'INTRASTAT_Podmiot' BEGIN
MERGE INTO intr2.INTRASTAT_Podmiot AS tgt
USING WA_StageHurtownia.intr2.INTRASTAT_Podmiot AS src
ON (tgt.IdPodmiotu=src.IdPodmiotu)
WHEN MATCHED
THEN UPDATE SET
tgt.NIP=src.NIP, tgt.REGON=src.REGON
WHEN NOT MATCHED
THEN INSERT (IdPodmiotu, NIP, REGON)
VALUES (src.IdPodmiotu, src.NIP, src.REGON);
	  SET @Merged = 1;
	END	

	--INTRASTAT_Towar
IF @TableName = 'INTRASTAT_Towar' BEGIN
MERGE INTO intr2.INTRASTAT_Towar AS tgt
USING WA_StageHurtownia.intr2.INTRASTAT_Towar AS src
ON (tgt.IdDeklWynikowej=src.IdDeklWynikowej AND tgt.IdPozycji=src.IdPozycji)
WHEN MATCHED
THEN UPDATE SET
 tgt.Status=src.Status, tgt.Komentarz=src.Komentarz, tgt.OpisTowaru=src.OpisTowaru, tgt.KrajPrzeznaczeniaWysylki=src.KrajPrzeznaczeniaWysylki, tgt.KrajPrzeznaczeniaWysylkiPid=src.KrajPrzeznaczeniaWysylkiPid, tgt.WarunkiDostawy=src.WarunkiDostawy, tgt.WarunkiDostawyPid=src.WarunkiDostawyPid, tgt.RodzajTransakcji=src.RodzajTransakcji, tgt.RodzajTransakcjiPid=src.RodzajTransakcjiPid, tgt.RodzajTransportu=src.RodzajTransportu, tgt.RodzajTransportuPid=src.RodzajTransportuPid, tgt.KodTowarowy=src.KodTowarowy, tgt.KodTowarowyPid=src.KodTowarowyPid, tgt.KrajPochodzenia=src.KrajPochodzenia, tgt.KrajPochodzeniaPid=src.KrajPochodzeniaPid, tgt.MasaNetto=src.MasaNetto, tgt.IloscUjm=src.IloscUjm, tgt.WartoscFaktury=src.WartoscFaktury, tgt.WartoscStatystyczna=src.WartoscStatystyczna, tgt.Flaga=src.Flaga, tgt.IdKontrahenta=src.IdKontrahenta
WHEN NOT MATCHED
THEN INSERT (IdDeklWynikowej, IdPozycji, Status, Komentarz, OpisTowaru, KrajPrzeznaczeniaWysylki, KrajPrzeznaczeniaWysylkiPid, WarunkiDostawy, WarunkiDostawyPid, RodzajTransakcji, RodzajTransakcjiPid, RodzajTransportu, RodzajTransportuPid, KodTowarowy, KodTowarowyPid, KrajPochodzenia, KrajPochodzeniaPid, MasaNetto, IloscUjm, WartoscFaktury, WartoscStatystyczna, Flaga, IdKontrahenta)
VALUES (src.IdDeklWynikowej, src.IdPozycji, src.Status, src.Komentarz, src.OpisTowaru, src.KrajPrzeznaczeniaWysylki, src.KrajPrzeznaczeniaWysylkiPid, src.WarunkiDostawy, src.WarunkiDostawyPid, src.RodzajTransakcji, src.RodzajTransakcjiPid, src.RodzajTransportu, src.RodzajTransportuPid, src.KodTowarowy, src.KodTowarowyPid, src.KrajPochodzenia, src.KrajPochodzeniaPid, src.MasaNetto, src.IloscUjm, src.WartoscFaktury, src.WartoscStatystyczna, src.Flaga, src.IdKontrahenta);
	  SET @Merged = 1;
	END	
	IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END