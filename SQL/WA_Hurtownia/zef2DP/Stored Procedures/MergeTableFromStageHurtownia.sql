



CREATE PROCEDURE [zef2DP].[MergeTableFromStageHurtownia] (@TableName VARCHAR(100) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
		END


--VAT14_Deklaracja
IF @TableName = 'VAT14_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.VAT14_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.VAT14_Deklaracja)
 MERGE INTO zef2DP.VAT14_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.VAT14_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[WynikSprawdzeniaPelnomocnictwa]=src.[WynikSprawdzeniaPelnomocnictwa],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[IdUrzeduCelnego]=src.[IdUrzeduCelnego],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[RazemWartoscTransakcji]=src.[RazemWartoscTransakcji],
tgt.[RazemKwotaZryczWynagrodzPlatnika]=src.[RazemKwotaZryczWynagrodzPlatnika],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[PodatekDoZaplaty]=src.[PodatekDoZaplaty],
tgt.[RazemKwotaPodatekNalezny]=src.[RazemKwotaPodatekNalezny],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[NumerReferencyjny]=src.[NumerReferencyjny],
tgt.[CzyObcokrajowiec]=src.[CzyObcokrajowiec],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[CzySkladajacyJestPlatnikiem]=src.[CzySkladajacyJestPlatnikiem],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[CzySkladajacyJestPodatnikiem]=src.[CzySkladajacyJestPodatnikiem],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [WynikSprawdzeniaPelnomocnictwa], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [IdUrzeduCelnego], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemWartoscTransakcji], [RazemKwotaZryczWynagrodzPlatnika], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [PodatekDoZaplaty], [RazemKwotaPodatekNalezny], [UwagiUrzeduCelnego], [NumerReferencyjny], [CzyObcokrajowiec], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny], [CzySkladajacyJestPlatnikiem],  [NumerPaczki], [CzySkladajacyJestPodatnikiem], [TelefonPodatnikaLubPelnomocnika] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [WynikSprawdzeniaPelnomocnictwa], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [IdUrzeduCelnego], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemWartoscTransakcji], [RazemKwotaZryczWynagrodzPlatnika], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [PodatekDoZaplaty], [RazemKwotaPodatekNalezny], [UwagiUrzeduCelnego], [NumerReferencyjny], [CzyObcokrajowiec], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny], [CzySkladajacyJestPlatnikiem],  [NumerPaczki], [CzySkladajacyJestPodatnikiem], [TelefonPodatnikaLubPelnomocnika] );
SET @Merged = 1;
 END

--VAT14_Pozycje
IF @TableName = 'VAT14_Pozycje' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.VAT14_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DP.VAT14_Pozycje)
MERGE INTO zef2DP.VAT14_Pozycje AS tgt
USING WA_StageHurtownia.zef2DP.VAT14_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.PodatnikNazwa=src.PodatnikNazwa, tgt.PodatnikNIP=src.PodatnikNIP, tgt.TransakcjaWlasna=src.TransakcjaWlasna, tgt.NumerSkladuOdbiorcy=src.NumerSkladuOdbiorcy, tgt.DataTransakcji=src.DataTransakcji, tgt.CzyStawkaSpozaISZTAR=src.CzyStawkaSpozaISZTAR, tgt.KodCN=src.KodCN, tgt.WartoscTransakcji=src.WartoscTransakcji, tgt.KwotaPodatekNalezny=src.KwotaPodatekNalezny, tgt.KwotaZryczWynagrodzPlatnika=src.KwotaZryczWynagrodzPlatnika, tgt.StawkaPodatekNalezny=src.StawkaPodatekNalezny, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.operacja=src.operacja
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PodatnikNazwa, PodatnikNIP, TransakcjaWlasna, NumerSkladuOdbiorcy, DataTransakcji, CzyStawkaSpozaISZTAR, KodCN, WartoscTransakcji, KwotaPodatekNalezny, KwotaZryczWynagrodzPlatnika, StawkaPodatekNalezny, DataArch, ID_Pismo_xml, operacja)
VALUES (src.IdentyfikatorDokumentu, src.PodatnikNazwa, src.PodatnikNIP, src.TransakcjaWlasna, src.NumerSkladuOdbiorcy, src.DataTransakcji, src.CzyStawkaSpozaISZTAR, src.KodCN, src.WartoscTransakcji, src.KwotaPodatekNalezny, src.KwotaZryczWynagrodzPlatnika, src.StawkaPodatekNalezny, src.DataArch, src.ID_Pismo_xml, src.operacja);
SET @Merged = 1; 
END

--Podmiot
IF @TableName = 'Podmiot' BEGIN 
UPDATE [WA_StageHurtownia].[zef2DP].[Podmiot] SET [DataUrodzeniaPodatnika] = null WHERE DataUrodzeniaPodatnika = '0001-01-01'
DELETE FROM WA_Hurtownia.zef2DP.Podmiot WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.Podmiot)
 MERGE INTO zef2DP.Podmiot AS tgt
USING [WA_StageHurtownia].zef2DP.Podmiot AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.CzyObcokrajowiec=src.CzyObcokrajowiec, tgt.NumerPodatnika=src.NumerPodatnika, tgt.REGON=src.REGON, tgt.RodzajPodatnika=src.RodzajPodatnika, tgt.NazwaPodatnika=src.NazwaPodatnika, tgt.NazwiskoPodatnika=src.NazwiskoPodatnika, tgt.ImiePodatnika=src.ImiePodatnika, tgt.Kraj=src.Kraj, tgt.Wojewodztwo=src.Wojewodztwo, tgt.Powiat=src.Powiat, tgt.Gmina=src.Gmina, tgt.Ulica=src.Ulica, tgt.NrDomu=src.NrDomu, tgt.NrLokalu=src.NrLokalu, tgt.Miejscowosc=src.Miejscowosc, tgt.KodPocztowy=src.KodPocztowy, tgt.Poczta=src.Poczta, tgt.UwagiDoDanychPodmiotu=src.UwagiDoDanychPodmiotu, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.DataUrodzeniaPodatnika = src.DataUrodzeniaPodatnika
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (NIPLubPESELPodatnika, CzyObcokrajowiec, NumerPodatnika, REGON, RodzajPodatnika, NazwaPodatnika, NazwiskoPodatnika, ImiePodatnika, Kraj, Wojewodztwo, Powiat, Gmina, Ulica, NrDomu, NrLokalu, Miejscowosc, KodPocztowy, Poczta, UwagiDoDanychPodmiotu, DataArch, ID_Pismo_xml, DataUrodzeniaPodatnika)
VALUES (src.NIPLubPESELPodatnika, src.CzyObcokrajowiec, src.NumerPodatnika, src.REGON, src.RodzajPodatnika, src.NazwaPodatnika, src.NazwiskoPodatnika, src.ImiePodatnika, src.Kraj, src.Wojewodztwo, src.Powiat, src.Gmina, src.Ulica, src.NrDomu, src.NrLokalu, src.Miejscowosc, src.KodPocztowy, src.Poczta, src.UwagiDoDanychPodmiotu, src.DataArch, src.ID_Pismo_xml, src.DataUrodzeniaPodatnika);
SET @Merged = 1; 
END

--'AKC4_Deklaracja'
IF @TableName = 'AKC4_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKC4_Deklaracja)
 MERGE INTO zef2DP.AKC4_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[NadwyzWplatDoRozliczPrzedplataAkc]=src.[NadwyzWplatDoRozliczPrzedplataAkc],
tgt.[NadwyzWplatDoRozliczOstatDeklar]=src.[NadwyzWplatDoRozliczOstatDeklar],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[IdDokumentuPowiazanegoAKCPA]=src.[IdDokumentuPowiazanegoAKCPA],
tgt.[MigracjaReczna]=src.[MigracjaReczna],
tgt.[DataArch]=src.[DataArch],
tgt.[KwotaPrzedplatyAkcyzy]=src.[KwotaPrzedplatyAkcyzy],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy],
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[DeklaracjaZerowa]=src.[DeklaracjaZerowa],
tgt.[IdUrzeduCelnego]=src.[IdUrzeduCelnego],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DoZaplaty]=src.[DoZaplaty],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[KwotaZnakowAkcyzy]=src.[KwotaZnakowAkcyzy],
tgt.[RazemPodatekAkcyzowy]=src.[RazemPodatekAkcyzowy],
tgt.[RodzajDokumentu]=src.[RodzajDokumentu],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[NadwyzWplatDoRozliczPrzedplataAkcOstatDeklar]=src.[NadwyzWplatDoRozliczPrzedplataAkcOstatDeklar],
tgt.[KwotaWplatDziennych]=src.[KwotaWplatDziennych],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[NadwyzWplatDoRozlicz]=src.[NadwyzWplatDoRozlicz]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DeklaracjaZaOkres], [NumerDokumentu], [NazwiskoPelnomocnika], [PowodZarachowania], [NadwyzWplatDoRozliczPrzedplataAkc], [NadwyzWplatDoRozliczOstatDeklar], [CzyZweryfikowany], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [IdDokumentuPowiazanegoAKCPA], [MigracjaReczna], [DataArch], [KwotaPrzedplatyAkcyzy], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [SystemZrodlowy], [DataDoWniesieniaSprzeciwu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [DeklaracjaZerowa], [IdUrzeduCelnego], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [NIPLubPESELPodatnika], [Zarachowanie], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [KwotaZnakowAkcyzy], [RazemPodatekAkcyzowy], [RodzajDokumentu], [ImiePelnomocnika], [NadwyzWplatDoRozliczPrzedplataAkcOstatDeklar], [KwotaWplatDziennych], [TelefonPodatnikaLubPelnomocnika], [NadwyzWplatDoRozlicz] )
VALUES ([DeklaracjaZaOkres], [NumerDokumentu], [NazwiskoPelnomocnika], [PowodZarachowania], [NadwyzWplatDoRozliczPrzedplataAkc], [NadwyzWplatDoRozliczOstatDeklar], [CzyZweryfikowany], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [IdDokumentuPowiazanegoAKCPA], [MigracjaReczna], [DataArch], [KwotaPrzedplatyAkcyzy], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [SystemZrodlowy], [DataDoWniesieniaSprzeciwu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [DeklaracjaZerowa], [IdUrzeduCelnego], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [NIPLubPESELPodatnika], [Zarachowanie], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [KwotaZnakowAkcyzy], [RazemPodatekAkcyzowy], [RodzajDokumentu], [ImiePelnomocnika], [NadwyzWplatDoRozliczPrzedplataAkcOstatDeklar], [KwotaWplatDziennych], [TelefonPodatnikaLubPelnomocnika], [NadwyzWplatDoRozlicz] );
SET @Merged = 1;
 END

--AKC4_PodatekWedlugGrup
IF @TableName = 'AKC4_PodatekWedlugGrup' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_PodatekWedlugGrup WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKC4_PodatekWedlugGrup)
 MERGE INTO zef2DP.AKC4_PodatekWedlugGrup AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_PodatekWedlugGrup AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.OgolemPodatekOdAlkoholuEtylowego=src.OgolemPodatekOdAlkoholuEtylowego, tgt.OgolemPodatekOdWinaNapojFerment=src.OgolemPodatekOdWinaNapojFerment, tgt.OgolemPodatekOdPiwa=src.OgolemPodatekOdPiwa, tgt.OgolemPodatekOdPaliwSilnik=src.OgolemPodatekOdPaliwSilnik, tgt.OgolemPodatekOdSamochOsob=src.OgolemPodatekOdSamochOsob, tgt.OgolemPodatekOdWyrobTyton=src.OgolemPodatekOdWyrobTyton, tgt.OgolemPodatekOdEnergiiElektr=src.OgolemPodatekOdEnergiiElektr, tgt.OgolemPodatekOdPaliwOpal=src.OgolemPodatekOdPaliwOpal, tgt.OgolemPodatekOdGazu=src.OgolemPodatekOdGazu, tgt.OgolemPodatekOdOlejSmar=src.OgolemPodatekOdOlejSmar, tgt.OgolemPodatekOdWyrobGazow=src.OgolemPodatekOdWyrobGazow, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, OgolemPodatekOdAlkoholuEtylowego, OgolemPodatekOdWinaNapojFerment, OgolemPodatekOdPiwa, OgolemPodatekOdPaliwSilnik, OgolemPodatekOdSamochOsob, OgolemPodatekOdWyrobTyton, OgolemPodatekOdEnergiiElektr, OgolemPodatekOdPaliwOpal, OgolemPodatekOdGazu, OgolemPodatekOdOlejSmar, OgolemPodatekOdWyrobGazow, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.OgolemPodatekOdAlkoholuEtylowego, src.OgolemPodatekOdWinaNapojFerment, src.OgolemPodatekOdPiwa, src.OgolemPodatekOdPaliwSilnik, src.OgolemPodatekOdSamochOsob, src.OgolemPodatekOdWyrobTyton, src.OgolemPodatekOdEnergiiElektr, src.OgolemPodatekOdPaliwOpal, src.OgolemPodatekOdGazu, src.OgolemPodatekOdOlejSmar, src.OgolemPodatekOdWyrobGazow, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END

--AKC4_ZalacznikA
IF @TableName = 'AKC4_ZalacznikA' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikA WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikA)
MERGE INTO zef2DP.AKC4_ZalacznikA AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikA AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.PowiazanaDeklaracjaAKCPA=src.PowiazanaDeklaracjaAKCPA, tgt.NumerAkcyzowySkladuPodatnika=src.NumerAkcyzowySkladuPodatnika, tgt.NumerAkcyzowySkladuObcego=src.NumerAkcyzowySkladuObcego, tgt.AdresSkladu=src.AdresSkladu, tgt.NumerAkcyzowyZarejestrowanegoOdbiorcy=src.NumerAkcyzowyZarejestrowanegoOdbiorcy, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaZnakowAkcyzy=src.KwotaZnakowAkcyzy, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplatyProdPozaSklad=src.NadwyzkaPrzedplatyProdPozaSklad, tgt.RazemKwotaNaleznychWplatDziennych=src.RazemKwotaNaleznychWplatDziennych, tgt.RazemKwotaNadwyzkiWplatPoprzDekl=src.RazemKwotaNadwyzkiWplatPoprzDekl, tgt.RazemKwotaDokonanychWplatDziennych=src.RazemKwotaDokonanychWplatDziennych, tgt.EksportIloscWyrobowWHektolitrach=src.EksportIloscWyrobowWHektolitrach, tgt.EksportStawkaPodatku=src.EksportStawkaPodatku, tgt.EksportKwotaPodatku=src.EksportKwotaPodatku, tgt.RazemIloscWyrobowWHektolitrach=src.RazemIloscWyrobowWHektolitrach, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, PowiazanaDeklaracjaAKCPA, NumerAkcyzowySkladuPodatnika, NumerAkcyzowySkladuObcego, AdresSkladu, NumerAkcyzowyZarejestrowanegoOdbiorcy, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaZnakowAkcyzy, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplatyProdPozaSklad, RazemKwotaNaleznychWplatDziennych, RazemKwotaNadwyzkiWplatPoprzDekl, RazemKwotaDokonanychWplatDziennych, EksportIloscWyrobowWHektolitrach, EksportStawkaPodatku, EksportKwotaPodatku, RazemIloscWyrobowWHektolitrach, RazemKwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.PowiazanaDeklaracjaAKCPA, src.NumerAkcyzowySkladuPodatnika, src.NumerAkcyzowySkladuObcego, src.AdresSkladu, src.NumerAkcyzowyZarejestrowanegoOdbiorcy, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaZnakowAkcyzy, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplatyProdPozaSklad, src.RazemKwotaNaleznychWplatDziennych, src.RazemKwotaNadwyzkiWplatPoprzDekl, src.RazemKwotaDokonanychWplatDziennych, src.EksportIloscWyrobowWHektolitrach, src.EksportStawkaPodatku, src.EksportKwotaPodatku, src.RazemIloscWyrobowWHektolitrach, src.RazemKwotaPodatku, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikA_InfKwotWplatDzien
IF @TableName = 'AKC4_ZalacznikA_InfKwotWplatDzien' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikA_InfKwotWplatDzien WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikA_InfKwotWplatDzien)
 MERGE INTO zef2DP.AKC4_ZalacznikA_InfKwotWplatDzien AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikA_InfKwotWplatDzien AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.DataPowstaniaObowPodatk=src.DataPowstaniaObowPodatk, tgt.KwotaPodatkuAkcZDniaPowstaniaObowPodatk=src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, tgt.DataDokonaniaWplatyDziennej=src.DataDokonaniaWplatyDziennej, tgt.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne=src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, tgt.KwotaDokonanejWplatyDziennej=src.KwotaDokonanejWplatyDziennej, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, DataPowstaniaObowPodatk, KwotaPodatkuAkcZDniaPowstaniaObowPodatk, DataDokonaniaWplatyDziennej, KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, KwotaDokonanejWplatyDziennej, id1)
VALUES (src.IdentyfikatorZalacznika, src.DataPowstaniaObowPodatk, src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, src.DataDokonaniaWplatyDziennej, src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, src.KwotaDokonanejWplatyDziennej, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikA_Towary
IF @TableName = 'AKC4_ZalacznikA_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikA_Towary WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikA_Towary)
 MERGE INTO zef2DP.AKC4_ZalacznikA_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikA_Towary AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.Ubytki=src.Ubytki, tgt.KodCN=src.KodCN, tgt.IloscWyrobowWHektolitrach=src.IloscWyrobowWHektolitrach, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, NazwaGrupyWyrobow, Ubytki, KodCN, IloscWyrobowWHektolitrach, StawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, id1)
VALUES (src.IdentyfikatorZalacznika, src.NazwaGrupyWyrobow, src.Ubytki, src.KodCN, src.IloscWyrobowWHektolitrach, src.StawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikB
IF @TableName = 'AKC4_ZalacznikB' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikB WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikB)
 MERGE INTO zef2DP.AKC4_ZalacznikB AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikB AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.PowiazanaDeklaracjaAKCPA=src.PowiazanaDeklaracjaAKCPA, tgt.NumerAkcyzowySkladuPodatnika=src.NumerAkcyzowySkladuPodatnika, tgt.NumerAkcyzowySkladuObcego=src.NumerAkcyzowySkladuObcego, tgt.AdresSkladu=src.AdresSkladu, tgt.NumerAkcyzowyZarejestrowanegoOdbiorcy=src.NumerAkcyzowyZarejestrowanegoOdbiorcy, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaZnakowAkcyzy=src.KwotaZnakowAkcyzy, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplatyProdPozaSklad=src.NadwyzkaPrzedplatyProdPozaSklad, tgt.RazemKwotaNaleznychWplatDziennych=src.RazemKwotaNaleznychWplatDziennych, tgt.RazemKwotaNadwyzkiWplatPoprzDekl=src.RazemKwotaNadwyzkiWplatPoprzDekl, tgt.RazemKwotaDokonanychWplatDziennych=src.RazemKwotaDokonanychWplatDziennych, tgt.EksportIloscWyrobowWHektolitrach=src.EksportIloscWyrobowWHektolitrach, tgt.EksportStawkaPodatku=src.EksportStawkaPodatku, tgt.EksportKwotaPodatku=src.EksportKwotaPodatku, tgt.RazemIloscWyrobowWHektolitrach=src.RazemIloscWyrobowWHektolitrach, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, PowiazanaDeklaracjaAKCPA, NumerAkcyzowySkladuPodatnika, NumerAkcyzowySkladuObcego, AdresSkladu, NumerAkcyzowyZarejestrowanegoOdbiorcy, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaZnakowAkcyzy, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplatyProdPozaSklad, RazemKwotaNaleznychWplatDziennych, RazemKwotaNadwyzkiWplatPoprzDekl, RazemKwotaDokonanychWplatDziennych, EksportIloscWyrobowWHektolitrach, EksportStawkaPodatku, EksportKwotaPodatku, RazemIloscWyrobowWHektolitrach, RazemKwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.PowiazanaDeklaracjaAKCPA, src.NumerAkcyzowySkladuPodatnika, src.NumerAkcyzowySkladuObcego, src.AdresSkladu, src.NumerAkcyzowyZarejestrowanegoOdbiorcy, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaZnakowAkcyzy, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplatyProdPozaSklad, src.RazemKwotaNaleznychWplatDziennych, src.RazemKwotaNadwyzkiWplatPoprzDekl, src.RazemKwotaDokonanychWplatDziennych, src.EksportIloscWyrobowWHektolitrach, src.EksportStawkaPodatku, src.EksportKwotaPodatku, src.RazemIloscWyrobowWHektolitrach, src.RazemKwotaPodatku, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikB_InfKwotWplatDzien
IF @TableName = 'AKC4_ZalacznikB_InfKwotWplatDzien' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikB_InfKwotWplatDzien WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikB_InfKwotWplatDzien)
 MERGE INTO zef2DP.AKC4_ZalacznikB_InfKwotWplatDzien AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikB_InfKwotWplatDzien AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.DataPowstaniaObowPodatk=src.DataPowstaniaObowPodatk, tgt.KwotaPodatkuAkcZDniaPowstaniaObowPodatk=src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, tgt.DataDokonaniaWplatyDziennej=src.DataDokonaniaWplatyDziennej, tgt.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne=src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, tgt.KwotaDokonanejWplatyDziennej=src.KwotaDokonanejWplatyDziennej, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, DataPowstaniaObowPodatk, KwotaPodatkuAkcZDniaPowstaniaObowPodatk, DataDokonaniaWplatyDziennej, KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, KwotaDokonanejWplatyDziennej, id1)
VALUES (src.IdentyfikatorZalacznika, src.DataPowstaniaObowPodatk, src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, src.DataDokonaniaWplatyDziennej, src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, src.KwotaDokonanejWplatyDziennej, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikB_Towary
IF @TableName = 'AKC4_ZalacznikB_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikB_Towary WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikB_Towary)
 MERGE INTO zef2DP.AKC4_ZalacznikB_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikB_Towary AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.Ubytki=src.Ubytki, tgt.KodCN=src.KodCN, tgt.IloscWyrobowWHektolitrach=src.IloscWyrobowWHektolitrach, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, NazwaGrupyWyrobow, Ubytki, KodCN, IloscWyrobowWHektolitrach, StawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, id1)
VALUES (src.IdentyfikatorZalacznika, src.NazwaGrupyWyrobow, src.Ubytki, src.KodCN, src.IloscWyrobowWHektolitrach, src.StawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikC
IF @TableName = 'AKC4_ZalacznikC' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikC WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikC)
 MERGE INTO zef2DP.AKC4_ZalacznikC AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikC AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.PowiazanaDeklaracjaAKCPA=src.PowiazanaDeklaracjaAKCPA, tgt.NumerAkcyzowySkladuPodatnika=src.NumerAkcyzowySkladuPodatnika, tgt.NumerAkcyzowySkladuObcego=src.NumerAkcyzowySkladuObcego, tgt.AdresSkladu=src.AdresSkladu, tgt.NumerAkcyzowyZarejestrowanegoOdbiorcy=src.NumerAkcyzowyZarejestrowanegoOdbiorcy, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplaty=src.NadwyzkaPrzedplaty, tgt.RazemKwotaNaleznychWplatDziennych=src.RazemKwotaNaleznychWplatDziennych, tgt.RazemKwotaNadwyzkiWplatPoprzDekl=src.RazemKwotaNadwyzkiWplatPoprzDekl, tgt.RazemKwotaDokonanychWplatDziennych=src.RazemKwotaDokonanychWplatDziennych, tgt.EksportIloscWyrobowWHektolitrach=src.EksportIloscWyrobowWHektolitrach, tgt.EksportStawkaPodatku=src.EksportStawkaPodatku, tgt.EksportKwotaPodatku=src.EksportKwotaPodatku, tgt.RazemIloscWyrobowWHektolitrach=src.RazemIloscWyrobowWHektolitrach, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, PowiazanaDeklaracjaAKCPA, NumerAkcyzowySkladuPodatnika, NumerAkcyzowySkladuObcego, AdresSkladu, NumerAkcyzowyZarejestrowanegoOdbiorcy, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplaty, RazemKwotaNaleznychWplatDziennych, RazemKwotaNadwyzkiWplatPoprzDekl, RazemKwotaDokonanychWplatDziennych, EksportIloscWyrobowWHektolitrach, EksportStawkaPodatku, EksportKwotaPodatku, RazemIloscWyrobowWHektolitrach, RazemKwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.PowiazanaDeklaracjaAKCPA, src.NumerAkcyzowySkladuPodatnika, src.NumerAkcyzowySkladuObcego, src.AdresSkladu, src.NumerAkcyzowyZarejestrowanegoOdbiorcy, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplaty, src.RazemKwotaNaleznychWplatDziennych, src.RazemKwotaNadwyzkiWplatPoprzDekl, src.RazemKwotaDokonanychWplatDziennych, src.EksportIloscWyrobowWHektolitrach, src.EksportStawkaPodatku, src.EksportKwotaPodatku, src.RazemIloscWyrobowWHektolitrach, src.RazemKwotaPodatku, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikC_InfKwotWplatDzien
IF @TableName = 'AKC4_ZalacznikC_InfKwotWplatDzien' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikC_InfKwotWplatDzien WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikC_InfKwotWplatDzien)
 MERGE INTO zef2DP.AKC4_ZalacznikC_InfKwotWplatDzien AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikC_InfKwotWplatDzien AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.DataPowstaniaObowPodatk=src.DataPowstaniaObowPodatk, tgt.KwotaPodatkuAkcZDniaPowstaniaObowPodatk=src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, tgt.DataDokonaniaWplatyDziennej=src.DataDokonaniaWplatyDziennej, tgt.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne=src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, tgt.KwotaDokonanejWplatyDziennej=src.KwotaDokonanejWplatyDziennej, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, DataPowstaniaObowPodatk, KwotaPodatkuAkcZDniaPowstaniaObowPodatk, DataDokonaniaWplatyDziennej, KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, KwotaDokonanejWplatyDziennej, id1)
VALUES (src.IdentyfikatorZalacznika, src.DataPowstaniaObowPodatk, src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, src.DataDokonaniaWplatyDziennej, src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, src.KwotaDokonanejWplatyDziennej, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikC_Towary
IF @TableName = 'AKC4_ZalacznikC_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikC_Towary WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikC_Towary)
 MERGE INTO zef2DP.AKC4_ZalacznikC_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikC_Towary AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.Ubytki=src.Ubytki, tgt.KodCN=src.KodCN, tgt.IloscWyrobowWHektolitrach=src.IloscWyrobowWHektolitrach, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, NazwaGrupyWyrobow, Ubytki, KodCN, IloscWyrobowWHektolitrach, StawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, id1)
VALUES (src.IdentyfikatorZalacznika, src.NazwaGrupyWyrobow, src.Ubytki, src.KodCN, src.IloscWyrobowWHektolitrach, src.StawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikD
IF @TableName = 'AKC4_ZalacznikD' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikD WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikD)
 MERGE INTO zef2DP.AKC4_ZalacznikD AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikD AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.PowiazanaDeklaracjaAKCPA=src.PowiazanaDeklaracjaAKCPA, tgt.NumerAkcyzowySkladuPodatnika=src.NumerAkcyzowySkladuPodatnika, tgt.NumerAkcyzowySkladuObcego=src.NumerAkcyzowySkladuObcego, tgt.AdresSkladu=src.AdresSkladu, tgt.NumerAkcyzowyZarejestrowanegoOdbiorcy=src.NumerAkcyzowyZarejestrowanegoOdbiorcy, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplaty=src.NadwyzkaPrzedplaty, tgt.RazemKwotaNaleznychWplatDziennych=src.RazemKwotaNaleznychWplatDziennych, tgt.RazemKwotaNadwyzkiWplatPoprzDekl=src.RazemKwotaNadwyzkiWplatPoprzDekl, tgt.RazemKwotaDokonanychWplatDziennych=src.RazemKwotaDokonanychWplatDziennych, tgt.EksportIloscWyrobowWTysLitrow=src.EksportIloscWyrobowWTysLitrow, tgt.EksportStawkaPodatku=src.EksportStawkaPodatku, tgt.EksportKwotaPodatku=src.EksportKwotaPodatku, tgt.RazemIloscWyrobowWTysLitrow=src.RazemIloscWyrobowWTysLitrow, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, PowiazanaDeklaracjaAKCPA, NumerAkcyzowySkladuPodatnika, NumerAkcyzowySkladuObcego, AdresSkladu, NumerAkcyzowyZarejestrowanegoOdbiorcy, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplaty, RazemKwotaNaleznychWplatDziennych, RazemKwotaNadwyzkiWplatPoprzDekl, RazemKwotaDokonanychWplatDziennych, EksportIloscWyrobowWTysLitrow, EksportStawkaPodatku, EksportKwotaPodatku, RazemIloscWyrobowWTysLitrow, RazemKwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.PowiazanaDeklaracjaAKCPA, src.NumerAkcyzowySkladuPodatnika, src.NumerAkcyzowySkladuObcego, src.AdresSkladu, src.NumerAkcyzowyZarejestrowanegoOdbiorcy, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplaty, src.RazemKwotaNaleznychWplatDziennych, src.RazemKwotaNadwyzkiWplatPoprzDekl, src.RazemKwotaDokonanychWplatDziennych, src.EksportIloscWyrobowWTysLitrow, src.EksportStawkaPodatku, src.EksportKwotaPodatku, src.RazemIloscWyrobowWTysLitrow, src.RazemKwotaPodatku, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikD_InfKwotWplatDzien
IF @TableName = 'AKC4_ZalacznikD_InfKwotWplatDzien' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikD_InfKwotWplatDzien WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikD_InfKwotWplatDzien)
 MERGE INTO zef2DP.AKC4_ZalacznikD_InfKwotWplatDzien AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikD_InfKwotWplatDzien AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.DataPowstaniaObowPodatk=src.DataPowstaniaObowPodatk, tgt.KwotaPodatkuAkcZDniaPowstaniaObowPodatk=src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, tgt.DataDokonaniaWplatyDziennej=src.DataDokonaniaWplatyDziennej, tgt.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne=src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, tgt.KwotaDokonanejWplatyDziennej=src.KwotaDokonanejWplatyDziennej, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, DataPowstaniaObowPodatk, KwotaPodatkuAkcZDniaPowstaniaObowPodatk, DataDokonaniaWplatyDziennej, KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, KwotaDokonanejWplatyDziennej, id1)
VALUES (src.IdentyfikatorZalacznika, src.DataPowstaniaObowPodatk, src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, src.DataDokonaniaWplatyDziennej, src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, src.KwotaDokonanejWplatyDziennej, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikD_Towary
IF @TableName = 'AKC4_ZalacznikD_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikD_Towary WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikD_Towary)
 MERGE INTO zef2DP.AKC4_ZalacznikD_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikD_Towary AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.Ubytki=src.Ubytki, tgt.KodCN=src.KodCN, tgt.IloscWyrobowWTysLitrow=src.IloscWyrobowWTysLitrow, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, NazwaGrupyWyrobow, Ubytki, KodCN, IloscWyrobowWTysLitrow, StawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, id1)
VALUES (src.IdentyfikatorZalacznika, src.NazwaGrupyWyrobow, src.Ubytki, src.KodCN, src.IloscWyrobowWTysLitrow, src.StawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikE
IF @TableName = 'AKC4_ZalacznikE' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikE WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikE)
 MERGE INTO zef2DP.AKC4_ZalacznikE AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikE AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.EksportLiczbaSamochObjetychPodatkiem=src.EksportLiczbaSamochObjetychPodatkiem, tgt.EksportPodstawaOpodatkowania=src.EksportPodstawaOpodatkowania, tgt.EksportStawkaPodatku=src.EksportStawkaPodatku, tgt.EksportKwotaPodatku=src.EksportKwotaPodatku, tgt.RazemLiczbaSamochObjetychPodatkiem=src.RazemLiczbaSamochObjetychPodatkiem, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, RazemObliczonyPodatek, EksportLiczbaSamochObjetychPodatkiem, EksportPodstawaOpodatkowania, EksportStawkaPodatku, EksportKwotaPodatku, RazemLiczbaSamochObjetychPodatkiem, RazemKwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.RazemObliczonyPodatek, src.EksportLiczbaSamochObjetychPodatkiem, src.EksportPodstawaOpodatkowania, src.EksportStawkaPodatku, src.EksportKwotaPodatku, src.RazemLiczbaSamochObjetychPodatkiem, src.RazemKwotaPodatku, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikE_Towary
IF @TableName = 'AKC4_ZalacznikE_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikE_Towary WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikE_Towary)
 MERGE INTO zef2DP.AKC4_ZalacznikE_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikE_Towary AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.LiczbaSamochObjetychPodatkiem=src.LiczbaSamochObjetychPodatkiem, tgt.PodstawaOpodatkowania=src.PodstawaOpodatkowania, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, NazwaGrupyWyrobow, KodCN, LiczbaSamochObjetychPodatkiem, PodstawaOpodatkowania, StawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, id1)
VALUES (src.IdentyfikatorZalacznika, src.NazwaGrupyWyrobow, src.KodCN, src.LiczbaSamochObjetychPodatkiem, src.PodstawaOpodatkowania, src.StawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikF
IF @TableName = 'AKC4_ZalacznikF' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikF WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikF)
 MERGE INTO zef2DP.AKC4_ZalacznikF AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikF AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.PowiazanaDeklaracjaAKCPA=src.PowiazanaDeklaracjaAKCPA, tgt.NumerAkcyzowySkladuPodatnika=src.NumerAkcyzowySkladuPodatnika, tgt.NumerAkcyzowySkladuObcego=src.NumerAkcyzowySkladuObcego, tgt.AdresSkladu=src.AdresSkladu, tgt.NumerAkcyzowyZarejestrowanegoOdbiorcy=src.NumerAkcyzowyZarejestrowanegoOdbiorcy, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaZnakowAkcyzy=src.KwotaZnakowAkcyzy, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplaty=src.NadwyzkaPrzedplaty, tgt.RazemKwotaNaleznychWplatDziennych=src.RazemKwotaNaleznychWplatDziennych, tgt.RazemKwotaNadwyzkiWplatPoprzDekl=src.RazemKwotaNadwyzkiWplatPoprzDekl, tgt.RazemKwotaDokonanychWplatDziennych=src.RazemKwotaDokonanychWplatDziennych, tgt.EksportWartoscWgMaksCenyDetal=src.EksportWartoscWgMaksCenyDetal, tgt.EksportIloscWyrobowWTysSztukLubKg=src.EksportIloscWyrobowWTysSztukLubKg, tgt.EksportStawkaPodatkuProcentowa=src.EksportStawkaPodatkuProcentowa, tgt.EksportStawkaPodatkuKwotowa=src.EksportStawkaPodatkuKwotowa, tgt.EksportKwotaPodatku=src.EksportKwotaPodatku, tgt.RazemWartoscWgMaksCenyDetal=src.RazemWartoscWgMaksCenyDetal, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, PowiazanaDeklaracjaAKCPA, NumerAkcyzowySkladuPodatnika, NumerAkcyzowySkladuObcego, AdresSkladu, NumerAkcyzowyZarejestrowanegoOdbiorcy, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaZnakowAkcyzy, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplaty, RazemKwotaNaleznychWplatDziennych, RazemKwotaNadwyzkiWplatPoprzDekl, RazemKwotaDokonanychWplatDziennych, EksportWartoscWgMaksCenyDetal, EksportIloscWyrobowWTysSztukLubKg, EksportStawkaPodatkuProcentowa, EksportStawkaPodatkuKwotowa, EksportKwotaPodatku, RazemWartoscWgMaksCenyDetal, RazemKwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.PowiazanaDeklaracjaAKCPA, src.NumerAkcyzowySkladuPodatnika, src.NumerAkcyzowySkladuObcego, src.AdresSkladu, src.NumerAkcyzowyZarejestrowanegoOdbiorcy, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaZnakowAkcyzy, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplaty, src.RazemKwotaNaleznychWplatDziennych, src.RazemKwotaNadwyzkiWplatPoprzDekl, src.RazemKwotaDokonanychWplatDziennych, src.EksportWartoscWgMaksCenyDetal, src.EksportIloscWyrobowWTysSztukLubKg, src.EksportStawkaPodatkuProcentowa, src.EksportStawkaPodatkuKwotowa, src.EksportKwotaPodatku, src.RazemWartoscWgMaksCenyDetal, src.RazemKwotaPodatku, src.id1);
SET @Merged = 1;
END


--AKC4_ZalacznikF_InfKwotWplatDzien
IF @TableName = 'AKC4_ZalacznikF_InfKwotWplatDzien' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikF_InfKwotWplatDzien WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikF_InfKwotWplatDzien)
 MERGE INTO zef2DP.AKC4_ZalacznikF_InfKwotWplatDzien AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikF_InfKwotWplatDzien AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.DataPowstaniaObowPodatk=src.DataPowstaniaObowPodatk, tgt.KwotaPodatkuAkcZDniaPowstaniaObowPodatk=src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, tgt.DataDokonaniaWplatyDziennej=src.DataDokonaniaWplatyDziennej, tgt.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne=src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, tgt.KwotaDokonanejWplatyDziennej=src.KwotaDokonanejWplatyDziennej, tgt.id1=src.id1
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorZalacznika, DataPowstaniaObowPodatk, KwotaPodatkuAkcZDniaPowstaniaObowPodatk, DataDokonaniaWplatyDziennej, KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, KwotaDokonanejWplatyDziennej, id1)
VALUES (src.IdentyfikatorZalacznika, src.DataPowstaniaObowPodatk, src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, src.DataDokonaniaWplatyDziennej, src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, src.KwotaDokonanejWplatyDziennej, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikF_Towary
IF @TableName = 'AKC4_ZalacznikF_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikF_Towary WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikF_Towary)
 MERGE INTO zef2DP.AKC4_ZalacznikF_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikF_Towary AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.Ubytki=src.Ubytki, tgt.KodCN=src.KodCN, tgt.WartoscWgMaksCenyDetal=src.WartoscWgMaksCenyDetal, tgt.IloscWyrobowWTysSztukLubKg=src.IloscWyrobowWTysSztukLubKg, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.StawkaPodatkuKwota=src.StawkaPodatkuKwota, tgt.MinimalnaStawkaPodatku=src.MinimalnaStawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, NazwaGrupyWyrobow, Ubytki, KodCN, WartoscWgMaksCenyDetal, IloscWyrobowWTysSztukLubKg, StawkaPodatkuProcent, StawkaPodatkuKwota, MinimalnaStawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, id1)
VALUES (src.IdentyfikatorZalacznika, src.NazwaGrupyWyrobow, src.Ubytki, src.KodCN, src.WartoscWgMaksCenyDetal, src.IloscWyrobowWTysSztukLubKg, src.StawkaPodatkuProcent, src.StawkaPodatkuKwota, src.MinimalnaStawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikH
IF @TableName = 'AKC4_ZalacznikH' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikH WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikH)
 MERGE INTO zef2DP.AKC4_ZalacznikH AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikH AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.KwotaZwolOdAkcArt30Ust1=src.KwotaZwolOdAkcArt30Ust1, tgt.KwotaZwolOdAkcArt30Ust6=src.KwotaZwolOdAkcArt30Ust6, tgt.KwotaZwolOdAkcArt30Ust7=src.KwotaZwolOdAkcArt30Ust7, tgt.OgolemPodatek=src.OgolemPodatek, tgt.EksportIloscEnergiiElektrycznejWMWh=src.EksportIloscEnergiiElektrycznejWMWh, tgt.EksportStawkaPodatku=src.EksportStawkaPodatku, tgt.EksportKwotaPodatku=src.EksportKwotaPodatku, tgt.RazemIloscEnergiiElektrycznejWMWh=src.RazemIloscEnergiiElektrycznejWMWh, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1, tgt.KwotaZwolOdAkcArt30Ust7a=src.KwotaZwolOdAkcArt30Ust7a
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, RazemObliczonyPodatek, ZwolnieniaObnizenia, KwotaZwolOdAkcArt30Ust1, KwotaZwolOdAkcArt30Ust6, KwotaZwolOdAkcArt30Ust7, OgolemPodatek, EksportIloscEnergiiElektrycznejWMWh, EksportStawkaPodatku, EksportKwotaPodatku, RazemIloscEnergiiElektrycznejWMWh, RazemKwotaPodatku, id1, KwotaZwolOdAkcArt30Ust7a)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.KwotaZwolOdAkcArt30Ust1, src.KwotaZwolOdAkcArt30Ust6, src.KwotaZwolOdAkcArt30Ust7, src.OgolemPodatek, src.EksportIloscEnergiiElektrycznejWMWh, src.EksportStawkaPodatku, src.EksportKwotaPodatku, src.RazemIloscEnergiiElektrycznejWMWh, src.RazemKwotaPodatku, src.id1, src.KwotaZwolOdAkcArt30Ust7a);
SET @Merged = 1;
END

--AKC4_ZalacznikH_Towary
IF @TableName = 'AKC4_ZalacznikH_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikH_Towary WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikH_Towary)
 MERGE INTO zef2DP.AKC4_ZalacznikH_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikH_Towary AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.IloscEnergiiElektrycznejWMWh=src.IloscEnergiiElektrycznejWMWh, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, NazwaGrupyWyrobow, KodCN, IloscEnergiiElektrycznejWMWh, StawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, id1)
VALUES (src.IdentyfikatorZalacznika, src.NazwaGrupyWyrobow, src.KodCN, src.IloscEnergiiElektrycznejWMWh, src.StawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikI
IF @TableName = 'AKC4_ZalacznikI' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikI WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikI)
 MERGE INTO zef2DP.AKC4_ZalacznikI AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikI AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.PowiazanaDeklaracjaAKCPA=src.PowiazanaDeklaracjaAKCPA, tgt.NumerAkcyzowySkladuPodatnika=src.NumerAkcyzowySkladuPodatnika, tgt.NumerAkcyzowySkladuObcego=src.NumerAkcyzowySkladuObcego, tgt.AdresSkladu=src.AdresSkladu, tgt.NumerAkcyzowyZarejestrowanegoOdbiorcy=src.NumerAkcyzowyZarejestrowanegoOdbiorcy, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplaty=src.NadwyzkaPrzedplaty, tgt.RazemKwotaNaleznychWplatDziennych=src.RazemKwotaNaleznychWplatDziennych, tgt.RazemKwotaNadwyzkiWplatPoprzDekl=src.RazemKwotaNadwyzkiWplatPoprzDekl, tgt.RazemKwotaDokonanychWplatDziennych=src.RazemKwotaDokonanychWplatDziennych, tgt.EksportIloscWyrobowWTysLitrow=src.EksportIloscWyrobowWTysLitrow, tgt.EksportIloscWyrobowWTysKg=src.EksportIloscWyrobowWTysKg, tgt.EksportWartoscOpalowaWGJ=src.EksportWartoscOpalowaWGJ, tgt.EksportStawkaPodatku=src.EksportStawkaPodatku, tgt.EksportKwotaPodatku=src.EksportKwotaPodatku, tgt.RazemIloscWyrobowWTysLitrow=src.RazemIloscWyrobowWTysLitrow, tgt.RazemIloscWyrobowWTysKg=src.RazemIloscWyrobowWTysKg, tgt.RazemWartoscOpalowaWGJ=src.RazemWartoscOpalowaWGJ, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, PowiazanaDeklaracjaAKCPA, NumerAkcyzowySkladuPodatnika, NumerAkcyzowySkladuObcego, AdresSkladu, NumerAkcyzowyZarejestrowanegoOdbiorcy, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplaty, RazemKwotaNaleznychWplatDziennych, RazemKwotaNadwyzkiWplatPoprzDekl, RazemKwotaDokonanychWplatDziennych, EksportIloscWyrobowWTysLitrow, EksportIloscWyrobowWTysKg, EksportWartoscOpalowaWGJ, EksportStawkaPodatku, EksportKwotaPodatku, RazemIloscWyrobowWTysLitrow, RazemIloscWyrobowWTysKg, RazemWartoscOpalowaWGJ, RazemKwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.PowiazanaDeklaracjaAKCPA, src.NumerAkcyzowySkladuPodatnika, src.NumerAkcyzowySkladuObcego, src.AdresSkladu, src.NumerAkcyzowyZarejestrowanegoOdbiorcy, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplaty, src.RazemKwotaNaleznychWplatDziennych, src.RazemKwotaNadwyzkiWplatPoprzDekl, src.RazemKwotaDokonanychWplatDziennych, src.EksportIloscWyrobowWTysLitrow, src.EksportIloscWyrobowWTysKg, src.EksportWartoscOpalowaWGJ, src.EksportStawkaPodatku, src.EksportKwotaPodatku, src.RazemIloscWyrobowWTysLitrow, src.RazemIloscWyrobowWTysKg, src.RazemWartoscOpalowaWGJ, src.RazemKwotaPodatku, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikI_InfKwotWplatDzien
IF @TableName = 'AKC4_ZalacznikI_InfKwotWplatDzien' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikI_InfKwotWplatDzien WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikI_InfKwotWplatDzien)
 MERGE INTO zef2DP.AKC4_ZalacznikI_InfKwotWplatDzien AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikI_InfKwotWplatDzien AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.DataPowstaniaObowPodatk=src.DataPowstaniaObowPodatk, tgt.KwotaPodatkuAkcZDniaPowstaniaObowPodatk=src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, tgt.DataDokonaniaWplatyDziennej=src.DataDokonaniaWplatyDziennej, tgt.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne=src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, tgt.KwotaDokonanejWplatyDziennej=src.KwotaDokonanejWplatyDziennej, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, DataPowstaniaObowPodatk, KwotaPodatkuAkcZDniaPowstaniaObowPodatk, DataDokonaniaWplatyDziennej, KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, KwotaDokonanejWplatyDziennej, id1)
VALUES (src.IdentyfikatorZalacznika, src.DataPowstaniaObowPodatk, src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, src.DataDokonaniaWplatyDziennej, src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, src.KwotaDokonanejWplatyDziennej, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikI_Towary
IF @TableName = 'AKC4_ZalacznikI_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikI_Towary WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikI_Towary)
 MERGE INTO zef2DP.AKC4_ZalacznikI_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikI_Towary AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.Ubytki=src.Ubytki, tgt.KodCN=src.KodCN, tgt.IloscWyrobowWTysLitrow=src.IloscWyrobowWTysLitrow, tgt.IloscWyrobowWTysKg=src.IloscWyrobowWTysKg, tgt.WartoscOpalowaWGJ=src.WartoscOpalowaWGJ, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, NazwaGrupyWyrobow, Ubytki, KodCN, IloscWyrobowWTysLitrow, IloscWyrobowWTysKg, WartoscOpalowaWGJ, StawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, id1)
VALUES (src.IdentyfikatorZalacznika, src.NazwaGrupyWyrobow, src.Ubytki, src.KodCN, src.IloscWyrobowWTysLitrow, src.IloscWyrobowWTysKg, src.WartoscOpalowaWGJ, src.StawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikJ
IF @TableName = 'AKC4_ZalacznikJ' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikJ WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikJ)
 MERGE INTO zef2DP.AKC4_ZalacznikJ AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikJ AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.PowiazanaDeklaracjaAKCPA=src.PowiazanaDeklaracjaAKCPA, tgt.NumerAkcyzowySkladuPodatnika=src.NumerAkcyzowySkladuPodatnika, tgt.NumerAkcyzowySkladuObcego=src.NumerAkcyzowySkladuObcego, tgt.AdresSkladu=src.AdresSkladu, tgt.NumerAkcyzowyZarejestrowanegoOdbiorcy=src.NumerAkcyzowyZarejestrowanegoOdbiorcy, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplaty=src.NadwyzkaPrzedplaty, tgt.RazemKwotaNaleznychWplatDziennych=src.RazemKwotaNaleznychWplatDziennych, tgt.RazemKwotaNadwyzkiWplatPoprzDekl=src.RazemKwotaNadwyzkiWplatPoprzDekl, tgt.RazemKwotaDokonanychWplatDziennych=src.RazemKwotaDokonanychWplatDziennych, tgt.EksportIloscWyrobowWTysKg=src.EksportIloscWyrobowWTysKg, tgt.EksportWartoscOpalowaWGJ=src.EksportWartoscOpalowaWGJ, tgt.EksportStawkaPodatku=src.EksportStawkaPodatku, tgt.EksportKwotaPodatku=src.EksportKwotaPodatku, tgt.RazemIloscWyrobowWTysKg=src.RazemIloscWyrobowWTysKg, tgt.RazemWartoscOpalowaWGJ=src.RazemWartoscOpalowaWGJ, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, PowiazanaDeklaracjaAKCPA, NumerAkcyzowySkladuPodatnika, NumerAkcyzowySkladuObcego, AdresSkladu, NumerAkcyzowyZarejestrowanegoOdbiorcy, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplaty, RazemKwotaNaleznychWplatDziennych, RazemKwotaNadwyzkiWplatPoprzDekl, RazemKwotaDokonanychWplatDziennych, EksportIloscWyrobowWTysKg, EksportWartoscOpalowaWGJ, EksportStawkaPodatku, EksportKwotaPodatku, RazemIloscWyrobowWTysKg, RazemWartoscOpalowaWGJ, RazemKwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.PowiazanaDeklaracjaAKCPA, src.NumerAkcyzowySkladuPodatnika, src.NumerAkcyzowySkladuObcego, src.AdresSkladu, src.NumerAkcyzowyZarejestrowanegoOdbiorcy, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplaty, src.RazemKwotaNaleznychWplatDziennych, src.RazemKwotaNadwyzkiWplatPoprzDekl, src.RazemKwotaDokonanychWplatDziennych, src.EksportIloscWyrobowWTysKg, src.EksportWartoscOpalowaWGJ, src.EksportStawkaPodatku, src.EksportKwotaPodatku, src.RazemIloscWyrobowWTysKg, src.RazemWartoscOpalowaWGJ, src.RazemKwotaPodatku, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikJ_InfKwotWplatDzien
IF @TableName = 'AKC4_ZalacznikJ_InfKwotWplatDzien' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikJ_InfKwotWplatDzien WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikJ_InfKwotWplatDzien)
 MERGE INTO zef2DP.AKC4_ZalacznikJ_InfKwotWplatDzien AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikJ_InfKwotWplatDzien AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.DataPowstaniaObowPodatk=src.DataPowstaniaObowPodatk, tgt.KwotaPodatkuAkcZDniaPowstaniaObowPodatk=src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, tgt.DataDokonaniaWplatyDziennej=src.DataDokonaniaWplatyDziennej, tgt.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne=src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, tgt.KwotaDokonanejWplatyDziennej=src.KwotaDokonanejWplatyDziennej, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, DataPowstaniaObowPodatk, KwotaPodatkuAkcZDniaPowstaniaObowPodatk, DataDokonaniaWplatyDziennej, KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, KwotaDokonanejWplatyDziennej, id1)
VALUES (src.IdentyfikatorZalacznika, src.DataPowstaniaObowPodatk, src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, src.DataDokonaniaWplatyDziennej, src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, src.KwotaDokonanejWplatyDziennej, src.id1);
SET @Merged = 1;
END


--AKC4_ZalacznikJ_Towary
IF @TableName = 'AKC4_ZalacznikJ_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikJ_Towary WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikJ_Towary)
MERGE INTO zef2DP.AKC4_ZalacznikJ_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikJ_Towary AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.Ubytki=src.Ubytki, tgt.KodCN=src.KodCN, tgt.IloscWyrobowWTysKg=src.IloscWyrobowWTysKg, tgt.WartoscOpalowaWGJ=src.WartoscOpalowaWGJ, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, NazwaGrupyWyrobow, Ubytki, KodCN, IloscWyrobowWTysKg, WartoscOpalowaWGJ, StawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, id1)
VALUES (src.IdentyfikatorZalacznika, src.NazwaGrupyWyrobow, src.Ubytki, src.KodCN, src.IloscWyrobowWTysKg, src.WartoscOpalowaWGJ, src.StawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikK
IF @TableName = 'AKC4_ZalacznikK' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikK WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikK)
 MERGE INTO zef2DP.AKC4_ZalacznikK AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikK AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.PowiazanaDeklaracjaAKCPA=src.PowiazanaDeklaracjaAKCPA, tgt.NumerAkcyzowySkladuPodatnika=src.NumerAkcyzowySkladuPodatnika, tgt.NumerAkcyzowySkladuObcego=src.NumerAkcyzowySkladuObcego, tgt.AdresSkladu=src.AdresSkladu, tgt.NumerAkcyzowyZarejestrowanegoOdbiorcy=src.NumerAkcyzowyZarejestrowanegoOdbiorcy, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.KwotaPrzedplatyAkcyzy=src.KwotaPrzedplatyAkcyzy, tgt.PodatekNalezny=src.PodatekNalezny, tgt.NadwyzkaPrzedplaty=src.NadwyzkaPrzedplaty, tgt.RazemKwotaNaleznychWplatDziennych=src.RazemKwotaNaleznychWplatDziennych, tgt.RazemKwotaNadwyzkiWplatPoprzDekl=src.RazemKwotaNadwyzkiWplatPoprzDekl, tgt.RazemKwotaDokonanychWplatDziennych=src.RazemKwotaDokonanychWplatDziennych, tgt.EksportIloscWyrobowWTysLitrow=src.EksportIloscWyrobowWTysLitrow, tgt.EksportStawkaPodatku=src.EksportStawkaPodatku, tgt.EksportKwotaPodatku=src.EksportKwotaPodatku, tgt.RazemIloscWyrobowWTysLitrow=src.RazemIloscWyrobowWTysLitrow, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, PowiazanaDeklaracjaAKCPA, NumerAkcyzowySkladuPodatnika, NumerAkcyzowySkladuObcego, AdresSkladu, NumerAkcyzowyZarejestrowanegoOdbiorcy, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, KwotaPrzedplatyAkcyzy, PodatekNalezny, NadwyzkaPrzedplaty, RazemKwotaNaleznychWplatDziennych, RazemKwotaNadwyzkiWplatPoprzDekl, RazemKwotaDokonanychWplatDziennych, EksportIloscWyrobowWTysLitrow, EksportStawkaPodatku, EksportKwotaPodatku, RazemIloscWyrobowWTysLitrow, RazemKwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.PowiazanaDeklaracjaAKCPA, src.NumerAkcyzowySkladuPodatnika, src.NumerAkcyzowySkladuObcego, src.AdresSkladu, src.NumerAkcyzowyZarejestrowanegoOdbiorcy, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.KwotaPrzedplatyAkcyzy, src.PodatekNalezny, src.NadwyzkaPrzedplaty, src.RazemKwotaNaleznychWplatDziennych, src.RazemKwotaNadwyzkiWplatPoprzDekl, src.RazemKwotaDokonanychWplatDziennych, src.EksportIloscWyrobowWTysLitrow, src.EksportStawkaPodatku, src.EksportKwotaPodatku, src.RazemIloscWyrobowWTysLitrow, src.RazemKwotaPodatku, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikK_InfKwotWplatDzien
IF @TableName = 'AKC4_ZalacznikK_InfKwotWplatDzien' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikK_InfKwotWplatDzien WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikK_InfKwotWplatDzien)
 MERGE INTO zef2DP.AKC4_ZalacznikK_InfKwotWplatDzien AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikK_InfKwotWplatDzien AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.DataPowstaniaObowPodatk=src.DataPowstaniaObowPodatk, tgt.KwotaPodatkuAkcZDniaPowstaniaObowPodatk=src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, tgt.DataDokonaniaWplatyDziennej=src.DataDokonaniaWplatyDziennej, tgt.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne=src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, tgt.KwotaDokonanejWplatyDziennej=src.KwotaDokonanejWplatyDziennej, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, DataPowstaniaObowPodatk, KwotaPodatkuAkcZDniaPowstaniaObowPodatk, DataDokonaniaWplatyDziennej, KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, KwotaDokonanejWplatyDziennej, id1)
VALUES (src.IdentyfikatorZalacznika, src.DataPowstaniaObowPodatk, src.KwotaPodatkuAkcZDniaPowstaniaObowPodatk, src.DataDokonaniaWplatyDziennej, src.KwotaNadwyzkiWplatZPoprzDeklNaWplatyDzienne, src.KwotaDokonanejWplatyDziennej, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikK_Towary
IF @TableName = 'AKC4_ZalacznikK_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikK_Towary WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikK_Towary)
 MERGE INTO zef2DP.AKC4_ZalacznikK_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikK_Towary AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.Ubytki=src.Ubytki, tgt.KodCN=src.KodCN, tgt.IloscWyrobowWTysLitrow=src.IloscWyrobowWTysLitrow, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, NazwaGrupyWyrobow, Ubytki, KodCN, IloscWyrobowWTysLitrow, StawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, id1)
VALUES (src.IdentyfikatorZalacznika, src.NazwaGrupyWyrobow, src.Ubytki, src.KodCN, src.IloscWyrobowWTysLitrow, src.StawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikL
IF @TableName = 'AKC4_ZalacznikL' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikL WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikL)
 MERGE INTO zef2DP.AKC4_ZalacznikL AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikL AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.RazemObliczonyPodatek=src.RazemObliczonyPodatek, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.OgolemPodatek=src.OgolemPodatek, tgt.RazemIloscGJ=src.RazemIloscGJ, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, RazemObliczonyPodatek, ZwolnieniaObnizenia, OgolemPodatek, RazemIloscGJ, RazemKwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.RazemObliczonyPodatek, src.ZwolnieniaObnizenia, src.OgolemPodatek, src.RazemIloscGJ, src.RazemKwotaPodatku, src.id1);
SET @Merged = 1;
END

--AKC4_ZalacznikL_Towary
IF @TableName = 'AKC4_ZalacznikL_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKC4_ZalacznikL_Towary WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.AKC4_ZalacznikL_Towary)
 MERGE INTO zef2DP.AKC4_ZalacznikL_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKC4_ZalacznikL_Towary AS src
ON (tgt.id1=src.id1)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.KodCN=src.KodCN, tgt.IloscGJ=src.IloscGJ, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, NazwaGrupyWyrobow, KodCN, IloscGJ, StawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, id1)
VALUES (src.IdentyfikatorZalacznika, src.NazwaGrupyWyrobow, src.KodCN, src.IloscGJ, src.StawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.id1);
SET @Merged = 1;
END

--AKCEN_Deklaracja
IF @TableName = 'AKCEN_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCEN_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCEN_Deklaracja)
 MERGE INTO zef2DP.AKCEN_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.AKCEN_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DoZaplaty]=src.[DoZaplaty],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[ZwolnieniaObnizenia]=src.[ZwolnieniaObnizenia],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [ZwolnieniaObnizenia], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [ZwolnieniaObnizenia], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] );
SET @Merged = 1;
 END

--AKCEN_Towary
IF @TableName = 'AKCEN_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCEN_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCEN_Towary)
MERGE INTO zef2DP.AKCEN_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKCEN_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.KodCN=src.KodCN, tgt.StawkaPodatku=src.StawkaPodatku, tgt.IloscEnergiiElektrycznejWMWh=src.IloscEnergiiElektrycznejWMWh, tgt.KwotaPodatku=src.KwotaPodatku, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, KodCN, StawkaPodatku, IloscEnergiiElektrycznejWMWh, KwotaPodatku, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.KodCN, src.StawkaPodatku, src.IloscEnergiiElektrycznejWMWh, src.KwotaPodatku, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END

--AKCP_Deklaracja
IF @TableName = 'AKCP_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCP_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCP_Deklaracja)
 MERGE INTO zef2DP.AKCP_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.AKCP_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[RazemKwotaPodatku]=src.[RazemKwotaPodatku],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DoZaplaty]=src.[DoZaplaty],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] );
SET @Merged = 1;
 END

--AKCP_Towary
IF @TableName = 'AKCP_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCP_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCP_Towary)
 MERGE INTO zef2DP.AKCP_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKCP_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.KodCN=src.KodCN, tgt.Marka=src.Marka, tgt.Model=src.Model, tgt.RokProdukcji=src.RokProdukcji, tgt.PojazdElektryczny=src.PojazdElektryczny, tgt.PojemnoscSkokowaSilnika=src.PojemnoscSkokowaSilnika, tgt.NumerVIN=src.NumerVIN, tgt.InformacjeDodatkowe=src.InformacjeDodatkowe, tgt.NiestandardowyNumerVIN=src.NiestandardowyNumerVIN, tgt.DataSprzedazSamoch=src.DataSprzedazSamoch, tgt.PodstawObliczPodatku=src.PodstawObliczPodatku, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, KodCN, Marka, Model, RokProdukcji, PojazdElektryczny, PojemnoscSkokowaSilnika, NumerVIN, InformacjeDodatkowe, NiestandardowyNumerVIN, DataSprzedazSamoch, PodstawObliczPodatku, StawkaPodatkuProcent, KwotaPodatku, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.KodCN, src.Marka, src.Model, src.RokProdukcji, src.PojazdElektryczny, src.PojemnoscSkokowaSilnika, src.NumerVIN, src.InformacjeDodatkowe, src.NiestandardowyNumerVIN, src.DataSprzedazSamoch, src.PodstawObliczPodatku, src.StawkaPodatkuProcent, src.KwotaPodatku, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END

--'AKCPA_Deklaracja'
IF @TableName = 'AKCPA_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCPA_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCPA_Deklaracja)
 MERGE INTO zef2DP.AKCPA_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.AKCPA_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[RazemKwotaPodatku]=src.[RazemKwotaPodatku],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[KwotaPrzedplatyAkcyzy]=src.[KwotaPrzedplatyAkcyzy],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[NadwyzkaPrzedplatyAkcyzy]=src.[NadwyzkaPrzedplatyAkcyzy],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[PrzedplataAkcyzyDoZaplaty]=src.[PrzedplataAkcyzyDoZaplaty],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[RazemIloscWyrobow]=src.[RazemIloscWyrobow],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[SymbolZalacznika]=src.[SymbolZalacznika],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaPrzedplatyAkcyzy], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [NadwyzkaPrzedplatyAkcyzy], [ImiePelnomocnika], [PrzedplataAkcyzyDoZaplaty], [UrzadCelny], [DeklaracjaZaOkres], [RazemIloscWyrobow],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SymbolZalacznika], [SystemZrodlowy] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaPrzedplatyAkcyzy], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [NadwyzkaPrzedplatyAkcyzy], [ImiePelnomocnika], [PrzedplataAkcyzyDoZaplaty], [UrzadCelny], [DeklaracjaZaOkres], [RazemIloscWyrobow],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SymbolZalacznika], [SystemZrodlowy] );
SET @Merged = 1;
 END

--AKCPA_Towary
IF @TableName = 'AKCPA_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCPA_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCPA_Towary)
 MERGE INTO zef2DP.AKCPA_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKCPA_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.KodCN=src.KodCN, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.PodstawObliczPrzedplaty=src.PodstawObliczPrzedplaty, tgt.WartoscWgMaksCenyDetal=src.WartoscWgMaksCenyDetal, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.StawkaPodatkuKwota=src.StawkaPodatkuKwota, tgt.KwotaPrzedplaty=src.KwotaPrzedplaty, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.RodzajStawkiSpozaISZTAR=src.RodzajStawkiSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, KodCN, NazwaGrupyWyrobow, PodstawObliczPrzedplaty, WartoscWgMaksCenyDetal, StawkaPodatkuProcent, StawkaPodatkuKwota, KwotaPrzedplaty, StawkaSpozaISZTAR, RodzajStawkiSpozaISZTAR, WartoscStawkiSpozaISZTAR, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.KodCN, src.NazwaGrupyWyrobow, src.PodstawObliczPrzedplaty, src.WartoscWgMaksCenyDetal, src.StawkaPodatkuProcent, src.StawkaPodatkuKwota, src.KwotaPrzedplaty, src.StawkaSpozaISZTAR, src.RodzajStawkiSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END


--AKCST_Deklaracja
IF @TableName = 'AKCST_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCST_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCST_Deklaracja)
 MERGE INTO zef2DP.AKCST_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.AKCST_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[RazemKwotaPodatku]=src.[RazemKwotaPodatku],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DoZaplaty]=src.[DoZaplaty],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[ZwolnieniaObnizenia]=src.[ZwolnieniaObnizenia],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[KwotaZnakowAkcyzy]=src.[KwotaZnakowAkcyzy],
tgt.[RodzajDokumentu]=src.[RodzajDokumentu],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [ZwolnieniaObnizenia], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [KwotaZnakowAkcyzy], [RodzajDokumentu], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [ZwolnieniaObnizenia], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [KwotaZnakowAkcyzy], [RodzajDokumentu], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] );
SET @Merged = 1;
 END

--AKCST_Towary
IF @TableName = 'AKCST_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCST_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCST_Towary)
MERGE INTO zef2DP.AKCST_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKCST_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.KodCN=src.KodCN, tgt.StawkaPodatku=src.StawkaPodatku, tgt.IloscSuszuTyton=src.IloscSuszuTyton, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.NazwaTowarow=src.NazwaTowarow
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, KodCN, StawkaPodatku, IloscSuszuTyton, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, DataArch, ID_Pismo_xml, NazwaTowarow)
VALUES (src.IdentyfikatorDokumentu, src.KodCN, src.StawkaPodatku, src.IloscSuszuTyton, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.DataArch, src.ID_Pismo_xml, src.NazwaTowarow);
SET @Merged = 1;
END

--'AKCU_Deklaracja'
IF @TableName = 'AKCU_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCU_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCU_Deklaracja)
 MERGE INTO zef2DP.AKCU_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.AKCU_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[RazemKwotaPodatku]=src.[RazemKwotaPodatku],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[MigracjaReczna]=src.[MigracjaReczna],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DoZaplaty]=src.[DoZaplaty],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[ZwolnieniaObnizenia]=src.[ZwolnieniaObnizenia],
tgt.[NumerZabezpieczenia]=src.[NumerZabezpieczenia],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[KwotaPodatkuPoObnizeniach]=src.[KwotaPodatkuPoObnizeniach],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[KwotaZnakowAkcyzy]=src.[KwotaZnakowAkcyzy],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[NumerZPNW]=src.[NumerZPNW],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[KwotaZwolnienia]=src.[KwotaZwolnienia],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[KwotaZnakowAkcyzyDlaGrupy]=src.[KwotaZnakowAkcyzyDlaGrupy],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[ZwolnieniaObnizeniaDlaGrupy]=src.[ZwolnieniaObnizeniaDlaGrupy],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy],
tgt.DokumentArchiwalny=src.DokumentArchiwalny
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [CzyOstatniaWersjaDeklaracji], [MigracjaReczna], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [ZwolnieniaObnizenia], [NumerZabezpieczenia], [UzasadnienieKorekty], [RodzajKorekty], [KwotaPodatkuPoObnizeniach], [EmailPodatnikaLubPelnomocnika], [KwotaZnakowAkcyzy], [UwagiUrzeduCelnego], [NumerZPNW], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny], [KwotaZwolnienia],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [KwotaZnakowAkcyzyDlaGrupy], [TelefonPodatnikaLubPelnomocnika], [ZwolnieniaObnizeniaDlaGrupy], [SystemZrodlowy], [DokumentArchiwalny] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [CzyOstatniaWersjaDeklaracji], [MigracjaReczna], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [ZwolnieniaObnizenia], [NumerZabezpieczenia], [UzasadnienieKorekty], [RodzajKorekty], [KwotaPodatkuPoObnizeniach], [EmailPodatnikaLubPelnomocnika], [KwotaZnakowAkcyzy], [UwagiUrzeduCelnego], [NumerZPNW], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny], [KwotaZwolnienia],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [KwotaZnakowAkcyzyDlaGrupy], [TelefonPodatnikaLubPelnomocnika], [ZwolnieniaObnizeniaDlaGrupy], [SystemZrodlowy], [DokumentArchiwalny] );
SET @Merged = 1;
 END

--AKCU_Towary
IF @TableName = 'AKCU_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCU_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCU_Towary)
 MERGE INTO zef2DP.AKCU_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKCU_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.OpisTowaru=src.OpisTowaru, tgt.DataPowstaniaObowPodatk=src.DataPowstaniaObowPodatk, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.DataPlatnosci=src.DataPlatnosci, tgt.Marka=src.Marka, tgt.Model=src.Model, tgt.RokProdukcji=src.RokProdukcji, tgt.PojazdElektryczny=src.PojazdElektryczny, tgt.PojemnoscSkokowaSilnika=src.PojemnoscSkokowaSilnika, tgt.NiestandardowyNumerVIN=src.NiestandardowyNumerVIN, tgt.NumerVIN=src.NumerVIN, tgt.InformacjeDodatkowe=src.InformacjeDodatkowe, tgt.KodCN=src.KodCN, tgt.PodstawObliczPodatkuIloscWyrobow=src.PodstawObliczPodatkuIloscWyrobow, tgt.PodstawObliczPodatkuWartoscWyrobow=src.PodstawObliczPodatkuWartoscWyrobow, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.StawkaPodatkuKwota=src.StawkaPodatkuKwota, tgt.MinimalnaStawkaPodatkuOdWyrTytoniowych=src.MinimalnaStawkaPodatkuOdWyrTytoniowych, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.RodzajStawkiSpozaISZTAR=src.RodzajStawkiSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.MieniePrzesiedlencze=src.MieniePrzesiedlencze
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, NazwaGrupyWyrobow, OpisTowaru, DataPowstaniaObowPodatk, TerminPlatnosci, DataPlatnosci, Marka, Model, RokProdukcji, PojazdElektryczny, PojemnoscSkokowaSilnika, NiestandardowyNumerVIN, NumerVIN, InformacjeDodatkowe, KodCN, PodstawObliczPodatkuIloscWyrobow, PodstawObliczPodatkuWartoscWyrobow, StawkaPodatkuProcent, StawkaPodatkuKwota, MinimalnaStawkaPodatkuOdWyrTytoniowych, KwotaPodatku, StawkaSpozaISZTAR, RodzajStawkiSpozaISZTAR, WartoscStawkiSpozaISZTAR, DataArch, ID_Pismo_xml, MieniePrzesiedlencze)
VALUES (src.IdentyfikatorDokumentu, src.NazwaGrupyWyrobow, src.OpisTowaru, src.DataPowstaniaObowPodatk, src.TerminPlatnosci, src.DataPlatnosci, src.Marka, src.Model, src.RokProdukcji, src.PojazdElektryczny, src.PojemnoscSkokowaSilnika, src.NiestandardowyNumerVIN, src.NumerVIN, src.InformacjeDodatkowe, src.KodCN, src.PodstawObliczPodatkuIloscWyrobow, src.PodstawObliczPodatkuWartoscWyrobow, src.StawkaPodatkuProcent, src.StawkaPodatkuKwota, src.MinimalnaStawkaPodatkuOdWyrTytoniowych, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.RodzajStawkiSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.DataArch, src.ID_Pismo_xml, src.MieniePrzesiedlencze);
SET @Merged = 1;
END

--'AKCWG_Deklaracja'
IF @TableName = 'AKCWG_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCWG_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCWG_Deklaracja)
 MERGE INTO zef2DP.AKCWG_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.AKCWG_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[RazemWartoscOpalowaWGJ]=src.[RazemWartoscOpalowaWGJ],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[RazemKwotaPodatku]=src.[RazemKwotaPodatku],
tgt.[TrybSkladaniaDeklaracji]=src.[TrybSkladaniaDeklaracji],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DoZaplaty]=src.[DoZaplaty],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[ZwolnieniaObnizenia]=src.[ZwolnieniaObnizenia],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[RazemIloscWyrobowWTysKg]=src.[RazemIloscWyrobowWTysKg],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [RazemWartoscOpalowaWGJ], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [TrybSkladaniaDeklaracji], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [ZwolnieniaObnizenia], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny], [RazemIloscWyrobowWTysKg],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [RazemWartoscOpalowaWGJ], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [TrybSkladaniaDeklaracji], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [ZwolnieniaObnizenia], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny], [RazemIloscWyrobowWTysKg],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] );
SET @Merged = 1;
 END

--AKCWG_Towary
IF @TableName = 'AKCWG_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCWG_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCWG_Towary)
 MERGE INTO zef2DP.AKCWG_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKCWG_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.Ubytki=src.Ubytki, tgt.KodCN=src.KodCN, tgt.IloscWyrobowWTysKg=src.IloscWyrobowWTysKg, tgt.WartoscOpalowaWGJ=src.WartoscOpalowaWGJ, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, NazwaGrupyWyrobow, Ubytki, KodCN, IloscWyrobowWTysKg, WartoscOpalowaWGJ, StawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.NazwaGrupyWyrobow, src.Ubytki, src.KodCN, src.IloscWyrobowWTysKg, src.WartoscOpalowaWGJ, src.StawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END

--AKCWW_Deklaracja
IF @TableName = 'AKCWW_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCWW_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCWW_Deklaracja)
 MERGE INTO zef2DP.AKCWW_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.AKCWW_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[RazemWartoscOpalowaWGJ]=src.[RazemWartoscOpalowaWGJ],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[RazemKwotaPodatku]=src.[RazemKwotaPodatku],
tgt.[TrybSkladaniaDeklaracji]=src.[TrybSkladaniaDeklaracji],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[MigracjaReczna]=src.[MigracjaReczna],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DoZaplaty]=src.[DoZaplaty],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[ZwolnieniaObnizenia]=src.[ZwolnieniaObnizenia],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [RazemWartoscOpalowaWGJ], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [TrybSkladaniaDeklaracji], [CzyOstatniaWersjaDeklaracji], [MigracjaReczna], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [ZwolnieniaObnizenia], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [RazemWartoscOpalowaWGJ], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [TrybSkladaniaDeklaracji], [CzyOstatniaWersjaDeklaracji], [MigracjaReczna], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [ZwolnieniaObnizenia], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] );
SET @Merged = 1;
 END

--AKCWW_Towary
IF @TableName = 'AKCWW_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCWW_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCWW_Towary)
 MERGE INTO zef2DP.AKCWW_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKCWW_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.Ubytki=src.Ubytki, tgt.KodCN=src.KodCN, tgt.WartoscOpalowaWGJ=src.WartoscOpalowaWGJ, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, NazwaGrupyWyrobow, Ubytki, KodCN, WartoscOpalowaWGJ, StawkaPodatku, KwotaPodatku, StawkaSpozaISZTAR, WartoscStawkiSpozaISZTAR, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.NazwaGrupyWyrobow, src.Ubytki, src.KodCN, src.WartoscOpalowaWGJ, src.StawkaPodatku, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END

--GHD1_Gry
IF @TableName = 'GHD1_Gry' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.GHD1_Gry WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.GHD1_Gry)
 MERGE INTO zef2DP.GHD1_Gry AS tgt
USING WA_StageHurtownia.zef2DP.GHD1_Gry AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.TypGry=src.TypGry, tgt.RodzajGry=src.RodzajGry, tgt.PodstawaDoplaty=src.PodstawaDoplaty, tgt.StawkaDoplaty=src.StawkaDoplaty, tgt.KwotaWyliczonejDoplaty=src.KwotaWyliczonejDoplaty, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, TypGry, RodzajGry, PodstawaDoplaty, StawkaDoplaty, KwotaWyliczonejDoplaty, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.TypGry, src.RodzajGry, src.PodstawaDoplaty, src.StawkaDoplaty, src.KwotaWyliczonejDoplaty, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END

--GHD1_Informacja
IF @TableName = 'GHD1_Informacja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.GHD1_Informacja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.GHD1_Informacja)
 MERGE INTO zef2DP.GHD1_Informacja AS tgt
USING WA_StageHurtownia.zef2DP.GHD1_Informacja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NadplataWplatDzienDoRozlicz]=src.[NadplataWplatDzienDoRozlicz],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DoZaplaty]=src.[DoZaplaty],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[WplatyDoplat]=src.[WplatyDoplat],
tgt.[KwotaPotraconegoWynagrodzenia]=src.[KwotaPotraconegoWynagrodzenia],
tgt.[RazemKwotaDoplat]=src.[RazemKwotaDoplat],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[NadplataWplatDzienPoprzedInform]=src.[NadplataWplatDzienPoprzedInform]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [DeklaracjaZaOkres], [NadplataWplatDzienDoRozlicz], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [CzyOstatniaWersjaDeklaracji], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [WplatyDoplat], [KwotaPotraconegoWynagrodzenia], [RazemKwotaDoplat], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [NadplataWplatDzienPoprzedInform] )
VALUES ([DataDoWniesieniaSprzeciwu], [DeklaracjaZaOkres], [NadplataWplatDzienDoRozlicz], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [CzyOstatniaWersjaDeklaracji], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [WplatyDoplat], [KwotaPotraconegoWynagrodzenia], [RazemKwotaDoplat], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [NadplataWplatDzienPoprzedInform] );
SET @Merged = 1;
 END

--INF_Informacja_A
IF @TableName = 'INF_Informacja_A' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.INF_Informacja_A WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.INF_Informacja_A)
 MERGE INTO zef2DP.INF_Informacja_A AS tgt
USING WA_StageHurtownia.zef2DP.INF_Informacja_A AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[IloscWyrobZeSkladPozaProcedZawiesz]=src.[IloscWyrobZeSkladPozaProcedZawiesz],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[ZapasPoczatkowy]=src.[ZapasPoczatkowy],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[NumerAkcyzowySkladu]=src.[NumerAkcyzowySkladu],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[UbytkiCalkowZniszcz]=src.[UbytkiCalkowZniszcz],
tgt.[ZapasKoncowy]=src.[ZapasKoncowy],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[KwotaOdpowZapasPoczatk]=src.[KwotaOdpowZapasPoczatk],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[NumerAkcyzowySkladuPodatnika]=src.[NumerAkcyzowySkladuPodatnika],
tgt.[AdresSkladu]=src.[AdresSkladu],
tgt.[IloscWyrobZeSkladWprocedZawiesz]=src.[IloscWyrobZeSkladWprocedZawiesz],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[IloscWyrobZeSklad]=src.[IloscWyrobZeSklad],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[IloscWyrobZuzytychDoProd]=src.[IloscWyrobZuzytychDoProd],
tgt.[IloscWyrobPrzyjetaNaSklad]=src.[IloscWyrobPrzyjetaNaSklad],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[KwotaOdpowZapasKoncow]=src.[KwotaOdpowZapasKoncow],
tgt.[IloscWyprodukWyrobAkc]=src.[IloscWyprodukWyrobAkc],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [IloscWyrobZeSkladPozaProcedZawiesz], [NazwiskoPelnomocnika], [DataWplywuDok], [ZapasPoczatkowy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [UbytkiCalkowZniszcz], [ZapasKoncowy], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [AdresSkladu], [IloscWyrobZeSkladWprocedZawiesz], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [IloscWyrobZeSklad], [UrzadCelny], [IloscWyrobZuzytychDoProd], [IloscWyrobPrzyjetaNaSklad],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyprodukWyrobAkc], [SystemZrodlowy] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [IloscWyrobZeSkladPozaProcedZawiesz], [NazwiskoPelnomocnika], [DataWplywuDok], [ZapasPoczatkowy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [UbytkiCalkowZniszcz], [ZapasKoncowy], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [AdresSkladu], [IloscWyrobZeSkladWprocedZawiesz], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [IloscWyrobZeSklad], [UrzadCelny], [IloscWyrobZuzytychDoProd], [IloscWyrobPrzyjetaNaSklad],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyprodukWyrobAkc], [SystemZrodlowy] );
SET @Merged = 1;
 END

--INF_Informacja_B
IF @TableName = 'INF_Informacja_B' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.INF_Informacja_B WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.INF_Informacja_B)
 MERGE INTO zef2DP.INF_Informacja_B AS tgt
USING WA_StageHurtownia.zef2DP.INF_Informacja_B AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[IloscWyrobZeSkladPozaProcedZawiesz]=src.[IloscWyrobZeSkladPozaProcedZawiesz],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[ZapasPoczatkowy]=src.[ZapasPoczatkowy],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[NumerAkcyzowySkladu]=src.[NumerAkcyzowySkladu],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[UbytkiCalkowZniszcz]=src.[UbytkiCalkowZniszcz],
tgt.[ZapasKoncowy]=src.[ZapasKoncowy],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[KwotaOdpowZapasPoczatk]=src.[KwotaOdpowZapasPoczatk],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[NumerAkcyzowySkladuPodatnika]=src.[NumerAkcyzowySkladuPodatnika],
tgt.[AdresSkladu]=src.[AdresSkladu],
tgt.[IloscWyrobZeSkladWprocedZawiesz]=src.[IloscWyrobZeSkladWprocedZawiesz],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[IloscWyrobZeSklad]=src.[IloscWyrobZeSklad],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[IloscWyrobZuzytychDoProd]=src.[IloscWyrobZuzytychDoProd],
tgt.[IloscWyrobPrzyjetaNaSklad]=src.[IloscWyrobPrzyjetaNaSklad],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[KwotaOdpowZapasKoncow]=src.[KwotaOdpowZapasKoncow],
tgt.[IloscWyprodukWyrobAkc]=src.[IloscWyprodukWyrobAkc],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy],
tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [IloscWyrobZeSkladPozaProcedZawiesz], [NazwiskoPelnomocnika], [DataWplywuDok], [ZapasPoczatkowy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [UbytkiCalkowZniszcz], [ZapasKoncowy], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [AdresSkladu], [IloscWyrobZeSkladWprocedZawiesz], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [IloscWyrobZeSklad], [UrzadCelny], [IloscWyrobZuzytychDoProd], [IloscWyrobPrzyjetaNaSklad],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyprodukWyrobAkc], [SystemZrodlowy], [DeklaracjaZaOkres] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [IloscWyrobZeSkladPozaProcedZawiesz], [NazwiskoPelnomocnika], [DataWplywuDok], [ZapasPoczatkowy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [UbytkiCalkowZniszcz], [ZapasKoncowy], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [AdresSkladu], [IloscWyrobZeSkladWprocedZawiesz], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [IloscWyrobZeSklad], [UrzadCelny], [IloscWyrobZuzytychDoProd], [IloscWyrobPrzyjetaNaSklad],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyprodukWyrobAkc], [SystemZrodlowy], [DeklaracjaZaOkres] );
SET @Merged = 1;
 END
 

--INF_Informacja_C
IF @TableName = 'INF_Informacja_C' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.INF_Informacja_C WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.INF_Informacja_C)
 MERGE INTO zef2DP.INF_Informacja_C AS tgt
USING WA_StageHurtownia.zef2DP.INF_Informacja_C AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[IloscWyrobZeSkladPozaProcedZawiesz]=src.[IloscWyrobZeSkladPozaProcedZawiesz],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[ZapasPoczatkowy]=src.[ZapasPoczatkowy],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[NumerAkcyzowySkladu]=src.[NumerAkcyzowySkladu],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[UbytkiCalkowZniszcz]=src.[UbytkiCalkowZniszcz],
tgt.[ZapasKoncowy]=src.[ZapasKoncowy],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[KwotaOdpowZapasPoczatk]=src.[KwotaOdpowZapasPoczatk],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[NumerAkcyzowySkladuPodatnika]=src.[NumerAkcyzowySkladuPodatnika],
tgt.[AdresSkladu]=src.[AdresSkladu],
tgt.[IloscWyrobZeSkladWprocedZawiesz]=src.[IloscWyrobZeSkladWprocedZawiesz],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[IloscWyrobZeSklad]=src.[IloscWyrobZeSklad],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[IloscWyrobZuzytychDoProd]=src.[IloscWyrobZuzytychDoProd],
tgt.[IloscWyrobPrzyjetaNaSklad]=src.[IloscWyrobPrzyjetaNaSklad],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[KwotaOdpowZapasKoncow]=src.[KwotaOdpowZapasKoncow],
tgt.[IloscWyprodukWyrobAkc]=src.[IloscWyprodukWyrobAkc],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [IloscWyrobZeSkladPozaProcedZawiesz], [NazwiskoPelnomocnika], [DataWplywuDok], [ZapasPoczatkowy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [UbytkiCalkowZniszcz], [ZapasKoncowy], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [AdresSkladu], [IloscWyrobZeSkladWprocedZawiesz], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [IloscWyrobZeSklad], [UrzadCelny], [IloscWyrobZuzytychDoProd], [IloscWyrobPrzyjetaNaSklad],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyprodukWyrobAkc], [SystemZrodlowy] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [IloscWyrobZeSkladPozaProcedZawiesz], [NazwiskoPelnomocnika], [DataWplywuDok], [ZapasPoczatkowy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [UbytkiCalkowZniszcz], [ZapasKoncowy], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [AdresSkladu], [IloscWyrobZeSkladWprocedZawiesz], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [IloscWyrobZeSklad], [UrzadCelny], [IloscWyrobZuzytychDoProd], [IloscWyrobPrzyjetaNaSklad],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyprodukWyrobAkc], [SystemZrodlowy] );
SET @Merged = 1;
 END

--INF_Informacja_D
IF @TableName = 'INF_Informacja_D' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.INF_Informacja_D WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.INF_Informacja_D)
 MERGE INTO zef2DP.INF_Informacja_D AS tgt
USING WA_StageHurtownia.zef2DP.INF_Informacja_D AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[IloscWyrobZeSkladPozaProcedZawiesz]=src.[IloscWyrobZeSkladPozaProcedZawiesz],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[ZapasPoczatkowy]=src.[ZapasPoczatkowy],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[NumerAkcyzowySkladu]=src.[NumerAkcyzowySkladu],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[UbytkiCalkowZniszcz]=src.[UbytkiCalkowZniszcz],
tgt.[ZapasKoncowy]=src.[ZapasKoncowy],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[KwotaOdpowZapasPoczatk]=src.[KwotaOdpowZapasPoczatk],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[NumerAkcyzowySkladuPodatnika]=src.[NumerAkcyzowySkladuPodatnika],
tgt.[AdresSkladu]=src.[AdresSkladu],
tgt.[IloscWyrobZeSkladWprocedZawiesz]=src.[IloscWyrobZeSkladWprocedZawiesz],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[IloscWyrobZeSklad]=src.[IloscWyrobZeSklad],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[IloscWyrobZuzytychDoProd]=src.[IloscWyrobZuzytychDoProd],
tgt.[IloscWyrobPrzyjetaNaSklad]=src.[IloscWyrobPrzyjetaNaSklad],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[KwotaOdpowZapasKoncow]=src.[KwotaOdpowZapasKoncow],
tgt.[IloscWyprodukWyrobAkc]=src.[IloscWyprodukWyrobAkc],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [IloscWyrobZeSkladPozaProcedZawiesz], [NazwiskoPelnomocnika], [DataWplywuDok], [ZapasPoczatkowy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [UbytkiCalkowZniszcz], [ZapasKoncowy], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [AdresSkladu], [IloscWyrobZeSkladWprocedZawiesz], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [IloscWyrobZeSklad], [UrzadCelny], [IloscWyrobZuzytychDoProd], [IloscWyrobPrzyjetaNaSklad],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyprodukWyrobAkc], [SystemZrodlowy] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [IloscWyrobZeSkladPozaProcedZawiesz], [NazwiskoPelnomocnika], [DataWplywuDok], [ZapasPoczatkowy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [UbytkiCalkowZniszcz], [ZapasKoncowy], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [AdresSkladu], [IloscWyrobZeSkladWprocedZawiesz], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [IloscWyrobZeSklad], [UrzadCelny], [IloscWyrobZuzytychDoProd], [IloscWyrobPrzyjetaNaSklad],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyprodukWyrobAkc], [SystemZrodlowy] );
SET @Merged = 1;
 END

--INF_Informacja_F
IF @TableName = 'INF_Informacja_F' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.INF_Informacja_F WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.INF_Informacja_F)
 MERGE INTO zef2DP.INF_Informacja_F AS tgt
USING WA_StageHurtownia.zef2DP.INF_Informacja_F AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[UbytkiCalkowZniszczTytonKg]=src.[UbytkiCalkowZniszczTytonKg],
tgt.[IloscWyrobPrzyjetaNaSkladCygaraSzt]=src.[IloscWyrobPrzyjetaNaSkladCygaraSzt],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[IloscWyrobZeSkladPozaProcedZawieszTytonKg]=src.[IloscWyrobZeSkladPozaProcedZawieszTytonKg],
tgt.[ZapasKoncowyPapierosySzt]=src.[ZapasKoncowyPapierosySzt],
tgt.[IloscWyrobZeSkladCygaraSzt]=src.[IloscWyrobZeSkladCygaraSzt],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[ZapasPoczatCygaraSzt]=src.[ZapasPoczatCygaraSzt],
tgt.[KwotaOdpowZapasKoncowTyton]=src.[KwotaOdpowZapasKoncowTyton],
tgt.[DataArch]=src.[DataArch],
tgt.[KwotaOdpowZapasPoczatkPapierosy]=src.[KwotaOdpowZapasPoczatkPapierosy],
tgt.[AdresSkladu]=src.[AdresSkladu],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[KwotaOdpowZapasPoczatkTyton]=src.[KwotaOdpowZapasPoczatkTyton],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[IloscWyprodukWyrobAkcCygaraSzt]=src.[IloscWyprodukWyrobAkcCygaraSzt],
tgt.[IloscWyrobZeSkladWprocedZawieszPapierosySzt]=src.[IloscWyrobZeSkladWprocedZawieszPapierosySzt],
tgt.[ZapasPoczatkowyPapierosySzt]=src.[ZapasPoczatkowyPapierosySzt],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy],
tgt.[IloscWyrobZeSkladPozaProcedZawieszCygaraSzt]=src.[IloscWyrobZeSkladPozaProcedZawieszCygaraSzt],
tgt.[UbytkiCalkowZniszczCygaraSzt]=src.[UbytkiCalkowZniszczCygaraSzt],
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[IloscWyprodukWyrobAkcTytonKg]=src.[IloscWyprodukWyrobAkcTytonKg],
tgt.[IloscWyrobZeSkladWprocedZawieszTytonKg]=src.[IloscWyrobZeSkladWprocedZawieszTytonKg],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[IloscWyrobZeSkladPozaProcedZawieszPapierosySzt]=src.[IloscWyrobZeSkladPozaProcedZawieszPapierosySzt],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[IloscWyprodukWyrobAkcPapierosySzt]=src.[IloscWyprodukWyrobAkcPapierosySzt],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[KwotaOdpowZapasKoncowCygara]=src.[KwotaOdpowZapasKoncowCygara],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[NumerAkcyzowySkladu]=src.[NumerAkcyzowySkladu],
tgt.[UbytkiCalkowZniszczPapierosySzt]=src.[UbytkiCalkowZniszczPapierosySzt],
tgt.[ZapasKoncowyTytonKg]=src.[ZapasKoncowyTytonKg],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[IloscWyrobZeSkladPapierosySzt]=src.[IloscWyrobZeSkladPapierosySzt],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[NumerAkcyzowySkladuPodatnika]=src.[NumerAkcyzowySkladuPodatnika],
tgt.[KwotaOdpowZapasKoncowPapierosy]=src.[KwotaOdpowZapasKoncowPapierosy],
tgt.[ZapasPoczatTytonKg]=src.[ZapasPoczatTytonKg],
tgt.[IloscWyrobPrzyjetaNaSkladTytonKg]=src.[IloscWyrobPrzyjetaNaSkladTytonKg],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[IloscWyrobPrzyjetaNaSkladPapierosySzt]=src.[IloscWyrobPrzyjetaNaSkladPapierosySzt],
tgt.[IloscWyrobZeSkladWprocedZawieszCygaraSzt]=src.[IloscWyrobZeSkladWprocedZawieszCygaraSzt],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[IloscWyrobZeSkladTytonKg]=src.[IloscWyrobZeSkladTytonKg],
tgt.[ZapasKoncowyCygaraSzt]=src.[ZapasKoncowyCygaraSzt],
tgt.[KwotaOdpowZapasPoczatkCygara]=src.[KwotaOdpowZapasPoczatkCygara]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [UbytkiCalkowZniszczTytonKg], [IloscWyrobPrzyjetaNaSkladCygaraSzt], [NazwiskoPelnomocnika], [IloscWyrobZeSkladPozaProcedZawieszTytonKg], [ZapasKoncowyPapierosySzt], [IloscWyrobZeSkladCygaraSzt], [CzyZweryfikowany], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [ZapasPoczatCygaraSzt], [KwotaOdpowZapasKoncowTyton], [DataArch], [KwotaOdpowZapasPoczatkPapierosy], [AdresSkladu], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [KwotaOdpowZapasPoczatkTyton], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [IloscWyprodukWyrobAkcCygaraSzt], [IloscWyrobZeSkladWprocedZawieszPapierosySzt], [ZapasPoczatkowyPapierosySzt], [SystemZrodlowy], [IloscWyrobZeSkladPozaProcedZawieszCygaraSzt], [UbytkiCalkowZniszczCygaraSzt], [DataDoWniesieniaSprzeciwu], [IloscWyprodukWyrobAkcTytonKg], [IloscWyrobZeSkladWprocedZawieszTytonKg], [NumerDokumentuPierwotnego], [IloscWyrobZeSkladPozaProcedZawieszPapierosySzt], [ID_Pismo_xml], [IloscWyprodukWyrobAkcPapierosySzt], [DataWplywuDok], [KwotaOdpowZapasKoncowCygara], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [UbytkiCalkowZniszczPapierosySzt], [ZapasKoncowyTytonKg], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [NIPLubPESELPodatnika], [IloscWyrobZeSkladPapierosySzt], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [KwotaOdpowZapasKoncowPapierosy], [ZapasPoczatTytonKg], [IloscWyrobPrzyjetaNaSkladTytonKg], [ImiePelnomocnika], [IloscWyrobPrzyjetaNaSkladPapierosySzt], [IloscWyrobZeSkladWprocedZawieszCygaraSzt], [TelefonPodatnikaLubPelnomocnika], [IloscWyrobZeSkladTytonKg], [ZapasKoncowyCygaraSzt], [KwotaOdpowZapasPoczatkCygara] )
VALUES ([SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [UbytkiCalkowZniszczTytonKg], [IloscWyrobPrzyjetaNaSkladCygaraSzt], [NazwiskoPelnomocnika], [IloscWyrobZeSkladPozaProcedZawieszTytonKg], [ZapasKoncowyPapierosySzt], [IloscWyrobZeSkladCygaraSzt], [CzyZweryfikowany], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [ZapasPoczatCygaraSzt], [KwotaOdpowZapasKoncowTyton], [DataArch], [KwotaOdpowZapasPoczatkPapierosy], [AdresSkladu], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [KwotaOdpowZapasPoczatkTyton], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [IloscWyprodukWyrobAkcCygaraSzt], [IloscWyrobZeSkladWprocedZawieszPapierosySzt], [ZapasPoczatkowyPapierosySzt], [SystemZrodlowy], [IloscWyrobZeSkladPozaProcedZawieszCygaraSzt], [UbytkiCalkowZniszczCygaraSzt], [DataDoWniesieniaSprzeciwu], [IloscWyprodukWyrobAkcTytonKg], [IloscWyrobZeSkladWprocedZawieszTytonKg], [NumerDokumentuPierwotnego], [IloscWyrobZeSkladPozaProcedZawieszPapierosySzt], [ID_Pismo_xml], [IloscWyprodukWyrobAkcPapierosySzt], [DataWplywuDok], [KwotaOdpowZapasKoncowCygara], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [UbytkiCalkowZniszczPapierosySzt], [ZapasKoncowyTytonKg], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [NIPLubPESELPodatnika], [IloscWyrobZeSkladPapierosySzt], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [KwotaOdpowZapasKoncowPapierosy], [ZapasPoczatTytonKg], [IloscWyrobPrzyjetaNaSkladTytonKg], [ImiePelnomocnika], [IloscWyrobPrzyjetaNaSkladPapierosySzt], [IloscWyrobZeSkladWprocedZawieszCygaraSzt], [TelefonPodatnikaLubPelnomocnika], [IloscWyrobZeSkladTytonKg], [ZapasKoncowyCygaraSzt], [KwotaOdpowZapasPoczatkCygara] );
SET @Merged = 1;
 END

--INF_Informacja_I
IF @TableName = 'INF_Informacja_I' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.INF_Informacja_I WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.INF_Informacja_I)
 MERGE INTO zef2DP.INF_Informacja_I AS tgt
USING WA_StageHurtownia.zef2DP.INF_Informacja_I AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[IloscWyrobZuzytychDoProdGJ]=src.[IloscWyrobZuzytychDoProdGJ],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[ZapasPoczatkowyTysL]=src.[ZapasPoczatkowyTysL],
tgt.[IloscWyprodukWyrobAkcGJ]=src.[IloscWyprodukWyrobAkcGJ],
tgt.[IloscWyrobZeSkladWprocedZawieszTysL]=src.[IloscWyrobZeSkladWprocedZawieszTysL],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[UbytkiCalkowZniszczTysL]=src.[UbytkiCalkowZniszczTysL],
tgt.[DataArch]=src.[DataArch],
tgt.[AdresSkladu]=src.[AdresSkladu],
tgt.[ZapasKoncowyTysKg]=src.[ZapasKoncowyTysKg],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[ZapasKoncowyGJ]=src.[ZapasKoncowyGJ],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[IloscWyrobZeSkladWprocedZawieszGJ]=src.[IloscWyrobZeSkladWprocedZawieszGJ],
tgt.[IloscWyrobZuzytychDoProdTysL]=src.[IloscWyrobZuzytychDoProdTysL],
tgt.[IloscWyrobPrzyjetaNaSkladTysL]=src.[IloscWyrobPrzyjetaNaSkladTysL],
tgt.[IloscWyrobPrzyjetaNaSkladTysKg]=src.[IloscWyrobPrzyjetaNaSkladTysKg],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[ZapasKoncowyTysL]=src.[ZapasKoncowyTysL],
tgt.[IloscWyrobZeSkladPozaProcedZawieszTysKg]=src.[IloscWyrobZeSkladPozaProcedZawieszTysKg],
tgt.[ZapasPoczatkowyGJ]=src.[ZapasPoczatkowyGJ],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy],
tgt.[IloscWyrobZeSkladWprocedZawieszTysKg]=src.[IloscWyrobZeSkladWprocedZawieszTysKg],
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[IloscWyprodukWyrobAkcTysL]=src.[IloscWyprodukWyrobAkcTysL],
tgt.[UbytkiCalkowZniszczTysKg]=src.[UbytkiCalkowZniszczTysKg],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[IloscWyrobPrzyjetaNaSkladGJ]=src.[IloscWyrobPrzyjetaNaSkladGJ],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[NumerAkcyzowySkladu]=src.[NumerAkcyzowySkladu],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[KwotaOdpowZapasPoczatk]=src.[KwotaOdpowZapasPoczatk],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[IloscWyrobZeSkladTysL]=src.[IloscWyrobZeSkladTysL],
tgt.[NumerAkcyzowySkladuPodatnika]=src.[NumerAkcyzowySkladuPodatnika],
tgt.[IloscWyrobZuzytychDoProdTysKg]=src.[IloscWyrobZuzytychDoProdTysKg],
tgt.[UbytkiCalkowZniszczGJ]=src.[UbytkiCalkowZniszczGJ],
tgt.[IloscWyrobZeSkladTysKg]=src.[IloscWyrobZeSkladTysKg],
tgt.[IloscWyrobZeSkladPozaProcedZawieszTysL]=src.[IloscWyrobZeSkladPozaProcedZawieszTysL],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[ZapasPoczatkowyTysKg]=src.[ZapasPoczatkowyTysKg],
tgt.[IloscWyprodukWyrobAkcTysKg]=src.[IloscWyprodukWyrobAkcTysKg],
tgt.[IloscWyrobZeSkladPozaProcedZawieszGJ]=src.[IloscWyrobZeSkladPozaProcedZawieszGJ],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[KwotaOdpowZapasKoncow]=src.[KwotaOdpowZapasKoncow],
tgt.[IloscWyrobZeSkladGJ]=src.[IloscWyrobZeSkladGJ]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [IloscWyrobZuzytychDoProdGJ], [NazwiskoPelnomocnika], [ZapasPoczatkowyTysL], [IloscWyprodukWyrobAkcGJ], [IloscWyrobZeSkladWprocedZawieszTysL], [CzyZweryfikowany], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [UbytkiCalkowZniszczTysL], [DataArch], [AdresSkladu], [ZapasKoncowyTysKg], [UwagiUrzeduCelnego], [ZapasKoncowyGJ], [DeklaracjaCzyKorekta], [IloscWyrobZeSkladWprocedZawieszGJ], [IloscWyrobZuzytychDoProdTysL], [IloscWyrobPrzyjetaNaSkladTysL], [IloscWyrobPrzyjetaNaSkladTysKg], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [ZapasKoncowyTysL], [IloscWyrobZeSkladPozaProcedZawieszTysKg], [ZapasPoczatkowyGJ], [SystemZrodlowy], [IloscWyrobZeSkladWprocedZawieszTysKg], [DataDoWniesieniaSprzeciwu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [IloscWyprodukWyrobAkcTysL], [UbytkiCalkowZniszczTysKg], [DataWplywuDok], [IloscWyrobPrzyjetaNaSkladGJ], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [NIPLubPESELPodatnika], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [IloscWyrobZeSkladTysL], [NumerAkcyzowySkladuPodatnika], [IloscWyrobZuzytychDoProdTysKg], [UbytkiCalkowZniszczGJ], [IloscWyrobZeSkladTysKg], [IloscWyrobZeSkladPozaProcedZawieszTysL], [ImiePelnomocnika], [ZapasPoczatkowyTysKg], [IloscWyprodukWyrobAkcTysKg], [IloscWyrobZeSkladPozaProcedZawieszGJ], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyrobZeSkladGJ] )
VALUES ([SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [IloscWyrobZuzytychDoProdGJ], [NazwiskoPelnomocnika], [ZapasPoczatkowyTysL], [IloscWyprodukWyrobAkcGJ], [IloscWyrobZeSkladWprocedZawieszTysL], [CzyZweryfikowany], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [UbytkiCalkowZniszczTysL], [DataArch], [AdresSkladu], [ZapasKoncowyTysKg], [UwagiUrzeduCelnego], [ZapasKoncowyGJ], [DeklaracjaCzyKorekta], [IloscWyrobZeSkladWprocedZawieszGJ], [IloscWyrobZuzytychDoProdTysL], [IloscWyrobPrzyjetaNaSkladTysL], [IloscWyrobPrzyjetaNaSkladTysKg], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [ZapasKoncowyTysL], [IloscWyrobZeSkladPozaProcedZawieszTysKg], [ZapasPoczatkowyGJ], [SystemZrodlowy], [IloscWyrobZeSkladWprocedZawieszTysKg], [DataDoWniesieniaSprzeciwu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [IloscWyprodukWyrobAkcTysL], [UbytkiCalkowZniszczTysKg], [DataWplywuDok], [IloscWyrobPrzyjetaNaSkladGJ], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [NIPLubPESELPodatnika], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [IloscWyrobZeSkladTysL], [NumerAkcyzowySkladuPodatnika], [IloscWyrobZuzytychDoProdTysKg], [UbytkiCalkowZniszczGJ], [IloscWyrobZeSkladTysKg], [IloscWyrobZeSkladPozaProcedZawieszTysL], [ImiePelnomocnika], [ZapasPoczatkowyTysKg], [IloscWyprodukWyrobAkcTysKg], [IloscWyrobZeSkladPozaProcedZawieszGJ], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyrobZeSkladGJ] );
SET @Merged = 1;
END

--INF_Informacja_J
IF @TableName = 'INF_Informacja_J' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.INF_Informacja_J WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.INF_Informacja_J)
 MERGE INTO zef2DP.INF_Informacja_J AS tgt
USING WA_StageHurtownia.zef2DP.INF_Informacja_J AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[IloscWyrobZuzytychDoProdGJ]=src.[IloscWyrobZuzytychDoProdGJ],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[IloscWyprodukWyrobAkcGJ]=src.[IloscWyprodukWyrobAkcGJ],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[DataArch]=src.[DataArch],
tgt.[AdresSkladu]=src.[AdresSkladu],
tgt.[ZapasKoncowyTysKg]=src.[ZapasKoncowyTysKg],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[ZapasKoncowyGJ]=src.[ZapasKoncowyGJ],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[IloscWyrobZeSkladWprocedZawieszGJ]=src.[IloscWyrobZeSkladWprocedZawieszGJ],
tgt.[IloscWyrobPrzyjetaNaSkladTysKg]=src.[IloscWyrobPrzyjetaNaSkladTysKg],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[IloscWyrobZeSkladPozaProcedZawieszTysKg]=src.[IloscWyrobZeSkladPozaProcedZawieszTysKg],
tgt.[ZapasPoczatkowyGJ]=src.[ZapasPoczatkowyGJ],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy],
tgt.[IloscWyrobZeSkladWprocedZawieszTysKg]=src.[IloscWyrobZeSkladWprocedZawieszTysKg],
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[UbytkiCalkowZniszczTysKg]=src.[UbytkiCalkowZniszczTysKg],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[IloscWyrobPrzyjetaNaSkladGJ]=src.[IloscWyrobPrzyjetaNaSkladGJ],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[NumerAkcyzowySkladu]=src.[NumerAkcyzowySkladu],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[KwotaOdpowZapasPoczatk]=src.[KwotaOdpowZapasPoczatk],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[NumerAkcyzowySkladuPodatnika]=src.[NumerAkcyzowySkladuPodatnika],
tgt.[IloscWyrobZuzytychDoProdTysKg]=src.[IloscWyrobZuzytychDoProdTysKg],
tgt.[UbytkiCalkowZniszczGJ]=src.[UbytkiCalkowZniszczGJ],
tgt.[IloscWyrobZeSkladTysKg]=src.[IloscWyrobZeSkladTysKg],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[ZapasPoczatkowyTysKg]=src.[ZapasPoczatkowyTysKg],
tgt.[IloscWyprodukWyrobAkcTysKg]=src.[IloscWyprodukWyrobAkcTysKg],
tgt.[IloscWyrobZeSkladPozaProcedZawieszGJ]=src.[IloscWyrobZeSkladPozaProcedZawieszGJ],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[KwotaOdpowZapasKoncow]=src.[KwotaOdpowZapasKoncow],
tgt.[IloscWyrobZeSkladGJ]=src.[IloscWyrobZeSkladGJ]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [IloscWyrobZuzytychDoProdGJ], [NazwiskoPelnomocnika], [IloscWyprodukWyrobAkcGJ], [CzyZweryfikowany], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [DataArch], [AdresSkladu], [ZapasKoncowyTysKg], [UwagiUrzeduCelnego], [ZapasKoncowyGJ], [DeklaracjaCzyKorekta], [IloscWyrobZeSkladWprocedZawieszGJ], [IloscWyrobPrzyjetaNaSkladTysKg], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [IloscWyrobZeSkladPozaProcedZawieszTysKg], [ZapasPoczatkowyGJ], [SystemZrodlowy], [IloscWyrobZeSkladWprocedZawieszTysKg], [DataDoWniesieniaSprzeciwu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [UbytkiCalkowZniszczTysKg], [DataWplywuDok], [IloscWyrobPrzyjetaNaSkladGJ], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [NIPLubPESELPodatnika], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [IloscWyrobZuzytychDoProdTysKg], [UbytkiCalkowZniszczGJ], [IloscWyrobZeSkladTysKg], [ImiePelnomocnika], [ZapasPoczatkowyTysKg], [IloscWyprodukWyrobAkcTysKg], [IloscWyrobZeSkladPozaProcedZawieszGJ], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyrobZeSkladGJ] )
VALUES ([SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [IloscWyrobZuzytychDoProdGJ], [NazwiskoPelnomocnika], [IloscWyprodukWyrobAkcGJ], [CzyZweryfikowany], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [DataArch], [AdresSkladu], [ZapasKoncowyTysKg], [UwagiUrzeduCelnego], [ZapasKoncowyGJ], [DeklaracjaCzyKorekta], [IloscWyrobZeSkladWprocedZawieszGJ], [IloscWyrobPrzyjetaNaSkladTysKg], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [IloscWyrobZeSkladPozaProcedZawieszTysKg], [ZapasPoczatkowyGJ], [SystemZrodlowy], [IloscWyrobZeSkladWprocedZawieszTysKg], [DataDoWniesieniaSprzeciwu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [UbytkiCalkowZniszczTysKg], [DataWplywuDok], [IloscWyrobPrzyjetaNaSkladGJ], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [NIPLubPESELPodatnika], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [IloscWyrobZuzytychDoProdTysKg], [UbytkiCalkowZniszczGJ], [IloscWyrobZeSkladTysKg], [ImiePelnomocnika], [ZapasPoczatkowyTysKg], [IloscWyprodukWyrobAkcTysKg], [IloscWyrobZeSkladPozaProcedZawieszGJ], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyrobZeSkladGJ] );
SET @Merged = 1;
 END

--INF_Informacja_K
IF @TableName = 'INF_Informacja_K' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.INF_Informacja_K WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.INF_Informacja_K)
 MERGE INTO zef2DP.INF_Informacja_K AS tgt
USING WA_StageHurtownia.zef2DP.INF_Informacja_K AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[IloscWyrobZeSkladPozaProcedZawiesz]=src.[IloscWyrobZeSkladPozaProcedZawiesz],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[ZapasPoczatkowy]=src.[ZapasPoczatkowy],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[NumerAkcyzowySkladu]=src.[NumerAkcyzowySkladu],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[UbytkiCalkowZniszcz]=src.[UbytkiCalkowZniszcz],
tgt.[ZapasKoncowy]=src.[ZapasKoncowy],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[NumerPodatnika]=src.[NumerPodatnika],
tgt.[KwotaOdpowZapasPoczatk]=src.[KwotaOdpowZapasPoczatk],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[NumerAkcyzowySkladuPodatnika]=src.[NumerAkcyzowySkladuPodatnika],
tgt.[AdresSkladu]=src.[AdresSkladu],
tgt.[IloscWyrobZeSkladWprocedZawiesz]=src.[IloscWyrobZeSkladWprocedZawiesz],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[NIPPodatnika]=src.[NIPPodatnika],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[IloscWyrobZeSklad]=src.[IloscWyrobZeSklad],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[IloscWyrobZuzytychDoProd]=src.[IloscWyrobZuzytychDoProd],
tgt.[IloscWyrobPrzyjetaNaSklad]=src.[IloscWyrobPrzyjetaNaSklad],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[KwotaOdpowZapasKoncow]=src.[KwotaOdpowZapasKoncow],
tgt.[IloscWyprodukWyrobAkc]=src.[IloscWyprodukWyrobAkc],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [IloscWyrobZeSkladPozaProcedZawiesz], [NazwiskoPelnomocnika], [CzyZweryfikowany], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [UbytkiCalkowZniszcz], [DataArch], [AdresSkladu], [UwagiUrzeduCelnego], [NIPPodatnika], [DeklaracjaCzyKorekta], [UrzadCelny], [IloscWyrobZuzytychDoProd], [IloscWyrobPrzyjetaNaSklad],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [SystemZrodlowy], [DataDoWniesieniaSprzeciwu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [DataWplywuDok], [ZapasPoczatkowy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [ZapasKoncowy], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [NumerPodatnika], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [IloscWyrobZeSkladWprocedZawiesz], [ImiePelnomocnika], [IloscWyrobZeSklad], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyprodukWyrobAkc] )
VALUES ([SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [IloscWyrobZeSkladPozaProcedZawiesz], [NazwiskoPelnomocnika], [CzyZweryfikowany], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [UbytkiCalkowZniszcz], [DataArch], [AdresSkladu], [UwagiUrzeduCelnego], [NIPPodatnika], [DeklaracjaCzyKorekta], [UrzadCelny], [IloscWyrobZuzytychDoProd], [IloscWyrobPrzyjetaNaSklad],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [SystemZrodlowy], [DataDoWniesieniaSprzeciwu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [DataWplywuDok], [ZapasPoczatkowy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [NumerAkcyzowySkladu], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [ZapasKoncowy], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [NumerPodatnika], [KwotaOdpowZapasPoczatk], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [NumerAkcyzowySkladuPodatnika], [IloscWyrobZeSkladWprocedZawiesz], [ImiePelnomocnika], [IloscWyrobZeSklad], [TelefonPodatnikaLubPelnomocnika], [KwotaOdpowZapasKoncow], [IloscWyprodukWyrobAkc] );
SET @Merged = 1;
END

--OplataPaliwowa
IF @TableName = 'OplataPaliwowa' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.OplataPaliwowa WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.OplataPaliwowa)
 MERGE INTO zef2DP.OplataPaliwowa AS tgt
USING WA_StageHurtownia.zef2DP.OplataPaliwowa AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[NumerZabezpieczeniaJednorazowego]=src.[NumerZabezpieczeniaJednorazowego],
tgt.[WynikSprawdzeniaPelnomocnictwa]=src.[WynikSprawdzeniaPelnomocnictwa],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[PrzewidywanaDataDostawy]=src.[PrzewidywanaDataDostawy],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[PowiazanySADLubDPDZ]=src.[PowiazanySADLubDPDZ],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[NumerZabezpieczeniaGeneralnego]=src.[NumerZabezpieczeniaGeneralnego],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[NIPPodatnika]=src.[NIPPodatnika],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[RodzajDzialalnosci]=src.[RodzajDzialalnosci],
tgt.[DeklaracjaZaRok]=src.[DeklaracjaZaRok],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[RazemKwotaOplPaliw]=src.[RazemKwotaOplPaliw],
tgt.[TerminPlatnosci]=src.[TerminPlatnosci],
tgt.[SumaKwotOplatyPaliwowej]=src.[SumaKwotOplatyPaliwowej]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [ID_Pismo_xml], [NumerZabezpieczeniaJednorazowego], [WynikSprawdzeniaPelnomocnictwa], [NazwiskoPelnomocnika], [DataWplywuDok], [PrzewidywanaDataDostawy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [PowiazanySADLubDPDZ], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [Zarachowanie], [DataZlozeniaDok], [NumerZabezpieczeniaGeneralnego], [CzyOstatniaWersjaDeklaracji], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [NIPPodatnika], [ImiePelnomocnika], [UrzadCelny], [RodzajDzialalnosci], [DeklaracjaZaRok],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [RazemKwotaOplPaliw], [TerminPlatnosci], [SumaKwotOplatyPaliwowej] )
VALUES ([SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [ID_Pismo_xml], [NumerZabezpieczeniaJednorazowego], [WynikSprawdzeniaPelnomocnictwa], [NazwiskoPelnomocnika], [DataWplywuDok], [PrzewidywanaDataDostawy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [PowiazanySADLubDPDZ], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [Zarachowanie], [DataZlozeniaDok], [NumerZabezpieczeniaGeneralnego], [CzyOstatniaWersjaDeklaracji], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [NIPPodatnika], [ImiePelnomocnika], [UrzadCelny], [RodzajDzialalnosci], [DeklaracjaZaRok],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [RazemKwotaOplPaliw], [TerminPlatnosci], [SumaKwotOplatyPaliwowej] );
SET @Merged = 1;
 END

--OplataPaliwowa_Towary
IF @TableName = 'OplataPaliwowa_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.OplataPaliwowa_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.OplataPaliwowa_Towary)
 MERGE INTO zef2DP.OplataPaliwowa_Towary AS tgt
USING WA_StageHurtownia.zef2DP.OplataPaliwowa_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.KodCN=src.KodCN, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.JednostkaMiary=src.JednostkaMiary, tgt.IloscWyrobow=src.IloscWyrobow, tgt.StawkaOplPaliw=src.StawkaOplPaliw, tgt.TytulPlatnosci=src.TytulPlatnosci, tgt.KwotaOplPaliw=src.KwotaOplPaliw, tgt.RodzajOplPaliw=src.RodzajOplPaliw, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, KodCN, NazwaGrupyWyrobow, JednostkaMiary, IloscWyrobow, StawkaOplPaliw, TytulPlatnosci, KwotaOplPaliw, RodzajOplPaliw, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.KodCN, src.NazwaGrupyWyrobow, src.JednostkaMiary, src.IloscWyrobow, src.StawkaOplPaliw, src.TytulPlatnosci, src.KwotaOplPaliw, src.RodzajOplPaliw, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END

--PKOP_Deklaracja
IF @TableName = 'PKOP_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.PKOP_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.PKOP_Deklaracja)
 MERGE INTO zef2DP.PKOP_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.PKOP_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[WynikSprawdzeniaPelnomocnictwa]=src.[WynikSprawdzeniaPelnomocnictwa],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DoZaplaty]=src.[DoZaplaty],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[UrzadCelny]=src.[UrzadCelny],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [WynikSprawdzeniaPelnomocnictwa], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [WynikSprawdzeniaPelnomocnictwa], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelny],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] );
SET @Merged = 1;
 END

--PKOP_Towary
IF @TableName = 'PKOP_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.PKOP_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.PKOP_Towary)
 MERGE INTO zef2DP.PKOP_Towary AS tgt
USING WA_StageHurtownia.zef2DP.PKOP_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.PodstawaOpodatkowaniaAg=src.PodstawaOpodatkowaniaAg, tgt.PodstawaOpodatkowaniaCu=src.PodstawaOpodatkowaniaCu, tgt.SredniaCenaAg=src.SredniaCenaAg, tgt.SredniaCenaCu=src.SredniaCenaCu, tgt.StawkaPodatkuAg=src.StawkaPodatkuAg, tgt.StawkaPodatkuCu=src.StawkaPodatkuCu, tgt.KwotaPodatkuAg=src.KwotaPodatkuAg, tgt.KwotaPodatkuCu=src.KwotaPodatkuCu, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, PodstawaOpodatkowaniaAg, PodstawaOpodatkowaniaCu, SredniaCenaAg, SredniaCenaCu, StawkaPodatkuAg, StawkaPodatkuCu, KwotaPodatkuAg, KwotaPodatkuCu, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PodstawaOpodatkowaniaAg, src.PodstawaOpodatkowaniaCu, src.SredniaCenaAg, src.SredniaCenaCu, src.StawkaPodatkuAg, src.StawkaPodatkuCu, src.KwotaPodatkuAg, src.KwotaPodatkuCu, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END


 --POG4_Deklaracja
IF @TableName = 'POG4_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.POG4_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.POG4_Deklaracja)
 MERGE INTO zef2DP.POG4_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.POG4_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[WynikSprawdzeniaPelnomocnictwa]=src.[WynikSprawdzeniaPelnomocnictwa],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[LiczbaZlozonychZalacznikowPOG4A]=src.[LiczbaZlozonychZalacznikowPOG4A],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[NadwyzWplatDoRozliczOstatDeklar]=src.[NadwyzWplatDoRozliczOstatDeklar],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[IdentyfikatorDokumentu]=src.[IdentyfikatorDokumentu],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[KwotaPodatkuPOG4R]=src.[KwotaPodatkuPOG4R],
tgt.[RazemKwotaPodatkuAkc]=src.[RazemKwotaPodatkuAkc],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DoZaplaty]=src.[DoZaplaty],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[UrzadCelnyDoKtoregoAdresowane]=src.[UrzadCelnyDoKtoregoAdresowane],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[KwotaPodatkuPOG4A]=src.[KwotaPodatkuPOG4A],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[UrzadCelnyZlozenia]=src.[UrzadCelnyZlozenia],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[NadwyzWplatDoRozlicz]=src.[NadwyzWplatDoRozlicz],
tgt.[LiczbaZlozonychZalacznikowPOG4R]=src.[LiczbaZlozonychZalacznikowPOG4R],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy],
tgt.[MigracjaReczna]=src.[MigracjaReczna]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [WynikSprawdzeniaPelnomocnictwa], [NazwiskoPelnomocnika], [DataWplywuDok], [LiczbaZlozonychZalacznikowPOG4A], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [NadwyzWplatDoRozliczOstatDeklar], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [KwotaPodatkuPOG4R], [RazemKwotaPodatkuAkc], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [UrzadCelnyDoKtoregoAdresowane], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [KwotaPodatkuPOG4A], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelnyZlozenia],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [NadwyzWplatDoRozlicz], [LiczbaZlozonychZalacznikowPOG4R], [SystemZrodlowy], [MigracjaReczna] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [WynikSprawdzeniaPelnomocnictwa], [NazwiskoPelnomocnika], [DataWplywuDok], [LiczbaZlozonychZalacznikowPOG4A], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [NadwyzWplatDoRozliczOstatDeklar], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [KwotaPodatkuPOG4R], [RazemKwotaPodatkuAkc], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [StatusDokumentu], [DoZaplaty], [DataArch], [FormaZlozeniaDok], [UrzadCelnyDoKtoregoAdresowane], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [KwotaPodatkuPOG4A], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelnyZlozenia],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [NadwyzWplatDoRozlicz], [LiczbaZlozonychZalacznikowPOG4R], [SystemZrodlowy], [MigracjaReczna]);
SET @Merged = 1;
 END

--POG4_ZalacznikA
IF @TableName = 'POG4_ZalacznikA' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.POG4_ZalacznikA WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.POG4_ZalacznikA)
 MERGE INTO zef2DP.POG4_ZalacznikA AS tgt
USING WA_StageHurtownia.zef2DP.POG4_ZalacznikA AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.REGON=src.REGON, tgt.NumerZezwolenia=src.NumerZezwolenia, tgt.DataWydaniaZezwolenia=src.DataWydaniaZezwolenia, tgt.OrganWydajacyZezwolenie=src.OrganWydajacyZezwolenie, tgt.Monopol=src.Monopol, tgt.DataUtworzenia=src.DataUtworzenia, tgt.PodstawaOpodatkowania=src.PodstawaOpodatkowania, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, REGON, NumerZezwolenia, DataWydaniaZezwolenia, OrganWydajacyZezwolenie, Monopol, DataUtworzenia, PodstawaOpodatkowania, StawkaPodatku, KwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.REGON, src.NumerZezwolenia, src.DataWydaniaZezwolenia, src.OrganWydajacyZezwolenie, src.Monopol, src.DataUtworzenia, src.PodstawaOpodatkowania, src.StawkaPodatku, src.KwotaPodatku, src.id1);
SET @Merged = 1;
END

--POG4_ZalacznikR
IF @TableName = 'POG4_ZalacznikR' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.POG4_ZalacznikR WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.POG4_ZalacznikR)
 MERGE INTO zef2DP.POG4_ZalacznikR AS tgt
USING WA_StageHurtownia.zef2DP.POG4_ZalacznikR AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.REGON=src.REGON, tgt.NumerZezwolenia=src.NumerZezwolenia, tgt.DataWydaniaZezwolenia=src.DataWydaniaZezwolenia, tgt.OrganWydajacyZezwolenie=src.OrganWydajacyZezwolenie, tgt.LacznaLiczbaAutomatow=src.LacznaLiczbaAutomatow, tgt.AutomatyWycofane=src.AutomatyWycofane, tgt.AutomatyCzasowoZawieszone=src.AutomatyCzasowoZawieszone, tgt.AutomatyNowoWprowadzone=src.AutomatyNowoWprowadzone, tgt.ZryczaltowanyPodatek=src.ZryczaltowanyPodatek, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, REGON, NumerZezwolenia, DataWydaniaZezwolenia, OrganWydajacyZezwolenie, LacznaLiczbaAutomatow, AutomatyWycofane, AutomatyCzasowoZawieszone, AutomatyNowoWprowadzone, ZryczaltowanyPodatek, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.REGON, src.NumerZezwolenia, src.DataWydaniaZezwolenia, src.OrganWydajacyZezwolenie, src.LacznaLiczbaAutomatow, src.AutomatyWycofane, src.AutomatyCzasowoZawieszone, src.AutomatyNowoWprowadzone, src.ZryczaltowanyPodatek, src.id1);
SET @Merged = 1;
END


 --POG5_Deklaracja
IF @TableName = 'POG5_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.POG5_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.POG5_Deklaracja)
 MERGE INTO zef2DP.POG5_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.POG5_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.LoginUzytkownikaWprowadzDok=src.LoginUzytkownikaWprowadzDok, tgt.CzyZweryfikowany=src.CzyZweryfikowany, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.NumerDokumentu=src.NumerDokumentu, tgt.NumerPaczki=src.NumerPaczki, tgt.SystemZrodlowy=src.SystemZrodlowy, tgt.StatusDokumentu=src.StatusDokumentu, tgt.NumerVATUE=src.NumerVATUE, tgt.Zarachowanie=src.Zarachowanie, tgt.PowodZarachowania=src.PowodZarachowania, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.UrzadSkarbowyDoKtoregoAdresowaneKod=src.UrzadSkarbowyDoKtoregoAdresowaneKod, tgt.UrzadSkarbowyDoKtoregoAdresowaneNazwa=src.UrzadSkarbowyDoKtoregoAdresowaneNazwa, tgt.UrzadZlozenia=src.UrzadZlozenia, tgt.DeklaracjaCzyKorekta=src.DeklaracjaCzyKorekta, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.NumerDokumentuPierwotnego=src.NumerDokumentuPierwotnego, tgt.RodzajKorekty=src.RodzajKorekty, tgt.DataDoreczeniaKorektyZUrzedu=src.DataDoreczeniaKorektyZUrzedu, tgt.DataDoWniesieniaSprzeciwu=src.DataDoWniesieniaSprzeciwu, tgt.CzySprzeciwDoKorektyZUrzedu=src.CzySprzeciwDoKorektyZUrzedu, tgt.LiczbaZlozonychZalacznikowPOG5A=src.LiczbaZlozonychZalacznikowPOG5A, tgt.LiczbaZlozonychZalacznikowPOG5C=src.LiczbaZlozonychZalacznikowPOG5C, tgt.LiczbaZlozonychZalacznikowPOG5D=src.LiczbaZlozonychZalacznikowPOG5D, tgt.KwotaPodatkuPOG5A=src.KwotaPodatkuPOG5A, tgt.KwotaPodatkuPOG5C=src.KwotaPodatkuPOG5C, tgt.KwotaPodatkuPOG5D=src.KwotaPodatkuPOG5D, tgt.RazemKwotaPodatkuPOG=src.RazemKwotaPodatkuPOG, tgt.RazemKwotaPodatkuPOGSPR=src.RazemKwotaPodatkuPOGSPR, tgt.NadwyzWplatDoRozliczOstatDeklar=src.NadwyzWplatDoRozliczOstatDeklar, tgt.KwotaWplatDziennych=src.KwotaWplatDziennych, tgt.DoZaplaty=src.DoZaplaty, tgt.DoZaplatySPR=src.DoZaplatySPR, tgt.NadwyzWplatDoRozlicz=src.NadwyzWplatDoRozlicz, tgt.NadwyzWplatDoRozliczSPR=src.NadwyzWplatDoRozliczSPR, tgt.ImiePelnomocnika=src.ImiePelnomocnika, tgt.NazwiskoPelnomocnika=src.NazwiskoPelnomocnika, tgt.TelefonPodatnikaLubPelnomocnika=src.TelefonPodatnikaLubPelnomocnika, tgt.EmailPodatnikaLubPelnomocnika=src.EmailPodatnikaLubPelnomocnika, tgt.WynikSprawdzeniaPelnomocnictwa=src.WynikSprawdzeniaPelnomocnictwa, tgt.UwagiUrzeduSkarbowego=src.UwagiUrzeduSkarbowego, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.FormaZlozeniaDok=src.FormaZlozeniaDok, tgt.UzasadnienieKorekty=src.UzasadnienieKorekty
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, LoginUzytkownikaWprowadzDok, CzyZweryfikowany, NIPLubPESELPodatnika, NumerDokumentu, NumerPaczki, SystemZrodlowy, StatusDokumentu, NumerVATUE, Zarachowanie, PowodZarachowania, DeklaracjaZaOkres, UrzadSkarbowyDoKtoregoAdresowaneKod, UrzadSkarbowyDoKtoregoAdresowaneNazwa, UrzadZlozenia, DeklaracjaCzyKorekta, DataZlozeniaDok, DataWplywuDok, NumerDokumentuPierwotnego, RodzajKorekty, DataDoreczeniaKorektyZUrzedu, DataDoWniesieniaSprzeciwu, CzySprzeciwDoKorektyZUrzedu, LiczbaZlozonychZalacznikowPOG5A, LiczbaZlozonychZalacznikowPOG5C, LiczbaZlozonychZalacznikowPOG5D, KwotaPodatkuPOG5A, KwotaPodatkuPOG5C, KwotaPodatkuPOG5D, RazemKwotaPodatkuPOG, RazemKwotaPodatkuPOGSPR, NadwyzWplatDoRozliczOstatDeklar, KwotaWplatDziennych, DoZaplaty, DoZaplatySPR, NadwyzWplatDoRozlicz, NadwyzWplatDoRozliczSPR, ImiePelnomocnika, NazwiskoPelnomocnika, TelefonPodatnikaLubPelnomocnika, EmailPodatnikaLubPelnomocnika, WynikSprawdzeniaPelnomocnictwa, UwagiUrzeduSkarbowego, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji, DataArch, ID_Pismo_xml, FormaZlozeniaDok, UzasadnienieKorekty)
VALUES (src.IdentyfikatorDokumentu, src.LoginUzytkownikaWprowadzDok, src.CzyZweryfikowany, src.NIPLubPESELPodatnika, src.NumerDokumentu, src.NumerPaczki, src.SystemZrodlowy, src.StatusDokumentu, src.NumerVATUE, src.Zarachowanie, src.PowodZarachowania, src.DeklaracjaZaOkres, src.UrzadSkarbowyDoKtoregoAdresowaneKod, src.UrzadSkarbowyDoKtoregoAdresowaneNazwa, src.UrzadZlozenia, src.DeklaracjaCzyKorekta, src.DataZlozeniaDok, src.DataWplywuDok, src.NumerDokumentuPierwotnego, src.RodzajKorekty, src.DataDoreczeniaKorektyZUrzedu, src.DataDoWniesieniaSprzeciwu, src.CzySprzeciwDoKorektyZUrzedu, src.LiczbaZlozonychZalacznikowPOG5A, src.LiczbaZlozonychZalacznikowPOG5C, src.LiczbaZlozonychZalacznikowPOG5D, src.KwotaPodatkuPOG5A, src.KwotaPodatkuPOG5C, src.KwotaPodatkuPOG5D, src.RazemKwotaPodatkuPOG, src.RazemKwotaPodatkuPOGSPR, src.NadwyzWplatDoRozliczOstatDeklar, src.KwotaWplatDziennych, src.DoZaplaty, src.DoZaplatySPR, src.NadwyzWplatDoRozlicz, src.NadwyzWplatDoRozliczSPR, src.ImiePelnomocnika, src.NazwiskoPelnomocnika, src.TelefonPodatnikaLubPelnomocnika, src.EmailPodatnikaLubPelnomocnika, src.WynikSprawdzeniaPelnomocnictwa, src.UwagiUrzeduSkarbowego, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji, src.DataArch, src.ID_Pismo_xml, src.FormaZlozeniaDok, src.UzasadnienieKorekty);
SET @Merged = 1;
END


--POG5_ZalacznikA
IF @TableName = 'POG5_ZalacznikA' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.POG5_ZalacznikA WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.POG5_ZalacznikA)
 MERGE INTO zef2DP.POG5_ZalacznikA AS tgt
USING WA_StageHurtownia.zef2DP.POG5_ZalacznikA AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.REGON=src.REGON, tgt.NumerZezwolenia=src.NumerZezwolenia, tgt.DataWydaniaZezwolenia=src.DataWydaniaZezwolenia, tgt.OrganWydajacyZezwolenie=src.OrganWydajacyZezwolenie, tgt.Monopol=src.Monopol, tgt.DataUtworzenia=src.DataUtworzenia, tgt.PodstawaOpodatkGryCylindrKasyno=src.PodstawaOpodatkGryCylindrKasyno, tgt.PodstawaOpodatkGryAutomatKasyno=src.PodstawaOpodatkGryAutomatKasyno, tgt.PodstawaOpodatkGryKartyKasyno=src.PodstawaOpodatkGryKartyKasyno, tgt.PodstawaOpodatkPozostaleGryKasyno=src.PodstawaOpodatkPozostaleGryKasyno, tgt.RazemPodstawaOpodatkGryKasyno=src.RazemPodstawaOpodatkGryKasyno, tgt.StawkaPodatkuGryKasyno=src.StawkaPodatkuGryKasyno, tgt.KwotaPodatkuGryKasyno=src.KwotaPodatkuGryKasyno, tgt.PodstawaOpodatkGryBingoIPieniezne=src.PodstawaOpodatkGryBingoIPieniezne, tgt.StawkaPodatkuGryBingoIPieniezne=src.StawkaPodatkuGryBingoIPieniezne, tgt.KwotaPodatkuGryBingoIPieniezne=src.KwotaPodatkuGryBingoIPieniezne, tgt.PodstawaOpodatkZakladyDotWspolzawodnLudzi=src.PodstawaOpodatkZakladyDotWspolzawodnLudzi, tgt.StawkaPodatkuZakladyDotWspolzawodnLudzi=src.StawkaPodatkuZakladyDotWspolzawodnLudzi, tgt.KwotaPodatkuZakladyDotWspolzawodnLudzi=src.KwotaPodatkuZakladyDotWspolzawodnLudzi, tgt.PodstawaOpodatkZakladyDotWspolzawodnZwierzat=src.PodstawaOpodatkZakladyDotWspolzawodnZwierzat, tgt.StawkaPodatkuZakladyDotWspolzawodnZwierzat=src.StawkaPodatkuZakladyDotWspolzawodnZwierzat, tgt.KwotaPodatkuZakladyDotWspolzawodnZwierzat=src.KwotaPodatkuZakladyDotWspolzawodnZwierzat, tgt.PodstawaOpodatkPozostaleRodzZakladowWzajemn=src.PodstawaOpodatkPozostaleRodzZakladowWzajemn, tgt.StawkaPodatkuPozostaleRodzZakladowWzajemn=src.StawkaPodatkuPozostaleRodzZakladowWzajemn, tgt.KwotaPodatkuPozostaleRodzZakladowWzajemn=src.KwotaPodatkuPozostaleRodzZakladowWzajemn, tgt.PodstawaOpodatkLoteriePieniezne=src.PodstawaOpodatkLoteriePieniezne, tgt.StawkaPodatkuLoteriePieniezne=src.StawkaPodatkuLoteriePieniezne, tgt.KwotaPodatkuLoteriePieniezne=src.KwotaPodatkuLoteriePieniezne, tgt.PodstawaOpodatkGryTelebingo=src.PodstawaOpodatkGryTelebingo, tgt.StawkaPodatkuGryTelebingo=src.StawkaPodatkuGryTelebingo, tgt.KwotaPodatkuGryTelebingo=src.KwotaPodatkuGryTelebingo, tgt.PodstawaOpodatkLoterieAudiotekstowe=src.PodstawaOpodatkLoterieAudiotekstowe, tgt.StawkaPodatkuLoterieAudiotekstowe=src.StawkaPodatkuLoterieAudiotekstowe, tgt.KwotaPodatkuLoterieAudiotekstowe=src.KwotaPodatkuLoterieAudiotekstowe, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, REGON, NumerZezwolenia, DataWydaniaZezwolenia, OrganWydajacyZezwolenie, Monopol, DataUtworzenia, PodstawaOpodatkGryCylindrKasyno, PodstawaOpodatkGryAutomatKasyno, PodstawaOpodatkGryKartyKasyno, PodstawaOpodatkPozostaleGryKasyno, RazemPodstawaOpodatkGryKasyno, StawkaPodatkuGryKasyno, KwotaPodatkuGryKasyno, PodstawaOpodatkGryBingoIPieniezne, StawkaPodatkuGryBingoIPieniezne, KwotaPodatkuGryBingoIPieniezne, PodstawaOpodatkZakladyDotWspolzawodnLudzi, StawkaPodatkuZakladyDotWspolzawodnLudzi, KwotaPodatkuZakladyDotWspolzawodnLudzi, PodstawaOpodatkZakladyDotWspolzawodnZwierzat, StawkaPodatkuZakladyDotWspolzawodnZwierzat, KwotaPodatkuZakladyDotWspolzawodnZwierzat, PodstawaOpodatkPozostaleRodzZakladowWzajemn, StawkaPodatkuPozostaleRodzZakladowWzajemn, KwotaPodatkuPozostaleRodzZakladowWzajemn, PodstawaOpodatkLoteriePieniezne, StawkaPodatkuLoteriePieniezne, KwotaPodatkuLoteriePieniezne, PodstawaOpodatkGryTelebingo, StawkaPodatkuGryTelebingo, KwotaPodatkuGryTelebingo, PodstawaOpodatkLoterieAudiotekstowe, StawkaPodatkuLoterieAudiotekstowe, KwotaPodatkuLoterieAudiotekstowe, RazemKwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.REGON, src.NumerZezwolenia, src.DataWydaniaZezwolenia, src.OrganWydajacyZezwolenie, src.Monopol, src.DataUtworzenia, src.PodstawaOpodatkGryCylindrKasyno, src.PodstawaOpodatkGryAutomatKasyno, src.PodstawaOpodatkGryKartyKasyno, src.PodstawaOpodatkPozostaleGryKasyno, src.RazemPodstawaOpodatkGryKasyno, src.StawkaPodatkuGryKasyno, src.KwotaPodatkuGryKasyno, src.PodstawaOpodatkGryBingoIPieniezne, src.StawkaPodatkuGryBingoIPieniezne, src.KwotaPodatkuGryBingoIPieniezne, src.PodstawaOpodatkZakladyDotWspolzawodnLudzi, src.StawkaPodatkuZakladyDotWspolzawodnLudzi, src.KwotaPodatkuZakladyDotWspolzawodnLudzi, src.PodstawaOpodatkZakladyDotWspolzawodnZwierzat, src.StawkaPodatkuZakladyDotWspolzawodnZwierzat, src.KwotaPodatkuZakladyDotWspolzawodnZwierzat, src.PodstawaOpodatkPozostaleRodzZakladowWzajemn, src.StawkaPodatkuPozostaleRodzZakladowWzajemn, src.KwotaPodatkuPozostaleRodzZakladowWzajemn, src.PodstawaOpodatkLoteriePieniezne, src.StawkaPodatkuLoteriePieniezne, src.KwotaPodatkuLoteriePieniezne, src.PodstawaOpodatkGryTelebingo, src.StawkaPodatkuGryTelebingo, src.KwotaPodatkuGryTelebingo, src.PodstawaOpodatkLoterieAudiotekstowe, src.StawkaPodatkuLoterieAudiotekstowe, src.KwotaPodatkuLoterieAudiotekstowe, src.RazemKwotaPodatku, src.id1);
SET @Merged = 1;
END

--POG5_ZalacznikA_v4
IF @TableName = 'POG5_ZalacznikA_v4' BEGIN
DELETE FROM WA_Hurtownia.zef2DP.POG5_ZalacznikA_v4 WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.POG5_ZalacznikA_v4)
MERGE INTO zef2DP.POG5_ZalacznikA_v4 AS tgt
USING WA_StageHurtownia.zef2DP.POG5_ZalacznikA_v4 AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.REGON=src.REGON, tgt.NumerZezwolenia=src.NumerZezwolenia, tgt.DataWydaniaZezwolenia=src.DataWydaniaZezwolenia, tgt.OrganWydajacyZezwolenie=src.OrganWydajacyZezwolenie, tgt.PodstawaOpodatkGryCylindryczne=src.PodstawaOpodatkGryCylindryczne, tgt.StawkaPodatkuGryCylindryczne=src.StawkaPodatkuGryCylindryczne, tgt.KwotaPodatkuGryCylindryczne=src.KwotaPodatkuGryCylindryczne, tgt.PodstawaOpodatkGryAutomaty=src.PodstawaOpodatkGryAutomaty, tgt.StawkaPodatkuGryAutomaty=src.StawkaPodatkuGryAutomaty, tgt.KwotaPodatkuGryAutomaty=src.KwotaPodatkuGryAutomaty, tgt.PodstawaOpodatkGryKarty=src.PodstawaOpodatkGryKarty, tgt.StawkaPodatkuGryKarty=src.StawkaPodatkuGryKarty, tgt.KwotaPodatkuGryKarty=src.KwotaPodatkuGryKarty, tgt.PodstawaOpodatkGryKosci=src.PodstawaOpodatkGryKosci, tgt.StawkaPodatkuGryKosci=src.StawkaPodatkuGryKosci, tgt.KwotaPodatkuGryKosci=src.KwotaPodatkuGryKosci, tgt.PodstawaOpodatkGryBingoIPieniezne=src.PodstawaOpodatkGryBingoIPieniezne, tgt.StawkaPodatkuGryBingoIPieniezne=src.StawkaPodatkuGryBingoIPieniezne, tgt.KwotaPodatkuGryBingoIPieniezne=src.KwotaPodatkuGryBingoIPieniezne, tgt.PodstawaOpodatkZakladyDotWspolzawodnLudziPunkty=src.PodstawaOpodatkZakladyDotWspolzawodnLudziPunkty, tgt.StawkaPodatkuZakladyDotWspolzawodnLudziPunkty=src.StawkaPodatkuZakladyDotWspolzawodnLudziPunkty, tgt.KwotaPodatkuZakladyDotWspolzawodnLudziPunkty=src.KwotaPodatkuZakladyDotWspolzawodnLudziPunkty, tgt.PodstawaOpodatkZakladyDotWspolzawodnLudziInternet=src.PodstawaOpodatkZakladyDotWspolzawodnLudziInternet, tgt.StawkaPodatkuZakladyDotWspolzawodnLudziInternet=src.StawkaPodatkuZakladyDotWspolzawodnLudziInternet, tgt.KwotaPodatkuZakladyDotWspolzawodnLudziInternet=src.KwotaPodatkuZakladyDotWspolzawodnLudziInternet, tgt.PodstawaOpodatkZakladyDotWspolzawodnLudziRAZEM=src.PodstawaOpodatkZakladyDotWspolzawodnLudziRAZEM, tgt.KwotaPodatkuZakladyDotWspolzawodnLudziRAZEM=src.KwotaPodatkuZakladyDotWspolzawodnLudziRAZEM, tgt.PodstawaOpodatkZakladyDotWspolzawodnZwierzatPunkty=src.PodstawaOpodatkZakladyDotWspolzawodnZwierzatPunkty, tgt.StawkaPodatkuZakladyDotWspolzawodnZwierzatPunkty=src.StawkaPodatkuZakladyDotWspolzawodnZwierzatPunkty, tgt.KwotaPodatkuZakladyDotWspolzawodnZwierzatPunkty=src.KwotaPodatkuZakladyDotWspolzawodnZwierzatPunkty, tgt.PodstawaOpodatkZakladyDotWspolzawodnZwierzatInternet=src.PodstawaOpodatkZakladyDotWspolzawodnZwierzatInternet, tgt.StawkaPodatkuZakladyDotWspolzawodnZwierzatInternet=src.StawkaPodatkuZakladyDotWspolzawodnZwierzatInternet, tgt.PodstawaOpodatkZakladyDotWspolzawodnZwierzatRAZEM=src.PodstawaOpodatkZakladyDotWspolzawodnZwierzatRAZEM, tgt.KwotaPodatkuZakladyDotWspolzawodnZwierzatRAZEM=src.KwotaPodatkuZakladyDotWspolzawodnZwierzatRAZEM, tgt.KwotaPodatkuZakladyDotWspolzawodnZwierzatInternet=src.KwotaPodatkuZakladyDotWspolzawodnZwierzatInternet, tgt.PodstawaOpodatkZdarzeniaWirtualnePunkty=src.PodstawaOpodatkZdarzeniaWirtualnePunkty, tgt.StawkaPodatkuZdarzeniaWirtualnePunkty=src.StawkaPodatkuZdarzeniaWirtualnePunkty, tgt.KwotaPodatkuZdarzeniaWirtualnePunkty=src.KwotaPodatkuZdarzeniaWirtualnePunkty, tgt.PodstawaOpodatkZdarzeniaWirtualneInternet=src.PodstawaOpodatkZdarzeniaWirtualneInternet, tgt.StawkaPodatkuZdarzeniaWirtualneInternet=src.StawkaPodatkuZdarzeniaWirtualneInternet, tgt.KwotaPodatkuZdarzeniaWirtualneInternet=src.KwotaPodatkuZdarzeniaWirtualneInternet, tgt.PodstawaOpodatkPozostaleRodzZakladowWzajemnPunkty=src.PodstawaOpodatkPozostaleRodzZakladowWzajemnPunkty, tgt.StawkaPodatkuPozostaleRodzZakladowWzajemnPunkty=src.StawkaPodatkuPozostaleRodzZakladowWzajemnPunkty, tgt.KwotaPodatkuPozostaleRodzZakladowWzajemnPunkty=src.KwotaPodatkuPozostaleRodzZakladowWzajemnPunkty, tgt.PodstawaOpodatkPozostaleRodzZakladowWzajemnInternet=src.PodstawaOpodatkPozostaleRodzZakladowWzajemnInternet, tgt.StawkaPodatkuPozostaleRodzZakladowWzajemnInternet=src.StawkaPodatkuPozostaleRodzZakladowWzajemnInternet, tgt.KwotaPodatkuPozostaleRodzZakladowWzajemnInternet=src.KwotaPodatkuPozostaleRodzZakladowWzajemnInternet, tgt.PodstawaOpodatkPozostaleRodzZakladowWzajemnRAZEM=src.PodstawaOpodatkPozostaleRodzZakladowWzajemnRAZEM, tgt.KwotaPodatkuPozostaleRodzZakladowWzajemnRAZEM=src.KwotaPodatkuPozostaleRodzZakladowWzajemnRAZEM, tgt.PodstawaOpodatkLoterieAudiotekstowe=src.PodstawaOpodatkLoterieAudiotekstowe, tgt.StawkaPodatkuLoterieAudiotekstowe=src.StawkaPodatkuLoterieAudiotekstowe, tgt.KwotaPodatkuLoterieAudiotekstowe=src.KwotaPodatkuLoterieAudiotekstowe, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.RazemKwotaPodatkuSPR=src.RazemKwotaPodatkuSPR, tgt.id1=src.id1 
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, REGON, NumerZezwolenia, DataWydaniaZezwolenia, OrganWydajacyZezwolenie, PodstawaOpodatkGryCylindryczne, StawkaPodatkuGryCylindryczne, KwotaPodatkuGryCylindryczne, PodstawaOpodatkGryAutomaty, StawkaPodatkuGryAutomaty, KwotaPodatkuGryAutomaty, PodstawaOpodatkGryKarty, StawkaPodatkuGryKarty, KwotaPodatkuGryKarty, PodstawaOpodatkGryKosci, StawkaPodatkuGryKosci, KwotaPodatkuGryKosci, PodstawaOpodatkGryBingoIPieniezne, StawkaPodatkuGryBingoIPieniezne, KwotaPodatkuGryBingoIPieniezne, PodstawaOpodatkZakladyDotWspolzawodnLudziPunkty, StawkaPodatkuZakladyDotWspolzawodnLudziPunkty, KwotaPodatkuZakladyDotWspolzawodnLudziPunkty, PodstawaOpodatkZakladyDotWspolzawodnLudziInternet, StawkaPodatkuZakladyDotWspolzawodnLudziInternet, KwotaPodatkuZakladyDotWspolzawodnLudziInternet, PodstawaOpodatkZakladyDotWspolzawodnLudziRAZEM, KwotaPodatkuZakladyDotWspolzawodnLudziRAZEM, PodstawaOpodatkZakladyDotWspolzawodnZwierzatPunkty, StawkaPodatkuZakladyDotWspolzawodnZwierzatPunkty, KwotaPodatkuZakladyDotWspolzawodnZwierzatPunkty, PodstawaOpodatkZakladyDotWspolzawodnZwierzatInternet, StawkaPodatkuZakladyDotWspolzawodnZwierzatInternet, PodstawaOpodatkZakladyDotWspolzawodnZwierzatRAZEM, KwotaPodatkuZakladyDotWspolzawodnZwierzatRAZEM, KwotaPodatkuZakladyDotWspolzawodnZwierzatInternet, PodstawaOpodatkZdarzeniaWirtualnePunkty, StawkaPodatkuZdarzeniaWirtualnePunkty, KwotaPodatkuZdarzeniaWirtualnePunkty, PodstawaOpodatkZdarzeniaWirtualneInternet, StawkaPodatkuZdarzeniaWirtualneInternet, KwotaPodatkuZdarzeniaWirtualneInternet, PodstawaOpodatkPozostaleRodzZakladowWzajemnPunkty, StawkaPodatkuPozostaleRodzZakladowWzajemnPunkty, KwotaPodatkuPozostaleRodzZakladowWzajemnPunkty, PodstawaOpodatkPozostaleRodzZakladowWzajemnInternet, StawkaPodatkuPozostaleRodzZakladowWzajemnInternet, KwotaPodatkuPozostaleRodzZakladowWzajemnInternet, PodstawaOpodatkPozostaleRodzZakladowWzajemnRAZEM, KwotaPodatkuPozostaleRodzZakladowWzajemnRAZEM, PodstawaOpodatkLoterieAudiotekstowe, StawkaPodatkuLoterieAudiotekstowe, KwotaPodatkuLoterieAudiotekstowe, RazemKwotaPodatku, RazemKwotaPodatkuSPR, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.REGON, src.NumerZezwolenia, src.DataWydaniaZezwolenia, src.OrganWydajacyZezwolenie, src.PodstawaOpodatkGryCylindryczne, src.StawkaPodatkuGryCylindryczne, src.KwotaPodatkuGryCylindryczne, src.PodstawaOpodatkGryAutomaty, src.StawkaPodatkuGryAutomaty, src.KwotaPodatkuGryAutomaty, src.PodstawaOpodatkGryKarty, src.StawkaPodatkuGryKarty, src.KwotaPodatkuGryKarty, src.PodstawaOpodatkGryKosci, src.StawkaPodatkuGryKosci, src.KwotaPodatkuGryKosci, src.PodstawaOpodatkGryBingoIPieniezne, src.StawkaPodatkuGryBingoIPieniezne, src.KwotaPodatkuGryBingoIPieniezne, src.PodstawaOpodatkZakladyDotWspolzawodnLudziPunkty, src.StawkaPodatkuZakladyDotWspolzawodnLudziPunkty, src.KwotaPodatkuZakladyDotWspolzawodnLudziPunkty, src.PodstawaOpodatkZakladyDotWspolzawodnLudziInternet, src.StawkaPodatkuZakladyDotWspolzawodnLudziInternet, src.KwotaPodatkuZakladyDotWspolzawodnLudziInternet, src.PodstawaOpodatkZakladyDotWspolzawodnLudziRAZEM, src.KwotaPodatkuZakladyDotWspolzawodnLudziRAZEM, src.PodstawaOpodatkZakladyDotWspolzawodnZwierzatPunkty, src.StawkaPodatkuZakladyDotWspolzawodnZwierzatPunkty, src.KwotaPodatkuZakladyDotWspolzawodnZwierzatPunkty, src.PodstawaOpodatkZakladyDotWspolzawodnZwierzatInternet, src.StawkaPodatkuZakladyDotWspolzawodnZwierzatInternet, src.PodstawaOpodatkZakladyDotWspolzawodnZwierzatRAZEM, src.KwotaPodatkuZakladyDotWspolzawodnZwierzatRAZEM, src.KwotaPodatkuZakladyDotWspolzawodnZwierzatInternet, src.PodstawaOpodatkZdarzeniaWirtualnePunkty, src.StawkaPodatkuZdarzeniaWirtualnePunkty, src.KwotaPodatkuZdarzeniaWirtualnePunkty, src.PodstawaOpodatkZdarzeniaWirtualneInternet, src.StawkaPodatkuZdarzeniaWirtualneInternet, src.KwotaPodatkuZdarzeniaWirtualneInternet, src.PodstawaOpodatkPozostaleRodzZakladowWzajemnPunkty, src.StawkaPodatkuPozostaleRodzZakladowWzajemnPunkty, src.KwotaPodatkuPozostaleRodzZakladowWzajemnPunkty, src.PodstawaOpodatkPozostaleRodzZakladowWzajemnInternet, src.StawkaPodatkuPozostaleRodzZakladowWzajemnInternet, src.KwotaPodatkuPozostaleRodzZakladowWzajemnInternet, src.PodstawaOpodatkPozostaleRodzZakladowWzajemnRAZEM, src.KwotaPodatkuPozostaleRodzZakladowWzajemnRAZEM, src.PodstawaOpodatkLoterieAudiotekstowe, src.StawkaPodatkuLoterieAudiotekstowe, src.KwotaPodatkuLoterieAudiotekstowe, src.RazemKwotaPodatku, src.RazemKwotaPodatkuSPR, src.id1);
SET @Merged = 1;
END

--POG5_ZalacznikC
IF @TableName = 'POG5_ZalacznikC' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.POG5_ZalacznikC WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.POG5_ZalacznikC)
 MERGE INTO zef2DP.POG5_ZalacznikC AS tgt
USING WA_StageHurtownia.zef2DP.POG5_ZalacznikC AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.REGON=src.REGON, tgt.Monopol=src.Monopol, tgt.DataUtworzenia=src.DataUtworzenia, tgt.PodstawaOpodatkowania=src.PodstawaOpodatkowania, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPodatku=src.KwotaPodatku, tgt.PodatekWplacony=src.PodatekWplacony, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, REGON, Monopol, DataUtworzenia, PodstawaOpodatkowania, StawkaPodatku, KwotaPodatku, PodatekWplacony, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.REGON, src.Monopol, src.DataUtworzenia, src.PodstawaOpodatkowania, src.StawkaPodatku, src.KwotaPodatku, src.PodatekWplacony, src.id1);
SET @Merged = 1;
END


--POG5_ZalacznikC_v4
IF @TableName = 'POG5_ZalacznikC_v4' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.POG5_ZalacznikC_v4 WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.POG5_ZalacznikC_v4)
MERGE INTO zef2DP.POG5_ZalacznikC_v4 AS tgt
USING WA_StageHurtownia.zef2DP.POG5_ZalacznikC_v4 AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.REGON=src.REGON, tgt.Monopol=src.Monopol, tgt.DataUtworzeniaMonopol=src.DataUtworzeniaMonopol, tgt.PodstawaOpodatkGryLiczbowe=src.PodstawaOpodatkGryLiczbowe, tgt.StawkaPodatkuGryLiczbowe=src.StawkaPodatkuGryLiczbowe, tgt.KwotaPodatkuGryLiczbowe=src.KwotaPodatkuGryLiczbowe, tgt.PodstawaOpodatkLoteriePieniezne=src.PodstawaOpodatkLoteriePieniezne, tgt.StawkaPodatkuLoteriePieniezne=src.StawkaPodatkuLoteriePieniezne, tgt.KwotaPodatkuLoteriePieniezne=src.KwotaPodatkuLoteriePieniezne, tgt.PodstawaOpodatkGryTelebingo=src.PodstawaOpodatkGryTelebingo, tgt.StawkaPodatkuGryTelebingo=src.StawkaPodatkuGryTelebingo, tgt.KwotaPodatkuGryTelebingo=src.KwotaPodatkuGryTelebingo, tgt.PodstawaOpodatkGryAutomaty=src.PodstawaOpodatkGryAutomaty, tgt.StawkaPodatkuGryAutomaty=src.StawkaPodatkuGryAutomaty, tgt.KwotaPodatkuGryAutomaty=src.KwotaPodatkuGryAutomaty, tgt.PodstawaOpodatkGryLiczboweInternet=src.PodstawaOpodatkGryLiczboweInternet, tgt.StawkaPodatkuGryLiczboweInternet=src.StawkaPodatkuGryLiczboweInternet, tgt.KwotaPodatkuGryLiczboweInternet=src.KwotaPodatkuGryLiczboweInternet, tgt.PodstawaOpodatkLoteriePieniezneInternet=src.PodstawaOpodatkLoteriePieniezneInternet, tgt.StawkaPodatkuLoteriePieniezneInternet=src.StawkaPodatkuLoteriePieniezneInternet, tgt.KwotaPodatkuLoteriePieniezneInternet=src.KwotaPodatkuLoteriePieniezneInternet, tgt.PodstawaOpodatkGryTelebingoInternet=src.PodstawaOpodatkGryTelebingoInternet, tgt.StawkaPodatkuGryTelebingoInternet=src.StawkaPodatkuGryTelebingoInternet, tgt.KwotaPodatkuGryTelebingoInternet=src.KwotaPodatkuGryTelebingoInternet, tgt.PodstawaOpodatkGryCylindryczneInternet=src.PodstawaOpodatkGryCylindryczneInternet, tgt.StawkaPodatkuGryCylindryczneInternet=src.StawkaPodatkuGryCylindryczneInternet, tgt.KwotaPodatkuGryCylindryczneInternet=src.KwotaPodatkuGryCylindryczneInternet, tgt.PodstawaOpodatkGryAutomatyInternet=src.PodstawaOpodatkGryAutomatyInternet, tgt.StawkaPodatkuGryAutomatyInternet=src.StawkaPodatkuGryAutomatyInternet, tgt.KwotaPodatkuGryAutomatyInternet=src.KwotaPodatkuGryAutomatyInternet, tgt.PodstawaOpodatkGryKartyInternet=src.PodstawaOpodatkGryKartyInternet, tgt.StawkaPodatkuGryKartyInternet=src.StawkaPodatkuGryKartyInternet, tgt.KwotaPodatkuGryKartyInternet=src.KwotaPodatkuGryKartyInternet, tgt.PodstawaOpodatkGryKosciInternet=src.PodstawaOpodatkGryKosciInternet, tgt.StawkaPodatkuGryKosciInternet=src.StawkaPodatkuGryKosciInternet, tgt.KwotaPodatkuGryKosciInternet=src.KwotaPodatkuGryKosciInternet, tgt.PodstawaOpodatkGryBingoPieniezneInternet=src.PodstawaOpodatkGryBingoPieniezneInternet, tgt.StawkaPodatkuGryBingoPieniezneInternet=src.StawkaPodatkuGryBingoPieniezneInternet, tgt.KwotaPodatkuGryBingoPieniezneInternet=src.KwotaPodatkuGryBingoPieniezneInternet, tgt.PodstawaOpodatkLoterieFantoweInternet=src.PodstawaOpodatkLoterieFantoweInternet, tgt.StawkaPodatkuLoterieFantoweInternet=src.StawkaPodatkuLoterieFantoweInternet, tgt.KwotaPodatkuLoterieFantoweInternet=src.KwotaPodatkuLoterieFantoweInternet, tgt.PodstawaOpodatkGryBingoFantoweInternet=src.PodstawaOpodatkGryBingoFantoweInternet, tgt.StawkaPodatkuGryBingoFantoweInternet=src.StawkaPodatkuGryBingoFantoweInternet, tgt.KwotaPodatkuGryBingoFantoweInternet=src.KwotaPodatkuGryBingoFantoweInternet, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.RazemKwotaPodatkuSPR=src.RazemKwotaPodatkuSPR, tgt.id1=src.id1, tgt.PodatekWplacony=src.PodatekWplacony
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, REGON, Monopol, DataUtworzeniaMonopol, PodstawaOpodatkGryLiczbowe, StawkaPodatkuGryLiczbowe, KwotaPodatkuGryLiczbowe, PodstawaOpodatkLoteriePieniezne, StawkaPodatkuLoteriePieniezne, KwotaPodatkuLoteriePieniezne, PodstawaOpodatkGryTelebingo, StawkaPodatkuGryTelebingo, KwotaPodatkuGryTelebingo, PodstawaOpodatkGryAutomaty, StawkaPodatkuGryAutomaty, KwotaPodatkuGryAutomaty, PodstawaOpodatkGryLiczboweInternet, StawkaPodatkuGryLiczboweInternet, KwotaPodatkuGryLiczboweInternet, PodstawaOpodatkLoteriePieniezneInternet, StawkaPodatkuLoteriePieniezneInternet, KwotaPodatkuLoteriePieniezneInternet, PodstawaOpodatkGryTelebingoInternet, StawkaPodatkuGryTelebingoInternet, KwotaPodatkuGryTelebingoInternet, PodstawaOpodatkGryCylindryczneInternet, StawkaPodatkuGryCylindryczneInternet, KwotaPodatkuGryCylindryczneInternet, PodstawaOpodatkGryAutomatyInternet, StawkaPodatkuGryAutomatyInternet, KwotaPodatkuGryAutomatyInternet, PodstawaOpodatkGryKartyInternet, StawkaPodatkuGryKartyInternet, KwotaPodatkuGryKartyInternet, PodstawaOpodatkGryKosciInternet, StawkaPodatkuGryKosciInternet, KwotaPodatkuGryKosciInternet, PodstawaOpodatkGryBingoPieniezneInternet, StawkaPodatkuGryBingoPieniezneInternet, KwotaPodatkuGryBingoPieniezneInternet, PodstawaOpodatkLoterieFantoweInternet, StawkaPodatkuLoterieFantoweInternet, KwotaPodatkuLoterieFantoweInternet, PodstawaOpodatkGryBingoFantoweInternet, StawkaPodatkuGryBingoFantoweInternet, KwotaPodatkuGryBingoFantoweInternet, RazemKwotaPodatku, RazemKwotaPodatkuSPR, id1, PodatekWplacony)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.REGON, src.Monopol, src.DataUtworzeniaMonopol, src.PodstawaOpodatkGryLiczbowe, src.StawkaPodatkuGryLiczbowe, src.KwotaPodatkuGryLiczbowe, src.PodstawaOpodatkLoteriePieniezne, src.StawkaPodatkuLoteriePieniezne, src.KwotaPodatkuLoteriePieniezne, src.PodstawaOpodatkGryTelebingo, src.StawkaPodatkuGryTelebingo, src.KwotaPodatkuGryTelebingo, src.PodstawaOpodatkGryAutomaty, src.StawkaPodatkuGryAutomaty, src.KwotaPodatkuGryAutomaty, src.PodstawaOpodatkGryLiczboweInternet, src.StawkaPodatkuGryLiczboweInternet, src.KwotaPodatkuGryLiczboweInternet, src.PodstawaOpodatkLoteriePieniezneInternet, src.StawkaPodatkuLoteriePieniezneInternet, src.KwotaPodatkuLoteriePieniezneInternet, src.PodstawaOpodatkGryTelebingoInternet, src.StawkaPodatkuGryTelebingoInternet, src.KwotaPodatkuGryTelebingoInternet, src.PodstawaOpodatkGryCylindryczneInternet, src.StawkaPodatkuGryCylindryczneInternet, src.KwotaPodatkuGryCylindryczneInternet, src.PodstawaOpodatkGryAutomatyInternet, src.StawkaPodatkuGryAutomatyInternet, src.KwotaPodatkuGryAutomatyInternet, src.PodstawaOpodatkGryKartyInternet, src.StawkaPodatkuGryKartyInternet, src.KwotaPodatkuGryKartyInternet, src.PodstawaOpodatkGryKosciInternet, src.StawkaPodatkuGryKosciInternet, src.KwotaPodatkuGryKosciInternet, src.PodstawaOpodatkGryBingoPieniezneInternet, src.StawkaPodatkuGryBingoPieniezneInternet, src.KwotaPodatkuGryBingoPieniezneInternet, src.PodstawaOpodatkLoterieFantoweInternet, src.StawkaPodatkuLoterieFantoweInternet, src.KwotaPodatkuLoterieFantoweInternet, src.PodstawaOpodatkGryBingoFantoweInternet, src.StawkaPodatkuGryBingoFantoweInternet, src.KwotaPodatkuGryBingoFantoweInternet, src.RazemKwotaPodatku, src.RazemKwotaPodatkuSPR, src.id1, PodatekWplacony);
SET @Merged = 1;
END

--POG5_ZalacznikD
IF @TableName = 'POG5_ZalacznikD' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.POG5_ZalacznikD WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.POG5_ZalacznikD)
 MERGE INTO zef2DP.POG5_ZalacznikD AS tgt
USING WA_StageHurtownia.zef2DP.POG5_ZalacznikD AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.NumerZezwolenia=src.NumerZezwolenia, tgt.DataWydaniaZezwolenia=src.DataWydaniaZezwolenia, tgt.OrganWydajacyZezwolenie=src.OrganWydajacyZezwolenie, tgt.PodstawaOpodatkGryBingoFantowe=src.PodstawaOpodatkGryBingoFantowe, tgt.StawkaPodatkuGryBingoFantowe=src.StawkaPodatkuGryBingoFantowe, tgt.KwotaPodatkuGryBingoFantowe=src.KwotaPodatkuGryBingoFantowe, tgt.PodstawaOpodatkLoterieFantowe=src.PodstawaOpodatkLoterieFantowe, tgt.StawkaPodatkuLoterieFantowe=src.StawkaPodatkuLoterieFantowe, tgt.KwotaPodatkuLoterieFantowe=src.KwotaPodatkuLoterieFantowe, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, NumerZezwolenia, DataWydaniaZezwolenia, OrganWydajacyZezwolenie, PodstawaOpodatkGryBingoFantowe, StawkaPodatkuGryBingoFantowe, KwotaPodatkuGryBingoFantowe, PodstawaOpodatkLoterieFantowe, StawkaPodatkuLoterieFantowe, KwotaPodatkuLoterieFantowe, RazemKwotaPodatku, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.NumerZezwolenia, src.DataWydaniaZezwolenia, src.OrganWydajacyZezwolenie, src.PodstawaOpodatkGryBingoFantowe, src.StawkaPodatkuGryBingoFantowe, src.KwotaPodatkuGryBingoFantowe, src.PodstawaOpodatkLoterieFantowe, src.StawkaPodatkuLoterieFantowe, src.KwotaPodatkuLoterieFantowe, src.RazemKwotaPodatku, src.id1);
SET @Merged = 1;
END

--POG5_ZalacznikD_v4
IF @TableName = 'POG5_ZalacznikD_v4' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.POG5_ZalacznikD_v4 WHERE id1 IN (SELECT id1 FROM WA_StageHurtownia.zef2DP.POG5_ZalacznikD_v4)
MERGE INTO zef2DP.POG5_ZalacznikD_v4 AS tgt
USING WA_StageHurtownia.zef2DP.POG5_ZalacznikD_v4 AS src
ON (tgt.IdentyfikatorZalacznika=src.IdentyfikatorZalacznika AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.OznaczenieZalacznika=src.OznaczenieZalacznika, tgt.NumerKolejnyZalacznika=src.NumerKolejnyZalacznika, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.NumerZezwolenia=src.NumerZezwolenia, tgt.DataWydaniaZezwolenia=src.DataWydaniaZezwolenia, tgt.OrganWydajacyZezwolenie=src.OrganWydajacyZezwolenie, tgt.PodstawaOpodatkBingoFantowe=src.PodstawaOpodatkBingoFantowe, tgt.StawkaPodatkuBingoFantowe=src.StawkaPodatkuBingoFantowe, tgt.KwotaPodatkuBingoFantowe=src.KwotaPodatkuBingoFantowe, tgt.PodstawaOpodatkLoterieFantowe=src.PodstawaOpodatkLoterieFantowe, tgt.StawkaPodatkuLoterieFantowe=src.StawkaPodatkuLoterieFantowe, tgt.KwotaPodatkuLoterieFantowe=src.KwotaPodatkuLoterieFantowe, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.RazemKwotaPodatkuSPR=src.RazemKwotaPodatkuSPR, tgt.id1=src.id1
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorZalacznika, IdentyfikatorDokumentu, OznaczenieZalacznika, NumerKolejnyZalacznika, NIPLubPESELPodatnika, DeklaracjaZaOkres, NumerZezwolenia, DataWydaniaZezwolenia, OrganWydajacyZezwolenie, PodstawaOpodatkBingoFantowe, StawkaPodatkuBingoFantowe, KwotaPodatkuBingoFantowe, PodstawaOpodatkLoterieFantowe, StawkaPodatkuLoterieFantowe, KwotaPodatkuLoterieFantowe, RazemKwotaPodatku, RazemKwotaPodatkuSPR, id1)
VALUES (src.IdentyfikatorZalacznika, src.IdentyfikatorDokumentu, src.OznaczenieZalacznika, src.NumerKolejnyZalacznika, src.NIPLubPESELPodatnika, src.DeklaracjaZaOkres, src.NumerZezwolenia, src.DataWydaniaZezwolenia, src.OrganWydajacyZezwolenie, src.PodstawaOpodatkBingoFantowe, src.StawkaPodatkuBingoFantowe, src.KwotaPodatkuBingoFantowe, src.PodstawaOpodatkLoterieFantowe, src.StawkaPodatkuLoterieFantowe, src.KwotaPodatkuLoterieFantowe, src.RazemKwotaPodatku, src.RazemKwotaPodatkuSPR, src.id1);
SET @Merged = 1;
END

--POGP_Deklaracja
IF @TableName = 'POGP_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.POGP_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.POGP_Deklaracja)
 MERGE INTO zef2DP.POGP_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.POGP_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.LoginUzytkownikaWprowadzDok=src.LoginUzytkownikaWprowadzDok, tgt.CzyZweryfikowany=src.CzyZweryfikowany, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.NumerDokumentu=src.NumerDokumentu, tgt.NumerPaczki=src.NumerPaczki, tgt.SystemZrodlowy=src.SystemZrodlowy, tgt.StatusDokumentu=src.StatusDokumentu, tgt.NumerVATUE=src.NumerVATUE, tgt.Zarachowanie=src.Zarachowanie, tgt.PowodZarachowania=src.PowodZarachowania, tgt.DeklaracjaZaOkres=src.DeklaracjaZaOkres, tgt.UrzadSkarbowyDoKtoregoAdresowaneKod=src.UrzadSkarbowyDoKtoregoAdresowaneKod, tgt.UrzadSkarbowyDoKtoregoAdresowaneNazwa=src.UrzadSkarbowyDoKtoregoAdresowaneNazwa, tgt.UrzadZlozenia=src.UrzadZlozenia, tgt.DeklaracjaCzyKorekta=src.DeklaracjaCzyKorekta, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.NumerDokumentuPierwotnego=src.NumerDokumentuPierwotnego, tgt.UzasadnienieKorekty=src.UzasadnienieKorekty, tgt.RodzajKorekty=src.RodzajKorekty, tgt.DataDoreczeniaKorektyZUrzedu=src.DataDoreczeniaKorektyZUrzedu, tgt.DataDoWniesieniaSprzeciwu=src.DataDoWniesieniaSprzeciwu, tgt.CzySprzeciwDoKorektyZUrzedu=src.CzySprzeciwDoKorektyZUrzedu, tgt.PodstawaOpodatkowania=src.PodstawaOpodatkowania, tgt.StawkaPodatku=src.StawkaPodatku, tgt.KwotaPobranegoPodatku=src.KwotaPobranegoPodatku, tgt.KwotaPotraconegoWynagrodzenia=src.KwotaPotraconegoWynagrodzenia, tgt.KwotaDoWplaty=src.KwotaDoWplaty, tgt.KwotaDoWplatySPR=src.KwotaDoWplatySPR, tgt.ImiePelnomocnika=src.ImiePelnomocnika, tgt.NazwiskoPelnomocnika=src.NazwiskoPelnomocnika, tgt.TelefonPodatnikaLubPelnomocnika=src.TelefonPodatnikaLubPelnomocnika, tgt.EmailPodatnikaLubPelnomocnika=src.EmailPodatnikaLubPelnomocnika, tgt.UwagiUrzeduSkarbowego=src.UwagiUrzeduSkarbowego, tgt.SprawdzPelnomocnictwa=src.SprawdzPelnomocnictwa, tgt.WynikSprawdzeniaPelnomocnictwa=src.WynikSprawdzeniaPelnomocnictwa, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.FormaZlozeniaDok=src.FormaZlozeniaDok
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, LoginUzytkownikaWprowadzDok, CzyZweryfikowany, NIPLubPESELPodatnika, NumerDokumentu, NumerPaczki, SystemZrodlowy, StatusDokumentu, NumerVATUE, Zarachowanie, PowodZarachowania, DeklaracjaZaOkres, UrzadSkarbowyDoKtoregoAdresowaneKod, UrzadSkarbowyDoKtoregoAdresowaneNazwa, UrzadZlozenia, DeklaracjaCzyKorekta, DataZlozeniaDok, DataWplywuDok, NumerDokumentuPierwotnego, UzasadnienieKorekty, RodzajKorekty, DataDoreczeniaKorektyZUrzedu, DataDoWniesieniaSprzeciwu, CzySprzeciwDoKorektyZUrzedu, PodstawaOpodatkowania, StawkaPodatku, KwotaPobranegoPodatku, KwotaPotraconegoWynagrodzenia, KwotaDoWplaty, KwotaDoWplatySPR, ImiePelnomocnika, NazwiskoPelnomocnika, TelefonPodatnikaLubPelnomocnika, EmailPodatnikaLubPelnomocnika, UwagiUrzeduSkarbowego, SprawdzPelnomocnictwa, WynikSprawdzeniaPelnomocnictwa, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji, DataArch, ID_Pismo_xml, FormaZlozeniaDok)
VALUES (src.IdentyfikatorDokumentu, src.LoginUzytkownikaWprowadzDok, src.CzyZweryfikowany, src.NIPLubPESELPodatnika, src.NumerDokumentu, src.NumerPaczki, src.SystemZrodlowy, src.StatusDokumentu, src.NumerVATUE, src.Zarachowanie, src.PowodZarachowania, src.DeklaracjaZaOkres, src.UrzadSkarbowyDoKtoregoAdresowaneKod, src.UrzadSkarbowyDoKtoregoAdresowaneNazwa, src.UrzadZlozenia, src.DeklaracjaCzyKorekta, src.DataZlozeniaDok, src.DataWplywuDok, src.NumerDokumentuPierwotnego, src.UzasadnienieKorekty, src.RodzajKorekty, src.DataDoreczeniaKorektyZUrzedu, src.DataDoWniesieniaSprzeciwu, src.CzySprzeciwDoKorektyZUrzedu, src.PodstawaOpodatkowania, src.StawkaPodatku, src.KwotaPobranegoPodatku, src.KwotaPotraconegoWynagrodzenia, src.KwotaDoWplaty, src.KwotaDoWplatySPR, src.ImiePelnomocnika, src.NazwiskoPelnomocnika, src.TelefonPodatnikaLubPelnomocnika, src.EmailPodatnikaLubPelnomocnika, src.UwagiUrzeduSkarbowego, src.SprawdzPelnomocnictwa, src.WynikSprawdzeniaPelnomocnictwa, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji, src.DataArch, src.ID_Pismo_xml, src.FormaZlozeniaDok);
SET @Merged = 1;
END

--ZPNW_Dokument
IF @TableName = 'ZPNW_Dokument' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.ZPNW_Dokument WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.ZPNW_Dokument)
 MERGE INTO zef2DP.ZPNW_Dokument AS tgt
USING WA_StageHurtownia.zef2DP.ZPNW_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[NumerZabezpieczeniaJednorazowego]=src.[NumerZabezpieczeniaJednorazowego],
tgt.[WynikSprawdzeniaPelnomocnictwa]=src.[WynikSprawdzeniaPelnomocnictwa],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[PrzewidywanaDataDostawy]=src.[PrzewidywanaDataDostawy],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[RazemKwotaPodatku]=src.[RazemKwotaPodatku],
tgt.[NumerZabezpieczeniaGeneralnego]=src.[NumerZabezpieczeniaGeneralnego],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DataArch]=src.[DataArch],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[UrzadCelnyDoKtoregoAdresowane]=src.[UrzadCelnyDoKtoregoAdresowane],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[UrzadCelnyZlozenia]=src.[UrzadCelnyZlozenia],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[REGON]=src.[REGON],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[MiejsceDostawy]=src.[MiejsceDostawy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NumerZabezpieczeniaJednorazowego], [WynikSprawdzeniaPelnomocnictwa], [NazwiskoPelnomocnika], [PrzewidywanaDataDostawy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [NumerZabezpieczeniaGeneralnego], [CzyOstatniaWersjaDeklaracji], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [UrzadCelnyDoKtoregoAdresowane], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelnyZlozenia],  [NumerPaczki], [REGON], [TelefonPodatnikaLubPelnomocnika], [MiejsceDostawy] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [ID_Pismo_xml], [NumerZabezpieczeniaJednorazowego], [WynikSprawdzeniaPelnomocnictwa], [NazwiskoPelnomocnika], [PrzewidywanaDataDostawy], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [DataDoreczeniaKorektyZUrzedu], [RazemKwotaPodatku], [NumerZabezpieczeniaGeneralnego], [CzyOstatniaWersjaDeklaracji], [StatusDokumentu], [DataArch], [FormaZlozeniaDok], [UrzadCelnyDoKtoregoAdresowane], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika], [UrzadCelnyZlozenia],  [NumerPaczki], [REGON], [TelefonPodatnikaLubPelnomocnika], [MiejsceDostawy] );
SET @Merged = 1;
 END

--ZPNW_Towary
IF @TableName = 'ZPNW_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.ZPNW_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.ZPNW_Towary)
 MERGE INTO zef2DP.ZPNW_Towary AS tgt
USING WA_StageHurtownia.zef2DP.ZPNW_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.NazwaWyrobu=src.NazwaWyrobu, tgt.KodCN=src.KodCN, tgt.PodstawObliczPodatkuIloscWyrobow=src.PodstawObliczPodatkuIloscWyrobow, tgt.PodstawObliczPodatkuWartoscWyrobow=src.PodstawObliczPodatkuWartoscWyrobow, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.StawkaPodatkuKwota=src.StawkaPodatkuKwota, tgt.MinimalnaStawkaPodatkuOdWyrTytoniowych=src.MinimalnaStawkaPodatkuOdWyrTytoniowych, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.RodzajStawkiSpozaISZTAR=src.RodzajStawkiSpozaISZTAR, tgt.WartoscStawkiSpozaISZTAR=src.WartoscStawkiSpozaISZTAR, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, NazwaGrupyWyrobow, NazwaWyrobu, KodCN, PodstawObliczPodatkuIloscWyrobow, PodstawObliczPodatkuWartoscWyrobow, StawkaPodatkuProcent, StawkaPodatkuKwota, MinimalnaStawkaPodatkuOdWyrTytoniowych, KwotaPodatku, StawkaSpozaISZTAR, RodzajStawkiSpozaISZTAR, WartoscStawkiSpozaISZTAR, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.NazwaGrupyWyrobow, src.NazwaWyrobu, src.KodCN, src.PodstawObliczPodatkuIloscWyrobow, src.PodstawObliczPodatkuWartoscWyrobow, src.StawkaPodatkuProcent, src.StawkaPodatkuKwota, src.MinimalnaStawkaPodatkuOdWyrTytoniowych, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.RodzajStawkiSpozaISZTAR, src.WartoscStawkiSpozaISZTAR, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END

--'PKOPRG_Deklaracja' 
IF @TableName = 'PKOPRG_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.PKOPRG_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.PKOPRG_Deklaracja)
 MERGE INTO zef2DP.PKOPRG_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.PKOPRG_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[WysokoscSkumulowanejStraty ]=src.[WysokoscSkumulowanejStraty ],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[WynikSprawdzeniaPelnomocnictwa]=src.[WynikSprawdzeniaPelnomocnictwa],
tgt.[KwotaPodatkuRopaNaftowa]=src.[KwotaPodatkuRopaNaftowa],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[KwotaOdliczenia]=src.[KwotaOdliczenia],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[KodUrzeduSkarbowego]=src.[KodUrzeduSkarbowego],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[DataArch]=src.[DataArch],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DoZaplaty]=src.[DoZaplaty],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[OgolemPodatekPoZwolnieniuGazZiemny]=src.[OgolemPodatekPoZwolnieniuGazZiemny],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[OgolemPodatekPoZwolnieniuRopaNaftowa]=src.[OgolemPodatekPoZwolnieniuRopaNaftowa],
tgt.[KwotaPodatkuGazZiemny]=src.[KwotaPodatkuGazZiemny],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [FormaZlozeniaDok], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [WysokoscSkumulowanejStraty ], [ID_Pismo_xml], [WynikSprawdzeniaPelnomocnictwa], [KwotaPodatkuRopaNaftowa], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [KwotaOdliczenia], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [KodUrzeduSkarbowego], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [CzyOstatniaWersjaDeklaracji], [DataArch], [StatusDokumentu], [DoZaplaty], [CzySprzeciwDoKorektyZUrzedu], [OgolemPodatekPoZwolnieniuGazZiemny], [UzasadnienieKorekty], [RodzajKorekty], [OgolemPodatekPoZwolnieniuRopaNaftowa], [KwotaPodatkuGazZiemny], [DeklaracjaCzyKorekta],  [LoginUzytkownikaWprowadzDok], [NumerPaczki] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [FormaZlozeniaDok], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [WysokoscSkumulowanejStraty ], [ID_Pismo_xml], [WynikSprawdzeniaPelnomocnictwa], [KwotaPodatkuRopaNaftowa], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [KwotaOdliczenia], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [KodUrzeduSkarbowego], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [CzyOstatniaWersjaDeklaracji], [DataArch], [StatusDokumentu], [DoZaplaty], [CzySprzeciwDoKorektyZUrzedu], [OgolemPodatekPoZwolnieniuGazZiemny], [UzasadnienieKorekty], [RodzajKorekty], [OgolemPodatekPoZwolnieniuRopaNaftowa], [KwotaPodatkuGazZiemny], [DeklaracjaCzyKorekta],  [LoginUzytkownikaWprowadzDok], [NumerPaczki] );
SET @Merged = 1;
 END

--'PKOPMS_Deklaracja'
IF @TableName = 'PKOPMS_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.PKOPMS_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.PKOPMS_Deklaracja)
 MERGE INTO zef2DP.PKOPMS_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.PKOPMS_Deklaracja AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataDoWniesieniaSprzeciwu]=src.[DataDoWniesieniaSprzeciwu],
tgt.[SprawdzPelnomocnictwa]=src.[SprawdzPelnomocnictwa],
tgt.[DeklaracjaZaOkres]=src.[DeklaracjaZaOkres],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[NumerDokumentuPierwotnego]=src.[NumerDokumentuPierwotnego],
tgt.[WysokoscSkumulowanejStraty ]=src.[WysokoscSkumulowanejStraty ],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[WynikSprawdzeniaPelnomocnictwa]=src.[WynikSprawdzeniaPelnomocnictwa],
tgt.[NazwiskoPelnomocnika]=src.[NazwiskoPelnomocnika],
tgt.[DataWplywuDok]=src.[DataWplywuDok],
tgt.[UrzadSkarbowyDoKtoregoAdresowaneNazwa]=src.[UrzadSkarbowyDoKtoregoAdresowaneNazwa],
tgt.[PowodZarachowania]=src.[PowodZarachowania],
tgt.[KwotaOdliczenia]=src.[KwotaOdliczenia],
tgt.[DataZlozeniaDeklaracjiPierwotnej]=src.[DataZlozeniaDeklaracjiPierwotnej],
tgt.[CzyZweryfikowany]=src.[CzyZweryfikowany],
tgt.[NIPLubPESELPodatnika]=src.[NIPLubPESELPodatnika],
tgt.[Zarachowanie]=src.[Zarachowanie],
tgt.[KodUrzeduSkarbowego]=src.[KodUrzeduSkarbowego],
tgt.[DataZlozeniaDok]=src.[DataZlozeniaDok],
tgt.[DataDoreczeniaKorektyZUrzedu]=src.[DataDoreczeniaKorektyZUrzedu],
tgt.[CzyOstatniaWersjaDeklaracji]=src.[CzyOstatniaWersjaDeklaracji],
tgt.[NumerVATUE]=src.[NumerVATUE],
tgt.[DataArch]=src.[DataArch],
tgt.[StatusDokumentu]=src.[StatusDokumentu],
tgt.[DoZaplaty]=src.[DoZaplaty],
tgt.[CzySprzeciwDoKorektyZUrzedu]=src.[CzySprzeciwDoKorektyZUrzedu],
tgt.[UzasadnienieKorekty]=src.[UzasadnienieKorekty],
tgt.[RodzajKorekty]=src.[RodzajKorekty],
tgt.[EmailPodatnikaLubPelnomocnika]=src.[EmailPodatnikaLubPelnomocnika],
tgt.[UwagiUrzeduCelnego]=src.[UwagiUrzeduCelnego],
tgt.[DeklaracjaCzyKorekta]=src.[DeklaracjaCzyKorekta],
tgt.[ImiePelnomocnika]=src.[ImiePelnomocnika],
tgt.[FormaZlozeniaDok]=src.[FormaZlozeniaDok],
tgt.[LoginUzytkownikaWprowadzDok]=src.[LoginUzytkownikaWprowadzDok],
tgt.[NumerPaczki]=src.[NumerPaczki],
tgt.[TelefonPodatnikaLubPelnomocnika]=src.[TelefonPodatnikaLubPelnomocnika],
tgt.[SystemZrodlowy]=src.[SystemZrodlowy]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (
[DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [FormaZlozeniaDok], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [WysokoscSkumulowanejStraty ], [ID_Pismo_xml], [WynikSprawdzeniaPelnomocnictwa], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [KwotaOdliczenia], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [KodUrzeduSkarbowego], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [DataArch], [StatusDokumentu], [DoZaplaty], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] )
VALUES ([DataDoWniesieniaSprzeciwu], [SprawdzPelnomocnictwa], [FormaZlozeniaDok], [DeklaracjaZaOkres], [NumerDokumentu], [NumerDokumentuPierwotnego], [WysokoscSkumulowanejStraty ], [ID_Pismo_xml], [WynikSprawdzeniaPelnomocnictwa], [NazwiskoPelnomocnika], [DataWplywuDok], [UrzadSkarbowyDoKtoregoAdresowaneNazwa], [PowodZarachowania], [KwotaOdliczenia], [DataZlozeniaDeklaracjiPierwotnej], [IdentyfikatorDokumentu], [CzyZweryfikowany], [NIPLubPESELPodatnika], [Zarachowanie], [KodUrzeduSkarbowego], [DataZlozeniaDok], [DataDoreczeniaKorektyZUrzedu], [CzyOstatniaWersjaDeklaracji], [NumerVATUE], [DataArch], [StatusDokumentu], [DoZaplaty], [CzySprzeciwDoKorektyZUrzedu], [UzasadnienieKorekty], [RodzajKorekty], [EmailPodatnikaLubPelnomocnika], [UwagiUrzeduCelnego], [DeklaracjaCzyKorekta], [ImiePelnomocnika],  [LoginUzytkownikaWprowadzDok], [NumerPaczki], [TelefonPodatnikaLubPelnomocnika], [SystemZrodlowy] );
SET @Merged = 1;
 END


 --PKOPMS_Towary
 IF @TableName = 'PKOPMS_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.PKOPMS_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.PKOPMS_Towary)
 MERGE INTO zef2DP.PKOPMS_Towary AS tgt
USING WA_StageHurtownia.zef2DP.PKOPMS_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml,  tgt.PodstawaOpodatkowaniaAg=src.PodstawaOpodatkowaniaAg, tgt.PodstawaOpodatkowaniaCu=src.PodstawaOpodatkowaniaCu, tgt.SredniaCenaAg=src.SredniaCenaAg, tgt.SredniaCenaCu=src.SredniaCenaCu, tgt.StawkaPodatkuAg=src.StawkaPodatkuAg, tgt.StawkaPodatkuCu=src.StawkaPodatkuCu, tgt.KwotaPodatkuAg=src.KwotaPodatkuAg, tgt.KwotaPodatkuCu=src.KwotaPodatkuCu
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, DataArch, ID_Pismo_xml, PodstawaOpodatkowaniaAg, PodstawaOpodatkowaniaCu, SredniaCenaAg, SredniaCenaCu, StawkaPodatkuAg, StawkaPodatkuCu, KwotaPodatkuAg, KwotaPodatkuCu)
VALUES (src.IdentyfikatorDokumentu, src.DataArch, src.ID_Pismo_xml, src.PodstawaOpodatkowaniaAg, src.PodstawaOpodatkowaniaCu, src.SredniaCenaAg, src.SredniaCenaCu, src.StawkaPodatkuAg, src.StawkaPodatkuCu, src.KwotaPodatkuAg, src.KwotaPodatkuCu);
SET @Merged = 1;
END


--PKOPRG_Towary
IF @TableName = 'PKOPRG_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.PKOPRG_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.PKOPRG_Towary)
 MERGE INTO zef2DP.PKOPRG_Towary AS tgt
USING WA_StageHurtownia.zef2DP.PKOPRG_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml,  tgt.IloscGazuZiemnegoArt7aUst4=src.IloscGazuZiemnegoArt7aUst4, tgt.IloscGazuZiemnegoArt7aUst6Pkt1=src.IloscGazuZiemnegoArt7aUst6Pkt1, tgt.IloscGazuZiemnegoArt7aUst6Pkt2=src.IloscGazuZiemnegoArt7aUst6Pkt2, tgt.IloscGazuZiemnegoArt7aUst8=src.IloscGazuZiemnegoArt7aUst8, tgt.SredniaCenaGazuZiemnegoArt7aUst4=src.SredniaCenaGazuZiemnegoArt7aUst4, tgt.SredniaCenaGazuZiemnegoArt7aUst6Pkt1=src.SredniaCenaGazuZiemnegoArt7aUst6Pkt1, tgt.SredniaCenaGazuZiemnegoArt7aUst6Pkt2=src.SredniaCenaGazuZiemnegoArt7aUst6Pkt2, tgt.SredniaCenaGazuZiemnegoArt7aUst8=src.SredniaCenaGazuZiemnegoArt7aUst8, tgt.WartoscWydobytegoGazuZiemnegoArt7aUst4=src.WartoscWydobytegoGazuZiemnegoArt7aUst4, tgt.WartoscWydobytegoGazuZiemnegoArt7aUst6Pkt1=src.WartoscWydobytegoGazuZiemnegoArt7aUst6Pkt1, tgt.WartoscWydobytegoGazuZiemnegoArt7aUst6Pkt2=src.WartoscWydobytegoGazuZiemnegoArt7aUst6Pkt2, tgt.WartoscWydobytegoGazuZiemnegoArt7aUst8=src.WartoscWydobytegoGazuZiemnegoArt7aUst8, tgt.StawkaPodatkuGazuZiemnegoArt7aUst4=src.StawkaPodatkuGazuZiemnegoArt7aUst4, tgt.StawkaPodatkuGazuZiemnegoArt7aUst6Pkt1=src.StawkaPodatkuGazuZiemnegoArt7aUst6Pkt1, tgt.StawkaPodatkuGazuZiemnegoArt7aUst6Pkt2=src.StawkaPodatkuGazuZiemnegoArt7aUst6Pkt2, tgt.StawkaPodatkuGazuZiemnegoArt7aUst8=src.StawkaPodatkuGazuZiemnegoArt7aUst8, tgt.KwotaPodatkuGazuZiemnegoArt7aUst4=src.KwotaPodatkuGazuZiemnegoArt7aUst4, tgt.KwotaPodatkuGazuZiemnegoArt7aUst6Pkt1=src.KwotaPodatkuGazuZiemnegoArt7aUst6Pkt1, tgt.KwotaPodatkuGazuZiemnegoArt7aUst6Pkt2=src.KwotaPodatkuGazuZiemnegoArt7aUst6Pkt2, tgt.KwotaPodatkuGazuZiemnegoArt7aUst8=src.KwotaPodatkuGazuZiemnegoArt7aUst8, tgt.IloscRopyNaftowejArt7aUst7Pkt1=src.IloscRopyNaftowejArt7aUst7Pkt1, tgt.IloscRopyNaftowejArt7aUst7Pkt2=src.IloscRopyNaftowejArt7aUst7Pkt2, tgt.IloscRopyNaftowejArt7aUst8=src.IloscRopyNaftowejArt7aUst8, tgt.SredniaCenaRopyNaftowejArt7aUst7Pkt1=src.SredniaCenaRopyNaftowejArt7aUst7Pkt1, tgt.SredniaCenaRopyNaftowejArt7aUst7Pkt2=src.SredniaCenaRopyNaftowejArt7aUst7Pkt2, tgt.SredniaCenaRopyNaftowejArt7aUst8=src.SredniaCenaRopyNaftowejArt7aUst8, tgt.WartoscWydobytejRopyNaftowejArt7aUst7Pkt1=src.WartoscWydobytejRopyNaftowejArt7aUst7Pkt1, tgt.WartoscWydobytejRopyNaftowejArt7aUst7Pkt2=src.WartoscWydobytejRopyNaftowejArt7aUst7Pkt2, tgt.WartoscWydobytejRopyNaftowejArt7aUst8=src.WartoscWydobytejRopyNaftowejArt7aUst8, tgt.StawkaPodatkuRopyNaftowejArt7aUst7Pkt1=src.StawkaPodatkuRopyNaftowejArt7aUst7Pkt1, tgt.StawkaPodatkuRopyNaftowejArt7aUst7Pkt2=src.StawkaPodatkuRopyNaftowejArt7aUst7Pkt2, tgt.StawkaPodatkuRopyNaftowejArt7aUst8=src.StawkaPodatkuRopyNaftowejArt7aUst8, tgt.KwotaPodatkuRopyNaftowejArt7aUst7Pkt1=src.KwotaPodatkuRopyNaftowejArt7aUst7Pkt1, tgt.KwotaPodatkuRopyNaftowejArt7aUst7Pkt2=src.KwotaPodatkuRopyNaftowejArt7aUst7Pkt2, tgt.KwotaPodatkuRopyNaftowejArt7aUst8=src.KwotaPodatkuRopyNaftowejArt7aUst8, tgt.KwotaPodatkuGazuZiemnegoArt7aUst4SekcjaC=src.KwotaPodatkuGazuZiemnegoArt7aUst4SekcjaC, tgt.KwotaPodatkuGazuZiemnegoArt7aUst6Pkt1SekcjaC=src.KwotaPodatkuGazuZiemnegoArt7aUst6Pkt1SekcjaC, tgt.KwotaPodatkuGazuZiemnegoArt7aUst6Pkt2SekcjaC=src.KwotaPodatkuGazuZiemnegoArt7aUst6Pkt2SekcjaC, tgt.KwotaPodatkuGazuZiemnegoArt7aUst8SekcjaC=src.KwotaPodatkuGazuZiemnegoArt7aUst8SekcjaC, tgt.KwotaPodatkuRopyNaftowejArt7aUst7Pkt1SekcjaC=src.KwotaPodatkuRopyNaftowejArt7aUst7Pkt1SekcjaC, tgt.KwotaPodatkuRopyNaftowejArt7aUst7Pkt2SekcjaC=src.KwotaPodatkuRopyNaftowejArt7aUst7Pkt2SekcjaC, tgt.KwotaPodatkuRopyNaftowejArt7aUst8SekcjaC=src.KwotaPodatkuRopyNaftowejArt7aUst8SekcjaC, tgt.KwotaZwolnieniaGazuZiemnegoArt7aUst4=src.KwotaZwolnieniaGazuZiemnegoArt7aUst4, tgt.KwotaZwolnieniaGazuZiemnegoArt7aUst6Pkt1=src.KwotaZwolnieniaGazuZiemnegoArt7aUst6Pkt1, tgt.KwotaZwolnieniaGazuZiemnegoArt7aUst6Pkt2=src.KwotaZwolnieniaGazuZiemnegoArt7aUst6Pkt2, tgt.KwotaZwolnieniaGazuZiemnegoArt7aUst8=src.KwotaZwolnieniaGazuZiemnegoArt7aUst8, tgt.KwotaPodatkuPoZwolnieniuRopyNaftowejArt7aUst7Pkt1=src.KwotaPodatkuPoZwolnieniuRopyNaftowejArt7aUst7Pkt1, tgt.KwotaPodatkuPoZwolnieniuRopyNaftowejArt7aUst7Pkt2=src.KwotaPodatkuPoZwolnieniuRopyNaftowejArt7aUst7Pkt2, tgt.KwotaPodatkuPoZwolnieniuRopyNaftowejArt7aUst8=src.KwotaPodatkuPoZwolnieniuRopyNaftowejArt7aUst8
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, DataArch, ID_Pismo_xml, IloscGazuZiemnegoArt7aUst4, IloscGazuZiemnegoArt7aUst6Pkt1, IloscGazuZiemnegoArt7aUst6Pkt2, IloscGazuZiemnegoArt7aUst8, SredniaCenaGazuZiemnegoArt7aUst4, SredniaCenaGazuZiemnegoArt7aUst6Pkt1, SredniaCenaGazuZiemnegoArt7aUst6Pkt2, SredniaCenaGazuZiemnegoArt7aUst8, WartoscWydobytegoGazuZiemnegoArt7aUst4, WartoscWydobytegoGazuZiemnegoArt7aUst6Pkt1, WartoscWydobytegoGazuZiemnegoArt7aUst6Pkt2, WartoscWydobytegoGazuZiemnegoArt7aUst8, StawkaPodatkuGazuZiemnegoArt7aUst4, StawkaPodatkuGazuZiemnegoArt7aUst6Pkt1, StawkaPodatkuGazuZiemnegoArt7aUst6Pkt2, StawkaPodatkuGazuZiemnegoArt7aUst8, KwotaPodatkuGazuZiemnegoArt7aUst4, KwotaPodatkuGazuZiemnegoArt7aUst6Pkt1, KwotaPodatkuGazuZiemnegoArt7aUst6Pkt2, KwotaPodatkuGazuZiemnegoArt7aUst8, IloscRopyNaftowejArt7aUst7Pkt1, IloscRopyNaftowejArt7aUst7Pkt2, IloscRopyNaftowejArt7aUst8, SredniaCenaRopyNaftowejArt7aUst7Pkt1, SredniaCenaRopyNaftowejArt7aUst7Pkt2, SredniaCenaRopyNaftowejArt7aUst8, WartoscWydobytejRopyNaftowejArt7aUst7Pkt1, WartoscWydobytejRopyNaftowejArt7aUst7Pkt2, WartoscWydobytejRopyNaftowejArt7aUst8, StawkaPodatkuRopyNaftowejArt7aUst7Pkt1, StawkaPodatkuRopyNaftowejArt7aUst7Pkt2, StawkaPodatkuRopyNaftowejArt7aUst8, KwotaPodatkuRopyNaftowejArt7aUst7Pkt1, KwotaPodatkuRopyNaftowejArt7aUst7Pkt2, KwotaPodatkuRopyNaftowejArt7aUst8, KwotaPodatkuGazuZiemnegoArt7aUst4SekcjaC, KwotaPodatkuGazuZiemnegoArt7aUst6Pkt1SekcjaC, KwotaPodatkuGazuZiemnegoArt7aUst6Pkt2SekcjaC, KwotaPodatkuGazuZiemnegoArt7aUst8SekcjaC, KwotaPodatkuRopyNaftowejArt7aUst7Pkt1SekcjaC, KwotaPodatkuRopyNaftowejArt7aUst7Pkt2SekcjaC, KwotaPodatkuRopyNaftowejArt7aUst8SekcjaC, KwotaZwolnieniaGazuZiemnegoArt7aUst4, KwotaZwolnieniaGazuZiemnegoArt7aUst6Pkt1, KwotaZwolnieniaGazuZiemnegoArt7aUst6Pkt2, KwotaZwolnieniaGazuZiemnegoArt7aUst8, KwotaZwolnieniaRopyNaftowejArt7aUst7Pkt1, KwotaZwolnieniaRopyNaftowejArt7aUst7Pkt2, KwotaZwolnieniaRopyNaftowejArt7aUst8, KwotaPodatkuPoZwolnieniuGazuZiemnegoArt7aUst4, KwotaPodatkuPoZwolnieniuGazuZiemnegoArt7aUst6Pkt1, KwotaPodatkuPoZwolnieniuGazuZiemnegoArt7aUst6Pkt2, KwotaPodatkuPoZwolnieniuGazuZiemnegoArt7aUst8, KwotaPodatkuPoZwolnieniuRopyNaftowejArt7aUst7Pkt1, KwotaPodatkuPoZwolnieniuRopyNaftowejArt7aUst7Pkt2, KwotaPodatkuPoZwolnieniuRopyNaftowejArt7aUst8)
VALUES (src.IdentyfikatorDokumentu, src.DataArch, src.ID_Pismo_xml, src.IloscGazuZiemnegoArt7aUst4, src.IloscGazuZiemnegoArt7aUst6Pkt1, src.IloscGazuZiemnegoArt7aUst6Pkt2, src.IloscGazuZiemnegoArt7aUst8, src.SredniaCenaGazuZiemnegoArt7aUst4, src.SredniaCenaGazuZiemnegoArt7aUst6Pkt1, src.SredniaCenaGazuZiemnegoArt7aUst6Pkt2, src.SredniaCenaGazuZiemnegoArt7aUst8, src.WartoscWydobytegoGazuZiemnegoArt7aUst4, src.WartoscWydobytegoGazuZiemnegoArt7aUst6Pkt1, src.WartoscWydobytegoGazuZiemnegoArt7aUst6Pkt2, src.WartoscWydobytegoGazuZiemnegoArt7aUst8, src.StawkaPodatkuGazuZiemnegoArt7aUst4, src.StawkaPodatkuGazuZiemnegoArt7aUst6Pkt1, src.StawkaPodatkuGazuZiemnegoArt7aUst6Pkt2, src.StawkaPodatkuGazuZiemnegoArt7aUst8, src.KwotaPodatkuGazuZiemnegoArt7aUst4, src.KwotaPodatkuGazuZiemnegoArt7aUst6Pkt1, src.KwotaPodatkuGazuZiemnegoArt7aUst6Pkt2, src.KwotaPodatkuGazuZiemnegoArt7aUst8, src.IloscRopyNaftowejArt7aUst7Pkt1, src.IloscRopyNaftowejArt7aUst7Pkt2, src.IloscRopyNaftowejArt7aUst8, src.SredniaCenaRopyNaftowejArt7aUst7Pkt1, src.SredniaCenaRopyNaftowejArt7aUst7Pkt2, src.SredniaCenaRopyNaftowejArt7aUst8, src.WartoscWydobytejRopyNaftowejArt7aUst7Pkt1, src.WartoscWydobytejRopyNaftowejArt7aUst7Pkt2, src.WartoscWydobytejRopyNaftowejArt7aUst8, src.StawkaPodatkuRopyNaftowejArt7aUst7Pkt1, src.StawkaPodatkuRopyNaftowejArt7aUst7Pkt2, src.StawkaPodatkuRopyNaftowejArt7aUst8, src.KwotaPodatkuRopyNaftowejArt7aUst7Pkt1, src.KwotaPodatkuRopyNaftowejArt7aUst7Pkt2, src.KwotaPodatkuRopyNaftowejArt7aUst8, src.KwotaPodatkuGazuZiemnegoArt7aUst4SekcjaC, src.KwotaPodatkuGazuZiemnegoArt7aUst6Pkt1SekcjaC, src.KwotaPodatkuGazuZiemnegoArt7aUst6Pkt2SekcjaC, src.KwotaPodatkuGazuZiemnegoArt7aUst8SekcjaC, src.KwotaPodatkuRopyNaftowejArt7aUst7Pkt1SekcjaC, src.KwotaPodatkuRopyNaftowejArt7aUst7Pkt2SekcjaC, src.KwotaPodatkuRopyNaftowejArt7aUst8SekcjaC, src.KwotaZwolnieniaGazuZiemnegoArt7aUst4, src.KwotaZwolnieniaGazuZiemnegoArt7aUst6Pkt1, src.KwotaZwolnieniaGazuZiemnegoArt7aUst6Pkt2, src.KwotaZwolnieniaGazuZiemnegoArt7aUst8, src.KwotaZwolnieniaRopyNaftowejArt7aUst7Pkt1, src.KwotaZwolnieniaRopyNaftowejArt7aUst7Pkt2, src.KwotaZwolnieniaRopyNaftowejArt7aUst8, src.KwotaPodatkuPoZwolnieniuGazuZiemnegoArt7aUst4, src.KwotaPodatkuPoZwolnieniuGazuZiemnegoArt7aUst6Pkt1, src.KwotaPodatkuPoZwolnieniuGazuZiemnegoArt7aUst6Pkt2, src.KwotaPodatkuPoZwolnieniuGazuZiemnegoArt7aUst8, src.KwotaPodatkuPoZwolnieniuRopyNaftowejArt7aUst7Pkt1, src.KwotaPodatkuPoZwolnieniuRopyNaftowejArt7aUst7Pkt2, src.KwotaPodatkuPoZwolnieniuRopyNaftowejArt7aUst8);
SET @Merged = 1;
END


--AKCUA_Deklaracja
IF @TableName = 'AKCUA_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCUA_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCUA_Deklaracja)
MERGE INTO zef2DP.AKCUA_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.AKCUA_Deklaracja AS src
ON (tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN  MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.LoginUzytkownikaWprowadzDok=src.LoginUzytkownikaWprowadzDok, tgt.CzyZweryfikowany=src.CzyZweryfikowany, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.NumerZPNW=src.NumerZPNW, tgt.NumerDokumentu=src.NumerDokumentu, tgt.NumerPaczki=src.NumerPaczki, tgt.SystemZrodlowy=src.SystemZrodlowy, tgt.MigracjaReczna=src.MigracjaReczna, tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.StatusDokumentu=src.StatusDokumentu, tgt.NumerVATUE=src.NumerVATUE, tgt.Zarachowanie=src.Zarachowanie, tgt.PowodZarachowania=src.PowodZarachowania, tgt.KodUrzeduSkarbowego=src.KodUrzeduSkarbowego, tgt.UrzadSkarbowyDoKtoregoAdresowaneNazwa=src.UrzadSkarbowyDoKtoregoAdresowaneNazwa, tgt.DeklaracjaCzyKorekta=src.DeklaracjaCzyKorekta, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.NumerDokumentuPierwotnego=src.NumerDokumentuPierwotnego, tgt.UzasadnienieKorekty=src.UzasadnienieKorekty, tgt.RodzajKorekty=src.RodzajKorekty, tgt.DataDoreczeniaKorektyZUrzedu=src.DataDoreczeniaKorektyZUrzedu, tgt.DataDoWniesieniaSprzeciwu=src.DataDoWniesieniaSprzeciwu, tgt.CzySprzeciwDoKorektyZUrzedu=src.CzySprzeciwDoKorektyZUrzedu, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.KwotaZnakowAkcyzy=src.KwotaZnakowAkcyzy, tgt.DoZaplaty=src.DoZaplaty, tgt.NumerZabezpieczenia=src.NumerZabezpieczenia, tgt.KwotaZwolnienia=src.KwotaZwolnienia, tgt.ImiePelnomocnika=src.ImiePelnomocnika, tgt.NazwiskoPelnomocnika=src.NazwiskoPelnomocnika, tgt.TelefonPodatnikaLubPelnomocnika=src.TelefonPodatnikaLubPelnomocnika, tgt.EmailPodatnikaLubPelnomocnika=src.EmailPodatnikaLubPelnomocnika, tgt.SprawdzPelnomocnictwa=src.SprawdzPelnomocnictwa, tgt.UwagiUrzeduSkarbowego=src.UwagiUrzeduSkarbowego, tgt.FormaZlozeniaDok=src.FormaZlozeniaDok, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, LoginUzytkownikaWprowadzDok, CzyZweryfikowany, NIPLubPESELPodatnika, NumerZPNW, NumerDokumentu, NumerPaczki, SystemZrodlowy, MigracjaReczna, DokumentArchiwalny, StatusDokumentu, NumerVATUE, Zarachowanie, PowodZarachowania, KodUrzeduSkarbowego, UrzadSkarbowyDoKtoregoAdresowaneNazwa, DeklaracjaCzyKorekta, DataZlozeniaDok, DataWplywuDok, NumerDokumentuPierwotnego, UzasadnienieKorekty, RodzajKorekty, DataDoreczeniaKorektyZUrzedu, DataDoWniesieniaSprzeciwu, CzySprzeciwDoKorektyZUrzedu, RazemKwotaPodatku, ZwolnieniaObnizenia, KwotaZnakowAkcyzy, DoZaplaty, NumerZabezpieczenia, KwotaZwolnienia, ImiePelnomocnika, NazwiskoPelnomocnika, TelefonPodatnikaLubPelnomocnika, EmailPodatnikaLubPelnomocnika, SprawdzPelnomocnictwa, UwagiUrzeduSkarbowego, FormaZlozeniaDok, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.LoginUzytkownikaWprowadzDok, src.CzyZweryfikowany, src.NIPLubPESELPodatnika, src.NumerZPNW, src.NumerDokumentu, src.NumerPaczki, src.SystemZrodlowy, src.MigracjaReczna, src.DokumentArchiwalny, src.StatusDokumentu, src.NumerVATUE, src.Zarachowanie, src.PowodZarachowania, src.KodUrzeduSkarbowego, src.UrzadSkarbowyDoKtoregoAdresowaneNazwa, src.DeklaracjaCzyKorekta, src.DataZlozeniaDok, src.DataWplywuDok, src.NumerDokumentuPierwotnego, src.UzasadnienieKorekty, src.RodzajKorekty, src.DataDoreczeniaKorektyZUrzedu, src.DataDoWniesieniaSprzeciwu, src.CzySprzeciwDoKorektyZUrzedu, src.RazemKwotaPodatku, src.ZwolnieniaObnizenia, src.KwotaZnakowAkcyzy, src.DoZaplaty, src.NumerZabezpieczenia, src.KwotaZwolnienia, src.ImiePelnomocnika, src.NazwiskoPelnomocnika, src.TelefonPodatnikaLubPelnomocnika, src.EmailPodatnikaLubPelnomocnika, src.SprawdzPelnomocnictwa, src.UwagiUrzeduSkarbowego, src.FormaZlozeniaDok, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END

--AKCUA_Towary
IF @TableName = 'AKCUA_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCUA_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCUA_Towary)
MERGE INTO zef2DP.AKCUA_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKCUA_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN  MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.NazwaGrupyWyrobow=src.NazwaGrupyWyrobow, tgt.NazwaWyrobu=src.NazwaWyrobu, tgt.DataPowstaniaObowPodatk=src.DataPowstaniaObowPodatk, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.DataPlatnosci=src.DataPlatnosci, tgt.KodCN=src.KodCN, tgt.PodstawObliczPodatkuIloscWyrobow=src.PodstawObliczPodatkuIloscWyrobow, tgt.PodstawObliczPodatkuWartoscWyrobow=src.PodstawObliczPodatkuWartoscWyrobow, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.StawkaPodatkuKwota=src.StawkaPodatkuKwota, tgt.MinimalnaStawkaPodatkuOdWyrTytoniowych=src.MinimalnaStawkaPodatkuOdWyrTytoniowych, tgt.KwotaPodatku=src.KwotaPodatku, tgt.StawkaSpozaISZTAR=src.StawkaSpozaISZTAR, tgt.RodzajStawkiSpozaISZTAR=src.RodzajStawkiSpozaISZTAR, tgt.StawkaPodatkuSpozaISZTAR=src.StawkaPodatkuSpozaISZTAR, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, NazwaGrupyWyrobow, NazwaWyrobu, DataPowstaniaObowPodatk, TerminPlatnosci, DataPlatnosci, KodCN, PodstawObliczPodatkuIloscWyrobow, PodstawObliczPodatkuWartoscWyrobow, StawkaPodatkuProcent, StawkaPodatkuKwota, MinimalnaStawkaPodatkuOdWyrTytoniowych, KwotaPodatku, StawkaSpozaISZTAR, RodzajStawkiSpozaISZTAR, StawkaPodatkuSpozaISZTAR, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.NazwaGrupyWyrobow, src.NazwaWyrobu, src.DataPowstaniaObowPodatk, src.TerminPlatnosci, src.DataPlatnosci, src.KodCN, src.PodstawObliczPodatkuIloscWyrobow, src.PodstawObliczPodatkuWartoscWyrobow, src.StawkaPodatkuProcent, src.StawkaPodatkuKwota, src.MinimalnaStawkaPodatkuOdWyrTytoniowych, src.KwotaPodatku, src.StawkaSpozaISZTAR, src.RodzajStawkiSpozaISZTAR, src.StawkaPodatkuSpozaISZTAR, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END

--AKCUS_Deklaracja
IF @TableName = 'AKCUS_Deklaracja' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCUS_Deklaracja WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCUS_Deklaracja)
MERGE INTO zef2DP.AKCUS_Deklaracja AS tgt
USING WA_StageHurtownia.zef2DP.AKCUS_Deklaracja AS src
ON (tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN  MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.LoginUzytkownikaWprowadzDok=src.LoginUzytkownikaWprowadzDok, tgt.CzyZweryfikowany=src.CzyZweryfikowany, tgt.NIPLubPESELPodatnika=src.NIPLubPESELPodatnika, tgt.NumerDokumentu=src.NumerDokumentu, tgt.NumerPaczki=src.NumerPaczki, tgt.SystemZrodlowy=src.SystemZrodlowy, tgt.StatusDokumentu=src.StatusDokumentu, tgt.NumerVATUE=src.NumerVATUE, tgt.Zarachowanie=src.Zarachowanie, tgt.PowodZarachowania=src.PowodZarachowania, tgt.KodUrzeduSkarbowego=src.KodUrzeduSkarbowego, tgt.UrzadSkarbowyDoKtoregoAdresowaneNazwa=src.UrzadSkarbowyDoKtoregoAdresowaneNazwa, tgt.DeklaracjaCzyKorekta=src.DeklaracjaCzyKorekta, tgt.DataZlozeniaDok=src.DataZlozeniaDok, tgt.DataWplywuDok=src.DataWplywuDok, tgt.NumerDokumentuPierwotnego=src.NumerDokumentuPierwotnego, tgt.UzasadnienieKorekty=src.UzasadnienieKorekty, tgt.RodzajKorekty=src.RodzajKorekty, tgt.DataDoreczeniaKorektyZUrzedu=src.DataDoreczeniaKorektyZUrzedu, tgt.DataDoWniesieniaSprzeciwu=src.DataDoWniesieniaSprzeciwu, tgt.CzySprzeciwDoKorektyZUrzedu=src.CzySprzeciwDoKorektyZUrzedu, tgt.RazemKwotaPodatku=src.RazemKwotaPodatku, tgt.ZwolnieniaObnizenia=src.ZwolnieniaObnizenia, tgt.DoZaplaty=src.DoZaplaty, tgt.TypIdentyfikatoraPelnomocnika=src.TypIdentyfikatoraPelnomocnika, tgt.IdentyfikatorPelnomocnika=src.IdentyfikatorPelnomocnika, tgt.ImiePelnomocnika=src.ImiePelnomocnika, tgt.NazwiskoPelnomocnika=src.NazwiskoPelnomocnika, tgt.TelefonPodatnikaLubPelnomocnika=src.TelefonPodatnikaLubPelnomocnika, tgt.EmailPodatnikaLubPelnomocnika=src.EmailPodatnikaLubPelnomocnika, tgt.SprawdzPelnomocnictwa=src.SprawdzPelnomocnictwa, tgt.UwagiUrzeduSkarbowego=src.UwagiUrzeduSkarbowego, tgt.FormaZlozeniaDok=src.FormaZlozeniaDok, tgt.DataZlozeniaDeklaracjiPierwotnej=src.DataZlozeniaDeklaracjiPierwotnej, tgt.CzyOstatniaWersjaDeklaracji=src.CzyOstatniaWersjaDeklaracji, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, LoginUzytkownikaWprowadzDok, CzyZweryfikowany, NIPLubPESELPodatnika, NumerDokumentu, NumerPaczki, SystemZrodlowy, StatusDokumentu, NumerVATUE, Zarachowanie, PowodZarachowania, KodUrzeduSkarbowego, UrzadSkarbowyDoKtoregoAdresowaneNazwa, DeklaracjaCzyKorekta, DataZlozeniaDok, DataWplywuDok, NumerDokumentuPierwotnego, UzasadnienieKorekty, RodzajKorekty, DataDoreczeniaKorektyZUrzedu, DataDoWniesieniaSprzeciwu, CzySprzeciwDoKorektyZUrzedu, RazemKwotaPodatku, ZwolnieniaObnizenia, DoZaplaty, TypIdentyfikatoraPelnomocnika, IdentyfikatorPelnomocnika, ImiePelnomocnika, NazwiskoPelnomocnika, TelefonPodatnikaLubPelnomocnika, EmailPodatnikaLubPelnomocnika, SprawdzPelnomocnictwa, UwagiUrzeduSkarbowego, FormaZlozeniaDok, DataZlozeniaDeklaracjiPierwotnej, CzyOstatniaWersjaDeklaracji, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.LoginUzytkownikaWprowadzDok, src.CzyZweryfikowany, src.NIPLubPESELPodatnika, src.NumerDokumentu, src.NumerPaczki, src.SystemZrodlowy, src.StatusDokumentu, src.NumerVATUE, src.Zarachowanie, src.PowodZarachowania, src.KodUrzeduSkarbowego, src.UrzadSkarbowyDoKtoregoAdresowaneNazwa, src.DeklaracjaCzyKorekta, src.DataZlozeniaDok, src.DataWplywuDok, src.NumerDokumentuPierwotnego, src.UzasadnienieKorekty, src.RodzajKorekty, src.DataDoreczeniaKorektyZUrzedu, src.DataDoWniesieniaSprzeciwu, src.CzySprzeciwDoKorektyZUrzedu, src.RazemKwotaPodatku, src.ZwolnieniaObnizenia, src.DoZaplaty, src.TypIdentyfikatoraPelnomocnika, src.IdentyfikatorPelnomocnika, src.ImiePelnomocnika, src.NazwiskoPelnomocnika, src.TelefonPodatnikaLubPelnomocnika, src.EmailPodatnikaLubPelnomocnika, src.SprawdzPelnomocnictwa, src.UwagiUrzeduSkarbowego, src.FormaZlozeniaDok, src.DataZlozeniaDeklaracjiPierwotnej, src.CzyOstatniaWersjaDeklaracji, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END

--AKCUS_Towary
IF @TableName = 'AKCUS_Towary' BEGIN 
DELETE FROM WA_Hurtownia.zef2DP.AKCUS_Towary WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DP.AKCUS_Towary)
MERGE INTO zef2DP.AKCUS_Towary AS tgt
USING WA_StageHurtownia.zef2DP.AKCUS_Towary AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml AND tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu)
WHEN  MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.DataPowstaniaObowPodatk=src.DataPowstaniaObowPodatk, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.DataPlatnosci=src.DataPlatnosci, tgt.StanSamochodu=src.StanSamochodu, tgt.Marka=src.Marka, tgt.Model=src.Model, tgt.RokProdukcji=src.RokProdukcji, tgt.SposobNapedu=src.SposobNapedu, tgt.PojemnoscSkokowaSilnika=src.PojemnoscSkokowaSilnika, tgt.PrzebiegKm=src.PrzebiegKm, tgt.NiestandardowyNumerVIN=src.NiestandardowyNumerVIN, tgt.NumerVIN=src.NumerVIN, tgt.NumerVINDotyczy=src.NumerVINDotyczy, tgt.MocSilnikaKW=src.MocSilnikaKW, tgt.RodzajSkrzyniBiegow=src.RodzajSkrzyniBiegow, tgt.StanTechniczny=src.StanTechniczny, tgt.PodstawObliczPodatkuWartoscWyrobow=src.PodstawObliczPodatkuWartoscWyrobow, tgt.StawkaPodatkuProcent=src.StawkaPodatkuProcent, tgt.KwotaPodatku=src.KwotaPodatku, tgt.MieniePrzesiedlencze=src.MieniePrzesiedlencze, tgt.Wspolwlasnosc=src.Wspolwlasnosc, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, DataPowstaniaObowPodatk, TerminPlatnosci, DataPlatnosci, StanSamochodu, Marka, Model, RokProdukcji, SposobNapedu, PojemnoscSkokowaSilnika, PrzebiegKm, NiestandardowyNumerVIN, NumerVIN, NumerVINDotyczy, MocSilnikaKW, RodzajSkrzyniBiegow, StanTechniczny, PodstawObliczPodatkuWartoscWyrobow, StawkaPodatkuProcent, KwotaPodatku, MieniePrzesiedlencze, Wspolwlasnosc, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.DataPowstaniaObowPodatk, src.TerminPlatnosci, src.DataPlatnosci, src.StanSamochodu, src.Marka, src.Model, src.RokProdukcji, src.SposobNapedu, src.PojemnoscSkokowaSilnika, src.PrzebiegKm, src.NiestandardowyNumerVIN, src.NumerVIN, src.NumerVINDotyczy, src.MocSilnikaKW, src.RodzajSkrzyniBiegow, src.StanTechniczny, src.PodstawObliczPodatkuWartoscWyrobow, src.StawkaPodatkuProcent, src.KwotaPodatku, src.MieniePrzesiedlencze, src.Wspolwlasnosc, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
END





IF (@Merged = 0)
	BEGIN
			DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
			THROW 51002, @Info, 0;
				END
			END;