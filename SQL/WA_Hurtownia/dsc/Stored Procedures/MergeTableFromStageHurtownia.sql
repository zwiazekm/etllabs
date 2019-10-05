-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-28
-- Description:	Merge z WA_StageHurtownia do WA_Hurtownia.
-- =============================================

CREATE PROCEDURE [dsc].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END

	IF @TableName = 'Pracownik' BEGIN
		MERGE INTO dsc.Pracownik AS tgt
		USING [WA_StageHurtownia].dsc.Pracownik AS src
		ON (tgt.IDPracownik=src.IDPracownik)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDKodPlec=src.IDKodPlec, tgt.DataUrodzenia=src.DataUrodzenia
		WHEN NOT MATCHED
		THEN INSERT (IDPracownik, IDKodPlec, DataUrodzenia)
		VALUES (src.IDPracownik, src.IDKodPlec, src.DataUrodzenia);
		SET @Merged = 1;
	END

	IF @TableName = 'Umowa' BEGIN
		--ALTER TABLE [dsc].[Umowa] NOCHECK CONSTRAINT [FK_Umowa_IDKodStatusZatrudnienia_StatusZatrudnienia_IDKodStatusZatrudnienia]
		MERGE INTO dsc.Umowa AS tgt
		USING [WA_StageHurtownia].dsc.Umowa AS src
		ON (tgt.IDUmowa=src.IDUmowa)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDPracownik=src.IDPracownik, tgt.IDKodRodzajUmowy=src.IDKodRodzajUmowy, tgt.DataRozwiazaniaSluzbyPracy=src.DataRozwiazaniaSluzbyPracy, tgt.DataPoczatkuSluzbyPracy=src.DataPoczatkuSluzbyPracy, tgt.IDKodRodzajSluzbyPracy=src.IDKodRodzajSluzbyPracy, tgt.IDKodStatusZatrudnienia=src.IDKodStatusZatrudnienia, tgt.IDSposobRozwiazaniaSluzbyPracy=src.IDSposobRozwiazaniaSluzbyPracy
		WHEN NOT MATCHED
		THEN INSERT (IDUmowa, IDPracownik, IDKodRodzajUmowy, DataRozwiazaniaSluzbyPracy, DataPoczatkuSluzbyPracy, IDKodRodzajSluzbyPracy, IDKodStatusZatrudnienia, IDSposobRozwiazaniaSluzbyPracy)
		VALUES (src.IDUmowa, src.IDPracownik, src.IDKodRodzajUmowy, src.DataRozwiazaniaSluzbyPracy, src.DataPoczatkuSluzbyPracy, src.IDKodRodzajSluzbyPracy, src.IDKodStatusZatrudnienia, src.IDSposobRozwiazaniaSluzbyPracy);
		SET @Merged = 1;
		--ALTER TABLE [dsc].[Umowa] CHECK CONSTRAINT [FK_Umowa_IDKodStatusZatrudnienia_StatusZatrudnienia_IDKodStatusZatrudnienia]
	END

	IF @TableName = 'StatusZatrudnienia' BEGIN
		MERGE INTO dsc.StatusZatrudnienia AS tgt
		USING [WA_StageHurtownia].dsc.StatusZatrudnienia AS src
		ON (tgt.IDKodStatusZatrudnienia=src.IDKodStatusZatrudnienia)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodStatusZatrudnienia=src.KodStatusZatrudnienia, tgt.NazwaStatusZatrudnienia=src.NazwaStatusZatrudnienia
		WHEN NOT MATCHED
		THEN INSERT (IDKodStatusZatrudnienia, KodStatusZatrudnienia, NazwaStatusZatrudnienia)
		VALUES (src.IDKodStatusZatrudnienia, src.KodStatusZatrudnienia, src.NazwaStatusZatrudnienia);
		SET @Merged = 1;
	END

	IF @TableName = 'RodzajWyksztalcenia' BEGIN
		MERGE INTO dsc.RodzajWyksztalcenia AS tgt
		USING [WA_StageHurtownia].dsc.RodzajWyksztalcenia AS src
		ON (tgt.IDRodzajWyksztalcenia=src.IDRodzajWyksztalcenia)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDKodPoziomWyksztalcenia=src.IDKodPoziomWyksztalcenia, tgt.IDPracownik=src.IDPracownik
		WHEN NOT MATCHED
		THEN INSERT (IDRodzajWyksztalcenia, IDKodPoziomWyksztalcenia, IDPracownik)
		VALUES (src.IDRodzajWyksztalcenia, src.IDKodPoziomWyksztalcenia, src.IDPracownik);
		SET @Merged = 1;
	END

	IF @TableName = 'StopienSluzbowy' BEGIN
		MERGE INTO dsc.StopienSluzbowy AS tgt
		USING [WA_StageHurtownia].dsc.StopienSluzbowy AS src
		ON (tgt.IDStopienSluzbowy=src.IDStopienSluzbowy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDKodStopienSluzbowy=src.IDKodStopienSluzbowy, tgt.IDPracownik=src.IDPracownik
		WHEN NOT MATCHED
		THEN INSERT (IDStopienSluzbowy, IDKodStopienSluzbowy, IDPracownik)
		VALUES (src.IDStopienSluzbowy, src.IDKodStopienSluzbowy, src.IDPracownik);
		SET @Merged = 1;
	END

	IF @TableName = 'Zatrudnienie' BEGIN
		MERGE INTO dsc.Zatrudnienie AS tgt
		USING [WA_StageHurtownia].dsc.Zatrudnienie AS src
		ON (tgt.IDZatrudnienie=src.IDZatrudnienie)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDPracownik=src.IDPracownik, tgt.IDUmowa=src.IDUmowa, tgt.IDJednostkaOrganizacyjna=src.IDJednostkaOrganizacyjna, tgt.IDKomorkaOrganizacyjna=src.IDKomorkaOrganizacyjna, tgt.IDStanowisko=src.IDStanowisko
		WHEN NOT MATCHED
		THEN INSERT (IDZatrudnienie, IDPracownik, IDUmowa, IDJednostkaOrganizacyjna, IDKomorkaOrganizacyjna, IDStanowisko)
		VALUES (src.IDZatrudnienie, src.IDPracownik, src.IDUmowa, src.IDJednostkaOrganizacyjna, src.IDKomorkaOrganizacyjna, src.IDStanowisko);
		SET @Merged = 1;
	END

	IF @TableName = 'WymiarEtatu' BEGIN
		ALTER TABLE [dsc].[WymiarEtatu] NOCHECK CONSTRAINT [FK_WymiarEtatu_IDUmowa_Umowa_IDUmowa]
		MERGE INTO dsc.WymiarEtatu AS tgt
		USING [WA_StageHurtownia].dsc.WymiarEtatu AS src
		ON (tgt.IDWymiarEtatu=src.IDWymiarEtatu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDPracownik=src.IDPracownik, tgt.IDUmowa=src.IDUmowa, tgt.WymiarEtatu=src.WymiarEtatu
		WHEN NOT MATCHED
		THEN INSERT (IDWymiarEtatu, IDPracownik, IDUmowa, WymiarEtatu)
		VALUES (src.IDWymiarEtatu, src.IDPracownik, src.IDUmowa, src.WymiarEtatu);
		SET @Merged = 1;
		ALTER TABLE [dsc].[WymiarEtatu] CHECK CONSTRAINT [FK_WymiarEtatu_IDUmowa_Umowa_IDUmowa]
	END

	IF @TableName = 'Slownik' BEGIN
		MERGE INTO dsc.Slownik AS tgt
		USING [WA_StageHurtownia].dsc.Slownik AS src
		ON (tgt.Tr=src.Tr and tgt.Kod=src.Kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ID=src.ID, tgt.NazwaSkrocona=src.NazwaSkrocona, tgt.Nazwa=src.Nazwa, tgt.NazwaPelna=src.NazwaPelna
		WHEN NOT MATCHED
		THEN INSERT (Tr, Kod, ID, NazwaSkrocona, Nazwa, NazwaPelna)
		VALUES (src.Tr, src.Kod, src.ID, src.NazwaSkrocona, src.Nazwa, src.NazwaPelna);
		SET @Merged = 1;
	END

	IF @TableName = 'JednostkaOrganizacyjna' BEGIN
		MERGE INTO dsc.JednostkaOrganizacyjna AS tgt
		USING [WA_StageHurtownia].dsc.JednostkaOrganizacyjna AS src
		ON (tgt.IDJednostkaOrganizacyjna=src.IDJednostkaOrganizacyjna)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SymbolJednostkaOrganizacyjna=src.SymbolJednostkaOrganizacyjna
		WHEN NOT MATCHED
		THEN INSERT (IDJednostkaOrganizacyjna, SymbolJednostkaOrganizacyjna)
		VALUES (src.IDJednostkaOrganizacyjna, src.SymbolJednostkaOrganizacyjna);
		SET @Merged = 1;
	END

	IF @TableName = 'TypJednostkiOrganizacyjnej' BEGIN
		MERGE INTO dsc.TypJednostkiOrganizacyjnej AS tgt
		USING [WA_StageHurtownia].dsc.TypJednostkiOrganizacyjnej AS src
		ON (tgt.IDTypJednostkiOrganizacyjnej=src.IDTypJednostkiOrganizacyjnej)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodMiejsceSluzbyPracy=src.KodMiejsceSluzbyPracy
		WHEN NOT MATCHED
		THEN INSERT (IDTypJednostkiOrganizacyjnej, KodMiejsceSluzbyPracy)
		VALUES (src.IDTypJednostkiOrganizacyjnej, src.KodMiejsceSluzbyPracy);
		SET @Merged = 1;
	END

	IF @TableName = 'Stanowisko' BEGIN
		MERGE INTO dsc.Stanowisko AS tgt
		USING [WA_StageHurtownia].dsc.Stanowisko AS src
		ON (tgt.IDStanowisko=src.IDStanowisko)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SymbolStanowisko=src.SymbolStanowisko
		WHEN NOT MATCHED
		THEN INSERT (IDStanowisko, SymbolStanowisko)
		VALUES (src.IDStanowisko, src.SymbolStanowisko);
		SET @Merged = 1;
	END
	
		IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END
END