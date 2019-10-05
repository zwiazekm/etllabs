-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-07-28
-- Description:	Merge z WA_StageHurtownia do WA_Hurtownia
-- =============================================

CREATE PROCEDURE [pta].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END

	IF @TableName = 'AD_Dokument' BEGIN
		MERGE INTO pta.AD_Dokument AS tgt
		USING [WA_StageHurtownia].pta.AD_Dokument AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ARC=src.ARC, tgt.Status=src.Status, tgt.NrPorzadkowy=src.NrPorzadkowy, tgt.LRN=src.LRN, tgt.MRN=src.MRN, tgt.CzyMiejsceWysylkiKrajowe=src.CzyMiejsceWysylkiKrajowe, tgt.CzyPrzemieszczenieKrajowe=src.CzyPrzemieszczenieKrajowe, tgt.KodPrzemieszczenia=src.KodPrzemieszczenia, tgt.DataPowiadomieniaKontroli=src.DataPowiadomieniaKontroli, tgt.DataCzasZatwierdzeniaAD=src.DataCzasZatwierdzeniaAD, tgt.DataEksportu=src.DataEksportu, tgt.DataUniewaznienia=src.DataUniewaznienia, tgt.DataCzasZatwierdzeniaUzup=src.DataCzasZatwierdzeniaUzup, tgt.DataRaportuODostarczeniu=src.DataRaportuODostarczeniu, tgt.DataCzasWysylki=src.DataCzasWysylki, tgt.TypZgloszenia=src.TypZgloszenia, tgt.KodRodzMiejscaPochRozpPrzem=src.KodRodzMiejscaPochRozpPrzem, tgt.KodRodzMiejscaPrzezn=src.KodRodzMiejscaPrzezn, tgt.CzasPrzewozu=src.CzasPrzewozu, tgt.OrganizacjaPrzewozu=src.OrganizacjaPrzewozu, tgt.FlagaOdroczeniaPotwierdzenia=src.FlagaOdroczeniaPotwierdzenia, tgt.NrFaktury=src.NrFaktury, tgt.DataFaktury=src.DataFaktury, tgt.WysylajacyNrAkcyzowy=src.WysylajacyNrAkcyzowy, tgt.WysylajacyNazwa=src.WysylajacyNazwa, tgt.WysylajacyUlica=src.WysylajacyUlica, tgt.WysylajacyNrDomu=src.WysylajacyNrDomu, tgt.WysylajacyKodPocztowy=src.WysylajacyKodPocztowy, tgt.WysylajacyMiejscowosc=src.WysylajacyMiejscowosc, tgt.MiejsceWysylkiNrSkladuPod=src.MiejsceWysylkiNrSkladuPod, tgt.MiejsceWysylkiNazwaPodm=src.MiejsceWysylkiNazwaPodm, tgt.MiejsceWysylkiUlica=src.MiejsceWysylkiUlica, tgt.MiejsceWysylkiNrDomu=src.MiejsceWysylkiNrDomu, tgt.MiejsceWysylkiKodPocztowy=src.MiejsceWysylkiKodPocztowy, tgt.MiejsceWysylkiMiejscowosc=src.MiejsceWysylkiMiejscowosc, tgt.UrzadNadzoruWMiejscuWysylki=src.UrzadNadzoruWMiejscuWysylki, tgt.UrzadKontroliWMiejscuWysylki=src.UrzadKontroliWMiejscuWysylki, tgt.OddzialDoKontroliWMiejscuZgloszenia=src.OddzialDoKontroliWMiejscuZgloszenia, tgt.OdbierajacyIdentyfikacja=src.OdbierajacyIdentyfikacja, tgt.OdbierajacyNazwa=src.OdbierajacyNazwa, tgt.OdbierajacyUlica=src.OdbierajacyUlica, tgt.OdbierajacyNrDomu=src.OdbierajacyNrDomu, tgt.OdbierajacyKodPocztowy=src.OdbierajacyKodPocztowy, tgt.OdbierajacyMiejscowosc=src.OdbierajacyMiejscowosc, tgt.UzupOdbierajacyKodKraju=src.UzupOdbierajacyKodKraju, tgt.UzupOdbierajacyNrSwiadectwaZwol=src.UzupOdbierajacyNrSwiadectwaZwol, tgt.CzyOdbierajacyZmieniony=src.CzyOdbierajacyZmieniony, tgt.MiejsceDostawyIdentyfikacja=src.MiejsceDostawyIdentyfikacja, tgt.MiejsceDostawyNazwaPodm=src.MiejsceDostawyNazwaPodm, tgt.MiejsceDostawyUlica=src.MiejsceDostawyUlica, tgt.MiejsceDostawyNrDomu=src.MiejsceDostawyNrDomu, tgt.MiejsceDostawyKodPocztowy=src.MiejsceDostawyKodPocztowy, tgt.MiejsceDostawyMiejscowosc=src.MiejsceDostawyMiejscowosc, tgt.UrzadNadzoruWMiejscuOdbioru=src.UrzadNadzoruWMiejscuOdbioru, tgt.UrzadKontroliWMiejscuOdbioru=src.UrzadKontroliWMiejscuOdbioru, tgt.GwarantKodRodz=src.GwarantKodRodz, tgt.GRN=src.GRN, tgt.OdbierajacyTIN=src.OdbierajacyTIN, tgt.GwarantTIN=src.GwarantTIN, tgt.KwotaGwarancji=src.KwotaGwarancji, tgt.PozostalaKwotaGwarancji=src.PozostalaKwotaGwarancji, tgt.BrakujacaKwotaGwarancji=src.BrakujacaKwotaGwarancji, tgt.Gwarant1NrAkcyzowy=src.Gwarant1NrAkcyzowy, tgt.Gwarant1Nazwa=src.Gwarant1Nazwa, tgt.Gwarant1Ulica=src.Gwarant1Ulica, tgt.Gwarant1NrDomu=src.Gwarant1NrDomu, tgt.Gwarant1KodPocztowy=src.Gwarant1KodPocztowy, tgt.Gwarant1Miejscowosc=src.Gwarant1Miejscowosc, tgt.Gwarant1NrVAT=src.Gwarant1NrVAT, tgt.Gwarant2NrAkcyzowy=src.Gwarant2NrAkcyzowy, tgt.Gwarant2Nazwa=src.Gwarant2Nazwa, tgt.Gwarant2Ulica=src.Gwarant2Ulica, tgt.Gwarant2NrDomu=src.Gwarant2NrDomu, tgt.Gwarant2KodPocztowy=src.Gwarant2KodPocztowy, tgt.Gwarant2Miejscowosc=src.Gwarant2Miejscowosc, tgt.Gwarant2NrVAT=src.Gwarant2NrVAT, tgt.TransportKodRodz=src.TransportKodRodz, tgt.OrganizatorTranspNrVAT=src.OrganizatorTranspNrVAT, tgt.OrganizatorTranspNazwa=src.OrganizatorTranspNazwa, tgt.OrganizatorTranspUlica=src.OrganizatorTranspUlica, tgt.OrganizatorTranspNrDomu=src.OrganizatorTranspNrDomu, tgt.OrganizatorTranspKodPocztowy=src.OrganizatorTranspKodPocztowy
		WHEN NOT MATCHED
		THEN INSERT (Id, ARC, Status, NrPorzadkowy, LRN, MRN, CzyMiejsceWysylkiKrajowe, CzyPrzemieszczenieKrajowe, KodPrzemieszczenia, DataPowiadomieniaKontroli, DataCzasZatwierdzeniaAD, DataEksportu, DataUniewaznienia, DataCzasZatwierdzeniaUzup, DataRaportuODostarczeniu, DataCzasWysylki, TypZgloszenia, KodRodzMiejscaPochRozpPrzem, KodRodzMiejscaPrzezn, CzasPrzewozu, OrganizacjaPrzewozu, FlagaOdroczeniaPotwierdzenia, NrFaktury, DataFaktury, WysylajacyNrAkcyzowy, WysylajacyNazwa, WysylajacyUlica, WysylajacyNrDomu, WysylajacyKodPocztowy, WysylajacyMiejscowosc, MiejsceWysylkiNrSkladuPod, MiejsceWysylkiNazwaPodm, MiejsceWysylkiUlica, MiejsceWysylkiNrDomu, MiejsceWysylkiKodPocztowy, MiejsceWysylkiMiejscowosc, UrzadNadzoruWMiejscuWysylki, UrzadKontroliWMiejscuWysylki, OddzialDoKontroliWMiejscuZgloszenia, OdbierajacyIdentyfikacja, OdbierajacyNazwa, OdbierajacyUlica, OdbierajacyNrDomu, OdbierajacyKodPocztowy, OdbierajacyMiejscowosc, UzupOdbierajacyKodKraju, UzupOdbierajacyNrSwiadectwaZwol, CzyOdbierajacyZmieniony, MiejsceDostawyIdentyfikacja, MiejsceDostawyNazwaPodm, MiejsceDostawyUlica, MiejsceDostawyNrDomu, MiejsceDostawyKodPocztowy, MiejsceDostawyMiejscowosc, UrzadNadzoruWMiejscuOdbioru, UrzadKontroliWMiejscuOdbioru, GwarantKodRodz, GRN, OdbierajacyTIN, GwarantTIN, KwotaGwarancji, PozostalaKwotaGwarancji, BrakujacaKwotaGwarancji, Gwarant1NrAkcyzowy, Gwarant1Nazwa, Gwarant1Ulica, Gwarant1NrDomu, Gwarant1KodPocztowy, Gwarant1Miejscowosc, Gwarant1NrVAT, Gwarant2NrAkcyzowy, Gwarant2Nazwa, Gwarant2Ulica, Gwarant2NrDomu, Gwarant2KodPocztowy, Gwarant2Miejscowosc, Gwarant2NrVAT, TransportKodRodz, OrganizatorTranspNrVAT, OrganizatorTranspNazwa, OrganizatorTranspUlica, OrganizatorTranspNrDomu, OrganizatorTranspKodPocztowy, OrganizatorTranspMiejscowosc, PierwszyPrzewoznikNrVAT, PierwszyPrzewoznikNazwa, PierwszyPrzewoznikUlica, PierwszyPrzewoznikNrDomu, PierwszyPrzewoznikKodPocztowy, PierwszyPrzewoznikMiejscowosc, CzyPrzewoznikZmieniony, CzySkontrolowanoMiejsceWysylki, CzySkontrolowanoMiejsceDostawy, CzyPowiadomionoODostarczeniu, CzyOpozniony, CzyWyjasnieniaZgloszonePrzezWysylajacego, CzyWyjasnieniaZgloszonePrzezOdbierajacego, CzyPrzemieszczeniePrzeterminowane, NadrzednyARC, DataOdrzuceniaLubOstrzezenia, DataPodzialuPrzesylki)
		VALUES (src.Id, src.ARC, src.Status, src.NrPorzadkowy, src.LRN, src.MRN, src.CzyMiejsceWysylkiKrajowe, src.CzyPrzemieszczenieKrajowe, src.KodPrzemieszczenia, src.DataPowiadomieniaKontroli, src.DataCzasZatwierdzeniaAD, src.DataEksportu, src.DataUniewaznienia, src.DataCzasZatwierdzeniaUzup, src.DataRaportuODostarczeniu, src.DataCzasWysylki, src.TypZgloszenia, src.KodRodzMiejscaPochRozpPrzem, src.KodRodzMiejscaPrzezn, src.CzasPrzewozu, src.OrganizacjaPrzewozu, src.FlagaOdroczeniaPotwierdzenia, src.NrFaktury, src.DataFaktury, src.WysylajacyNrAkcyzowy, src.WysylajacyNazwa, src.WysylajacyUlica, src.WysylajacyNrDomu, src.WysylajacyKodPocztowy, src.WysylajacyMiejscowosc, src.MiejsceWysylkiNrSkladuPod, src.MiejsceWysylkiNazwaPodm, src.MiejsceWysylkiUlica, src.MiejsceWysylkiNrDomu, src.MiejsceWysylkiKodPocztowy, src.MiejsceWysylkiMiejscowosc, src.UrzadNadzoruWMiejscuWysylki, src.UrzadKontroliWMiejscuWysylki, src.OddzialDoKontroliWMiejscuZgloszenia, src.OdbierajacyIdentyfikacja, src.OdbierajacyNazwa, src.OdbierajacyUlica, src.OdbierajacyNrDomu, src.OdbierajacyKodPocztowy, src.OdbierajacyMiejscowosc, src.UzupOdbierajacyKodKraju, src.UzupOdbierajacyNrSwiadectwaZwol, src.CzyOdbierajacyZmieniony, src.MiejsceDostawyIdentyfikacja, src.MiejsceDostawyNazwaPodm, src.MiejsceDostawyUlica, src.MiejsceDostawyNrDomu, src.MiejsceDostawyKodPocztowy, src.MiejsceDostawyMiejscowosc, src.UrzadNadzoruWMiejscuOdbioru, src.UrzadKontroliWMiejscuOdbioru, src.GwarantKodRodz, src.GRN, src.OdbierajacyTIN, src.GwarantTIN, src.KwotaGwarancji, src.PozostalaKwotaGwarancji, src.BrakujacaKwotaGwarancji, src.Gwarant1NrAkcyzowy, src.Gwarant1Nazwa, src.Gwarant1Ulica, src.Gwarant1NrDomu, src.Gwarant1KodPocztowy, src.Gwarant1Miejscowosc, src.Gwarant1NrVAT, src.Gwarant2NrAkcyzowy, src.Gwarant2Nazwa, src.Gwarant2Ulica, src.Gwarant2NrDomu, src.Gwarant2KodPocztowy, src.Gwarant2Miejscowosc, src.Gwarant2NrVAT, src.TransportKodRodz, src.OrganizatorTranspNrVAT, src.OrganizatorTranspNazwa, src.OrganizatorTranspUlica, src.OrganizatorTranspNrDomu, src.OrganizatorTranspKodPocztowy, src.OrganizatorTranspMiejscowosc, src.PierwszyPrzewoznikNrVAT, src.PierwszyPrzewoznikNazwa, src.PierwszyPrzewoznikUlica, src.PierwszyPrzewoznikNrDomu, src.PierwszyPrzewoznikKodPocztowy, src.PierwszyPrzewoznikMiejscowosc, src.CzyPrzewoznikZmieniony, src.CzySkontrolowanoMiejsceWysylki, src.CzySkontrolowanoMiejsceDostawy, src.CzyPowiadomionoODostarczeniu, src.CzyOpozniony, src.CzyWyjasnieniaZgloszonePrzezWysylajacego, src.CzyWyjasnieniaZgloszonePrzezOdbierajacego, src.CzyPrzemieszczeniePrzeterminowane, src.NadrzednyARC, src.DataOdrzuceniaLubOstrzezenia, src.DataPodzialuPrzesylki);
		SET @Merged = 1; 
	END
	
	IF @TableName = 'AD_SADPrzywozu' BEGIN
		MERGE INTO pta.AD_SADPrzywozu AS tgt
		USING [WA_StageHurtownia].pta.AD_SADPrzywozu AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrSAD=src.NrSAD, tgt.IdDokAD=src.IdDokAD
		WHEN NOT MATCHED
		THEN INSERT (Id, NrSAD, IdDokAD)
		VALUES (src.Id, src.NrSAD, src.IdDokAD);	
		SET @Merged = 1; 
	END
	
	IF @TableName = 'AD_SzczegolyTransportu' BEGIN
		MERGE INTO pta.AD_SzczegolyTransportu AS tgt
		USING [WA_StageHurtownia].pta.AD_SzczegolyTransportu AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodJednTransp=src.KodJednTransp, tgt.OznJednTransp=src.OznJednTransp, tgt.OznaczeniePieczecHandl=src.OznaczeniePieczecHandl, tgt.InfPieczec=src.InfPieczec, tgt.InfPieczecKodJezyka=src.InfPieczecKodJezyka, tgt.DodInf=src.DodInf, tgt.DodInfKodJezyka=src.DodInfKodJezyka, tgt.IdDokAD=src.IdDokAD
		WHEN NOT MATCHED
		THEN INSERT (Id, KodJednTransp, OznJednTransp, OznaczeniePieczecHandl, InfPieczec, InfPieczecKodJezyka, DodInf, DodInfKodJezyka, IdDokAD)
		VALUES (src.Id, src.KodJednTransp, src.OznJednTransp, src.OznaczeniePieczecHandl, src.InfPieczec, src.InfPieczecKodJezyka, src.DodInf, src.DodInfKodJezyka, src.IdDokAD);
		SET @Merged = 1; 
	END
	
	IF @TableName = 'AD_Wyrob' BEGIN
		MERGE INTO pta.AD_Wyrob AS tgt
		USING [WA_StageHurtownia].pta.AD_Wyrob AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdPozycjiTowarowej=src.IdPozycjiTowarowej, tgt.KategoriaWyrobuAkcyzowego=src.KategoriaWyrobuAkcyzowego, tgt.KodWyrobuAkcyzowego=src.KodWyrobuAkcyzowego, tgt.KodCN=src.KodCN, tgt.Ilosc=src.Ilosc, tgt.PozostalaIlosc=src.PozostalaIlosc, tgt.IloscDodJednMiary=src.IloscDodJednMiary, tgt.IloscDodJednMiaryPoOdbiorze=src.IloscDodJednMiaryPoOdbiorze, tgt.MasaBrutto=src.MasaBrutto, tgt.PozostalaWagaBrutto=src.PozostalaWagaBrutto, tgt.MasaNetto=src.MasaNetto, tgt.PozostalaWagaNetto=src.PozostalaWagaNetto, tgt.ZawartoscAlkoholu=src.ZawartoscAlkoholu, tgt.StopienPlato=src.StopienPlato, tgt.TypPaliwa=src.TypPaliwa, tgt.OlejeNiebarwioneINieoznaczane=src.OlejeNiebarwioneINieoznaczane, tgt.IloscDodanychBiokomponentow=src.IloscDodanychBiokomponentow, tgt.MaksymalnaCenaDetaliczna=src.MaksymalnaCenaDetaliczna, tgt.ZnakiAkcyzy=src.ZnakiAkcyzy, tgt.ZnakAkcyzy=src.ZnakAkcyzy, tgt.MiejscePochodzenia=src.MiejscePochodzenia, tgt.WielkoscProducenta=src.WielkoscProducenta, tgt.Gestosc=src.Gestosc, tgt.OpisHandlowy=src.OpisHandlowy, tgt.MarkaWyrobow=src.MarkaWyrobow, tgt.KategoriaWyrobuWiniarskiego=src.KategoriaWyrobuWiniarskiego, tgt.KodStrefyUprawyWinorosli=src.KodStrefyUprawyWinorosli, tgt.KrajTrzeciPochodzeniaWino=src.KrajTrzeciPochodzeniaWino, tgt.DodInfWino=src.DodInfWino, tgt.NiedoborLubNadwyzka=src.NiedoborLubNadwyzka, tgt.IloscNiedoboruLubNadwyzki=src.IloscNiedoboruLubNadwyzki, tgt.KwotaGwarancji=src.KwotaGwarancji, tgt.PozostalaKwotaGwarancji=src.PozostalaKwotaGwarancji, tgt.BrakujacaKwotaGwarancji=src.BrakujacaKwotaGwarancji, tgt.PotwProduktDostarczony=src.PotwProduktDostarczony, tgt.IdDokAD=src.IdDokAD, tgt.BiokomponentyCzySpelWymJakosc=src.BiokomponentyCzySpelWymJakosc
		WHEN NOT MATCHED
		THEN INSERT (Id, IdPozycjiTowarowej, KategoriaWyrobuAkcyzowego, KodWyrobuAkcyzowego, KodCN, Ilosc, PozostalaIlosc, IloscDodJednMiary, IloscDodJednMiaryPoOdbiorze, MasaBrutto, PozostalaWagaBrutto, MasaNetto, PozostalaWagaNetto, ZawartoscAlkoholu, StopienPlato, TypPaliwa, OlejeNiebarwioneINieoznaczane, IloscDodanychBiokomponentow, MaksymalnaCenaDetaliczna, ZnakiAkcyzy, ZnakAkcyzy, MiejscePochodzenia, WielkoscProducenta, Gestosc, OpisHandlowy, MarkaWyrobow, KategoriaWyrobuWiniarskiego, KodStrefyUprawyWinorosli, KrajTrzeciPochodzeniaWino, DodInfWino, NiedoborLubNadwyzka, IloscNiedoboruLubNadwyzki, KwotaGwarancji, PozostalaKwotaGwarancji, BrakujacaKwotaGwarancji, PotwProduktDostarczony, IdDokAD, BiokomponentyCzySpelWymJakosc)
		VALUES (src.Id, src.IdPozycjiTowarowej, src.KategoriaWyrobuAkcyzowego, src.KodWyrobuAkcyzowego, src.KodCN, src.Ilosc, src.PozostalaIlosc, src.IloscDodJednMiary, src.IloscDodJednMiaryPoOdbiorze, src.MasaBrutto, src.PozostalaWagaBrutto, src.MasaNetto, src.PozostalaWagaNetto, src.ZawartoscAlkoholu, src.StopienPlato, src.TypPaliwa, src.OlejeNiebarwioneINieoznaczane, src.IloscDodanychBiokomponentow, src.MaksymalnaCenaDetaliczna, src.ZnakiAkcyzy, src.ZnakAkcyzy, src.MiejscePochodzenia, src.WielkoscProducenta, src.Gestosc, src.OpisHandlowy, src.MarkaWyrobow, src.KategoriaWyrobuWiniarskiego, src.KodStrefyUprawyWinorosli, src.KrajTrzeciPochodzeniaWino, src.DodInfWino, src.NiedoborLubNadwyzka, src.IloscNiedoboruLubNadwyzki, src.KwotaGwarancji, src.PozostalaKwotaGwarancji, src.BrakujacaKwotaGwarancji, src.PotwProduktDostarczony, src.IdDokAD, src.BiokomponentyCzySpelWymJakosc);	
		SET @Merged = 1; 
	END
	
	IF @TableName = 'AD_Opakowanie' BEGIN
		MERGE INTO pta.AD_Opakowanie AS tgt
		USING [WA_StageHurtownia].pta.AD_Opakowanie AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodRodzOpakowan=src.KodRodzOpakowan, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.OznPieczecHandl=src.OznPieczecHandl, tgt.InfPieczecHandl=src.InfPieczecHandl, tgt.IdWyrobAD=src.IdWyrobAD
		WHEN NOT MATCHED
		THEN INSERT (Id, KodRodzOpakowan, LiczbaOpakowan, OznPieczecHandl, InfPieczecHandl, IdWyrobAD)
		VALUES (src.Id, src.KodRodzOpakowan, src.LiczbaOpakowan, src.OznPieczecHandl, src.InfPieczecHandl, src.IdWyrobAD);	
		SET @Merged = 1; 
	END
	
	IF @TableName = 'AD_KodCzynnosciWino' BEGIN
		MERGE INTO pta.AD_KodCzynnosciWino AS tgt
		USING [WA_StageHurtownia].pta.AD_KodCzynnosciWino AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodCzynnosciWino=src.KodCzynnosciWino, tgt.IdWyrobAD=src.IdWyrobAD
		WHEN NOT MATCHED
		THEN INSERT (Id, KodCzynnosciWino, IdWyrobAD)
		VALUES (src.Id, src.KodCzynnosciWino, src.IdWyrobAD);	
		SET @Merged = 1; 
	END
	
	IF @TableName = 'AD_Zaswiadczenie' BEGIN
		MERGE INTO pta.AD_Zaswiadczenie AS tgt
		USING [WA_StageHurtownia].pta.AD_Zaswiadczenie AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrDok=src.NrDok, tgt.KrotkiOpis=src.KrotkiOpis, tgt.IdDokAD=src.IdDokAD
		WHEN NOT MATCHED
		THEN INSERT (Id, NrDok, KrotkiOpis, IdDokAD)
		VALUES (src.Id, src.NrDok, src.KrotkiOpis, src.IdDokAD);	
		SET @Merged = 1; 
	END
	
	IF @TableName = 'AD_Podmiot' BEGIN
		MERGE INTO pta.AD_Podmiot AS tgt
		USING [WA_StageHurtownia].pta.AD_Podmiot AS src
		ON (tgt.NRA=src.NRA AND tgt.Typ=src.Typ)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nazwa=src.Nazwa, tgt.NIP=src.NIP, tgt.REGON=src.REGON, tgt.KodKraju=src.KodKraju, tgt.Ulica=src.Ulica, tgt.NrDomu=src.NrDomu, tgt.NrLokalu=src.NrLokalu, tgt.Miejscowosc=src.Miejscowosc, tgt.KodPocztowy=src.KodPocztowy, tgt.Poczta=src.Poczta, tgt.UCNadzoru=src.UCNadzoru, tgt.ObowiazujeOd=src.ObowiazujeOd, tgt.ObowiazujeDo=src.ObowiazujeDo, tgt.Wysylajacy=src.Wysylajacy, tgt.IntDomyslny=src.IntDomyslny, tgt.UCWydania=src.UCWydania, tgt.CzyDostawaBezposrednia=src.CzyDostawaBezposrednia, tgt.Wlasciciel=src.Wlasciciel
		WHEN NOT MATCHED
		THEN INSERT (NRA, Typ, Nazwa, NIP, REGON, KodKraju, Ulica, NrDomu, NrLokalu, Miejscowosc, KodPocztowy, Poczta, UCNadzoru, ObowiazujeOd, ObowiazujeDo, Wysylajacy, IntDomyslny, UCWydania, CzyDostawaBezposrednia, Wlasciciel)
		VALUES (src.NRA, src.Typ, src.Nazwa, src.NIP, src.REGON, src.KodKraju, src.Ulica, src.NrDomu, src.NrLokalu, src.Miejscowosc, src.KodPocztowy, src.Poczta, src.UCNadzoru, src.ObowiazujeOd, src.ObowiazujeDo, src.Wysylajacy, src.IntDomyslny, src.UCWydania, src.CzyDostawaBezposrednia, src.Wlasciciel);	
		SET @Merged = 1; 
	END
	
	IF @TableName = 'AD_Wlasciciel' BEGIN
		MERGE INTO pta.AD_Wlasciciel AS tgt
		USING [WA_StageHurtownia].pta.AD_Wlasciciel AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NRA=src.NRA, tgt.Typ=src.Typ, tgt.WlascicielNRA=src.WlascicielNRA, tgt.WlascicielTyp=src.WlascicielTyp
		WHEN NOT MATCHED
		THEN INSERT (Id, NRA, Typ, WlascicielNRA, WlascicielTyp)
		VALUES (src.Id, src.NRA, src.Typ, src.WlascicielNRA, src.WlascicielTyp);	
		SET @Merged = 1; 
	END
	
	IF @TableName = 'AD_MiejsceOdbioru' BEGIN
		MERGE INTO pta.AD_MiejsceOdbioru AS tgt
		USING [WA_StageHurtownia].pta.AD_MiejsceOdbioru AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.PodmiotNRA=src.PodmiotNRA, tgt.Nazwa=src.Nazwa, tgt.NrAkcyzowy=src.NrAkcyzowy, tgt.UCKontroli=src.UCKontroli, tgt.KodKraju=src.KodKraju, tgt.Ulica=src.Ulica, tgt.NrDomu=src.NrDomu, tgt.NrLokalu=src.NrLokalu, tgt.Miejscowosc=src.Miejscowosc, tgt.KodPocztowy=src.KodPocztowy, tgt.Poczta=src.Poczta, tgt.PodmiotTyp=src.PodmiotTyp
		WHEN NOT MATCHED
		THEN INSERT (Id, PodmiotNRA, Nazwa, NrAkcyzowy, UCKontroli, KodKraju, Ulica, NrDomu, NrLokalu, Miejscowosc, KodPocztowy, Poczta, PodmiotTyp)
		VALUES (src.Id, src.PodmiotNRA, src.Nazwa, src.NrAkcyzowy, src.UCKontroli, src.KodKraju, src.Ulica, src.NrDomu, src.NrLokalu, src.Miejscowosc, src.KodPocztowy, src.Poczta, src.PodmiotTyp);	
		SET @Merged = 1; 
	END
	
	IF @TableName = 'AD_TypZadania' BEGIN
		MERGE INTO pta.AD_TypZadania AS tgt
		USING [WA_StageHurtownia].pta.AD_TypZadania AS src
		ON (tgt.TypZadania=src.TypZadania)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (TypZadania, Opis)
		VALUES (src.TypZadania, src.Opis);	
		SET @Merged = 1; 
	END
	
	IF @TableName = 'AD_Zadanie' BEGIN
		MERGE INTO pta.AD_Zadanie AS tgt
		USING [WA_StageHurtownia].pta.AD_Zadanie AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Status=src.Status, tgt.TypZadania=src.TypZadania, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.OdpowiedzialnaRola=src.OdpowiedzialnaRola, tgt.OdpowiedzialnyUzytkownik=src.OdpowiedzialnyUzytkownik, tgt.UrzadCelnyNrRef=src.UrzadCelnyNrRef, tgt.Tytul=src.Tytul, tgt.IdDokAD=src.IdDokAD, tgt.PodmiotIdentyfikacja=src.PodmiotIdentyfikacja, tgt.PodmiotNazwa=src.PodmiotNazwa, tgt.PodmiotUlica=src.PodmiotUlica, tgt.PodmiotNrDomu=src.PodmiotNrDomu, tgt.PodmiotKodPocztowy=src.PodmiotKodPocztowy, tgt.PodmiotMiejscowosc=src.PodmiotMiejscowosc, tgt.KodPowoduOdrzuceniaCla=src.KodPowoduOdrzuceniaCla, tgt.NrRefDokumentu=src.NrRefDokumentu, tgt.DecyzjaKontroliDomyslna=src.DecyzjaKontroliDomyslna, tgt.DecyzjaKontroli=src.DecyzjaKontroli, tgt.Ilosc=src.Ilosc, tgt.CzyPrawidlowaOperacjaOSOZ=src.CzyPrawidlowaOperacjaOSOZ, tgt.DataUtworzenia=src.DataUtworzenia, tgt.DataZmian=src.DataZmian, tgt.ZmienionePrzez=src.ZmienionePrzez, tgt.WersjaAudytu=src.WersjaAudytu, tgt.ARC=src.ARC, tgt.LRN=src.LRN, tgt.NazwaMiejscaKontroli=src.NazwaMiejscaKontroli, tgt.CzyZadanieKontroli=src.CzyZadanieKontroli, tgt.DataPrzeladunku=src.DataPrzeladunku
		WHEN NOT MATCHED
		THEN INSERT (Id, Status, TypZadania, TerminPlatnosci, OdpowiedzialnaRola, OdpowiedzialnyUzytkownik, UrzadCelnyNrRef, Tytul, IdDokAD, PodmiotIdentyfikacja, PodmiotNazwa, PodmiotUlica, PodmiotNrDomu, PodmiotKodPocztowy, PodmiotMiejscowosc, KodPowoduOdrzuceniaCla, NrRefDokumentu, DecyzjaKontroliDomyslna, DecyzjaKontroli, Ilosc, CzyPrawidlowaOperacjaOSOZ, DataUtworzenia, DataZmian, ZmienionePrzez, WersjaAudytu, ARC, LRN, NazwaMiejscaKontroli, CzyZadanieKontroli, DataPrzeladunku)
		VALUES (src.Id, src.Status, src.TypZadania, src.TerminPlatnosci, src.OdpowiedzialnaRola, src.OdpowiedzialnyUzytkownik, src.UrzadCelnyNrRef, src.Tytul, src.IdDokAD, src.PodmiotIdentyfikacja, src.PodmiotNazwa, src.PodmiotUlica, src.PodmiotNrDomu, src.PodmiotKodPocztowy, src.PodmiotMiejscowosc, src.KodPowoduOdrzuceniaCla, src.NrRefDokumentu, src.DecyzjaKontroliDomyslna, src.DecyzjaKontroli, src.Ilosc, src.CzyPrawidlowaOperacjaOSOZ, src.DataUtworzenia, src.DataZmian, src.ZmienionePrzez, src.WersjaAudytu, src.ARC, src.LRN, src.NazwaMiejscaKontroli, src.CzyZadanieKontroli, src.DataPrzeladunku);	
		SET @Merged = 1; 
	END
	
		IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END