



-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2017-11-02
-- Description:	
-- =============================================

CREATE PROCEDURE [sent].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END

	IF @TableName = 'SENT_Zgloszenie' BEGIN
		MERGE INTO [sent].SENT_Zgloszenie AS tgt
		USING WA_StageHurtownia.[sent].SENT_Zgloszenie AS src
		ON (tgt.NumerZgloszenia=src.NumerZgloszenia)
		WHEN MATCHED
		THEN UPDATE SET
tgt.HistoriaZgloszenia = src.HistoriaZgloszenia
,tgt.IdSENT=src.IdSENT, tgt.NumerZgloszenia=src.NumerZgloszenia, tgt.KluczOdbiorcy=src.KluczOdbiorcy, tgt.KluczNadawcy=src.KluczNadawcy, tgt.KluczKierowcy=src.KluczKierowcy, tgt.ZgloszenieOswiadczenieOUpowaznieniu=src.ZgloszenieOswiadczenieOUpowaznieniu, tgt.ZgloszenieNumerWlasnyDokumentu=src.ZgloszenieNumerWlasnyDokumentu, tgt.ZgloszenieRodzaj=src.ZgloszenieRodzaj, tgt.ZgloszenieNameSpace=src.ZgloszenieNameSpace, tgt.ZgloszenieStatus=src.ZgloszenieStatus, tgt.ZgloszenieTymczasowe=src.ZgloszenieTymczasowe, tgt.ZgloszenieDataRejestracji=src.ZgloszenieDataRejestracji, tgt.ZgloszenieRejestrujacy=src.ZgloszenieRejestrujacy, tgt.ZgloszenieDataZmiany=src.ZgloszenieDataZmiany, tgt.ZgloszenieZmieniajacy=src.ZgloszenieZmieniajacy, tgt.ZgloszenieIdSEAP=src.ZgloszenieIdSEAP, tgt.ZgloszenieIdSISCROF=src.ZgloszenieIdSISCROF, tgt.ZgloszenieSysRef=src.ZgloszenieSysRef, tgt.ZgloszenieNrWplywu=src.ZgloszenieNrWplywu, tgt.ZgloszenieNrWysylki=src.ZgloszenieNrWysylki, tgt.ZgloszenieUwagi=src.ZgloszenieUwagi, tgt.ZgloszenieAnulowaneUwagi=src.ZgloszenieAnulowaneUwagi, tgt.ZgloszenieDyrektywa=src.ZgloszenieDyrektywa, tgt.ZgloszenieKontrola=src.ZgloszenieKontrola, tgt.ZgloszenieAnalizaRyzyka=src.ZgloszenieAnalizaRyzyka, tgt.ZgloszenieDecyzja=src.ZgloszenieDecyzja, tgt.NadawcaIdSISC=src.NadawcaIdSISC, tgt.NadawcaPelnaNazwa=src.NadawcaPelnaNazwa, tgt.NadawcaNip=src.NadawcaNip, tgt.NadawcaRodzajIdentyfikatora=src.NadawcaRodzajIdentyfikatora, tgt.NadawcaNumerIdentyfikatora=src.NadawcaNumerIdentyfikatora, tgt.NadawcaKraj=src.NadawcaKraj, tgt.NadawcaKodPocztowy=src.NadawcaKodPocztowy, tgt.NadawcaMiejscowosc=src.NadawcaMiejscowosc, tgt.NadawcaUlica=src.NadawcaUlica, tgt.NadawcaNrDomu=src.NadawcaNrDomu, tgt.NadawcaNrLokalu=src.NadawcaNrLokalu, tgt.OdbiorcaIdSISC=src.OdbiorcaIdSISC, tgt.OdbiorcaPelnaNazwa=src.OdbiorcaPelnaNazwa, tgt.OdbiorcaNip=src.OdbiorcaNip, tgt.OdbiorcaRodzajIdentyfikatora=src.OdbiorcaRodzajIdentyfikatora, tgt.OdbiorcaNumerIdentyfikatora=src.OdbiorcaNumerIdentyfikatora, tgt.OdbiorcaKraj=src.OdbiorcaKraj, tgt.OdbiorcaKodPocztowy=src.OdbiorcaKodPocztowy, tgt.OdbiorcaMiejscowosc=src.OdbiorcaMiejscowosc, tgt.OdbiorcaUlica=src.OdbiorcaUlica, tgt.OdbiorcaNrDomu=src.OdbiorcaNrDomu, tgt.OdbiorcaNrLokalu=src.OdbiorcaNrLokalu, tgt.PrzewoznikIdSISC=src.PrzewoznikIdSISC, tgt.PrzewoznikPelnaNazwa=src.PrzewoznikPelnaNazwa, tgt.PrzewoznikNip=src.PrzewoznikNip, tgt.PrzewoznikRodzajIdentyfikatora=src.PrzewoznikRodzajIdentyfikatora, tgt.PrzewoznikNumerIdentyfikatora=src.PrzewoznikNumerIdentyfikatora, tgt.PrzewoznikKraj=src.PrzewoznikKraj, tgt.PrzewoznikKodPocztowy=src.PrzewoznikKodPocztowy, tgt.PrzewoznikMiejscowosc=src.PrzewoznikMiejscowosc, tgt.PrzewoznikUlica=src.PrzewoznikUlica, tgt.PrzewoznikNrDomu=src.PrzewoznikNrDomu, tgt.PrzewoznikNrLokalu=src.PrzewoznikNrLokalu, tgt.SrodekTransportuNumerCiagnika=src.SrodekTransportuNumerCiagnika, tgt.SrodekTransportuNumerNaczepy=src.SrodekTransportuNumerNaczepy, tgt.SrodekTransportuNrZezwoleniaDrogowego=src.SrodekTransportuNrZezwoleniaDrogowego, tgt.SrodekTransportuNrLokalizatora=src.SrodekTransportuNrLokalizatora, tgt.TowarKodKlasyfikacjiCN=src.TowarKodKlasyfikacjiCN, tgt.TowarKodKlasyfikacjiPKWiU=src.TowarKodKlasyfikacjiPKWiU, tgt.TowarNazwa=src.TowarNazwa, tgt.TowarIlosc=src.TowarIlosc, tgt.TowarJednostkaMiary=src.TowarJednostkaMiary, tgt.TowarMasaNetto=src.TowarMasaNetto, tgt.TowarMasaBrutto=src.TowarMasaBrutto, tgt.TowarWartoscNetto=src.TowarWartoscNetto, tgt.TowarWaluta=src.TowarWaluta, tgt.TowarRodzajDokumentuTowarzyszacego=src.TowarRodzajDokumentuTowarzyszacego, tgt.TowarNrDokumentuTowarzyszacego=src.TowarNrDokumentuTowarzyszacego, tgt.TransportZaladunekKraj=src.TransportZaladunekKraj, tgt.TransportZaladunekKodPocztowy=src.TransportZaladunekKodPocztowy, tgt.TransportZaladunekMiejscowosc=src.TransportZaladunekMiejscowosc, tgt.TransportZaladunekUlica=src.TransportZaladunekUlica, tgt.TransportZaladunekNrDomu=src.TransportZaladunekNrDomu, tgt.TransportZaladunekNrLokalu=src.TransportZaladunekNrLokalu, tgt.TransportDostawaKraj = src.TransportDostawaKraj
,tgt.TransportDostawaKodPocztowy = src.TransportDostawaKodPocztowy
,tgt.TransportDostawaMiejscowosc = src.TransportDostawaMiejscowosc
,tgt.TransportDostawaUlica = src.TransportDostawaUlica
,tgt.TransportDostawaNrDomu = src.TransportDostawaNrDomu
,tgt.TransportDostawaNrLokalu = src.TransportDostawaNrLokalu
,tgt.TransportDataPlanowanegoPrzewozu = src.TransportDataPlanowanegoPrzewozu
,tgt.TransportDataRozpoczeciaPrzewozu = src.TransportDataRozpoczeciaPrzewozu
,tgt.TransportDataZakonczeniaPrzewozu = src.TransportDataZakonczeniaPrzewozu
,tgt.TrasaWjazdMiejsce = src.TrasaWjazdMiejsce
,tgt.TrasaWjazdNrDrogi = src.TrasaWjazdNrDrogi
,tgt.TrasaWjazdData = src.TrasaWjazdData
,tgt.TrasaWyjazdMiejsce = src.TrasaWyjazdMiejsce
,tgt.TrasaWyjazdNrDrogi = src.TrasaWyjazdNrDrogi
,tgt.TrasaWyjazdData = src.TrasaWyjazdData
,tgt.ZakonczeniePrzewozuZgodnyZeZgloszeniem = src.ZakonczeniePrzewozuZgodnyZeZgloszeniem
,tgt.ZakonczeniePrzewozuRodzajNiezgodnosci = src.ZakonczeniePrzewozuRodzajNiezgodnosci
,tgt.ZakonczeniePrzewozuUwagi = src.ZakonczeniePrzewozuUwagi
,tgt.ZakonczeniePrzewozuData = src.ZakonczeniePrzewozuData
,tgt.KopertaWebService = src.KopertaWebService
,tgt.WsOdciskPalcaCertyfikatu = src.WsOdciskPalcaCertyfikatu
,tgt.WsUzytkownik = src.WsUzytkownik
,tgt.WsHaslo = src.WsHaslo
,tgt.WsAdresKanaluZwrotnego = src.WsAdresKanaluZwrotnego
,tgt.KopertaEmail = src.KopertaEmail
,tgt.KopertaData = src.KopertaData
,tgt.Email1 = src.Email1
,tgt.Email2 = src.Email2
,tgt.Email3 = src.Email3
,tgt.ZgloszenieSumaKontrolna = src.ZgloszenieSumaKontrolna
,tgt.ZgloszenieIdSISCROP = src.ZgloszenieIdSISCROP
,tgt.ZgloszenieIdSISCP = src.ZgloszenieIdSISCP
,tgt.ZgloszenieNowyKlucz = src.ZgloszenieNowyKlucz
,tgt.WsFromSISC = src.WsFromSISC
,tgt.NumerSentZb = src.NumerSentZb
,tgt.TransportZaladunekTERC = src.TransportZaladunekTERC
,tgt.TransportZaladunekSIMC = src.TransportZaladunekSIMC
,tgt.TransportZaladunekULIC = src.TransportZaladunekULIC
,tgt.TransportDostawaTERC = src.TransportDostawaTERC
,tgt.TransportDostawaSIMC = src.TransportDostawaSIMC
,tgt.TransportDostawaULIC = src.TransportDostawaULIC
,tgt.TowarIloscDostarczona = src.TowarIloscDostarczona
,tgt.ZgloszenieBiezace = src.ZgloszenieBiezace
		WHEN NOT MATCHED
		THEN INSERT (HistoriaZgloszenia, IdSENT, NumerZgloszenia, KluczOdbiorcy, KluczNadawcy, KluczKierowcy, ZgloszenieOswiadczenieOUpowaznieniu, ZgloszenieNumerWlasnyDokumentu, ZgloszenieRodzaj, ZgloszenieNameSpace, ZgloszenieStatus, ZgloszenieTymczasowe, ZgloszenieDataRejestracji, ZgloszenieRejestrujacy, ZgloszenieDataZmiany, ZgloszenieZmieniajacy, ZgloszenieIdSEAP, ZgloszenieIdSISCROF, ZgloszenieSysRef, ZgloszenieNrWplywu, ZgloszenieNrWysylki, ZgloszenieUwagi, ZgloszenieAnulowaneUwagi, ZgloszenieDyrektywa, ZgloszenieKontrola, ZgloszenieAnalizaRyzyka, ZgloszenieDecyzja, NadawcaIdSISC, NadawcaPelnaNazwa, NadawcaNip, NadawcaRodzajIdentyfikatora, NadawcaNumerIdentyfikatora, NadawcaKraj, NadawcaKodPocztowy, NadawcaMiejscowosc, NadawcaUlica, NadawcaNrDomu, NadawcaNrLokalu, OdbiorcaIdSISC, OdbiorcaPelnaNazwa, OdbiorcaNip, OdbiorcaRodzajIdentyfikatora, OdbiorcaNumerIdentyfikatora, OdbiorcaKraj, OdbiorcaKodPocztowy, OdbiorcaMiejscowosc, OdbiorcaUlica, OdbiorcaNrDomu, OdbiorcaNrLokalu, PrzewoznikIdSISC, PrzewoznikPelnaNazwa, PrzewoznikNip, PrzewoznikRodzajIdentyfikatora, PrzewoznikNumerIdentyfikatora, PrzewoznikKraj, PrzewoznikKodPocztowy, PrzewoznikMiejscowosc, PrzewoznikUlica, PrzewoznikNrDomu, PrzewoznikNrLokalu, SrodekTransportuNumerCiagnika, SrodekTransportuNumerNaczepy, SrodekTransportuNrZezwoleniaDrogowego, SrodekTransportuNrLokalizatora, TowarKodKlasyfikacjiCN, TowarKodKlasyfikacjiPKWiU, TowarNazwa, TowarIlosc, TowarJednostkaMiary, TowarMasaNetto, TowarMasaBrutto, TowarWartoscNetto, TowarWaluta, TowarRodzajDokumentuTowarzyszacego, TowarNrDokumentuTowarzyszacego, TransportZaladunekKraj, TransportZaladunekKodPocztowy, TransportZaladunekMiejscowosc, TransportZaladunekUlica, TransportZaladunekNrDomu, TransportZaladunekNrLokalu, TransportDostawaKraj, TransportDostawaKodPocztowy, TransportDostawaMiejscowosc, TransportDostawaUlica, TransportDostawaNrDomu, TransportDostawaNrLokalu, TransportDataPlanowanegoPrzewozu, TransportDataRozpoczeciaPrzewozu, TransportDataZakonczeniaPrzewozu, TrasaWjazdMiejsce, TrasaWjazdNrDrogi, TrasaWjazdData, TrasaWyjazdMiejsce, TrasaWyjazdNrDrogi, TrasaWyjazdData, ZakonczeniePrzewozuZgodnyZeZgloszeniem, ZakonczeniePrzewozuRodzajNiezgodnosci, ZakonczeniePrzewozuUwagi, ZakonczeniePrzewozuData, KopertaWebService, WsOdciskPalcaCertyfikatu, WsUzytkownik, WsHaslo, WsAdresKanaluZwrotnego, KopertaEmail, KopertaData, Email1, Email2, Email3, ZgloszenieSumaKontrolna, ZgloszenieIdSISCROP, ZgloszenieIdSISCP, ZgloszenieNowyKlucz, WsFromSISC, NumerSentZb, TransportZaladunekTERC, TransportZaladunekSIMC, TransportZaladunekULIC, TransportDostawaTERC, TransportDostawaSIMC, TransportDostawaULIC, TowarIloscDostarczona, ZgloszenieBiezace)
		VALUES (src.HistoriaZgloszenia, src.IdSENT, src.NumerZgloszenia, src.KluczOdbiorcy, src.KluczNadawcy, src.KluczKierowcy, src.ZgloszenieOswiadczenieOUpowaznieniu, src.ZgloszenieNumerWlasnyDokumentu, src.ZgloszenieRodzaj, src.ZgloszenieNameSpace, src.ZgloszenieStatus, src.ZgloszenieTymczasowe, src.ZgloszenieDataRejestracji, src.ZgloszenieRejestrujacy, src.ZgloszenieDataZmiany, src.ZgloszenieZmieniajacy, src.ZgloszenieIdSEAP, src.ZgloszenieIdSISCROF, src.ZgloszenieSysRef, src.ZgloszenieNrWplywu, src.ZgloszenieNrWysylki, src.ZgloszenieUwagi, src.ZgloszenieAnulowaneUwagi, src.ZgloszenieDyrektywa, src.ZgloszenieKontrola, src.ZgloszenieAnalizaRyzyka, src.ZgloszenieDecyzja, src.NadawcaIdSISC, src.NadawcaPelnaNazwa, src.NadawcaNip, src.NadawcaRodzajIdentyfikatora, src.NadawcaNumerIdentyfikatora, src.NadawcaKraj, src.NadawcaKodPocztowy, src.NadawcaMiejscowosc, src.NadawcaUlica, src.NadawcaNrDomu, src.NadawcaNrLokalu, src.OdbiorcaIdSISC, src.OdbiorcaPelnaNazwa, src.OdbiorcaNip, src.OdbiorcaRodzajIdentyfikatora, src.OdbiorcaNumerIdentyfikatora, src.OdbiorcaKraj, src.OdbiorcaKodPocztowy, src.OdbiorcaMiejscowosc, src.OdbiorcaUlica, src.OdbiorcaNrDomu, src.OdbiorcaNrLokalu, src.PrzewoznikIdSISC, src.PrzewoznikPelnaNazwa, src.PrzewoznikNip, src.PrzewoznikRodzajIdentyfikatora, src.PrzewoznikNumerIdentyfikatora, src.PrzewoznikKraj, src.PrzewoznikKodPocztowy, src.PrzewoznikMiejscowosc, src.PrzewoznikUlica, src.PrzewoznikNrDomu, src.PrzewoznikNrLokalu, src.SrodekTransportuNumerCiagnika, src.SrodekTransportuNumerNaczepy, src.SrodekTransportuNrZezwoleniaDrogowego, src.SrodekTransportuNrLokalizatora, src.TowarKodKlasyfikacjiCN, src.TowarKodKlasyfikacjiPKWiU, src.TowarNazwa, src.TowarIlosc, src.TowarJednostkaMiary, src.TowarMasaNetto, src.TowarMasaBrutto, src.TowarWartoscNetto, src.TowarWaluta, src.TowarRodzajDokumentuTowarzyszacego, src.TowarNrDokumentuTowarzyszacego, src.TransportZaladunekKraj, src.TransportZaladunekKodPocztowy, src.TransportZaladunekMiejscowosc, src.TransportZaladunekUlica, src.TransportZaladunekNrDomu, src.TransportZaladunekNrLokalu, src.TransportDostawaKraj, src.TransportDostawaKodPocztowy, src.TransportDostawaMiejscowosc, src.TransportDostawaUlica, src.TransportDostawaNrDomu, src.TransportDostawaNrLokalu, src.TransportDataPlanowanegoPrzewozu, src.TransportDataRozpoczeciaPrzewozu, src.TransportDataZakonczeniaPrzewozu, src.TrasaWjazdMiejsce, src.TrasaWjazdNrDrogi, src.TrasaWjazdData, src.TrasaWyjazdMiejsce, src.TrasaWyjazdNrDrogi, src.TrasaWyjazdData, src.ZakonczeniePrzewozuZgodnyZeZgloszeniem, src.ZakonczeniePrzewozuRodzajNiezgodnosci, src.ZakonczeniePrzewozuUwagi, src.ZakonczeniePrzewozuData, src.KopertaWebService, src.WsOdciskPalcaCertyfikatu, src.WsUzytkownik, src.WsHaslo, src.WsAdresKanaluZwrotnego, src.KopertaEmail, src.KopertaData, src.Email1, src.Email2, src.Email3, src.ZgloszenieSumaKontrolna, src.ZgloszenieIdSISCROP, src.ZgloszenieIdSISCP, src.ZgloszenieNowyKlucz, src.WsFromSISC, src.NumerSentZb, src.TransportZaladunekTERC, src.TransportZaladunekSIMC, src.TransportZaladunekULIC, src.TransportDostawaTERC, src.TransportDostawaSIMC, src.TransportDostawaULIC, src.TowarIloscDostarczona, src.ZgloszenieBiezace);
	 SET @Merged = 1;
	END


	IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END