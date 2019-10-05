CREATE PROCEDURE [zab].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END

	IF @TableName = 'Podmiot' BEGIN
		MERGE INTO zab.Podmiot AS tgt
		USING [WA_StageHurtownia].zab.Podmiot AS src
		ON (tgt.IdPodmiotu=src.IdPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NIP=src.NIP, tgt.REGON=src.REGON, tgt.EORI=src.EORI, tgt.Nazwa=src.Nazwa, tgt.AdresUlica=src.AdresUlica, tgt.AdresNumerBudynku=src.AdresNumerBudynku, tgt.AdresNumerLokalu=src.AdresNumerLokalu, tgt.AdresMiejscowosc=src.AdresMiejscowosc, tgt.AdresKodPocztowy=src.AdresKodPocztowy, tgt.AdresKraj=src.AdresKraj
		WHEN NOT MATCHED
		THEN INSERT (IdPodmiotu, NIP, REGON, EORI, Nazwa, AdresUlica, AdresNumerBudynku, AdresNumerLokalu, AdresMiejscowosc, AdresKodPocztowy, AdresKraj)
		VALUES (src.IdPodmiotu, src.NIP, src.REGON, src.EORI, src.Nazwa, src.AdresUlica, src.AdresNumerBudynku, src.AdresNumerLokalu, src.AdresMiejscowosc, src.AdresKodPocztowy, src.AdresKraj);
        SET @Merged = 1;
	END
	IF @TableName = 'Zabezpieczenia' BEGIN
		MERGE INTO zab.Zabezpieczenia AS tgt
		USING [WA_StageHurtownia].zab.Zabezpieczenia AS src
		ON (tgt.IdZabezpieczenia=src.IdZabezpieczenia)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NumerGRN=src.NumerGRN, tgt.TypZabezpieczeniaPid=src.TypZabezpieczeniaPid, tgt.RodzajZabezpieczeniaPid=src.RodzajZabezpieczeniaPid, tgt.WariantZabezpieczeniaPid=src.WariantZabezpieczeniaPid, tgt.IdPodmiotu=src.IdPodmiotu, tgt.DataRejestracji=src.DataRejestracji, tgt.UrzadZlozeniaZabezpieczeniaPid=src.UrzadZlozeniaZabezpieczeniaPid, tgt.KwotaZabezpieczenia=src.KwotaZabezpieczenia, tgt.KwotaReferencyjna=src.KwotaReferencyjna, tgt.ProcentKwotyReferencyjnej=src.ProcentKwotyReferencyjnej, tgt.WalutaPid=src.WalutaPid, tgt.SaldoZabezpieczenia=src.SaldoZabezpieczenia, tgt.WazneOd=src.WazneOd, tgt.WazneDo=src.WazneDo, tgt.StatusPid=src.StatusPid, tgt.AkcyzaCzyObcySkladPodatkowy=src.AkcyzaCzyObcySkladPodatkowy, tgt.AkcyzaCzyNabywcaWewnZaplAkcyzaArt78=src.AkcyzaCzyNabywcaWewnZaplAkcyzaArt78, tgt.AkcyzaCzyPodatnikOkreslonyArt13Ust3=src.AkcyzaCzyPodatnikOkreslonyArt13Ust3, tgt.AkcyzaObszarWaznosci=src.AkcyzaObszarWaznosci, tgt.TranzytCzyNiewazneNaTerenieUE=src.TranzytCzyNiewazneNaTerenieUE, tgt.GryKrotnoscZlozonychZabezpieczen=src.GryKrotnoscZlozonychZabezpieczen, tgt.GryLiczbaKasynPunktowSalonow=src.GryLiczbaKasynPunktowSalonow, tgt.OplataPaliwowa=src.OplataPaliwowa, tgt.WtymNaOplPaliw=src.WtymNaOplPaliw
		WHEN NOT MATCHED
		THEN INSERT (IdZabezpieczenia, NumerGRN, TypZabezpieczeniaPid, RodzajZabezpieczeniaPid, WariantZabezpieczeniaPid, IdPodmiotu, DataRejestracji, UrzadZlozeniaZabezpieczeniaPid, KwotaZabezpieczenia, KwotaReferencyjna, ProcentKwotyReferencyjnej, WalutaPid, SaldoZabezpieczenia, WazneOd, WazneDo, StatusPid, AkcyzaCzyObcySkladPodatkowy, AkcyzaCzyNabywcaWewnZaplAkcyzaArt78, AkcyzaCzyPodatnikOkreslonyArt13Ust3, AkcyzaObszarWaznosci, TranzytCzyNiewazneNaTerenieUE, GryKrotnoscZlozonychZabezpieczen, GryLiczbaKasynPunktowSalonow, OplataPaliwowa, WtymNaOplPaliw)
		VALUES (src.IdZabezpieczenia, src.NumerGRN, src.TypZabezpieczeniaPid, src.RodzajZabezpieczeniaPid, src.WariantZabezpieczeniaPid, src.IdPodmiotu, src.DataRejestracji, src.UrzadZlozeniaZabezpieczeniaPid, src.KwotaZabezpieczenia, src.KwotaReferencyjna, src.ProcentKwotyReferencyjnej, src.WalutaPid, src.SaldoZabezpieczenia, src.WazneOd, src.WazneDo, src.StatusPid, src.AkcyzaCzyObcySkladPodatkowy, src.AkcyzaCzyNabywcaWewnZaplAkcyzaArt78, src.AkcyzaCzyPodatnikOkreslonyArt13Ust3, src.AkcyzaObszarWaznosci, src.TranzytCzyNiewazneNaTerenieUE, src.GryKrotnoscZlozonychZabezpieczen, src.GryLiczbaKasynPunktowSalonow, src.OplataPaliwowa, src.WtymNaOplPaliw);
        SET @Merged = 1;
	END
	IF @TableName = 'StatusPodmiotu' BEGIN
		MERGE INTO zab.StatusPodmiotu AS tgt
		USING [WA_StageHurtownia].zab.StatusPodmiotu AS src
		ON (tgt.IdStatusPodmiotu=src.IdStatusPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdPodmiotu=src.IdPodmiotu, tgt.NazwaSEED=src.NazwaSEED, tgt.NumerAkcyzowy=src.NumerAkcyzowy
		WHEN NOT MATCHED
		THEN INSERT (IdStatusPodmiotu, IdPodmiotu, NazwaSEED, NumerAkcyzowy)
		VALUES (src.IdStatusPodmiotu, src.IdPodmiotu, src.NazwaSEED, src.NumerAkcyzowy);
        SET @Merged = 1;
	END
	IF @TableName = 'Gwaranci' BEGIN
		MERGE INTO zab.Gwaranci AS tgt
		USING [WA_StageHurtownia].zab.Gwaranci AS src
		ON (tgt.IdGwaranta=src.IdGwaranta)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nazwa=src.Nazwa, tgt.NIP=src.NIP, tgt.AdresUlica=src.AdresUlica, tgt.AdresNumerBudynku=src.AdresNumerBudynku, tgt.AdresNumerLokalu=src.AdresNumerLokalu, tgt.AdresMiejscowosc=src.AdresMiejscowosc, tgt.AdresKodPocztowy=src.AdresKodPocztowy, tgt.AdresKraj=src.AdresKraj
		WHEN NOT MATCHED
		THEN INSERT (IdGwaranta, Nazwa, NIP, AdresUlica, AdresNumerBudynku, AdresNumerLokalu, AdresMiejscowosc, AdresKodPocztowy, AdresKraj)
		VALUES (src.IdGwaranta, src.Nazwa, src.NIP, src.AdresUlica, src.AdresNumerBudynku, src.AdresNumerLokalu, src.AdresMiejscowosc, src.AdresKodPocztowy, src.AdresKraj);
        SET @Merged = 1;
	END
	IF @TableName = 'Gwarancja' BEGIN
		MERGE INTO zab.Gwarancja AS tgt
		USING [WA_StageHurtownia].zab.Gwarancja AS src
		ON (tgt.IdGwarancji=src.IdGwarancji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Numer=src.Numer, tgt.Kwota=src.Kwota, tgt.IdGwaranta=src.IdGwaranta
		WHEN NOT MATCHED
		THEN INSERT (IdGwarancji, Numer, Kwota, IdGwaranta)
		VALUES (src.IdGwarancji, src.Numer, src.Kwota, src.IdGwaranta);
        SET @Merged = 1;
	END
	IF @TableName = 'Hipoteka' BEGIN
		MERGE INTO zab.Hipoteka AS tgt
		USING [WA_StageHurtownia].zab.Hipoteka AS src
		ON (tgt.IdHipoteki=src.IdHipoteki)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NumerKsiegiWieczystej=src.NumerKsiegiWieczystej, tgt.WartoscHipoteki=src.WartoscHipoteki
		WHEN NOT MATCHED
		THEN INSERT (IdHipoteki, NumerKsiegiWieczystej, WartoscHipoteki)
		VALUES (src.IdHipoteki, src.NumerKsiegiWieczystej, src.WartoscHipoteki);
        SET @Merged = 1;
	END
	IF @TableName = 'Potwierdzenie' BEGIN
		MERGE INTO zab.Potwierdzenie AS tgt
		USING [WA_StageHurtownia].zab.Potwierdzenie AS src
		ON (tgt.IdPotwierdzenia=src.IdPotwierdzenia)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Numer=src.Numer, tgt.Kwota=src.Kwota
		WHEN NOT MATCHED
		THEN INSERT (IdPotwierdzenia, Numer, Kwota)
		VALUES (src.IdPotwierdzenia, src.Numer, src.Kwota);
        SET @Merged = 1;
	END
	IF @TableName = 'OgraniczenieWaznosciZabezp' BEGIN
		MERGE INTO zab.OgraniczenieWaznosciZabezp AS tgt
		USING [WA_StageHurtownia].zab.OgraniczenieWaznosciZabezp AS src
		ON (tgt.IdZabezpieczenia=src.IdZabezpieczenia AND tgt.OgraniczeniePid=src.OgraniczeniePid)
		WHEN NOT MATCHED
		THEN INSERT (IdZabezpieczenia, OgraniczeniePid)
		VALUES (src.IdZabezpieczenia, src.OgraniczeniePid);
        SET @Merged = 1;
	END
	IF @TableName = 'PokwitowaniePotwierdzenie' BEGIN
		MERGE INTO zab.PokwitowaniePotwierdzenie AS tgt
		USING [WA_StageHurtownia].zab.PokwitowaniePotwierdzenie AS src
		ON (tgt.IdPokwitowaniaPotwierdzenia=src.IdPokwitowaniaPotwierdzenia)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Numer=src.Numer, tgt.Kwota=src.Kwota, tgt.IdGwarancji=src.IdGwarancji
		WHEN NOT MATCHED
		THEN INSERT (IdPokwitowaniaPotwierdzenia, Numer, Kwota, IdGwarancji)
		VALUES (src.IdPokwitowaniaPotwierdzenia, src.Numer, src.Kwota, src.IdGwarancji);
        SET @Merged = 1;
	END
	IF @TableName = 'ProceduryAkcyzoweNaZabezp' BEGIN
		MERGE INTO zab.ProceduryAkcyzoweNaZabezp AS tgt
		USING [WA_StageHurtownia].zab.ProceduryAkcyzoweNaZabezp AS src
		ON (tgt.IdZabezpieczenia=src.IdZabezpieczenia AND tgt.ProceduraAkcyzowaPid=src.ProceduraAkcyzowaPid)
		WHEN NOT MATCHED
		THEN INSERT (IdZabezpieczenia, ProceduraAkcyzowaPid)
		VALUES (src.IdZabezpieczenia, src.ProceduraAkcyzowaPid);
        SET @Merged = 1;
	END
	IF @TableName = 'StatusPodmiotuNaZabezp' BEGIN
		MERGE INTO zab.StatusPodmiotuNaZabezp AS tgt
		USING [WA_StageHurtownia].zab.StatusPodmiotuNaZabezp AS src
		ON (tgt.IdZabezpieczenia=src.IdZabezpieczenia AND tgt.IdStatusPodmiotu=src.IdStatusPodmiotu)
		WHEN NOT MATCHED
		THEN INSERT (IdZabezpieczenia, IdStatusPodmiotu)
		VALUES (src.IdZabezpieczenia, src.IdStatusPodmiotu);
        SET @Merged = 1;
	END
	IF @TableName = 'WlasciwoscMiejscowa' BEGIN
		MERGE INTO zab.WlasciwoscMiejscowa AS tgt
		USING [WA_StageHurtownia].zab.WlasciwoscMiejscowa AS src
		ON (tgt.[IdZabezpieczenia]=src.[IdZabezpieczenia] AND tgt.OrganJednostki =src.OrganJednostki)
		WHEN NOT MATCHED
		THEN INSERT (IdZabezpieczenia, OrganJednostki)
		VALUES (src.IdZabezpieczenia, src.OrganJednostki);
        SET @Merged = 1;
	END
	IF @TableName = 'ZlozenieZabezpieczenia' BEGIN
		MERGE INTO zab.ZlozenieZabezpieczenia AS tgt
		USING [WA_StageHurtownia].zab.ZlozenieZabezpieczenia AS src
		ON (tgt.IdZlozeniaZabezp=src.IdZlozeniaZabezp AND tgt.Zrodlo=src.Zrodlo)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.FormaZlozeniaZabezpieczeniaPid=src.FormaZlozeniaZabezpieczeniaPid, tgt.IdGwarancji=src.IdGwarancji, tgt.IdPotwierdzenia=src.IdPotwierdzenia, tgt.IdHipoteki=src.IdHipoteki, tgt.IdPokwitowaniaPotwierdzenia=src.IdPokwitowaniaPotwierdzenia, tgt.IdZabezpieczenia=src.IdZabezpieczenia, tgt.KwotaUdzielonaNaZabezp=src.KwotaUdzielonaNaZabezp, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (IdZlozeniaZabezp, Zrodlo, FormaZlozeniaZabezpieczeniaPid, IdGwarancji, IdPotwierdzenia, IdHipoteki, IdPokwitowaniaPotwierdzenia, IdZabezpieczenia, KwotaUdzielonaNaZabezp, Opis)
		VALUES (src.IdZlozeniaZabezp, src.Zrodlo, src.FormaZlozeniaZabezpieczeniaPid, src.IdGwarancji, src.IdPotwierdzenia, src.IdHipoteki, src.IdPokwitowaniaPotwierdzenia, src.IdZabezpieczenia, src.KwotaUdzielonaNaZabezp, src.Opis);
        SET @Merged = 1;
	END
	IF @TableName = 'ProceduryCelne' BEGIN
		MERGE INTO zab.ProceduryCelne AS tgt
		USING [WA_StageHurtownia].zab.ProceduryCelne AS src
		ON (tgt.IdProcedury=src.IdProcedury)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Nazwa=src.Nazwa
		WHEN NOT MATCHED
		THEN INSERT (IdProcedury, Kod, Nazwa)
		VALUES (src.IdProcedury, src.Kod, src.Nazwa);
	  SET @Merged = 1;
	END
	IF @TableName = 'ProceduryCelneNaZabezp' BEGIN
		MERGE INTO zab.ProceduryCelneNaZabezp AS tgt
		USING WA_StageHurtownia.zab.ProceduryCelneNaZabezp AS src
		ON (tgt.IdZabezpieczenia=src.IdZabezpieczenia AND tgt.ProceduraCelnaPid=src.ProceduraCelnaPid)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdZabezpieczenia = src.IdZabezpieczenia, tgt.ProceduraCelnaPid = src.ProceduraCelnaPid
		WHEN NOT MATCHED
		THEN INSERT (IdZabezpieczenia, ProceduraCelnaPid)
		VALUES (src.IdZabezpieczenia, src.ProceduraCelnaPid);
		SET @Merged = 1;
	END

	IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END