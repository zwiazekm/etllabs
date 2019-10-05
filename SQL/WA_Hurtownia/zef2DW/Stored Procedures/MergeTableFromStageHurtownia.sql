CREATE PROCEDURE [zef2DW].[MergeTableFromStageHurtownia] (@TableName VARCHAR(100) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
		END

SET @Merged = 1;
 END 
--Kontrahent

IF @TableName = 'Kontrahent' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.Kontrahent WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DW.Kontrahent) 
 MERGE INTO zef2DW.Kontrahent AS tgt
USING WA_StageHurtownia.zef2DW.Kontrahent AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.NazwaKontrahenta=src.NazwaKontrahenta, tgt.RodzajKontrahenta=src.RodzajKontrahenta, tgt.NazwiskoKontrahenta=src.NazwiskoKontrahenta, tgt.KontrahentImie=src.KontrahentImie, tgt.KontrahentDataUrodzenia=src.KontrahentDataUrodzenia, tgt.KontrahentKraj=src.KontrahentKraj, tgt.KontrahentWojewodztwo=src.KontrahentWojewodztwo, tgt.KontrahentPowiat=src.KontrahentPowiat, tgt.KontrahentGmina=src.KontrahentGmina, tgt.UlicaKontrahenta=src.UlicaKontrahenta, tgt.NrDomuKontrahenta=src.NrDomuKontrahenta, tgt.NrLokaluKontrahenta=src.NrLokaluKontrahenta, tgt.MiejscowoscKontrahenta=src.MiejscowoscKontrahenta, tgt.KodPocztowyKontrahenta=src.KodPocztowyKontrahenta, tgt.PocztaKontrahenta=src.PocztaKontrahenta, tgt.NrEoriKontrahenta=src.NrEoriKontrahenta, tgt.NrDokumentuKontrahenta=src.NrDokumentuKontrahenta, tgt.NumerVATUEKontrahenta=src.NumerVATUEKontrahenta, tgt.NazwaPodatnikaRw=src.NazwaPodatnikaRw, tgt.KontrahentSystemZrodlowy=src.KontrahentSystemZrodlowy, tgt.NipPodatnikaRw=src.NipPodatnikaRw, tgt.PeselPodatnikaRw=src.PeselPodatnikaRw, tgt.RegonPodatnikaRw=src.RegonPodatnikaRw, tgt.KontrahentUwagi=src.KontrahentUwagi, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika, NazwaKontrahenta, RodzajKontrahenta, NazwiskoKontrahenta, KontrahentImie, KontrahentDataUrodzenia, KontrahentKraj, KontrahentWojewodztwo, KontrahentPowiat, KontrahentGmina, UlicaKontrahenta, NrDomuKontrahenta, NrLokaluKontrahenta, MiejscowoscKontrahenta, KodPocztowyKontrahenta, PocztaKontrahenta, NrEoriKontrahenta, NrDokumentuKontrahenta, NumerVATUEKontrahenta, NazwaPodatnikaRw, KontrahentSystemZrodlowy, NipPodatnikaRw, PeselPodatnikaRw, RegonPodatnikaRw, KontrahentUwagi, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.NazwaKontrahenta, src.RodzajKontrahenta, src.NazwiskoKontrahenta, src.KontrahentImie, src.KontrahentDataUrodzenia, src.KontrahentKraj, src.KontrahentWojewodztwo, src.KontrahentPowiat, src.KontrahentGmina, src.UlicaKontrahenta, src.NrDomuKontrahenta, src.NrLokaluKontrahenta, src.MiejscowoscKontrahenta, src.KodPocztowyKontrahenta, src.PocztaKontrahenta, src.NrEoriKontrahenta, src.NrDokumentuKontrahenta, src.NumerVATUEKontrahenta, src.NazwaPodatnikaRw, src.KontrahentSystemZrodlowy, src.NipPodatnikaRw, src.PeselPodatnikaRw, src.RegonPodatnikaRw, src.KontrahentUwagi, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 


--AZNN_Dokument
IF @TableName = 'AZNN_Dokument' BEGIN 
MERGE INTO zef2DW.AZNN_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.AZNN_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.Instancja=src.Instancja, tgt.DecyzjaWlasnaUS_SC=src.DecyzjaWlasnaUS_SC, tgt.NazwaOrganuWydajacego=src.NazwaOrganuWydajacego, tgt.DataPostanowienia=src.DataPostanowienia, tgt.NumerPostanowienia=src.NumerPostanowienia, tgt.DataDoreczenia=src.DataDoreczenia, tgt.NrPostanowieniaIInstancji=src.NrPostanowieniaIInstancji, tgt.PierwotneRodzaj=src.PierwotneRodzaj, tgt.PierwotneNumer=src.PierwotneNumer, tgt.PierwotneDataDokumentu=src.PierwotneDataDokumentu, tgt.PierwotneDataZaliczenia=src.PierwotneDataZaliczenia, tgt.PierwotneKwotaNadplaty=src.PierwotneKwotaNadplaty, tgt.PierwotneKwotaOprocentowania=src.PierwotneKwotaOprocentowania, tgt.PierwotneOkresNaliczeniaOd=src.PierwotneOkresNaliczeniaOd, tgt.PierwotneOkresNaliczeniaDo=src.PierwotneOkresNaliczeniaDo, tgt.PierwotneRazemKwotaNadplatyIOprocentowania=src.PierwotneRazemKwotaNadplatyIOprocentowania, tgt.UtrzymanieUchylenie=src.UtrzymanieUchylenie, tgt.RwUzasadnienie=src.RwUzasadnienie, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.RazemNadplata=src.RazemNadplata, tgt.RazemOdsetki=src.RazemOdsetki, tgt.RazemOplataProlongacyjna=src.RazemOplataProlongacyjna, tgt.UsKwotaPrzelewuRazem=src.UsKwotaPrzelewuRazem, tgt.RwPodstawaPrawna=src.RwPodstawaPrawna, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, Instancja, DecyzjaWlasnaUS_SC, NazwaOrganuWydajacego, DataPostanowienia, NumerPostanowienia, DataDoreczenia, NrPostanowieniaIInstancji, PierwotneRodzaj, PierwotneNumer, PierwotneDataDokumentu, PierwotneDataZaliczenia, PierwotneKwotaNadplaty, PierwotneKwotaOprocentowania, PierwotneOkresNaliczeniaOd, PierwotneOkresNaliczeniaDo, PierwotneRazemKwotaNadplatyIOprocentowania, UtrzymanieUchylenie, RwUzasadnienie, AdnotacjeIUwagi, RazemNadplata, RazemOdsetki, RazemOplataProlongacyjna, UsKwotaPrzelewuRazem, RwPodstawaPrawna, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.Instancja, src.DecyzjaWlasnaUS_SC, src.NazwaOrganuWydajacego, src.DataPostanowienia, src.NumerPostanowienia, src.DataDoreczenia, src.NrPostanowieniaIInstancji, src.PierwotneRodzaj, src.PierwotneNumer, src.PierwotneDataDokumentu, src.PierwotneDataZaliczenia, src.PierwotneKwotaNadplaty, src.PierwotneKwotaOprocentowania, src.PierwotneOkresNaliczeniaOd, src.PierwotneOkresNaliczeniaDo, src.PierwotneRazemKwotaNadplatyIOprocentowania, src.UtrzymanieUchylenie, src.RwUzasadnienie, src.AdnotacjeIUwagi, src.RazemNadplata, src.RazemOdsetki, src.RazemOplataProlongacyjna, src.UsKwotaPrzelewuRazem, src.RwPodstawaPrawna, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 



--BO_Dokument                    

IF @TableName = 'BO_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.BO_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.BO_Dokument) 
 MERGE INTO zef2DW.BO_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.BO_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.Typ=src.Typ, tgt.NumerDokumentu=src.NumerDokumentu, tgt.RodzajDokumentuArchiwalnego=src.RodzajDokumentuArchiwalnego, tgt.DataWystawienia=src.DataWystawienia, tgt.OkresRozliczeniowy=src.OkresRozliczeniowy, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.OrganWydajacy=src.OrganWydajacy, tgt.DecyzjaWydanaPrzez=src.DecyzjaWydanaPrzez, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.PozycjeKwotaRazem=src.PozycjeKwotaRazem, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, DokumentArchiwalny, Typ, NumerDokumentu, RodzajDokumentuArchiwalnego, DataWystawienia, OkresRozliczeniowy, TerminPlatnosci, OrganWydajacy, DecyzjaWydanaPrzez, AdnotacjeIUwagi, PozycjeKwotaRazem, RaportWyslaniaSK, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.DokumentArchiwalny, src.Typ, src.NumerDokumentu, src.RodzajDokumentuArchiwalnego, src.DataWystawienia, src.OkresRozliczeniowy, src.TerminPlatnosci, src.OrganWydajacy, src.DecyzjaWydanaPrzez, src.AdnotacjeIUwagi, src.PozycjeKwotaRazem, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 


--DAKC_Dokument                 
IF @TableName = 'DAKC_Dokument' BEGIN 
	DELETE FROM WA_Hurtownia.zef2DW.DAKC_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DAKC_Dokument) 
	MERGE INTO zef2DW.DAKC_Dokument AS tgt
	USING WA_StageHurtownia.zef2DW.DAKC_Dokument AS src
	ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
	WHEN MATCHED AND src.operacja IN ('U', 'I')
	THEN UPDATE SET
	tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.RodzajPodatku=src.RodzajPodatku, tgt.DecyzjaWydanaPrzez=src.DecyzjaWydanaPrzez, tgt.OrganWydajacy=src.OrganWydajacy, tgt.DataWydania=src.DataWydania, tgt.DataDoreczenia=src.DataDoreczenia, tgt.NumerDecyzji=src.NumerDecyzji, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.WWynikuKontroliPostepowania=src.WWynikuKontroliPostepowania, tgt.NrUpowaznienia=src.NrUpowaznienia, tgt.NrPostanowieniaOWszczeciuPostepowania=src.NrPostanowieniaOWszczeciuPostepowania, tgt.WynikKontroliNumerWniosku=src.WynikKontroliNumerWniosku, tgt.ZaOkres=src.ZaOkres, tgt.PierwotnyRodzajDokumentu=src.PierwotnyRodzajDokumentu, tgt.PierwotnyNumerDokumentu=src.PierwotnyNumerDokumentu, tgt.KwotaDecyzjiRazem=src.KwotaDecyzjiRazem, tgt.ParametryWniosku=src.ParametryWniosku, tgt.JakiOkresRozliczeniowy=src.JakiOkresRozliczeniowy, tgt.WnioskodawcaPostepowania=src.WnioskodawcaPostepowania, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika, tgt.KodJednostki=src.KodJednostki
	WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
	WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
	THEN INSERT (IdentyfikatorDokumentu, DokumentArchiwalny, RodzajPodatku, DecyzjaWydanaPrzez, OrganWydajacy, DataWydania, DataDoreczenia, NumerDecyzji, TerminPlatnosci, WWynikuKontroliPostepowania, NrUpowaznienia, NrPostanowieniaOWszczeciuPostepowania, WynikKontroliNumerWniosku, ZaOkres, PierwotnyRodzajDokumentu, PierwotnyNumerDokumentu, KwotaDecyzjiRazem, ParametryWniosku, JakiOkresRozliczeniowy, WnioskodawcaPostepowania, AdnotacjeIUwagi, RaportWyslaniaSK, DataArch, ID_Pismo_xml, IdentyfikatorPodatnika, KodJednostki)
	VALUES (src.IdentyfikatorDokumentu, src.DokumentArchiwalny, src.RodzajPodatku, src.DecyzjaWydanaPrzez, src.OrganWydajacy, src.DataWydania, src.DataDoreczenia, src.NumerDecyzji, src.TerminPlatnosci, src.WWynikuKontroliPostepowania, src.NrUpowaznienia, src.NrPostanowieniaOWszczeciuPostepowania, src.WynikKontroliNumerWniosku, src.ZaOkres, src.PierwotnyRodzajDokumentu, src.PierwotnyNumerDokumentu, src.KwotaDecyzjiRazem, src.ParametryWniosku, src.JakiOkresRozliczeniowy, src.WnioskodawcaPostepowania, src.AdnotacjeIUwagi, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml, src.IdentyfikatorPodatnika, src.KodJednostki);
SET @Merged = 1;
 END 



--DAKO_Dokument                  
IF @TableName = 'DAKO_Dokument' BEGIN 
	DELETE FROM WA_Hurtownia.zef2DW.DAKO_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DAKO_Dokument) 
	MERGE INTO zef2DW.DAKO_Dokument AS tgt
	USING WA_StageHurtownia.zef2DW.DAKO_Dokument AS src
	ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
	WHEN MATCHED AND src.operacja IN ('U', 'I')
	THEN UPDATE SET
	tgt.DataDoreczenia=src.DataDoreczenia, tgt.DataWydania=src.DataWydania, tgt.DecyjaPrzejetaZ=src.DecyjaPrzejetaZ, tgt.ParametryWniosku=src.ParametryWniosku, tgt.Okres=src.Okres, tgt.OrganWydajacyIc=src.OrganWydajacyIc, tgt.JakiOkresRozliczeniowy=src.JakiOkresRozliczeniowy, tgt.PozycjeRazem=src.PozycjeRazem, tgt.PrzyczynaZadluzenia=src.PrzyczynaZadluzenia, tgt.RodzajPodatku=src.RodzajPodatku, tgt.NumerDecyzji=src.NumerDecyzji, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.RodzajDeklaracji=src.RodzajDeklaracji, tgt.ZaOkres=src.ZaOkres, tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.WWynikuKontroliPostepowania=src.WWynikuKontroliPostepowania, tgt.NrUpowaznienia=src.NrUpowaznienia, tgt.NrPostanowieniaOWszczeciuPostepowania=src.NrPostanowieniaOWszczeciuPostepowania, tgt.WynikKontroliNumerWniosku=src.WynikKontroliNumerWniosku, tgt.PierwotnyRodzajDokumentu=src.PierwotnyRodzajDokumentu, tgt.PierwotnyNumerDokumentu=src.PierwotnyNumerDokumentu, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.WnioskodawcaPostepowania=src.WnioskodawcaPostepowania, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika, tgt.KodJednostki=src.KodJednostki, tgt.MigracjaReczna=src.MigracjaReczna
	WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
	WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
	THEN INSERT (IdentyfikatorDokumentu, DataDoreczenia, DataWydania, DecyjaPrzejetaZ, ParametryWniosku, Okres, OrganWydajacyIc, JakiOkresRozliczeniowy, PozycjeRazem, PrzyczynaZadluzenia, RodzajPodatku, NumerDecyzji, RaportWyslaniaSK, RodzajDeklaracji, ZaOkres, DokumentArchiwalny, WWynikuKontroliPostepowania, NrUpowaznienia, NrPostanowieniaOWszczeciuPostepowania, WynikKontroliNumerWniosku, PierwotnyRodzajDokumentu, PierwotnyNumerDokumentu, AdnotacjeIUwagi, WnioskodawcaPostepowania, DataArch, ID_Pismo_xml, IdentyfikatorPodatnika, KodJednostki, MigracjaReczna)
	VALUES (src.IdentyfikatorDokumentu, src.DataDoreczenia, src.DataWydania, src.DecyjaPrzejetaZ, src.ParametryWniosku, src.Okres, src.OrganWydajacyIc, src.JakiOkresRozliczeniowy, src.PozycjeRazem, src.PrzyczynaZadluzenia, src.RodzajPodatku, src.NumerDecyzji, src.RaportWyslaniaSK, src.RodzajDeklaracji, src.ZaOkres, src.DokumentArchiwalny, src.WWynikuKontroliPostepowania, src.NrUpowaznienia, src.NrPostanowieniaOWszczeciuPostepowania, src.WynikKontroliNumerWniosku, src.PierwotnyRodzajDokumentu, src.PierwotnyNumerDokumentu, src.AdnotacjeIUwagi, src.WnioskodawcaPostepowania, src.DataArch, src.ID_Pismo_xml, src.IdentyfikatorPodatnika, src.KodJednostki, src.MigracjaReczna);
SET @Merged = 1;
 END 


--DKOR_Dokument                  
IF @TableName = 'DKOR_Dokument' BEGIN 
	DELETE FROM WA_Hurtownia.zef2DW.DKOR_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DKOR_Dokument) 
	MERGE INTO zef2DW.DKOR_Dokument AS tgt
	USING WA_StageHurtownia.zef2DW.DKOR_Dokument AS src
	ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
	WHEN MATCHED AND src.operacja IN ('U', 'I') 
	THEN UPDATE SET
	tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.NumerDecyzji=src.NumerDecyzji, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.NumerZabezpieczeniaGeneralnego=src.NumerZabezpieczeniaGeneralnego, tgt.KwotaZabezpieczeniaGeneralnego=src.KwotaZabezpieczeniaGeneralnego, tgt.DataObciazeniaZabezpieczeniaGeneralnego=src.DataObciazeniaZabezpieczeniaGeneralnego, tgt.CzyZabezpieczenieGeneralneObciazaAIS=src.CzyZabezpieczenieGeneralneObciazaAIS, tgt.NumerZabezpieczniaJednorazowego=src.NumerZabezpieczniaJednorazowego, tgt.KwotaZabezpieczeniaJednorazowego=src.KwotaZabezpieczeniaJednorazowego, tgt.DataObciazeniaZabezpieczeniaJednorazowego=src.DataObciazeniaZabezpieczeniaJednorazowego, tgt.NIPKontrahentaZabezpieczeniaJednorazowego=src.NIPKontrahentaZabezpieczeniaJednorazowego, tgt.MigracjaReczna=src.MigracjaReczna, tgt.WWynikuKontroliPostepowania=src.WWynikuKontroliPostepowania, tgt.NrUpowaznienia=src.NrUpowaznienia, tgt.NrPostanowieniaOWszczeciuPostepowania=src.NrPostanowieniaOWszczeciuPostepowania, tgt.WynikKontroliNumerWniosku=src.WynikKontroliNumerWniosku, tgt.PierwotnyRodzajDokumentu=src.PierwotnyRodzajDokumentu, tgt.PierwotnyNumerDokumentu=src.PierwotnyNumerDokumentu, tgt.AIS=src.AIS, tgt.DataDecyzji=src.DataDecyzji, tgt.DataPowiadomienia=src.DataPowiadomienia, tgt.DataPowstaniaDluguCelnego=src.DataPowstaniaDluguCelnego, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.ProceduraCelna=src.ProceduraCelna, tgt.Ownres=src.Ownres, tgt.WpisDoRejestruDluguCelnego=src.WpisDoRejestruDluguCelnego, tgt.RazemBezZwoln=src.RazemBezZwoln, tgt.RazemZeZwoln=src.RazemZeZwoln, tgt.KwotaZabezpieczeniaTSW=src.KwotaZabezpieczeniaTSW, tgt.WnioskodawcaPostepowania=src.WnioskodawcaPostepowania, tgt.OstatniaDecyzja=src.OstatniaDecyzja, tgt.NrPozwNaProcedureUproszczona=src.NrPozwNaProcedureUproszczona, tgt.NumerPozwoleniaSASP=src.NumerPozwoleniaSASP, tgt.OrganCelnySASP=src.OrganCelnySASP, tgt.NumerPostanowieniaDodatkowego=src.NumerPostanowieniaDodatkowego, tgt.NumerZabezpieczeniaDodatkowego=src.NumerZabezpieczeniaDodatkowego, tgt.KwotaZabezpieczeniaDodatkowego=src.KwotaZabezpieczeniaDodatkowego, tgt.DataZlozeniaZabezpieczeniaDodatkowego=src.DataZlozeniaZabezpieczeniaDodatkowego, tgt.KwotaZwolnienia=src.KwotaZwolnienia, tgt.IdPismaPierwotnego=src.IdPismaPierwotnego, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.NaliczycOdsetki=src.NaliczycOdsetki, tgt.PrzyczynaZadluzenia=src.PrzyczynaZadluzenia, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika, tgt.KodJednostki=src.KodJednostki, tgt.DataRejestracjiRDC=src.DataRejestracjiRDC, tgt.NaleznosciCelnoPodatkowe=src.NaleznosciCelnoPodatkowe, tgt.StawkaOdsetek=src.StawkaOdsetek
	WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
	WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
	THEN INSERT (IdentyfikatorDokumentu, DokumentArchiwalny, NumerDecyzji, AdnotacjeIUwagi, NumerZabezpieczeniaGeneralnego, KwotaZabezpieczeniaGeneralnego, DataObciazeniaZabezpieczeniaGeneralnego, CzyZabezpieczenieGeneralneObciazaAIS, NumerZabezpieczniaJednorazowego, KwotaZabezpieczeniaJednorazowego, DataObciazeniaZabezpieczeniaJednorazowego, NIPKontrahentaZabezpieczeniaJednorazowego, MigracjaReczna, WWynikuKontroliPostepowania, NrUpowaznienia, NrPostanowieniaOWszczeciuPostepowania, WynikKontroliNumerWniosku, PierwotnyRodzajDokumentu, PierwotnyNumerDokumentu, AIS, DataDecyzji, DataPowiadomienia, DataPowstaniaDluguCelnego, TerminPlatnosci, ProceduraCelna, Ownres, WpisDoRejestruDluguCelnego, RazemBezZwoln, RazemZeZwoln, KwotaZabezpieczeniaTSW, WnioskodawcaPostepowania, OstatniaDecyzja, NrPozwNaProcedureUproszczona, NumerPozwoleniaSASP, OrganCelnySASP, NumerPostanowieniaDodatkowego, NumerZabezpieczeniaDodatkowego, KwotaZabezpieczeniaDodatkowego, DataZlozeniaZabezpieczeniaDodatkowego, KwotaZwolnienia, IdPismaPierwotnego, RaportWyslaniaSK, NaliczycOdsetki, PrzyczynaZadluzenia, DataArch, ID_Pismo_xml, IdentyfikatorPodatnika, KodJednostki, DataRejestracjiRDC, NaleznosciCelnoPodatkowe, StawkaOdsetek)
	VALUES (src.IdentyfikatorDokumentu, src.DokumentArchiwalny, src.NumerDecyzji, src.AdnotacjeIUwagi, src.NumerZabezpieczeniaGeneralnego, src.KwotaZabezpieczeniaGeneralnego, src.DataObciazeniaZabezpieczeniaGeneralnego, src.CzyZabezpieczenieGeneralneObciazaAIS, src.NumerZabezpieczniaJednorazowego, src.KwotaZabezpieczeniaJednorazowego, src.DataObciazeniaZabezpieczeniaJednorazowego, src.NIPKontrahentaZabezpieczeniaJednorazowego, src.MigracjaReczna, src.WWynikuKontroliPostepowania, src.NrUpowaznienia, src.NrPostanowieniaOWszczeciuPostepowania, src.WynikKontroliNumerWniosku, src.PierwotnyRodzajDokumentu, src.PierwotnyNumerDokumentu, src.AIS, src.DataDecyzji, src.DataPowiadomienia, src.DataPowstaniaDluguCelnego, src.TerminPlatnosci, src.ProceduraCelna, src.Ownres, src.WpisDoRejestruDluguCelnego, src.RazemBezZwoln, src.RazemZeZwoln, src.KwotaZabezpieczeniaTSW, src.WnioskodawcaPostepowania, src.OstatniaDecyzja, src.NrPozwNaProcedureUproszczona, src.NumerPozwoleniaSASP, src.OrganCelnySASP, src.NumerPostanowieniaDodatkowego, src.NumerZabezpieczeniaDodatkowego, src.KwotaZabezpieczeniaDodatkowego, src.DataZlozeniaZabezpieczeniaDodatkowego, src.KwotaZwolnienia, src.IdPismaPierwotnego, src.RaportWyslaniaSK, src.NaliczycOdsetki, src.PrzyczynaZadluzenia, src.DataArch, src.ID_Pismo_xml, src.IdentyfikatorPodatnika, src.KodJednostki, src.DataRejestracjiRDC, src.NaleznosciCelnoPodatkowe, src.StawkaOdsetek);
SET @Merged = 1;
 END 

--DKPI_Dokument                  
IF @TableName = 'DKPI_Dokument' BEGIN 
	DELETE FROM WA_Hurtownia.zef2DW.DKPI_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DKPI_Dokument) 
	MERGE INTO zef2DW.DKPI_Dokument AS tgt
	USING WA_StageHurtownia.zef2DW.DKPI_Dokument AS src
	ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
	WHEN MATCHED AND src.operacja IN ('U', 'I')
	THEN UPDATE SET
	tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.NumerDecyzji=src.NumerDecyzji, tgt.RodzajKary=src.RodzajKary, tgt.DataWydania=src.DataWydania, tgt.DataOtrzymania=src.DataOtrzymania, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.CzyNaliczycOdsetki=src.CzyNaliczycOdsetki, tgt.WWynikuKontroliPostepowania=src.WWynikuKontroliPostepowania, tgt.NrUpowaznienia=src.NrUpowaznienia, tgt.NrPostanowieniaOWszczeciuPostepowania=src.NrPostanowieniaOWszczeciuPostepowania, tgt.WynikKontroliNumerWniosku=src.WynikKontroliNumerWniosku, tgt.KaraRazem=src.KaraRazem, tgt.OsobaKrajowaZagraniczna=src.OsobaKrajowaZagraniczna, tgt.WnioskodawcaPostepowania=src.WnioskodawcaPostepowania, tgt.MigracjaReczna=src.MigracjaReczna, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.SposobZaplaty=src.SposobZaplaty, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika, tgt.KodJednostki=src.KodJednostki, tgt.NumerPokwitowania=src.NumerPokwitowania, tgt.KwotaKaucji=src.KwotaKaucji
	WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
	WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
	THEN INSERT (IdentyfikatorDokumentu, DokumentArchiwalny, NumerDecyzji, RodzajKary, DataWydania, DataOtrzymania, TerminPlatnosci, CzyNaliczycOdsetki, WWynikuKontroliPostepowania, NrUpowaznienia, NrPostanowieniaOWszczeciuPostepowania, WynikKontroliNumerWniosku, KaraRazem, OsobaKrajowaZagraniczna, WnioskodawcaPostepowania, MigracjaReczna, AdnotacjeIUwagi, RaportWyslaniaSK, SposobZaplaty, DataArch, ID_Pismo_xml, IdentyfikatorPodatnika, KodJednostki, NumerPokwitowania, KwotaKaucji)
	VALUES (src.IdentyfikatorDokumentu, src.DokumentArchiwalny, src.NumerDecyzji, src.RodzajKary, src.DataWydania, src.DataOtrzymania, src.TerminPlatnosci, src.CzyNaliczycOdsetki, src.WWynikuKontroliPostepowania, src.NrUpowaznienia, src.NrPostanowieniaOWszczeciuPostepowania, src.WynikKontroliNumerWniosku, src.KaraRazem, src.OsobaKrajowaZagraniczna, src.WnioskodawcaPostepowania, src.MigracjaReczna, src.AdnotacjeIUwagi, src.RaportWyslaniaSK, src.SposobZaplaty, src.DataArch, src.ID_Pismo_xml, src.IdentyfikatorPodatnika, src.KodJednostki, src.NumerPokwitowania, src.KwotaKaucji);
SET @Merged = 1;
 END 


--DOOD_Dokument                  
IF @TableName = 'DOOD_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOOD_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DOOD_Dokument) 
 MERGE INTO zef2DW.DOOD_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DOOD_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[WWynikuKontroliPostepowania]=src.[WWynikuKontroliPostepowania],
tgt.[RaportWyslaniaSK]=src.[RaportWyslaniaSK],
tgt.[OrganWydajacyUks]=src.[OrganWydajacyUks],
tgt.[NumerDecyzji]=src.[NumerDecyzji],
tgt.[KodJednostki]=src.[KodJednostki],
tgt.[OrganWydajacyIc]=src.[OrganWydajacyIc],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[NrPostanowieniaOWszczeciuPostepowania]=src.[NrPostanowieniaOWszczeciuPostepowania],
tgt.[PierwotnyNumerDokumentu]=src.[PierwotnyNumerDokumentu],
tgt.[JakiOkresRozliczeniowy]=src.[JakiOkresRozliczeniowy],
tgt.[TerminPlatnosciWynikajacyZDeklaracji]=src.[TerminPlatnosciWynikajacyZDeklaracji],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[DokumentArchiwalny]=src.[DokumentArchiwalny],
tgt.[MigracjaReczna]=src.[MigracjaReczna],
tgt.[DataWydania]=src.[DataWydania],
tgt.[WynikKontroliNumerWniosku]=src.[WynikKontroliNumerWniosku],
tgt.[DataArch]=src.[DataArch],
tgt.[RazemNalezneZaliczki]=src.[RazemNalezneZaliczki],
tgt.[RazemOdsetki]=src.[RazemOdsetki],
tgt.[OrganWydajacyUs]=src.[OrganWydajacyUs],
tgt.[WnioskodawcaPostepowania]=src.[WnioskodawcaPostepowania],
tgt.[PierwotnyRodzajDokumentu]=src.[PierwotnyRodzajDokumentu],

tgt.[TerminOdsetki]=src.[TerminOdsetki],
tgt.[ZaOkres]=src.[ZaOkres],
tgt.[TerminPlatnosci]=src.[TerminPlatnosci],
tgt.[DecyzjaWydanaPrzez]=src.[DecyzjaWydanaPrzez],
tgt.[DataDoreczenia]=src.[DataDoreczenia],
tgt.[NrUpowaznienia]=src.[NrUpowaznienia]WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([ID_Pismo_xml], [WWynikuKontroliPostepowania], [RaportWyslaniaSK], [OrganWydajacyUks], [NumerDecyzji], [KodJednostki], [OrganWydajacyIc], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [NrPostanowieniaOWszczeciuPostepowania], [PierwotnyNumerDokumentu], [JakiOkresRozliczeniowy], [TerminPlatnosciWynikajacyZDeklaracji], [AdnotacjeIUwagi], [DokumentArchiwalny], [MigracjaReczna], [DataWydania], [WynikKontroliNumerWniosku], [DataArch], [RazemNalezneZaliczki], [RazemOdsetki], [OrganWydajacyUs], [WnioskodawcaPostepowania], [PierwotnyRodzajDokumentu],  [TerminOdsetki], [ZaOkres], [TerminPlatnosci], [DecyzjaWydanaPrzez], [DataDoreczenia], [NrUpowaznienia] )
VALUES ([ID_Pismo_xml], [WWynikuKontroliPostepowania], [RaportWyslaniaSK], [OrganWydajacyUks], [NumerDecyzji], [KodJednostki], [OrganWydajacyIc], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [NrPostanowieniaOWszczeciuPostepowania], [PierwotnyNumerDokumentu], [JakiOkresRozliczeniowy], [TerminPlatnosciWynikajacyZDeklaracji], [AdnotacjeIUwagi], [DokumentArchiwalny], [MigracjaReczna], [DataWydania], [WynikKontroliNumerWniosku], [DataArch], [RazemNalezneZaliczki], [RazemOdsetki], [OrganWydajacyUs], [WnioskodawcaPostepowania], [PierwotnyRodzajDokumentu],  [TerminOdsetki], [ZaOkres], [TerminPlatnosci], [DecyzjaWydanaPrzez], [DataDoreczenia], [NrUpowaznienia] );


SET @Merged = 1;
 END 

--DOOP_Dokument                  

IF @TableName = 'DOOP_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOOP_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DOOP_Dokument) 
MERGE INTO zef2DW.DOOP_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DOOP_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.TypDochodu=src.TypDochodu, tgt.DataDecyzji=src.DataDecyzji, tgt.NumerDecyzji=src.NumerDecyzji, tgt.DataDoreczenia=src.DataDoreczenia, tgt.DataWniosku=src.DataWniosku, tgt.NumerWniosku=src.NumerWniosku, tgt.AnulowanoOdroczenia=src.AnulowanoOdroczenia, tgt.PozycjeSumaOdroczona=src.PozycjeSumaOdroczona, tgt.PozycjeSumaOdsetki=src.PozycjeSumaOdsetki, tgt.PozycjeSumaOplataProlongacyjna=src.PozycjeSumaOplataProlongacyjna, tgt.RejestracjaKontrahenta=src.RejestracjaKontrahenta, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, TypDochodu, DataDecyzji, NumerDecyzji, DataDoreczenia, DataWniosku, NumerWniosku, AnulowanoOdroczenia, PozycjeSumaOdroczona, PozycjeSumaOdsetki, PozycjeSumaOplataProlongacyjna, RejestracjaKontrahenta, AdnotacjeIUwagi, RaportWyslaniaSK, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.TypDochodu, src.DataDecyzji, src.NumerDecyzji, src.DataDoreczenia, src.DataWniosku, src.NumerWniosku, src.AnulowanoOdroczenia, src.PozycjeSumaOdroczona, src.PozycjeSumaOdsetki, src.PozycjeSumaOplataProlongacyjna, src.RejestracjaKontrahenta, src.AdnotacjeIUwagi, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--DOPN_Dokument                  
IF @TableName = 'DOPN_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOPN_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DOPN_Dokument) 
 MERGE INTO zef2DW.DOPN_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DOPN_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.NumerZglaszajacego=src.NumerZglaszajacego, tgt.NazwaZglaszajacego=src.NazwaZglaszajacego, tgt.System=src.System, tgt.NipZglaszajacego=src.NipZglaszajacego, tgt.PeselZglaszajacego=src.PeselZglaszajacego, tgt.RegonZglaszajacego=src.RegonZglaszajacego, tgt.NazwaPelnaZglaszajacego=src.NazwaPelnaZglaszajacego, tgt.RodzajZglaszajacego=src.RodzajZglaszajacego, tgt.NazwiskoZglaszajacego=src.NazwiskoZglaszajacego, tgt.ImieZglaszajacego=src.ImieZglaszajacego, tgt.DataUrodzeniaZglaszajacego=src.DataUrodzeniaZglaszajacego, tgt.KrajZglaszajacego=src.KrajZglaszajacego, tgt.WojewodztwoZglaszajacego=src.WojewodztwoZglaszajacego, tgt.PowiatZglaszajacego=src.PowiatZglaszajacego, tgt.GminaZglaszajacego=src.GminaZglaszajacego, tgt.UlicaZglaszajacego=src.UlicaZglaszajacego, tgt.NrDomuZglaszajacego=src.NrDomuZglaszajacego, tgt.NrLokaluZglaszajacego=src.NrLokaluZglaszajacego, tgt.MiejscowoscZglaszajacego=src.MiejscowoscZglaszajacego, tgt.KodPocztowyZglaszajacego=src.KodPocztowyZglaszajacego, tgt.PocztaZglaszajacego=src.PocztaZglaszajacego, tgt.NrEORIZglaszajacego=src.NrEORIZglaszajacego, tgt.NrDokumentuZglaszajacego=src.NrDokumentuZglaszajacego, tgt.NrVatUeZglaszajacego=src.NrVatUeZglaszajacego, tgt.UwagiZglaszajacego=src.UwagiZglaszajacego, tgt.DataWystawienia=src.DataWystawienia, tgt.DataPowiadomienia=src.DataPowiadomienia, tgt.DataDlugu=src.DataDlugu, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.SumaNaleznosci=src.SumaNaleznosci, tgt.NumerDecyzji=src.NumerDecyzji, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.PierwotnyRodzajDokumentu=src.PierwotnyRodzajDokumentu, tgt.PierwotnyNumerDokumentu=src.PierwotnyNumerDokumentu, tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeKwota=src.PozycjeKwota, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, NumerZglaszajacego, NazwaZglaszajacego, System, NipZglaszajacego, PeselZglaszajacego, RegonZglaszajacego, NazwaPelnaZglaszajacego, RodzajZglaszajacego, NazwiskoZglaszajacego, ImieZglaszajacego, DataUrodzeniaZglaszajacego, KrajZglaszajacego, WojewodztwoZglaszajacego, PowiatZglaszajacego, GminaZglaszajacego, UlicaZglaszajacego, NrDomuZglaszajacego, NrLokaluZglaszajacego, MiejscowoscZglaszajacego, KodPocztowyZglaszajacego, PocztaZglaszajacego, NrEORIZglaszajacego, NrDokumentuZglaszajacego, NrVatUeZglaszajacego, UwagiZglaszajacego, DataWystawienia, DataPowiadomienia, DataDlugu, TerminPlatnosci, RaportWyslaniaSK, SumaNaleznosci, NumerDecyzji, AdnotacjeIUwagi, PierwotnyRodzajDokumentu, PierwotnyNumerDokumentu, PozycjeRodzajNaleznosci, PozycjeKwota, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.NumerZglaszajacego, src.NazwaZglaszajacego, src.System, src.NipZglaszajacego, src.PeselZglaszajacego, src.RegonZglaszajacego, src.NazwaPelnaZglaszajacego, src.RodzajZglaszajacego, src.NazwiskoZglaszajacego, src.ImieZglaszajacego, src.DataUrodzeniaZglaszajacego, src.KrajZglaszajacego, src.WojewodztwoZglaszajacego, src.PowiatZglaszajacego, src.GminaZglaszajacego, src.UlicaZglaszajacego, src.NrDomuZglaszajacego, src.NrLokaluZglaszajacego, src.MiejscowoscZglaszajacego, src.KodPocztowyZglaszajacego, src.PocztaZglaszajacego, src.NrEORIZglaszajacego, src.NrDokumentuZglaszajacego, src.NrVatUeZglaszajacego, src.UwagiZglaszajacego, src.DataWystawienia, src.DataPowiadomienia, src.DataDlugu, src.TerminPlatnosci, src.RaportWyslaniaSK, src.SumaNaleznosci, src.NumerDecyzji, src.AdnotacjeIUwagi, src.PierwotnyRodzajDokumentu, src.PierwotnyNumerDokumentu, src.PozycjeRodzajNaleznosci, src.PozycjeKwota, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 


--DOPO_Dokument                  
IF @TableName = 'DOPO_Dokument' BEGIN 
	DELETE FROM WA_Hurtownia.zef2DW.DOPO_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DOPO_Dokument) 
	MERGE INTO zef2DW.DOPO_Dokument AS tgt
	USING WA_StageHurtownia.zef2DW.DOPO_Dokument AS src
	ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
	WHEN MATCHED AND src.operacja IN ('U', 'I')
	THEN UPDATE SET
	tgt.TypDochodu=src.TypDochodu, tgt.NumerDecyzji=src.NumerDecyzji, tgt.DataDecyzji=src.DataDecyzji, tgt.DataDoreczenia=src.DataDoreczenia, tgt.NowyTerminPlatnosci=src.NowyTerminPlatnosci, tgt.PrzyczynaZadluzenia=src.PrzyczynaZadluzenia, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika, tgt.KodJednostki=src.KodJednostki, tgt.MigracjaReczna=src.MigracjaReczna
	WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
	WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
	THEN INSERT (IdentyfikatorDokumentu, TypDochodu, NumerDecyzji, DataDecyzji, DataDoreczenia, NowyTerminPlatnosci, PrzyczynaZadluzenia, AdnotacjeIUwagi, RaportWyslaniaSK, DataArch, ID_Pismo_xml, IdentyfikatorPodatnika, KodJednostki, MigracjaReczna)
	VALUES (src.IdentyfikatorDokumentu, src.TypDochodu, src.NumerDecyzji, src.DataDecyzji, src.DataDoreczenia, src.NowyTerminPlatnosci, src.PrzyczynaZadluzenia, src.AdnotacjeIUwagi, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml, src.IdentyfikatorPodatnika, src.KodJednostki, src.MigracjaReczna);
SET @Merged = 1;
 END 


--DOPR_Dokument                  
IF @TableName = 'DOPR_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOPR_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DOPR_Dokument) 
 MERGE INTO zef2DW.DOPR_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DOPR_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.NumerZglaszajacego=src.NumerZglaszajacego, tgt.NazwaZglaszajacego=src.NazwaZglaszajacego, tgt.System=src.System, tgt.NumerDecyzji=src.NumerDecyzji, tgt.NipZglaszajacego=src.NipZglaszajacego, tgt.PeselZglaszajacego=src.PeselZglaszajacego, tgt.RegonZglaszajacego=src.RegonZglaszajacego, tgt.NazwaPelnaZglaszajacego=src.NazwaPelnaZglaszajacego, tgt.RodzajZglaszajacego=src.RodzajZglaszajacego, tgt.NazwiskoZglaszajacego=src.NazwiskoZglaszajacego, tgt.ImieZglaszajacego=src.ImieZglaszajacego, tgt.DataUrodzeniaZglaszajacego=src.DataUrodzeniaZglaszajacego, tgt.KrajZglaszajacego=src.KrajZglaszajacego, tgt.WojewodztwoZglaszajacego=src.WojewodztwoZglaszajacego, tgt.PowiatZglaszajacego=src.PowiatZglaszajacego, tgt.GminaZglaszajacego=src.GminaZglaszajacego, tgt.UlicaZglaszajacego=src.UlicaZglaszajacego, tgt.NrDomuZglaszajacego=src.NrDomuZglaszajacego, tgt.NrLokaluZglaszajacego=src.NrLokaluZglaszajacego, tgt.MiejscowoscZglaszajacego=src.MiejscowoscZglaszajacego, tgt.KodPocztowyZglaszajacego=src.KodPocztowyZglaszajacego, tgt.PocztaZglaszajacego=src.PocztaZglaszajacego, tgt.NrEORIZglaszajacego=src.NrEORIZglaszajacego, tgt.NrDokumentuZglaszajacego=src.NrDokumentuZglaszajacego, tgt.NrVatUeZglaszajacego=src.NrVatUeZglaszajacego, tgt.UwagiZglaszajacego=src.UwagiZglaszajacego, tgt.DataWystawienia=src.DataWystawienia, tgt.DataPowiadomienia=src.DataPowiadomienia, tgt.PrzyczynaZadluzenia=src.PrzyczynaZadluzenia, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.SumaNaleznosci=src.SumaNaleznosci, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.WalidacjaPdrRaport=src.WalidacjaPdrRaport, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, NumerZglaszajacego, NazwaZglaszajacego, System, NumerDecyzji, NipZglaszajacego, PeselZglaszajacego, RegonZglaszajacego, NazwaPelnaZglaszajacego, RodzajZglaszajacego, NazwiskoZglaszajacego, ImieZglaszajacego, DataUrodzeniaZglaszajacego, KrajZglaszajacego, WojewodztwoZglaszajacego, PowiatZglaszajacego, GminaZglaszajacego, UlicaZglaszajacego, NrDomuZglaszajacego, NrLokaluZglaszajacego, MiejscowoscZglaszajacego, KodPocztowyZglaszajacego, PocztaZglaszajacego, NrEORIZglaszajacego, NrDokumentuZglaszajacego, NrVatUeZglaszajacego, UwagiZglaszajacego, DataWystawienia, DataPowiadomienia, PrzyczynaZadluzenia, TerminPlatnosci, SumaNaleznosci, AdnotacjeIUwagi, WalidacjaPdrRaport, RaportWyslaniaSK, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.NumerZglaszajacego, src.NazwaZglaszajacego, src.System, src.NumerDecyzji, src.NipZglaszajacego, src.PeselZglaszajacego, src.RegonZglaszajacego, src.NazwaPelnaZglaszajacego, src.RodzajZglaszajacego, src.NazwiskoZglaszajacego, src.ImieZglaszajacego, src.DataUrodzeniaZglaszajacego, src.KrajZglaszajacego, src.WojewodztwoZglaszajacego, src.PowiatZglaszajacego, src.GminaZglaszajacego, src.UlicaZglaszajacego, src.NrDomuZglaszajacego, src.NrLokaluZglaszajacego, src.MiejscowoscZglaszajacego, src.KodPocztowyZglaszajacego, src.PocztaZglaszajacego, src.NrEORIZglaszajacego, src.NrDokumentuZglaszajacego, src.NrVatUeZglaszajacego, src.UwagiZglaszajacego, src.DataWystawienia, src.DataPowiadomienia, src.PrzyczynaZadluzenia, src.TerminPlatnosci, src.SumaNaleznosci, src.AdnotacjeIUwagi, src.WalidacjaPdrRaport, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--DORA_Dokument                  

IF @TableName = 'DORA_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DORA_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DORA_Dokument) 
 MERGE INTO zef2DW.DORA_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DORA_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[LacznaKwotaRat]=src.[LacznaKwotaRat],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[RazemRatyKwota]=src.[RazemRatyKwota],
tgt.[TypDochodu]=src.[TypDochodu],
tgt.[RaportWyslaniaSK]=src.[RaportWyslaniaSK],
tgt.[PierwotneKwotaRozkladanaRazem]=src.[PierwotneKwotaRozkladanaRazem],
tgt.[NumerDecyzji]=src.[NumerDecyzji],
tgt.[IloscRat]=src.[IloscRat],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[TerminPierwszejRaty]=src.[TerminPierwszejRaty],
tgt.[PierwotneKwotaNaleznosciRazem]=src.[PierwotneKwotaNaleznosciRazem],
tgt.[DataDecyzji]=src.[DataDecyzji],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[SumaRatyOplaty]=src.[SumaRatyOplaty],
tgt.[OrganWydajacy]=src.[OrganWydajacy],
tgt.[MigracjaReczna]=src.[MigracjaReczna],
tgt.[DataArch]=src.[DataArch],
tgt.[KwotaRozkladanaRazem]=src.[KwotaRozkladanaRazem],
tgt.[NumerWniosku]=src.[NumerWniosku],
tgt.[MaksKwotaRat]=src.[MaksKwotaRat],
tgt.[KwotaNaleznosciRazem]=src.[KwotaNaleznosciRazem],
tgt.[DataWniosku]=src.[DataWniosku],
tgt.[SumaRatyOdsetki]=src.[SumaRatyOdsetki]

WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([LacznaKwotaRat], [ID_Pismo_xml], [RazemRatyKwota], [TypDochodu], [RaportWyslaniaSK], [PierwotneKwotaRozkladanaRazem], [NumerDecyzji], [IloscRat], [IdentyfikatorPodatnika], [TerminPierwszejRaty], [IdentyfikatorDokumentu], [PierwotneKwotaNaleznosciRazem], [DataDecyzji], [AdnotacjeIUwagi], [SumaRatyOplaty], [OrganWydajacy], [MigracjaReczna], [DataArch], [KwotaRozkladanaRazem], [NumerWniosku], [MaksKwotaRat], [KwotaNaleznosciRazem], [DataWniosku], [SumaRatyOdsetki])
VALUES ([LacznaKwotaRat], [ID_Pismo_xml], [RazemRatyKwota], [TypDochodu], [RaportWyslaniaSK], [PierwotneKwotaRozkladanaRazem], [NumerDecyzji], [IloscRat], [IdentyfikatorPodatnika], [TerminPierwszejRaty], [IdentyfikatorDokumentu], [PierwotneKwotaNaleznosciRazem], [DataDecyzji], [AdnotacjeIUwagi], [SumaRatyOplaty], [OrganWydajacy], [MigracjaReczna], [DataArch], [KwotaRozkladanaRazem], [NumerWniosku], [MaksKwotaRat], [KwotaNaleznosciRazem], [DataWniosku], [SumaRatyOdsetki]);

SET @Merged = 1;
 END 

--DOUP_Dokument                  
IF @TableName = 'DOUP_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOUP_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DOUP_Dokument) 
 MERGE INTO zef2DW.DOUP_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DOUP_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.TypDochodu=src.TypDochodu, tgt.NumerDecyzji=src.NumerDecyzji, tgt.DataDecyzji=src.DataDecyzji, tgt.DataDoreczenia=src.DataDoreczenia, tgt.RodzajPodatku=src.RodzajPodatku, tgt.OrganWydajacy=src.OrganWydajacy, tgt.WWynikuKontroliPostepowania=src.WWynikuKontroliPostepowania, tgt.NrUpowaznienia=src.NrUpowaznienia, tgt.NrPostanowieniaOWszczeciuPostepowania=src.NrPostanowieniaOWszczeciuPostepowania, tgt.WynikKontroliNumerWniosku=src.WynikKontroliNumerWniosku, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.WnioskodawcaPostepowania=src.WnioskodawcaPostepowania, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, TypDochodu, NumerDecyzji, DataDecyzji, DataDoreczenia, RodzajPodatku, OrganWydajacy, WWynikuKontroliPostepowania, NrUpowaznienia, NrPostanowieniaOWszczeciuPostepowania, WynikKontroliNumerWniosku, RodzajDokumentu, NumerDokumentu, WnioskodawcaPostepowania, AdnotacjeIUwagi, RaportWyslaniaSK, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.TypDochodu, src.NumerDecyzji, src.DataDecyzji, src.DataDoreczenia, src.RodzajPodatku, src.OrganWydajacy, src.WWynikuKontroliPostepowania, src.NrUpowaznienia, src.NrPostanowieniaOWszczeciuPostepowania, src.WynikKontroliNumerWniosku, src.RodzajDokumentu, src.NumerDokumentu, src.WnioskodawcaPostepowania, src.AdnotacjeIUwagi, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 
--DPDZ_Dokument                  
IF @TableName = 'DPDZ_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DPDZ_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DPDZ_Dokument) 
 MERGE INTO zef2DW.DPDZ_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DPDZ_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[NazwiskoZglaszajacego]=src.[NazwiskoZglaszajacego],
tgt.[DataZwolnieniaTowaru]=src.[DataZwolnieniaTowaru],
tgt.[RodzajZglaszajacego]=src.[RodzajZglaszajacego],
tgt.[UwagiZglaszajacego]=src.[UwagiZglaszajacego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[NrDokumentuZglaszajacego]=src.[NrDokumentuZglaszajacego],
tgt.[PozycjeRazem]=src.[PozycjeRazem],
tgt.[System]=src.[System],
tgt.[RaportWyslaniaSK]=src.[RaportWyslaniaSK],
tgt.[RegonZglaszajacego]=src.[RegonZglaszajacego],
tgt.[UlicaZglaszajacego]=src.[UlicaZglaszajacego],
tgt.[ImieZglaszajacego]=src.[ImieZglaszajacego],
tgt.[AIS]=src.[AIS],
tgt.[DataZgloszenia]=src.[DataZgloszenia],
tgt.[NrEORIZglaszajacego]=src.[NrEORIZglaszajacego],
tgt.[PowiatZglaszajacego]=src.[PowiatZglaszajacego],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[Usunieto]=src.[Usunieto],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[DataPowiadomienia]=src.[DataPowiadomienia],
tgt.[ObrotPocztowy]=src.[ObrotPocztowy],
tgt.[WpisDoRejestruDluguCelnego]=src.[WpisDoRejestruDluguCelnego],
tgt.[DokumentArchiwalny]=src.[DokumentArchiwalny],
tgt.[NumerZglaszajacego]=src.[NumerZglaszajacego],
tgt.[NrVatUeZglaszajacego]=src.[NrVatUeZglaszajacego],
tgt.[KwotaZabezpieczeniaTSW]=src.[KwotaZabezpieczeniaTSW],
tgt.[DataArch]=src.[DataArch],
tgt.[NrLokaluZglaszajacego]=src.[NrLokaluZglaszajacego],
tgt.[PocztaZglaszajacego]=src.[PocztaZglaszajacego],
tgt.[DataUrodzeniaZglaszajacego]=src.[DataUrodzeniaZglaszajacego],
tgt.[GminaZglaszajacego]=src.[GminaZglaszajacego],
tgt.[NazwaZglaszajacego]=src.[NazwaZglaszajacego],
tgt.[KrajZglaszajacego]=src.[KrajZglaszajacego],
tgt.[NazwaPelnaZglaszajacego]=src.[NazwaPelnaZglaszajacego],
tgt.[KodPocztowyZglaszajacego]=src.[KodPocztowyZglaszajacego],
tgt.[WojewodztwoZglaszajacego]=src.[WojewodztwoZglaszajacego],
tgt.[RazemBezZwol]=src.[RazemBezZwol],

tgt.[NrZgloszenia]=src.[NrZgloszenia],
tgt.[NrDomuZglaszajacego]=src.[NrDomuZglaszajacego],
tgt.[MiejscowoscZglaszajacego]=src.[MiejscowoscZglaszajacego],
tgt.[TerminPlatnosci]=src.[TerminPlatnosci],
tgt.[DataPowstaniaDluguCelnego]=src.[DataPowstaniaDluguCelnego],
tgt.[NipZglaszajacego]=src.[NipZglaszajacego],
tgt.[PeselZglaszajacego]=src.[PeselZglaszajacego],
tgt.[DataRejestracjiRDC]=src.[DataRejestracjiRDC]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([DataZwolnieniaTowaru], [RodzajZglaszajacego], [System], [RegonZglaszajacego], [UlicaZglaszajacego], [DataZgloszenia], [NrEORIZglaszajacego], [DataPowiadomienia], [ObrotPocztowy], [NumerZglaszajacego], [KwotaZabezpieczeniaTSW], [DataArch], [NrLokaluZglaszajacego], [GminaZglaszajacego], [NazwaZglaszajacego], [KrajZglaszajacego], [KodPocztowyZglaszajacego], [WojewodztwoZglaszajacego],  [NrZgloszenia], [MiejscowoscZglaszajacego], [DataPowstaniaDluguCelnego], [NipZglaszajacego], [NazwiskoZglaszajacego], [UwagiZglaszajacego], [ID_Pismo_xml], [NrDokumentuZglaszajacego], [PozycjeRazem], [RaportWyslaniaSK], [ImieZglaszajacego], [AIS], [PowiatZglaszajacego], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [Usunieto], [AdnotacjeIUwagi], [WpisDoRejestruDluguCelnego], [DokumentArchiwalny], [NrVatUeZglaszajacego], [PocztaZglaszajacego], [DataUrodzeniaZglaszajacego], [NazwaPelnaZglaszajacego], [RazemBezZwol], [NrDomuZglaszajacego], [TerminPlatnosci], [PeselZglaszajacego], [DataRejestracjiRDC] )
VALUES ([DataZwolnieniaTowaru], [RodzajZglaszajacego], [System], [RegonZglaszajacego], [UlicaZglaszajacego], [DataZgloszenia], [NrEORIZglaszajacego], [DataPowiadomienia], [ObrotPocztowy], [NumerZglaszajacego], [KwotaZabezpieczeniaTSW], [DataArch], [NrLokaluZglaszajacego], [GminaZglaszajacego], [NazwaZglaszajacego], [KrajZglaszajacego], [KodPocztowyZglaszajacego], [WojewodztwoZglaszajacego],  [NrZgloszenia], [MiejscowoscZglaszajacego], [DataPowstaniaDluguCelnego], [NipZglaszajacego], [NazwiskoZglaszajacego], [UwagiZglaszajacego], [ID_Pismo_xml], [NrDokumentuZglaszajacego], [PozycjeRazem], [RaportWyslaniaSK], [ImieZglaszajacego], [AIS], [PowiatZglaszajacego], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [Usunieto], [AdnotacjeIUwagi], [WpisDoRejestruDluguCelnego], [DokumentArchiwalny], [NrVatUeZglaszajacego], [PocztaZglaszajacego], [DataUrodzeniaZglaszajacego], [NazwaPelnaZglaszajacego], [RazemBezZwol], [NrDomuZglaszajacego], [TerminPlatnosci], [PeselZglaszajacego], [DataRejestracjiRDC] );


SET @Merged = 1;
 END 


--DUNA_Dokument                  

IF @TableName = 'DUNA_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DUNA_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DUNA_Dokument) 
 MERGE INTO zef2DW.DUNA_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DUNA_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[RazemUmorzenie]=src.[RazemUmorzenie],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[PrzyczynyUmorzenia]=src.[PrzyczynyUmorzenia],
tgt.[WWynikuKontroliPostepowania]=src.[WWynikuKontroliPostepowania],
tgt.[TypDochodu]=src.[TypDochodu],
tgt.[RaportWyslaniaSK]=src.[RaportWyslaniaSK],
tgt.[NumerDecyzji]=src.[NumerDecyzji],
tgt.[RazemNaleznosc]=src.[RazemNaleznosc],
tgt.[WnioskodawcaPostepowania]=src.[WnioskodawcaPostepowania],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[NrPostanowieniaOWszczeciuPostepowania]=src.[NrPostanowieniaOWszczeciuPostepowania],

tgt.[DataDecyzji]=src.[DataDecyzji],
tgt.[WpisDoRejestruCelnego]=src.[WpisDoRejestruCelnego],
tgt.[PierwotnyRodzaj]=src.[PierwotnyRodzaj],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[PierwotnyNumer]=src.[PierwotnyNumer],
tgt.[WynikKontroliNumerWniosku]=src.[WynikKontroliNumerWniosku],
tgt.[DataDoreczenia]=src.[DataDoreczenia],
tgt.[DataArch]=src.[DataArch],
tgt.[NrUpowaznienia]=src.[NrUpowaznienia],
tgt.[DataRejestracjiRDC]=src.[DataRejestracjiRDC]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([ID_Pismo_xml], [WWynikuKontroliPostepowania], [TypDochodu], [RaportWyslaniaSK], [NumerDecyzji], [RazemNaleznosc], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [NrPostanowieniaOWszczeciuPostepowania], [DataDecyzji], [WpisDoRejestruCelnego], [PierwotnyRodzaj], [AdnotacjeIUwagi], [WynikKontroliNumerWniosku], [DataArch], [RazemUmorzenie], [PrzyczynyUmorzenia], [WnioskodawcaPostepowania],  [PierwotnyNumer], [DataDoreczenia], [NrUpowaznienia], [DataRejestracjiRDC] )
VALUES ([ID_Pismo_xml], [WWynikuKontroliPostepowania], [TypDochodu], [RaportWyslaniaSK], [NumerDecyzji], [RazemNaleznosc], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [NrPostanowieniaOWszczeciuPostepowania], [DataDecyzji], [WpisDoRejestruCelnego], [PierwotnyRodzaj], [AdnotacjeIUwagi], [WynikKontroliNumerWniosku], [DataArch], [RazemUmorzenie], [PrzyczynyUmorzenia], [WnioskodawcaPostepowania],  [PierwotnyNumer], [DataDoreczenia], [NrUpowaznienia], [DataRejestracjiRDC] );

SET @Merged = 1;
 END 

--DUOD_Dokument                  
IF @TableName = 'DUOD_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DUOD_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DUOD_Dokument) 
 MERGE INTO zef2DW.DUOD_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DUOD_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.DataDecyzji=src.DataDecyzji, tgt.DataDoreczenia=src.DataDoreczenia, tgt.NumerDecyzji=src.NumerDecyzji, tgt.WWynikuKontroliPostepowania=src.WWynikuKontroliPostepowania, tgt.NrUpowaznienia=src.NrUpowaznienia, tgt.NrPostanowieniaOWszczeciuPostepowania=src.NrPostanowieniaOWszczeciuPostepowania, tgt.WynikKontroliNumerWniosku=src.WynikKontroliNumerWniosku, tgt.PierwotnyRodzaj=src.PierwotnyRodzaj, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.PierwotnyNumer=src.PierwotnyNumer, tgt.WnioskodawcaPostepowania=src.WnioskodawcaPostepowania, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, DataDecyzji, DataDoreczenia, NumerDecyzji, WWynikuKontroliPostepowania, NrUpowaznienia, NrPostanowieniaOWszczeciuPostepowania, WynikKontroliNumerWniosku, PierwotnyRodzaj, AdnotacjeIUwagi, PierwotnyNumer, WnioskodawcaPostepowania, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.DataDecyzji, src.DataDoreczenia, src.NumerDecyzji, src.WWynikuKontroliPostepowania, src.NrUpowaznienia, src.NrPostanowieniaOWszczeciuPostepowania, src.WynikKontroliNumerWniosku, src.PierwotnyRodzaj, src.AdnotacjeIUwagi, src.PierwotnyNumer, src.WnioskodawcaPostepowania, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--DVIM_Dokument                  

IF @TableName = 'DVIM_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DVIM_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DVIM_Dokument) 
 MERGE INTO zef2DW.DVIM_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DVIM_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.DataWplywu=src.DataWplywu, tgt.DataZgloszeniaCelnego=src.DataZgloszeniaCelnego, tgt.DataZlozeniaVat=src.DataZlozeniaVat, tgt.NumerDeklaracji=src.NumerDeklaracji, tgt.ArtykulUstawy=src.ArtykulUstawy, tgt.NumerZgloszeniaCelnego=src.NumerZgloszeniaCelnego, tgt.DataWplywiArtb=src.DataWplywiArtb, tgt.OkresRozliczeniowy=src.OkresRozliczeniowy, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, DataWplywu, DataZgloszeniaCelnego, DataZlozeniaVat, NumerDeklaracji, ArtykulUstawy, NumerZgloszeniaCelnego, DataWplywiArtb, OkresRozliczeniowy, TerminPlatnosci, AdnotacjeIUwagi, RaportWyslaniaSK, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.DataWplywu, src.DataZgloszeniaCelnego, src.DataZlozeniaVat, src.NumerDeklaracji, src.ArtykulUstawy, src.NumerZgloszeniaCelnego, src.DataWplywiArtb, src.OkresRozliczeniowy, src.TerminPlatnosci, src.AdnotacjeIUwagi, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

 
--DWNN_Dokument                  
IF @TableName = 'DWNN_Dokument' BEGIN 
	DELETE FROM WA_Hurtownia.zef2DW.DWNN_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DWNN_Dokument) 
	MERGE INTO zef2DW.DWNN_Dokument AS tgt
	USING WA_StageHurtownia.zef2DW.DWNN_Dokument AS src
	ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
	WHEN MATCHED AND src.operacja IN ('U', 'I') AND src.operacja IN ('U','I')
	THEN UPDATE SET
	tgt.AIS=src.AIS, tgt.DataPowiadomienia=src.DataPowiadomienia, tgt.DataWystawieniaDecyzji=src.DataWystawieniaDecyzji, tgt.DataPowstaniaDluguCelnego=src.DataPowstaniaDluguCelnego, tgt.DataZwolnieniaTowaru=src.DataZwolnieniaTowaru, tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.FormaOdroczenia=src.FormaOdroczenia, tgt.KwotaZabezpieczeniaTSW=src.KwotaZabezpieczeniaTSW, tgt.NaliczycOdsetki=src.NaliczycOdsetki, tgt.NumerPozwolenia=src.NumerPozwolenia, tgt.OdroczonyTerminPlatnosci=src.OdroczonyTerminPlatnosci, tgt.OkresRozliczeniowy=src.OkresRozliczeniowy, tgt.Ownres=src.Ownres, tgt.PozycjeRazem=src.PozycjeRazem, tgt.RazemBezZwol=src.RazemBezZwol, tgt.ProceduraCelna=src.ProceduraCelna, tgt.ProceduraUproszczona=src.ProceduraUproszczona, tgt.PrzyczynaZadluzenia=src.PrzyczynaZadluzenia, tgt.RodzajOdprawy=src.RodzajOdprawy, tgt.NumerDecyzji=src.NumerDecyzji, tgt.NumerPozwoleniaSASP=src.NumerPozwoleniaSASP, tgt.OrganCelnySASP=src.OrganCelnySASP, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.WpisDoRejestruDluguCelnego=src.WpisDoRejestruDluguCelnego, tgt.ZaswiadczenieOZaleglosciach=src.ZaswiadczenieOZaleglosciach, tgt.NumerZabezpieczniaJednorazowego=src.NumerZabezpieczniaJednorazowego, tgt.KwotaZabezpieczeniaJednorazowego=src.KwotaZabezpieczeniaJednorazowego, tgt.DataObciazeniaZabezpieczeniaJednorazowego=src.DataObciazeniaZabezpieczeniaJednorazowego, tgt.NIPKontrahentaZabezpieczeniaJednorazowego=src.NIPKontrahentaZabezpieczeniaJednorazowego, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.NumerZabezpieczeniaGeneralnego=src.NumerZabezpieczeniaGeneralnego, tgt.KwotaZabezpieczeniaGeneralnego=src.KwotaZabezpieczeniaGeneralnego, tgt.DataObciazeniaZabezpieczeniaGeneralnego=src.DataObciazeniaZabezpieczeniaGeneralnego, tgt.CzyZabezpieczenieGeneralneObciazaAIS=src.CzyZabezpieczenieGeneralneObciazaAIS, tgt.MigracjaReczna=src.MigracjaReczna, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika, tgt.KodJednostki=src.KodJednostki, tgt.DataRejestracjiRDC=src.DataRejestracjiRDC, tgt.NaleznosciCelnoPodatkowe=src.NaleznosciCelnoPodatkowe, tgt.StawkaOdsetek=src.StawkaOdsetek
	WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
	WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
	THEN INSERT (IdentyfikatorDokumentu, AIS, DataPowiadomienia, DataWystawieniaDecyzji, DataPowstaniaDluguCelnego, DataZwolnieniaTowaru, DokumentArchiwalny, FormaOdroczenia, KwotaZabezpieczeniaTSW, NaliczycOdsetki, NumerPozwolenia, OdroczonyTerminPlatnosci, OkresRozliczeniowy, Ownres, PozycjeRazem, RazemBezZwol, ProceduraCelna, ProceduraUproszczona, PrzyczynaZadluzenia, RodzajOdprawy, NumerDecyzji, NumerPozwoleniaSASP, OrganCelnySASP, TerminPlatnosci, WpisDoRejestruDluguCelnego, ZaswiadczenieOZaleglosciach, NumerZabezpieczniaJednorazowego, KwotaZabezpieczeniaJednorazowego, DataObciazeniaZabezpieczeniaJednorazowego, NIPKontrahentaZabezpieczeniaJednorazowego, AdnotacjeIUwagi, RaportWyslaniaSK, NumerZabezpieczeniaGeneralnego, KwotaZabezpieczeniaGeneralnego, DataObciazeniaZabezpieczeniaGeneralnego, CzyZabezpieczenieGeneralneObciazaAIS, MigracjaReczna, DataArch, ID_Pismo_xml, IdentyfikatorPodatnika, KodJednostki, DataRejestracjiRDC, NaleznosciCelnoPodatkowe, StawkaOdsetek)
	VALUES (src.IdentyfikatorDokumentu, src.AIS, src.DataPowiadomienia, src.DataWystawieniaDecyzji, src.DataPowstaniaDluguCelnego, src.DataZwolnieniaTowaru, src.DokumentArchiwalny, src.FormaOdroczenia, src.KwotaZabezpieczeniaTSW, src.NaliczycOdsetki, src.NumerPozwolenia, src.OdroczonyTerminPlatnosci, src.OkresRozliczeniowy, src.Ownres, src.PozycjeRazem, src.RazemBezZwol, src.ProceduraCelna, src.ProceduraUproszczona, src.PrzyczynaZadluzenia, src.RodzajOdprawy, src.NumerDecyzji, src.NumerPozwoleniaSASP, src.OrganCelnySASP, src.TerminPlatnosci, src.WpisDoRejestruDluguCelnego, src.ZaswiadczenieOZaleglosciach, src.NumerZabezpieczniaJednorazowego, src.KwotaZabezpieczeniaJednorazowego, src.DataObciazeniaZabezpieczeniaJednorazowego, src.NIPKontrahentaZabezpieczeniaJednorazowego, src.AdnotacjeIUwagi, src.RaportWyslaniaSK, src.NumerZabezpieczeniaGeneralnego, src.KwotaZabezpieczeniaGeneralnego, src.DataObciazeniaZabezpieczeniaGeneralnego, src.CzyZabezpieczenieGeneralneObciazaAIS, src.MigracjaReczna, src.DataArch, src.ID_Pismo_xml, src.IdentyfikatorPodatnika, src.KodJednostki, src.DataRejestracjiRDC, src.NaleznosciCelnoPodatkowe, src.StawkaOdsetek); 
SET @Merged = 1;
 END


--DZAB_Dokument                  
IF @TableName = 'DZAB_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DZAB_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DZAB_Dokument) 
 MERGE INTO zef2DW.DZAB_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DZAB_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[Naleznosci]=src.[Naleznosci],
tgt.[TypDochodu]=src.[TypDochodu],
tgt.[RaportWyslaniaSK]=src.[RaportWyslaniaSK],
tgt.[NumerDecyzji]=src.[NumerDecyzji],
tgt.[Odsetki]=src.[Odsetki],
tgt.[Razem]=src.[Razem],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],

tgt.[DataWygaszenia]=src.[DataWygaszenia],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[OrganWydajacy]=src.[OrganWydajacy],
tgt.[RodzajPodatku]=src.[RodzajPodatku],
tgt.[DataWydania]=src.[DataWydania],
tgt.[DataDoreczenia]=src.[DataDoreczenia],
tgt.[DataArch]=src.[DataArch]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([ID_Pismo_xml], [Naleznosci], [TypDochodu], [RaportWyslaniaSK], [NumerDecyzji], [Odsetki], [Razem], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu],  [DataWygaszenia], [AdnotacjeIUwagi], [OrganWydajacy], [RodzajPodatku], [DataWydania], [DataDoreczenia], [DataArch] )
VALUES ([ID_Pismo_xml], [Naleznosci], [TypDochodu], [RaportWyslaniaSK], [NumerDecyzji], [Odsetki], [Razem], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu],  [DataWygaszenia], [AdnotacjeIUwagi], [OrganWydajacy], [RodzajPodatku], [DataWydania], [DataDoreczenia], [DataArch] );


SET @Merged = 1;
 END 
--DZMT_Dokument                  
IF @TableName = 'DZMT_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DZMT_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DZMT_Dokument) 
 MERGE INTO zef2DW.DZMT_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DZMT_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[WWynikuKontroliPostepowania]=src.[WWynikuKontroliPostepowania],
tgt.[NowyTerminPlatnosci]=src.[NowyTerminPlatnosci],
tgt.[NumerDecyzji]=src.[NumerDecyzji],
tgt.[RodzajDeklaracji]=src.[RodzajDeklaracji],
tgt.[RodzajDecyzji]=src.[RodzajDecyzji],
tgt.[ParametryWniosku]=src.[ParametryWniosku],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[NrPostanowieniaOWszczeciuPostepowania]=src.[NrPostanowieniaOWszczeciuPostepowania],
tgt.[UchylenieTerminuZlozeniaDeklaracji]=src.[UchylenieTerminuZlozeniaDeklaracji],
tgt.[JakiOkresRozliczeniowy]=src.[JakiOkresRozliczeniowy],
tgt.[TerminZlozeniaDeklaracji]=src.[TerminZlozeniaDeklaracji],
tgt.[DataDecyzji]=src.[DataDecyzji],
tgt.[PierwotnyRodzaj]=src.[PierwotnyRodzaj],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[DataUchylenia]=src.[DataUchylenia],
tgt.[WynikKontroliNumerWniosku]=src.[WynikKontroliNumerWniosku],
tgt.[DataArch]=src.[DataArch],
tgt.[PierwotnyTerminPlatnosci]=src.[PierwotnyTerminPlatnosci],
tgt.[PierwotnyTerminZlozeniaDeklaracji]=src.[PierwotnyTerminZlozeniaDeklaracji],
tgt.[WnioskodawcaPostepowania]=src.[WnioskodawcaPostepowania],
tgt.[NowyTerminZlozeniaDeklaracji]=src.[NowyTerminZlozeniaDeklaracji],
tgt.[PierwotnyNumer]=src.[PierwotnyNumer],
tgt.[OkresNowyTerminZlozeniaDeklaracji]=src.[OkresNowyTerminZlozeniaDeklaracji],
tgt.[DataDoreczenia]=src.[DataDoreczenia],
tgt.[NrUpowaznienia]=src.[NrUpowaznienia]WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([ID_Pismo_xml], [WWynikuKontroliPostepowania], [NowyTerminPlatnosci], [NumerDecyzji], [RodzajDeklaracji], [RodzajDecyzji], [ParametryWniosku], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [NrPostanowieniaOWszczeciuPostepowania], [UchylenieTerminuZlozeniaDeklaracji], [JakiOkresRozliczeniowy], [TerminZlozeniaDeklaracji], [DataDecyzji], [PierwotnyRodzaj], [AdnotacjeIUwagi], [DataUchylenia], [WynikKontroliNumerWniosku], [DataArch], [PierwotnyTerminPlatnosci], [PierwotnyTerminZlozeniaDeklaracji], [WnioskodawcaPostepowania], [NowyTerminZlozeniaDeklaracji], [PierwotnyNumer], [OkresNowyTerminZlozeniaDeklaracji], [DataDoreczenia], [NrUpowaznienia] )
VALUES ([ID_Pismo_xml], [WWynikuKontroliPostepowania], [NowyTerminPlatnosci], [NumerDecyzji], [RodzajDeklaracji], [RodzajDecyzji], [ParametryWniosku], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [NrPostanowieniaOWszczeciuPostepowania], [UchylenieTerminuZlozeniaDeklaracji], [JakiOkresRozliczeniowy], [TerminZlozeniaDeklaracji], [DataDecyzji], [PierwotnyRodzaj], [AdnotacjeIUwagi], [DataUchylenia], [WynikKontroliNumerWniosku], [DataArch], [PierwotnyTerminPlatnosci], [PierwotnyTerminZlozeniaDeklaracji], [WnioskodawcaPostepowania], [NowyTerminZlozeniaDeklaracji], [PierwotnyNumer], [OkresNowyTerminZlozeniaDeklaracji], [DataDoreczenia], [NrUpowaznienia] );


SET @Merged = 1;
 END 
--DZMW_Dokument                  
IF @TableName = 'DZMW_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DZMW_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DZMW_Dokument) 
 MERGE INTO zef2DW.DZMW_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DZMW_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.DataDoreczenia=src.DataDoreczenia, tgt.DataUprawomocnienia=src.DataUprawomocnienia, tgt.DataWplywu=src.DataWplywu, tgt.DataWystawienia=src.DataWystawienia, tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.Koszty=src.Koszty, tgt.PierwotnyNumerDokumentu=src.PierwotnyNumerDokumentu, tgt.PierwotnyRodzajDokumentu=src.PierwotnyRodzajDokumentu, tgt.Roztrzygniecie=src.Roztrzygniecie, tgt.NumerPostanowienia=src.NumerPostanowienia, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.Typ=src.Typ, tgt.TypDochodu=src.TypDochodu, tgt.UchylenieZWinyOrganu=src.UchylenieZWinyOrganu, tgt.WpisDoRejestru=src.WpisDoRejestru, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.SposobNaliczeniaOdsetek=src.SposobNaliczeniaOdsetek, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, DataDoreczenia, DataUprawomocnienia, DataWplywu, DataWystawienia, DokumentArchiwalny, Koszty, PierwotnyNumerDokumentu, PierwotnyRodzajDokumentu, Roztrzygniecie, NumerPostanowienia, TerminPlatnosci, Typ, TypDochodu, UchylenieZWinyOrganu, WpisDoRejestru, AdnotacjeIUwagi, SposobNaliczeniaOdsetek, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.DataDoreczenia, src.DataUprawomocnienia, src.DataWplywu, src.DataWystawienia, src.DokumentArchiwalny, src.Koszty, src.PierwotnyNumerDokumentu, src.PierwotnyRodzajDokumentu, src.Roztrzygniecie, src.NumerPostanowienia, src.TerminPlatnosci, src.Typ, src.TypDochodu, src.UchylenieZWinyOrganu, src.WpisDoRejestru, src.AdnotacjeIUwagi, src.SposobNaliczeniaOdsetek, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--DZWR_Dokument                  

IF @TableName = 'DZWR_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DZWR_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DZWR_Dokument) 
 MERGE INTO zef2DW.DZWR_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.DZWR_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[TerminZwrotu]=src.[TerminZwrotu],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[WWynikuKontroliPostepowania]=src.[WWynikuKontroliPostepowania],
tgt.[TypDochodu]=src.[TypDochodu],
tgt.[RaportWyslaniaSK]=src.[RaportWyslaniaSK],
tgt.[NumerDecyzji]=src.[NumerDecyzji],
tgt.[ParametryWniosku]=src.[ParametryWniosku],
tgt.[KodJednostki]=src.[KodJednostki],
tgt.[WpisDoRejestru]=src.[WpisDoRejestru],
tgt.[WnioskodawcaPostepowania]=src.[WnioskodawcaPostepowania],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[DataUiszczenia]=src.[DataUiszczenia],
tgt.[NrPostanowieniaOWszczeciuPostepowania]=src.[NrPostanowieniaOWszczeciuPostepowania],

tgt.[DataDecyzji]=src.[DataDecyzji],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[DokumentArchiwalny]=src.[DokumentArchiwalny],
tgt.[DataPoczatkuNaliczeniaOproc]=src.[DataPoczatkuNaliczeniaOproc],
tgt.[RodzajPodatku]=src.[RodzajPodatku],
tgt.[WynikKontroliNumerWniosku]=src.[WynikKontroliNumerWniosku],
tgt.[DataArch]=src.[DataArch],
tgt.[NrUpowaznienia]=src.[NrUpowaznienia],
tgt.[DataRejestracjiRDC]=src.[DataRejestracjiRDC]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([TerminZwrotu], [ID_Pismo_xml], [WWynikuKontroliPostepowania], [TypDochodu], [RaportWyslaniaSK], [NumerDecyzji], [ParametryWniosku], [KodJednostki], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [DataUiszczenia], [NrPostanowieniaOWszczeciuPostepowania], [DataDecyzji], [AdnotacjeIUwagi], [DokumentArchiwalny], [DataPoczatkuNaliczeniaOproc], [RodzajPodatku], [WynikKontroliNumerWniosku], [DataArch], [WpisDoRejestru], [WnioskodawcaPostepowania],  [NrUpowaznienia], [DataRejestracjiRDC] )
VALUES ([TerminZwrotu], [ID_Pismo_xml], [WWynikuKontroliPostepowania], [TypDochodu], [RaportWyslaniaSK], [NumerDecyzji], [ParametryWniosku], [KodJednostki], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [DataUiszczenia], [NrPostanowieniaOWszczeciuPostepowania], [DataDecyzji], [AdnotacjeIUwagi], [DokumentArchiwalny], [DataPoczatkuNaliczeniaOproc], [RodzajPodatku], [WynikKontroliNumerWniosku], [DataArch], [WpisDoRejestru], [WnioskodawcaPostepowania],  [NrUpowaznienia], [DataRejestracjiRDC] );

SET @Merged = 1;
 END 

--HIPN_Dokument                  

IF @TableName = 'HIPN_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.HIPN_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.HIPN_Dokument) 
 MERGE INTO zef2DW.HIPN_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.HIPN_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.NumerDokumentuWpisu=src.NumerDokumentuWpisu, tgt.KwotaZabezpieczenia=src.KwotaZabezpieczenia, tgt.NumerDokumentu=src.NumerDokumentu, tgt.DataWystawienia=src.DataWystawienia, tgt.KwotaZabezpieczeniaRazem=src.KwotaZabezpieczeniaRazem, tgt.SaldoZabezpRazem=src.SaldoZabezpRazem, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.HipotekaZastaw=src.HipotekaZastaw, tgt.MigracjaReczna=src.MigracjaReczna, tgt.WpisWycofanie=src.WpisWycofanie, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, NumerDokumentuWpisu, KwotaZabezpieczenia, NumerDokumentu, DataWystawienia, KwotaZabezpieczeniaRazem, SaldoZabezpRazem, AdnotacjeIUwagi, HipotekaZastaw, MigracjaReczna, WpisWycofanie, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.NumerDokumentuWpisu, src.KwotaZabezpieczenia, src.NumerDokumentu, src.DataWystawienia, src.KwotaZabezpieczeniaRazem, src.SaldoZabezpRazem, src.AdnotacjeIUwagi, src.HipotekaZastaw, src.MigracjaReczna, src.WpisWycofanie, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 


--KPAD_Dokument                  
IF @TableName = 'KPAD_Dokument' BEGIN 
	DELETE FROM WA_Hurtownia.zef2DW.KPAD_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.KPAD_Dokument) 
	MERGE INTO zef2DW.KPAD_Dokument AS tgt
	USING WA_StageHurtownia.zef2DW.KPAD_Dokument AS src
	ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
	WHEN MATCHED AND src.operacja IN ('U', 'I')
	THEN UPDATE SET
	tgt.DataPostanowienia=src.DataPostanowienia, tgt.DataPowiadomienia=src.DataPowiadomienia, tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.KwotaOplatyRazem=src.KwotaOplatyRazem, tgt.NumerPostanowienia=src.NumerPostanowienia, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.ZrodloFinansowania=src.ZrodloFinansowania, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.MigracjaReczna=src.MigracjaReczna, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika
	WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
	WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
	THEN INSERT (IdentyfikatorDokumentu, DataPostanowienia, DataPowiadomienia, DokumentArchiwalny, KwotaOplatyRazem, NumerPostanowienia, TerminPlatnosci, ZrodloFinansowania, AdnotacjeIUwagi, MigracjaReczna, RaportWyslaniaSK, DataArch, ID_Pismo_xml, IdentyfikatorPodatnika)
	VALUES (src.IdentyfikatorDokumentu, src.DataPostanowienia, src.DataPowiadomienia, src.DokumentArchiwalny, src.KwotaOplatyRazem, src.NumerPostanowienia, src.TerminPlatnosci, src.ZrodloFinansowania, src.AdnotacjeIUwagi, src.MigracjaReczna, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml, src.IdentyfikatorPodatnika);
SET @Merged = 1;
 END      


--KZPN_Dokument                  
IF @TableName = 'KZPN_Dokument' BEGIN 
		DELETE FROM WA_Hurtownia.zef2DW.KZPN_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.KZPN_Dokument) 
		MERGE INTO zef2DW.KZPN_Dokument AS tgt
		USING WA_StageHurtownia.zef2DW.KZPN_Dokument AS src
		ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
		WHEN MATCHED AND src.operacja IN ('U', 'I')
		THEN UPDATE SET
		tgt.DataDecyzji=src.DataDecyzji, tgt.DataOtrzymania=src.DataOtrzymania, tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.KategoriaZezwolenia=src.KategoriaZezwolenia, tgt.OsobaKrajowaZagraniczna=src.OsobaKrajowaZagraniczna, tgt.PozycjeRazem=src.PozycjeRazem, tgt.NumerDecyzji=src.NumerDecyzji, tgt.SposobZaplaty=src.SposobZaplaty, tgt.MigracjaReczna=src.MigracjaReczna, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika, tgt.KodJednostki=src.KodJednostki
		WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
		WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
		THEN INSERT (IdentyfikatorDokumentu, DataDecyzji, DataOtrzymania, DokumentArchiwalny, KategoriaZezwolenia, OsobaKrajowaZagraniczna, PozycjeRazem, NumerDecyzji, SposobZaplaty, MigracjaReczna, AdnotacjeIUwagi, TerminPlatnosci, RaportWyslaniaSK, DataArch, ID_Pismo_xml, IdentyfikatorPodatnika, KodJednostki)
		VALUES (src.IdentyfikatorDokumentu, src.DataDecyzji, src.DataOtrzymania, src.DokumentArchiwalny, src.KategoriaZezwolenia, src.OsobaKrajowaZagraniczna, src.PozycjeRazem, src.NumerDecyzji, src.SposobZaplaty, src.MigracjaReczna, src.AdnotacjeIUwagi, src.TerminPlatnosci, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml, src.IdentyfikatorPodatnika, src.KodJednostki);
SET @Merged = 1;
 END 

--MAND_Dokument                  
IF @TableName = 'MAND_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.MAND_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.MAND_Dokument) 
 MERGE INTO zef2DW.MAND_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.MAND_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.DataUkarania=src.DataUkarania, tgt.FunkcjonariuszImie=src.FunkcjonariuszImie, tgt.FunkcjonariuszNazwisko=src.FunkcjonariuszNazwisko, tgt.GrzywnaRazem=src.GrzywnaRazem, tgt.RodzajMandatu=src.RodzajMandatu, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.NumerMandatu=src.NumerMandatu, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, DataUkarania, FunkcjonariuszImie, FunkcjonariuszNazwisko, GrzywnaRazem, RodzajMandatu, AdnotacjeIUwagi, NumerMandatu, TerminPlatnosci, RaportWyslaniaSK, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.DataUkarania, src.FunkcjonariuszImie, src.FunkcjonariuszNazwisko, src.GrzywnaRazem, src.RodzajMandatu, src.AdnotacjeIUwagi, src.NumerMandatu, src.TerminPlatnosci, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 


--NCPR_Dokument                  
IF @TableName = 'NCPR_Dokument' BEGIN 
	DELETE FROM WA_Hurtownia.zef2DW.NCPR_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.NCPR_Dokument) 
	MERGE INTO zef2DW.NCPR_Dokument AS tgt
	USING WA_StageHurtownia.zef2DW.NCPR_Dokument AS src
	ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
	WHEN MATCHED AND src.operacja IN ('U', 'I')
	THEN UPDATE SET
	tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.DataOtrzymania=src.DataOtrzymania, tgt.DataUprawomocnienia=src.DataUprawomocnienia, tgt.DataWystawienia=src.DataWystawienia, tgt.OdDnia=src.OdDnia, tgt.Odsetki=src.Odsetki, tgt.NumerDokumentu=src.NumerDokumentu, tgt.Skala=src.Skala, tgt.StawkaOdsetek=src.StawkaOdsetek, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.kwotaRazem=src.kwotaRazem, tgt.MigracjaReczna=src.MigracjaReczna, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.MigracjaKAS=src.MigracjaKAS, tgt.Rodzaj=src.Rodzaj, tgt.NaliczycOdsetkiOd=src.NaliczycOdsetkiOd
	WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
	WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
	THEN INSERT (IdentyfikatorDokumentu, DokumentArchiwalny, DataOtrzymania, DataUprawomocnienia, DataWystawienia, OdDnia, Odsetki, NumerDokumentu, Skala, StawkaOdsetek, TerminPlatnosci, kwotaRazem, MigracjaReczna, RaportWyslaniaSK, DataArch, ID_Pismo_xml, IdentyfikatorPodatnika, AdnotacjeIUwagi, MigracjaKAS, Rodzaj, NaliczycOdsetkiOd)
	VALUES (src.IdentyfikatorDokumentu, src.DokumentArchiwalny, src.DataOtrzymania, src.DataUprawomocnienia, src.DataWystawienia, src.OdDnia, src.Odsetki, src.NumerDokumentu, src.Skala, src.StawkaOdsetek, src.TerminPlatnosci, src.kwotaRazem, src.MigracjaReczna, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml, src.IdentyfikatorPodatnika, src.AdnotacjeIUwagi, src.MigracjaKAS, src.Rodzaj, src.NaliczycOdsetkiOd);
SET @Merged = 1;
 END 


--ODPD_Dokument                  

IF @TableName = 'ODPD_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.ODPD_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.ODPD_Dokument) 
 MERGE INTO zef2DW.ODPD_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.ODPD_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.DataWystawienia=src.DataWystawienia, tgt.PrzyczynaOdpisuPrzypisu=src.PrzyczynaOdpisuPrzypisu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.RazemNaleznosc=src.RazemNaleznosc, tgt.RazemUmorzenia=src.RazemUmorzenia, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, DataWystawienia, PrzyczynaOdpisuPrzypisu, NumerDokumentu, AdnotacjeIUwagi, RazemNaleznosc, RazemUmorzenia, RaportWyslaniaSK, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.DataWystawienia, src.PrzyczynaOdpisuPrzypisu, src.NumerDokumentu, src.AdnotacjeIUwagi, src.RazemNaleznosc, src.RazemUmorzenia, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--ODPN_Dokument                  

IF @TableName = 'ODPN_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.ODPN_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.ODPN_Dokument) 
 MERGE INTO zef2DW.ODPN_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.ODPN_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[TypDochodu]=src.[TypDochodu],
tgt.[RaportWyslaniaSK]=src.[RaportWyslaniaSK],
tgt.[PrzyczynaOdpisuPrzypisu]=src.[PrzyczynaOdpisuPrzypisu],
tgt.[KwotaZabezpieczeniaGeneralnego]=src.[KwotaZabezpieczeniaGeneralnego],
tgt.[SumaPrzypisOdpis]=src.[SumaPrzypisOdpis],
tgt.[DataObciazeniaZabezpieczeniaGeneralnego]=src.[DataObciazeniaZabezpieczeniaGeneralnego],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[PierwotnyNumerDokumentu]=src.[PierwotnyNumerDokumentu],
tgt.[DataWystawienia]=src.[DataWystawienia],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[SumNaleznosc]=src.[SumNaleznosc],
tgt.[WpisDoRejestruDluguCelnego]=src.[WpisDoRejestruDluguCelnego],
tgt.[NumerZabezpieczeniaGeneralnego]=src.[NumerZabezpieczeniaGeneralnego],
tgt.[PrzyczynaPrzedawnienia]=src.[PrzyczynaPrzedawnienia],
tgt.[RodzajPodatku]=src.[RodzajPodatku],
tgt.[MigracjaReczna]=src.[MigracjaReczna],
tgt.[OrganCelnySASP]=src.[OrganCelnySASP],
tgt.[KwotaZabezpieczeniaTSW]=src.[KwotaZabezpieczeniaTSW],
tgt.[DataArch]=src.[DataArch],
tgt.[PrzyczynaZadluzenia]=src.[PrzyczynaZadluzenia],
tgt.[SumaSaldoKoncowe]=src.[SumaSaldoKoncowe],
tgt.[NumerPozwoleniaSASP]=src.[NumerPozwoleniaSASP],
tgt.[PierwotnyRodzajDokumentu]=src.[PierwotnyRodzajDokumentu],

tgt.[KwotaobciazeniaZwolnienia]=src.[KwotaobciazeniaZwolnienia],
tgt.[DataRejestracjiRDC]=src.[DataRejestracjiRDC]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([NumerDokumentu], [ID_Pismo_xml], [TypDochodu], [RaportWyslaniaSK], [PrzyczynaOdpisuPrzypisu], [KwotaZabezpieczeniaGeneralnego], [SumaPrzypisOdpis], [DataObciazeniaZabezpieczeniaGeneralnego], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [PierwotnyNumerDokumentu], [DataWystawienia], [AdnotacjeIUwagi], [SumNaleznosc], [WpisDoRejestruDluguCelnego], [NumerZabezpieczeniaGeneralnego], [PrzyczynaPrzedawnienia], [RodzajPodatku], [MigracjaReczna], [OrganCelnySASP], [KwotaZabezpieczeniaTSW], [DataArch], [PrzyczynaZadluzenia], [SumaSaldoKoncowe], [NumerPozwoleniaSASP], [PierwotnyRodzajDokumentu],  [KwotaobciazeniaZwolnienia], [DataRejestracjiRDC] )
VALUES ([NumerDokumentu], [ID_Pismo_xml], [TypDochodu], [RaportWyslaniaSK], [PrzyczynaOdpisuPrzypisu], [KwotaZabezpieczeniaGeneralnego], [SumaPrzypisOdpis], [DataObciazeniaZabezpieczeniaGeneralnego], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [PierwotnyNumerDokumentu], [DataWystawienia], [AdnotacjeIUwagi], [SumNaleznosc], [WpisDoRejestruDluguCelnego], [NumerZabezpieczeniaGeneralnego], [PrzyczynaPrzedawnienia], [RodzajPodatku], [MigracjaReczna], [OrganCelnySASP], [KwotaZabezpieczeniaTSW], [DataArch], [PrzyczynaZadluzenia], [SumaSaldoKoncowe], [NumerPozwoleniaSASP], [PierwotnyRodzajDokumentu],  [KwotaobciazeniaZwolnienia], [DataRejestracjiRDC] );


SET @Merged = 1;
 END 


--OKAR_Dokument                  

IF @TableName = 'OKAR_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.OKAR_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.OKAR_Dokument) 
 MERGE INTO zef2DW.OKAR_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.OKAR_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.DataOrzeczenia=src.DataOrzeczenia, tgt.DataUprawomocnienia=src.DataUprawomocnienia, tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.KwotaWplaty=src.KwotaWplaty, tgt.NumerDokWplaty=src.NumerDokWplaty, tgt.PozycjeKwotaRazem=src.PozycjeKwotaRazem, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.NumerOrzeczenia=src.NumerOrzeczenia, tgt.MigracjaReczna=src.MigracjaReczna, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, DataOrzeczenia, DataUprawomocnienia, DokumentArchiwalny, KwotaWplaty, NumerDokWplaty, PozycjeKwotaRazem, AdnotacjeIUwagi, NumerOrzeczenia, MigracjaReczna, RaportWyslaniaSK, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.DataOrzeczenia, src.DataUprawomocnienia, src.DokumentArchiwalny, src.KwotaWplaty, src.NumerDokWplaty, src.PozycjeKwotaRazem, src.AdnotacjeIUwagi, src.NumerOrzeczenia, src.MigracjaReczna, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--OZWW_Dokument                  

IF @TableName = 'OZWW_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.OZWW_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.OZWW_Dokument) 
 MERGE INTO zef2DW.OZWW_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.OZWW_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.NieNaliczanieOdsetekDataDo=src.NieNaliczanieOdsetekDataDo, tgt.NieNaliczanieOdsetekDataOd=src.NieNaliczanieOdsetekDataOd, tgt.NieNaliczanieOdsetek=src.NieNaliczanieOdsetek, tgt.DataWplywuOdwolania=src.DataWplywuOdwolania, tgt.OrganWydajacy=src.OrganWydajacy, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.MigracjaReczna=src.MigracjaReczna, tgt.PozycjeRazemKwotaWstrzymana=src.PozycjeRazemKwotaWstrzymana, tgt.Przyczyna=src.Przyczyna, tgt.NumerDokumentu=src.NumerDokumentu, tgt.DataWstrzymaniaWykonywaniaDecyzji=src.DataWstrzymaniaWykonywaniaDecyzji, tgt.ZazalenieDataWplywu=src.ZazalenieDataWplywu, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.PierwotnyDataWydania=src.PierwotnyDataWydania, tgt.PierwotnyNumerDokumentu=src.PierwotnyNumerDokumentu, tgt.PierwotnyRodzajDokumentu=src.PierwotnyRodzajDokumentu, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, NieNaliczanieOdsetekDataDo, NieNaliczanieOdsetekDataOd, NieNaliczanieOdsetek, DataWplywuOdwolania, OrganWydajacy, AdnotacjeIUwagi, MigracjaReczna, PozycjeRazemKwotaWstrzymana, Przyczyna, NumerDokumentu, DataWstrzymaniaWykonywaniaDecyzji, ZazalenieDataWplywu, RaportWyslaniaSK, PierwotnyDataWydania, PierwotnyNumerDokumentu, PierwotnyRodzajDokumentu, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.NieNaliczanieOdsetekDataDo, src.NieNaliczanieOdsetekDataOd, src.NieNaliczanieOdsetek, src.DataWplywuOdwolania, src.OrganWydajacy, src.AdnotacjeIUwagi, src.MigracjaReczna, src.PozycjeRazemKwotaWstrzymana, src.Przyczyna, src.NumerDokumentu, src.DataWstrzymaniaWykonywaniaDecyzji, src.ZazalenieDataWplywu, src.RaportWyslaniaSK, src.PierwotnyDataWydania, src.PierwotnyNumerDokumentu, src.PierwotnyRodzajDokumentu, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 


--PKPO_Dokument                  
IF @TableName = 'PKPO_Dokument' BEGIN 
	DELETE FROM WA_Hurtownia.zef2DW.PKPO_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.PKPO_Dokument) 
	MERGE INTO zef2DW.PKPO_Dokument AS tgt
	USING WA_StageHurtownia.zef2DW.PKPO_Dokument AS src
	ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
	WHEN MATCHED AND src.operacja IN ('U', 'I')
	THEN UPDATE SET
	tgt.DataOtrzymania=src.DataOtrzymania, tgt.DataWydania=src.DataWydania, tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.KaraRazem=src.KaraRazem, tgt.RodzajKary=src.RodzajKary, tgt.NumerPostanowienia=src.NumerPostanowienia, tgt.WWynikuKontroliPostepowania=src.WWynikuKontroliPostepowania, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.NrPostanowieniaOWszczeciuPostepowania=src.NrPostanowieniaOWszczeciuPostepowania, tgt.NrUpowaznienia=src.NrUpowaznienia, tgt.WynikKontroliNumerWniosku=src.WynikKontroliNumerWniosku, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.WnioskodawcaPostepowania=src.WnioskodawcaPostepowania, tgt.MigracjaReczna=src.MigracjaReczna, tgt.DokumentPowiazany=src.DokumentPowiazany, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika
	WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
	WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
	THEN INSERT (IdentyfikatorDokumentu, DataOtrzymania, DataWydania, DokumentArchiwalny, KaraRazem, RodzajKary, NumerPostanowienia, WWynikuKontroliPostepowania, TerminPlatnosci, NrPostanowieniaOWszczeciuPostepowania, NrUpowaznienia, WynikKontroliNumerWniosku, AdnotacjeIUwagi, WnioskodawcaPostepowania, MigracjaReczna, DokumentPowiazany, RaportWyslaniaSK, DataArch, ID_Pismo_xml, IdentyfikatorPodatnika)
	VALUES (src.IdentyfikatorDokumentu, src.DataOtrzymania, src.DataWydania, src.DokumentArchiwalny, src.KaraRazem, src.RodzajKary, src.NumerPostanowienia, src.WWynikuKontroliPostepowania, src.TerminPlatnosci, src.NrPostanowieniaOWszczeciuPostepowania, src.NrUpowaznienia, src.WynikKontroliNumerWniosku, src.AdnotacjeIUwagi, src.WnioskodawcaPostepowania, src.MigracjaReczna, src.DokumentPowiazany, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml, src.IdentyfikatorPodatnika);
SET @Merged = 1;
 END 


--PODZ_Dokument                  

IF @TableName = 'PODZ_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.PODZ_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.PODZ_Dokument) 
 MERGE INTO zef2DW.PODZ_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.PODZ_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.DataWystawienia=src.DataWystawienia, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.NumerDokumentu=src.NumerDokumentu, tgt.NumerPostanowienia=src.NumerPostanowienia, tgt.TypRejestracji=src.TypRejestracji, tgt.DataObciazeniaZabezpieczeniaGeneralnego=src.DataObciazeniaZabezpieczeniaGeneralnego, tgt.KodDostepuZabezpieczeniaGeneralnego=src.KodDostepuZabezpieczeniaGeneralnego, tgt.KwotaZabezpieczeniaGeneralnego=src.KwotaZabezpieczeniaGeneralnego, tgt.NIPKontrahentaZabezpieczeniaGeneralnego=src.NIPKontrahentaZabezpieczeniaGeneralnego, tgt.NumerZabezpieczeniaGeneralnego=src.NumerZabezpieczeniaGeneralnego, tgt.DataObciazeniaZabezpieczeniaJednorazowego=src.DataObciazeniaZabezpieczeniaJednorazowego, tgt.KwotaZabezpieczeniaJednorazowego=src.KwotaZabezpieczeniaJednorazowego, tgt.NIPKontrahentaZabezpieczeniaJednorazowego=src.NIPKontrahentaZabezpieczeniaJednorazowego, tgt.NumerZabezpieczeniaJednorazowego=src.NumerZabezpieczeniaJednorazowego, tgt.NumerRozstrzygniecia=src.NumerRozstrzygniecia, tgt.DataZwolnienia=src.DataZwolnienia, tgt.KwotaZwolnienia=src.KwotaZwolnienia, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.TypZabezpieczenia=src.TypZabezpieczenia, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, DataWystawienia, AdnotacjeIUwagi, NumerDokumentu, NumerPostanowienia, TypRejestracji, DataObciazeniaZabezpieczeniaGeneralnego, KodDostepuZabezpieczeniaGeneralnego, KwotaZabezpieczeniaGeneralnego, NIPKontrahentaZabezpieczeniaGeneralnego, NumerZabezpieczeniaGeneralnego, DataObciazeniaZabezpieczeniaJednorazowego, KwotaZabezpieczeniaJednorazowego, NIPKontrahentaZabezpieczeniaJednorazowego, NumerZabezpieczeniaJednorazowego, NumerRozstrzygniecia, DataZwolnienia, KwotaZwolnienia, RaportWyslaniaSK, TypZabezpieczenia, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.DataWystawienia, src.AdnotacjeIUwagi, src.NumerDokumentu, src.NumerPostanowienia, src.TypRejestracji, src.DataObciazeniaZabezpieczeniaGeneralnego, src.KodDostepuZabezpieczeniaGeneralnego, src.KwotaZabezpieczeniaGeneralnego, src.NIPKontrahentaZabezpieczeniaGeneralnego, src.NumerZabezpieczeniaGeneralnego, src.DataObciazeniaZabezpieczeniaJednorazowego, src.KwotaZabezpieczeniaJednorazowego, src.NIPKontrahentaZabezpieczeniaJednorazowego, src.NumerZabezpieczeniaJednorazowego, src.NumerRozstrzygniecia, src.DataZwolnienia, src.KwotaZwolnienia, src.RaportWyslaniaSK, src.TypZabezpieczenia, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--PONW_Dokument                  

IF @TableName = 'PONW_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.PONW_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.PONW_Dokument) 
 MERGE INTO zef2DW.PONW_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.PONW_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.DataDoreczenia=src.DataDoreczenia, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataWystawienia=src.DataWystawienia, tgt.NumerPostanowieniaNadaniaRygoru=src.NumerPostanowieniaNadaniaRygoru, tgt.PierwotneNumer=src.PierwotneNumer, tgt.PierwotneRodzaj=src.PierwotneRodzaj, tgt.NumerDokumentu=src.NumerDokumentu, tgt.UtrzymanieUchylenie=src.UtrzymanieUchylenie, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.StatusSK=src.StatusSK, tgt.Instancja=src.Instancja, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, DataDoreczenia, RaportWyslaniaSK, DataWystawienia, NumerPostanowieniaNadaniaRygoru, PierwotneNumer, PierwotneRodzaj, NumerDokumentu, UtrzymanieUchylenie, AdnotacjeIUwagi, StatusSK, Instancja, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.DataDoreczenia, src.RaportWyslaniaSK, src.DataWystawienia, src.NumerPostanowieniaNadaniaRygoru, src.PierwotneNumer, src.PierwotneRodzaj, src.NumerDokumentu, src.UtrzymanieUchylenie, src.AdnotacjeIUwagi, src.StatusSK, src.Instancja, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 


--POPC_Dokument                  
IF @TableName = 'POPC_Dokument' BEGIN 
	DELETE FROM WA_Hurtownia.zef2DW.POPC_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.POPC_Dokument) 
	MERGE INTO zef2DW.POPC_Dokument AS tgt
	USING WA_StageHurtownia.zef2DW.POPC_Dokument AS src
	ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
	WHEN MATCHED AND src.operacja IN ('U', 'I')
	THEN UPDATE SET
	tgt.DataDoreczenia=src.DataDoreczenia, tgt.DataWystawienia=src.DataWystawienia, tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.KwotaOplatyRazem=src.KwotaOplatyRazem, tgt.NumerPokwitowania=src.NumerPokwitowania, tgt.RodzajOplaty=src.RodzajOplaty, tgt.NumerPostanowienia=src.NumerPostanowienia, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.NumerZabezpieczniaJednorazowego=src.NumerZabezpieczniaJednorazowego, tgt.KwotaZabezpieczeniaJednorazowego=src.KwotaZabezpieczeniaJednorazowego, tgt.DataObciazeniaZabezpieczeniaJednorazowego=src.DataObciazeniaZabezpieczeniaJednorazowego, tgt.NIPKontrahentaZabezpieczeniaJednorazowego=src.NIPKontrahentaZabezpieczeniaJednorazowego, tgt.PotwierdzeniaDataPrzelewu=src.PotwierdzeniaDataPrzelewu, tgt.MigracjaReczna=src.MigracjaReczna, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika
	WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
	WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
	THEN INSERT (IdentyfikatorDokumentu, DataDoreczenia, DataWystawienia, DokumentArchiwalny, KwotaOplatyRazem, NumerPokwitowania, RodzajOplaty, NumerPostanowienia, TerminPlatnosci, AdnotacjeIUwagi, RaportWyslaniaSK, NumerZabezpieczniaJednorazowego, KwotaZabezpieczeniaJednorazowego, DataObciazeniaZabezpieczeniaJednorazowego, NIPKontrahentaZabezpieczeniaJednorazowego, PotwierdzeniaDataPrzelewu, MigracjaReczna, DataArch, ID_Pismo_xml, IdentyfikatorPodatnika)
	VALUES (src.IdentyfikatorDokumentu, src.DataDoreczenia, src.DataWystawienia, src.DokumentArchiwalny, src.KwotaOplatyRazem, src.NumerPokwitowania, src.RodzajOplaty, src.NumerPostanowienia, src.TerminPlatnosci, src.AdnotacjeIUwagi, src.RaportWyslaniaSK, src.NumerZabezpieczniaJednorazowego, src.KwotaZabezpieczeniaJednorazowego, src.DataObciazeniaZabezpieczeniaJednorazowego, src.NIPKontrahentaZabezpieczeniaJednorazowego, src.PotwierdzeniaDataPrzelewu, src.MigracjaReczna, src.DataArch, src.ID_Pismo_xml, src.IdentyfikatorPodatnika);
SET @Merged = 1;
 END 


--POTS_Dokument                  

IF @TableName = 'POTS_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.POTS_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.POTS_Dokument) 
 MERGE INTO zef2DW.POTS_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.POTS_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[PozycjeKwotaRazem]=src.[PozycjeKwotaRazem],
tgt.[KosztyPoboru]=src.[KosztyPoboru],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[RodzajPrzypisuOdpisuTSW]=src.[RodzajPrzypisuOdpisuTSW],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[NumerPostanowienia]=src.[NumerPostanowienia],
tgt.[JednostkaOrganizacyjna]=src.[JednostkaOrganizacyjna],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[DataDokumentu]=src.[DataDokumentu],
tgt.[OkresTSW]=src.[OkresTSW],
tgt.[DataArch]=src.[DataArch]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([PozycjeKwotaRazem], [KosztyPoboru], [ID_Pismo_xml], [RodzajPrzypisuOdpisuTSW], [IdentyfikatorPodatnika], [NumerPostanowienia], [IdentyfikatorDokumentu], [JednostkaOrganizacyjna],  [AdnotacjeIUwagi], [DataDokumentu], [OkresTSW], [DataArch] )
VALUES ([PozycjeKwotaRazem], [KosztyPoboru], [ID_Pismo_xml], [RodzajPrzypisuOdpisuTSW], [IdentyfikatorPodatnika], [NumerPostanowienia], [IdentyfikatorDokumentu], [JednostkaOrganizacyjna],  [AdnotacjeIUwagi], [DataDokumentu], [OkresTSW], [DataArch] );

SET @Merged = 1;
 END 

--POWK_Dokument                  

IF @TableName = 'POWK_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.POWK_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.POWK_Dokument) 
 MERGE INTO zef2DW.POWK_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.POWK_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataWplywu]=src.[DataWplywu],
tgt.[PoKontroli]=src.[PoKontroli],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[TypDochodu]=src.[TypDochodu],
tgt.[RaportWyslaniaSK]=src.[RaportWyslaniaSK],
tgt.[ZakresPostepowania]=src.[ZakresPostepowania],
tgt.[UnikanieOpodatkowania]=src.[UnikanieOpodatkowania],
tgt.[NumerWniosku]=src.[NumerWniosku],
tgt.[ParametryWniosku]=src.[ParametryWniosku],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[NumerPostanowienia]=src.[NumerPostanowienia],
tgt.[KontrolaPowod]=src.[KontrolaPowod],
tgt.[DataWystawienia]=src.[DataWystawienia],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[DataDoreczeniaArt200]=src.[DataDoreczeniaArt200],
tgt.[OrganWydajacy]=src.[OrganWydajacy],
tgt.[RodzajPodatku]=src.[RodzajPodatku],
tgt.[DataDoreczenia]=src.[DataDoreczenia],
tgt.[DataArch]=src.[DataArch],
tgt.[NrUpowaznienia]=src.[NrUpowaznienia]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([DataWplywu], [PoKontroli], [ID_Pismo_xml], [TypDochodu], [RaportWyslaniaSK], [ZakresPostepowania], [UnikanieOpodatkowania], [NumerWniosku], [ParametryWniosku], [IdentyfikatorPodatnika], [NumerPostanowienia], [IdentyfikatorDokumentu], [KontrolaPowod], [DataWystawienia], [AdnotacjeIUwagi], [DataDoreczeniaArt200], [OrganWydajacy], [RodzajPodatku], [DataDoreczenia], [DataArch], [NrUpowaznienia] )
VALUES ([DataWplywu], [PoKontroli], [ID_Pismo_xml], [TypDochodu], [RaportWyslaniaSK], [ZakresPostepowania], [UnikanieOpodatkowania], [NumerWniosku], [ParametryWniosku], [IdentyfikatorPodatnika], [NumerPostanowienia], [IdentyfikatorDokumentu], [KontrolaPowod], [DataWystawienia], [AdnotacjeIUwagi], [DataDoreczeniaArt200], [OrganWydajacy], [RodzajPodatku], [DataDoreczenia], [DataArch], [NrUpowaznienia] );

SET @Merged = 1;
 END 

--POZA_Dokument                  

IF @TableName = 'POZA_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.POZA_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.POZA_Dokument) 
 MERGE INTO zef2DW.POZA_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.POZA_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[DataPostanowienia]=src.[DataPostanowienia],
tgt.[RwPodstawaPrawna]=src.[RwPodstawaPrawna],
tgt.[RwUzasadnienie]=src.[RwUzasadnienie],
tgt.[RazemOplataProlongacyjna]=src.[RazemOplataProlongacyjna],
tgt.[RazemOdsetki]=src.[RazemOdsetki],
tgt.[DataWplaty]=src.[DataWplaty],
tgt.[Instancja]=src.[Instancja],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[NumerPostanowienia]=src.[NumerPostanowienia],
tgt.[UtrzymanieUchylenie]=src.[UtrzymanieUchylenie],
tgt.[NumerWplaty]=src.[NumerWplaty],
tgt.[NrPostanowieniaIInstancji]=src.[NrPostanowieniaIInstancji],
tgt.[RazemKwota]=src.[RazemKwota],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[NazwaWplacajacego]=src.[NazwaWplacajacego],
tgt.[DataDoreczenia]=src.[DataDoreczenia],
tgt.[DataArch]=src.[DataArch]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([ID_Pismo_xml], [DataPostanowienia], [RwPodstawaPrawna], [RwUzasadnienie], [RazemOplataProlongacyjna], [RazemOdsetki], [DataWplaty], [Instancja], [IdentyfikatorPodatnika], [NumerPostanowienia], [UtrzymanieUchylenie], [NumerWplaty], [IdentyfikatorDokumentu], [NrPostanowieniaIInstancji], [RazemKwota], [AdnotacjeIUwagi], [NazwaWplacajacego], [DataDoreczenia], [DataArch] )
VALUES ([ID_Pismo_xml], [DataPostanowienia], [RwPodstawaPrawna], [RwUzasadnienie], [RazemOplataProlongacyjna], [RazemOdsetki], [DataWplaty], [Instancja], [IdentyfikatorPodatnika], [NumerPostanowienia], [UtrzymanieUchylenie], [NumerWplaty], [IdentyfikatorDokumentu], [NrPostanowieniaIInstancji], [RazemKwota], [AdnotacjeIUwagi], [NazwaWplacajacego], [DataDoreczenia], [DataArch] );

SET @Merged = 1;
 END 

--PUPD_Dokument                  

IF @TableName = 'PUPD_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.PUPD_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.PUPD_Dokument) 
 MERGE INTO zef2DW.PUPD_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.PUPD_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.DataUpadlosci=src.DataUpadlosci, tgt.DataUprawomocnienia=src.DataUprawomocnienia, tgt.DataWydania=src.DataWydania, tgt.DokumentArchiwalny=src.DokumentArchiwalny, tgt.NaliczenieOdsetek=src.NaliczenieOdsetek, tgt.NumerPostanowieniaNadaniaRygoru=src.NumerPostanowieniaNadaniaRygoru, tgt.OrganWydajacy=src.OrganWydajacy, tgt.RodzajPostanowienia=src.RodzajPostanowienia, tgt.RodzajUpadlosci=src.RodzajUpadlosci, tgt.NumerDokumentu=src.NumerDokumentu, tgt.Upadlosc=src.Upadlosc, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, DataUpadlosci, DataUprawomocnienia, DataWydania, DokumentArchiwalny, NaliczenieOdsetek, NumerPostanowieniaNadaniaRygoru, OrganWydajacy, RodzajPostanowienia, RodzajUpadlosci, NumerDokumentu, Upadlosc, AdnotacjeIUwagi, RaportWyslaniaSK, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.DataUpadlosci, src.DataUprawomocnienia, src.DataWydania, src.DokumentArchiwalny, src.NaliczenieOdsetek, src.NumerPostanowieniaNadaniaRygoru, src.OrganWydajacy, src.RodzajPostanowienia, src.RodzajUpadlosci, src.NumerDokumentu, src.Upadlosc, src.AdnotacjeIUwagi, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--SADS_Dokument                  

IF @TableName = 'SADS_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.SADS_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.SADS_Dokument) 
 MERGE INTO zef2DW.SADS_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.SADS_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataZwolnieniaTowaru]=src.[DataZwolnieniaTowaru],
tgt.[RodzajZglaszajacego]=src.[RodzajZglaszajacego],
tgt.[NIPKontrahentaZabezpieczeniaJednorazowego]=src.[NIPKontrahentaZabezpieczeniaJednorazowego],
tgt.[OdroczonyTerminPlatnosci]=src.[OdroczonyTerminPlatnosci],
tgt.[RegonZglaszajacy]=src.[RegonZglaszajacy],
tgt.[NrZgloszeniaCelnego]=src.[NrZgloszeniaCelnego],
tgt.[DataObciazeniaZabezpieczeniaGeneralnego]=src.[DataObciazeniaZabezpieczeniaGeneralnego],
tgt.[DataObciazeniaZabezpieczeniaJednorazowego]=src.[DataObciazeniaZabezpieczeniaJednorazowego],
tgt.[ZglaszajacyMiejscowosc]=src.[ZglaszajacyMiejscowosc],
tgt.[ZglaszajacyNumerVatUe]=src.[ZglaszajacyNumerVatUe],
tgt.[DataPowiadomienia]=src.[DataPowiadomienia],
tgt.[NumerZglaszajacego]=src.[NumerZglaszajacego],
tgt.[DataSprostowania]=src.[DataSprostowania],
tgt.[KwotaZabezpieczeniaTSW]=src.[KwotaZabezpieczeniaTSW],
tgt.[DataArch]=src.[DataArch],
tgt.[ZglaszajacyKraj]=src.[ZglaszajacyKraj],
tgt.[ZglaszajacyNrLokalu]=src.[ZglaszajacyNrLokalu],
tgt.[ZglaszajacyNrDokumentu]=src.[ZglaszajacyNrDokumentu],
tgt.[ProceduraCelna]=src.[ProceduraCelna],
tgt.[NazwaZglaszajacego]=src.[NazwaZglaszajacego],
tgt.[ZglaszajacyWojewodztwo]=src.[ZglaszajacyWojewodztwo],
tgt.[PierwotnyNumerBiznesowy]=src.[PierwotnyNumerBiznesowy],
tgt.[ZglaszajacyKodPocztowy]=src.[ZglaszajacyKodPocztowy],
tgt.[ZglaszajacySystem]=src.[ZglaszajacySystem],

tgt.[NumerZabezpieczniaJednorazowego]=src.[NumerZabezpieczniaJednorazowego],
tgt.[RodzajZgloszenia]=src.[RodzajZgloszenia],
tgt.[DataPowstaniaDluguCelnego]=src.[DataPowstaniaDluguCelnego],
tgt.[NipZglaszajacego]=src.[NipZglaszajacego],
tgt.[ZglaszajacyUlica]=src.[ZglaszajacyUlica],
tgt.[NazwiskoZglaszajacego]=src.[NazwiskoZglaszajacego],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[ZglaszajacyPoczta]=src.[ZglaszajacyPoczta],
tgt.[DataZgloszeniaCelnego]=src.[DataZgloszeniaCelnego],
tgt.[PozycjeRazem]=src.[PozycjeRazem],
tgt.[RaportWyslaniaSK]=src.[RaportWyslaniaSK],
tgt.[ZglaszajacyUwagi]=src.[ZglaszajacyUwagi],
tgt.[KwotaZabezpieczeniaGeneralnego]=src.[KwotaZabezpieczeniaGeneralnego],
tgt.[ImieZglaszajacego]=src.[ImieZglaszajacego],
tgt.[AIS]=src.[AIS],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[ZglaszajacyNrEori]=src.[ZglaszajacyNrEori],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[WpisDoRejestruDluguCelnego]=src.[WpisDoRejestruDluguCelnego],
tgt.[NumerZabezpieczeniaGeneralnego]=src.[NumerZabezpieczeniaGeneralnego],
tgt.[NumerPozwolenia]=src.[NumerPozwolenia],
tgt.[CzyZabezpieczenieGeneralneObciazaAIS]=src.[CzyZabezpieczenieGeneralneObciazaAIS],
tgt.[ZglaszajacyPowiat]=src.[ZglaszajacyPowiat],
tgt.[DataUrodzeniaZglaszajacego]=src.[DataUrodzeniaZglaszajacego],
tgt.[NazwaPelnaZglaszajacego]=src.[NazwaPelnaZglaszajacego],
tgt.[ZglaszajacyGmina]=src.[ZglaszajacyGmina],
tgt.[ZglaszajacyNrDomu]=src.[ZglaszajacyNrDomu],
tgt.[RazemBezZwol]=src.[RazemBezZwol],
tgt.[KwotaZabezpieczeniaJednorazowego]=src.[KwotaZabezpieczeniaJednorazowego],
tgt.[TerminPlatnosci]=src.[TerminPlatnosci],
tgt.[PeselZglaszajacego]=src.[PeselZglaszajacego],
tgt.[DataRejestracjiRDC]=src.[DataRejestracjiRDC]WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([DataZwolnieniaTowaru], [RodzajZglaszajacego], [NIPKontrahentaZabezpieczeniaJednorazowego], [OdroczonyTerminPlatnosci], [RegonZglaszajacy], [NrZgloszeniaCelnego], [DataObciazeniaZabezpieczeniaGeneralnego], [DataObciazeniaZabezpieczeniaJednorazowego], [ZglaszajacyMiejscowosc], [ZglaszajacyNumerVatUe], [DataPowiadomienia], [NumerZglaszajacego], [DataSprostowania], [KwotaZabezpieczeniaTSW], [DataArch], [ZglaszajacyKraj], [ZglaszajacyNrLokalu], [ZglaszajacyNrDokumentu], [ProceduraCelna], [NazwaZglaszajacego], [ZglaszajacyWojewodztwo], [PierwotnyNumerBiznesowy], [ZglaszajacyKodPocztowy], [ZglaszajacySystem],  [NumerZabezpieczniaJednorazowego], [RodzajZgloszenia], [DataPowstaniaDluguCelnego], [NipZglaszajacego], [ZglaszajacyUlica], [NazwiskoZglaszajacego], [ID_Pismo_xml], [ZglaszajacyPoczta], [DataZgloszeniaCelnego], [PozycjeRazem], [RaportWyslaniaSK], [ZglaszajacyUwagi], [KwotaZabezpieczeniaGeneralnego], [ImieZglaszajacego], [AIS], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [ZglaszajacyNrEori], [AdnotacjeIUwagi], [WpisDoRejestruDluguCelnego], [NumerZabezpieczeniaGeneralnego], [NumerPozwolenia], [CzyZabezpieczenieGeneralneObciazaAIS], [ZglaszajacyPowiat], [DataUrodzeniaZglaszajacego], [NazwaPelnaZglaszajacego], [ZglaszajacyGmina], [ZglaszajacyNrDomu], [RazemBezZwol], [KwotaZabezpieczeniaJednorazowego], [TerminPlatnosci], [PeselZglaszajacego], [DataRejestracjiRDC] )
VALUES ([DataZwolnieniaTowaru], [RodzajZglaszajacego], [NIPKontrahentaZabezpieczeniaJednorazowego], [OdroczonyTerminPlatnosci], [RegonZglaszajacy], [NrZgloszeniaCelnego], [DataObciazeniaZabezpieczeniaGeneralnego], [DataObciazeniaZabezpieczeniaJednorazowego], [ZglaszajacyMiejscowosc], [ZglaszajacyNumerVatUe], [DataPowiadomienia], [NumerZglaszajacego], [DataSprostowania], [KwotaZabezpieczeniaTSW], [DataArch], [ZglaszajacyKraj], [ZglaszajacyNrLokalu], [ZglaszajacyNrDokumentu], [ProceduraCelna], [NazwaZglaszajacego], [ZglaszajacyWojewodztwo], [PierwotnyNumerBiznesowy], [ZglaszajacyKodPocztowy], [ZglaszajacySystem],  [NumerZabezpieczniaJednorazowego], [RodzajZgloszenia], [DataPowstaniaDluguCelnego], [NipZglaszajacego], [ZglaszajacyUlica], [NazwiskoZglaszajacego], [ID_Pismo_xml], [ZglaszajacyPoczta], [DataZgloszeniaCelnego], [PozycjeRazem], [RaportWyslaniaSK], [ZglaszajacyUwagi], [KwotaZabezpieczeniaGeneralnego], [ImieZglaszajacego], [AIS], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [ZglaszajacyNrEori], [AdnotacjeIUwagi], [WpisDoRejestruDluguCelnego], [NumerZabezpieczeniaGeneralnego], [NumerPozwolenia], [CzyZabezpieczenieGeneralneObciazaAIS], [ZglaszajacyPowiat], [DataUrodzeniaZglaszajacego], [NazwaPelnaZglaszajacego], [ZglaszajacyGmina], [ZglaszajacyNrDomu], [RazemBezZwol], [KwotaZabezpieczeniaJednorazowego], [TerminPlatnosci], [PeselZglaszajacego], [DataRejestracjiRDC] );

SET @Merged = 1;
 END 


--SADU_Dokument                  

IF @TableName = 'SADU_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.SADU_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.SADU_Dokument) 
 MERGE INTO zef2DW.SADU_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.SADU_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataZwolnieniaTowaru]=src.[DataZwolnieniaTowaru],
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[RodzajZglaszajacego]=src.[RodzajZglaszajacego],
tgt.[OdroczonyTerminPlatnosci]=src.[OdroczonyTerminPlatnosci],
tgt.[RegonZglaszajacy]=src.[RegonZglaszajacy],
tgt.[ZglaszajacyMiejscowosc]=src.[ZglaszajacyMiejscowosc],
tgt.[ZglaszajacyNumerVatUe]=src.[ZglaszajacyNumerVatUe],
tgt.[DataPowiadomienia]=src.[DataPowiadomienia],
tgt.[ObrotPocztowy]=src.[ObrotPocztowy],
tgt.[NumerZglaszajacego]=src.[NumerZglaszajacego],
tgt.[DataArch]=src.[DataArch],
tgt.[ZglaszajacyKraj]=src.[ZglaszajacyKraj],
tgt.[ZglaszajacyNrLokalu]=src.[ZglaszajacyNrLokalu],
tgt.[ZglaszajacyNrDokumentu]=src.[ZglaszajacyNrDokumentu],
tgt.[ProceduraCelna]=src.[ProceduraCelna],
tgt.[NazwaZglaszajacego]=src.[NazwaZglaszajacego],
tgt.[ZglaszajacyWojewodztwo]=src.[ZglaszajacyWojewodztwo],
tgt.[NumerPozwoleniaSASP]=src.[NumerPozwoleniaSASP],
tgt.[PierwotnyNumerBiznesowy]=src.[PierwotnyNumerBiznesowy],
tgt.[ZglaszajacyKodPocztowy]=src.[ZglaszajacyKodPocztowy],
tgt.[ZglaszajacySystem]=src.[ZglaszajacySystem],

tgt.[RodzajZgloszenia]=src.[RodzajZgloszenia],
tgt.[DataPowstaniaDluguCelnego]=src.[DataPowstaniaDluguCelnego],
tgt.[NipZglaszajacego]=src.[NipZglaszajacego],
tgt.[ZglaszajacyUlica]=src.[ZglaszajacyUlica],
tgt.[NazwiskoZglaszajacego]=src.[NazwiskoZglaszajacego],
tgt.[ProceduraUproszczona]=src.[ProceduraUproszczona],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[ZglaszajacyPoczta]=src.[ZglaszajacyPoczta],
tgt.[DataZgloszeniaCelnego]=src.[DataZgloszeniaCelnego],
tgt.[PozycjeRazem]=src.[PozycjeRazem],
tgt.[ZglaszajacyUwagi]=src.[ZglaszajacyUwagi],
tgt.[ImieZglaszajacego]=src.[ImieZglaszajacego],
tgt.[AIS]=src.[AIS],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[ZglaszajacyNrEori]=src.[ZglaszajacyNrEori],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[WpisDoRejestruDluguCelnego]=src.[WpisDoRejestruDluguCelnego],
tgt.[NumerPozwolenia]=src.[NumerPozwolenia],
tgt.[DataUniewaznienia]=src.[DataUniewaznienia],
tgt.[OrganCelnySASP]=src.[OrganCelnySASP],
tgt.[ZglaszajacyPowiat]=src.[ZglaszajacyPowiat],
tgt.[DataUrodzeniaZglaszajacego]=src.[DataUrodzeniaZglaszajacego],
tgt.[NazwaPelnaZglaszajacego]=src.[NazwaPelnaZglaszajacego],
tgt.[FormaOdroczenia]=src.[FormaOdroczenia],
tgt.[ZglaszajacyGmina]=src.[ZglaszajacyGmina],
tgt.[ZglaszajacyNrDomu]=src.[ZglaszajacyNrDomu],
tgt.[RazemBezZwol]=src.[RazemBezZwol],
tgt.[ZaswiadczenieOZaleglosciach]=src.[ZaswiadczenieOZaleglosciach],
tgt.[TerminPlatnosci]=src.[TerminPlatnosci],
tgt.[PeselZglaszajacego]=src.[PeselZglaszajacego],
tgt.[DataRejestracjiRDC]=src.[DataRejestracjiRDC]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([DataZwolnieniaTowaru], [NumerDokumentu], [RodzajZglaszajacego], [OdroczonyTerminPlatnosci], [RegonZglaszajacy], [ZglaszajacyMiejscowosc], [ZglaszajacyNumerVatUe], [DataPowiadomienia], [ObrotPocztowy], [NumerZglaszajacego], [DataArch], [ZglaszajacyKraj], [ZglaszajacyNrLokalu], [ZglaszajacyNrDokumentu], [ProceduraCelna], [NazwaZglaszajacego], [ZglaszajacyWojewodztwo], [NumerPozwoleniaSASP], [PierwotnyNumerBiznesowy], [ZglaszajacyKodPocztowy], [ZglaszajacySystem],  [RodzajZgloszenia], [DataPowstaniaDluguCelnego], [NipZglaszajacego], [ZglaszajacyUlica], [NazwiskoZglaszajacego], [ProceduraUproszczona], [ID_Pismo_xml], [ZglaszajacyPoczta], [DataZgloszeniaCelnego], [PozycjeRazem], [ZglaszajacyUwagi], [ImieZglaszajacego], [AIS], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [ZglaszajacyNrEori], [AdnotacjeIUwagi], [WpisDoRejestruDluguCelnego], [NumerPozwolenia], [DataUniewaznienia], [OrganCelnySASP], [ZglaszajacyPowiat], [DataUrodzeniaZglaszajacego], [NazwaPelnaZglaszajacego], [FormaOdroczenia], [ZglaszajacyGmina], [ZglaszajacyNrDomu], [RazemBezZwol], [ZaswiadczenieOZaleglosciach], [TerminPlatnosci], [PeselZglaszajacego], [DataRejestracjiRDC] )
VALUES ([DataZwolnieniaTowaru], [NumerDokumentu], [RodzajZglaszajacego], [OdroczonyTerminPlatnosci], [RegonZglaszajacy], [ZglaszajacyMiejscowosc], [ZglaszajacyNumerVatUe], [DataPowiadomienia], [ObrotPocztowy], [NumerZglaszajacego], [DataArch], [ZglaszajacyKraj], [ZglaszajacyNrLokalu], [ZglaszajacyNrDokumentu], [ProceduraCelna], [NazwaZglaszajacego], [ZglaszajacyWojewodztwo], [NumerPozwoleniaSASP], [PierwotnyNumerBiznesowy], [ZglaszajacyKodPocztowy], [ZglaszajacySystem],  [RodzajZgloszenia], [DataPowstaniaDluguCelnego], [NipZglaszajacego], [ZglaszajacyUlica], [NazwiskoZglaszajacego], [ProceduraUproszczona], [ID_Pismo_xml], [ZglaszajacyPoczta], [DataZgloszeniaCelnego], [PozycjeRazem], [ZglaszajacyUwagi], [ImieZglaszajacego], [AIS], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [ZglaszajacyNrEori], [AdnotacjeIUwagi], [WpisDoRejestruDluguCelnego], [NumerPozwolenia], [DataUniewaznienia], [OrganCelnySASP], [ZglaszajacyPowiat], [DataUrodzeniaZglaszajacego], [NazwaPelnaZglaszajacego], [FormaOdroczenia], [ZglaszajacyGmina], [ZglaszajacyNrDomu], [RazemBezZwol], [ZaswiadczenieOZaleglosciach], [TerminPlatnosci], [PeselZglaszajacego], [DataRejestracjiRDC] );

SET @Merged = 1;
 END 

--UPWK_Dokument                  

IF @TableName = 'UPWK_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.UPWK_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.UPWK_Dokument) 
 MERGE INTO zef2DW.UPWK_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.UPWK_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.BlokadaKorektyWgDaty=src.BlokadaKorektyWgDaty, tgt.BlokadaKorektyZaOkres=src.BlokadaKorektyZaOkres, tgt.DataDoreczenia=src.DataDoreczenia, tgt.DataUpowaznienia=src.DataUpowaznienia, tgt.OrganWydajacy=src.OrganWydajacy, tgt.JakiOkresRozliczeniowy=src.JakiOkresRozliczeniowy, tgt.RodzajPodatku=src.RodzajPodatku, tgt.NumerUpowaznienia=src.NumerUpowaznienia, tgt.TypDecyzji=src.TypDecyzji, tgt.TypDochodu=src.TypDochodu,  tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.DataZakonczeniaKontroli=src.DataZakonczeniaKontroli, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, BlokadaKorektyWgDaty, BlokadaKorektyZaOkres, DataDoreczenia, DataUpowaznienia, OrganWydajacy, JakiOkresRozliczeniowy, RodzajPodatku, NumerUpowaznienia, TypDecyzji, TypDochodu, AdnotacjeIUwagi, DataZakonczeniaKontroli, RaportWyslaniaSK, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.BlokadaKorektyWgDaty, src.BlokadaKorektyZaOkres, src.DataDoreczenia, src.DataUpowaznienia, src.OrganWydajacy, src.JakiOkresRozliczeniowy, src.RodzajPodatku, src.NumerUpowaznienia, src.TypDecyzji, src.TypDochodu, src.AdnotacjeIUwagi, src.DataZakonczeniaKontroli, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--USAD_Dokument  
IF @TableName = 'USAD_Dokument' BEGIN 
DELETE FROM WA_Hurtownia.zef2DW.USAD_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.USAD_Dokument)                 
MERGE INTO zef2DW.USAD_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.USAD_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataZwolnieniaTowaru]=src.[DataZwolnieniaTowaru],
tgt.[RodzajZglaszajacego]=src.[RodzajZglaszajacego],
tgt.[NIPKontrahentaZabezpieczeniaJednorazowego]=src.[NIPKontrahentaZabezpieczeniaJednorazowego],
tgt.[OdroczonyTerminPlatnosci]=src.[OdroczonyTerminPlatnosci],
tgt.[RegonZglaszajacy]=src.[RegonZglaszajacy],
tgt.[DataObciazeniaZabezpieczeniaGeneralnego]=src.[DataObciazeniaZabezpieczeniaGeneralnego],
tgt.[DataObciazeniaZabezpieczeniaJednorazowego]=src.[DataObciazeniaZabezpieczeniaJednorazowego],
tgt.[ZglaszajacyMiejscowosc]=src.[ZglaszajacyMiejscowosc],
tgt.[ZglaszajacyNumerVatUe]=src.[ZglaszajacyNumerVatUe],
tgt.[DataPowiadomienia]=src.[DataPowiadomienia],
tgt.[ObrotPocztowy]=src.[ObrotPocztowy],
tgt.[NumerZglaszajacego]=src.[NumerZglaszajacego],
tgt.[KwotaZabezpieczeniaTSW]=src.[KwotaZabezpieczeniaTSW],
tgt.[DataArch]=src.[DataArch],
tgt.[ZglaszajacyKraj]=src.[ZglaszajacyKraj],
tgt.[ZglaszajacyNrLokalu]=src.[ZglaszajacyNrLokalu],
tgt.[ZglaszajacyNrDokumentu]=src.[ZglaszajacyNrDokumentu],
tgt.[ProceduraCelna]=src.[ProceduraCelna],
tgt.[NazwaZglaszajacego]=src.[NazwaZglaszajacego],
tgt.[ZglaszajacyWojewodztwo]=src.[ZglaszajacyWojewodztwo],
tgt.[NumerPozwoleniaSASP]=src.[NumerPozwoleniaSASP],
tgt.[ZglaszajacyKodPocztowy]=src.[ZglaszajacyKodPocztowy],
tgt.[ZglaszajacySystem]=src.[ZglaszajacySystem],

tgt.[NumerZabezpieczniaJednorazowego]=src.[NumerZabezpieczniaJednorazowego],
tgt.[RodzajZgloszenia]=src.[RodzajZgloszenia],
tgt.[DataPowstaniaDluguCelnego]=src.[DataPowstaniaDluguCelnego],
tgt.[NipZglaszajacego]=src.[NipZglaszajacego],
tgt.[NumerZgloszeniaCelnego]=src.[NumerZgloszeniaCelnego],
tgt.[ZglaszajacyUlica]=src.[ZglaszajacyUlica],
tgt.[NazwiskoZglaszajacego]=src.[NazwiskoZglaszajacego],
tgt.[ProceduraUproszczona]=src.[ProceduraUproszczona],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[ZglaszajacyPoczta]=src.[ZglaszajacyPoczta],
tgt.[DataZgloszeniaCelnego]=src.[DataZgloszeniaCelnego],
tgt.[PozycjeRazem]=src.[PozycjeRazem],
tgt.[RaportWyslaniaSK]=src.[RaportWyslaniaSK],
tgt.[ZglaszajacyUwagi]=src.[ZglaszajacyUwagi],
tgt.[KwotaZabezpieczeniaGeneralnego]=src.[KwotaZabezpieczeniaGeneralnego],
tgt.[ImieZglaszajacego]=src.[ImieZglaszajacego],
tgt.[AIS]=src.[AIS],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[ZglaszajacyNrEori]=src.[ZglaszajacyNrEori],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[WpisDoRejestruDluguCelnego]=src.[WpisDoRejestruDluguCelnego],
tgt.[NumerZabezpieczeniaGeneralnego]=src.[NumerZabezpieczeniaGeneralnego],
tgt.[DokumentArchiwalny]=src.[DokumentArchiwalny],
tgt.[NumerPozwolenia]=src.[NumerPozwolenia],
tgt.[CzyZabezpieczenieGeneralneObciazaAIS]=src.[CzyZabezpieczenieGeneralneObciazaAIS],
tgt.[OrganCelnySASP]=src.[OrganCelnySASP],
tgt.[NrZgloszeniaNiekompletnego]=src.[NrZgloszeniaNiekompletnego],
tgt.[KwotaDoZaplatyZwrotu]=src.[KwotaDoZaplatyZwrotu],
tgt.[OkresRozliczeniowy]=src.[OkresRozliczeniowy],
tgt.[ZglaszajacyPowiat]=src.[ZglaszajacyPowiat],
tgt.[DataUrodzeniaZglaszajacego]=src.[DataUrodzeniaZglaszajacego],
tgt.[NazwaPelnaZglaszajacego]=src.[NazwaPelnaZglaszajacego],
tgt.[FormaOdroczenia]=src.[FormaOdroczenia],
tgt.[ZglaszajacyGmina]=src.[ZglaszajacyGmina],
tgt.[ZglaszajacyNrDomu]=src.[ZglaszajacyNrDomu],
tgt.[RazemBezZwol]=src.[RazemBezZwol],
tgt.[ZaswiadczenieOZaleglosciach]=src.[ZaswiadczenieOZaleglosciach],
tgt.[KwotaZabezpieczeniaJednorazowego]=src.[KwotaZabezpieczeniaJednorazowego],
tgt.[TerminPlatnosci]=src.[TerminPlatnosci],
tgt.[PeselZglaszajacego]=src.[PeselZglaszajacego],
tgt.[DataRejestracjiRDC]=src.[DataRejestracjiRDC]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([DataZwolnieniaTowaru], [RodzajZglaszajacego], [NIPKontrahentaZabezpieczeniaJednorazowego], [OdroczonyTerminPlatnosci], [RegonZglaszajacy], [DataObciazeniaZabezpieczeniaGeneralnego], [DataObciazeniaZabezpieczeniaJednorazowego], [ZglaszajacyMiejscowosc], [ZglaszajacyNumerVatUe], [DataPowiadomienia], [ObrotPocztowy], [NumerZglaszajacego], [KwotaZabezpieczeniaTSW], [DataArch], [ZglaszajacyKraj], [ZglaszajacyNrLokalu], [ZglaszajacyNrDokumentu], [ProceduraCelna], [NazwaZglaszajacego], [ZglaszajacyWojewodztwo], [NumerPozwoleniaSASP], [ZglaszajacyKodPocztowy], [ZglaszajacySystem],  [NumerZabezpieczniaJednorazowego], [RodzajZgloszenia], [DataPowstaniaDluguCelnego], [NipZglaszajacego], [NumerZgloszeniaCelnego], [ZglaszajacyUlica], [NazwiskoZglaszajacego], [ProceduraUproszczona], [ID_Pismo_xml], [ZglaszajacyPoczta], [DataZgloszeniaCelnego], [PozycjeRazem], [RaportWyslaniaSK], [ZglaszajacyUwagi], [KwotaZabezpieczeniaGeneralnego], [ImieZglaszajacego], [AIS], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [ZglaszajacyNrEori], [AdnotacjeIUwagi], [WpisDoRejestruDluguCelnego], [NumerZabezpieczeniaGeneralnego], [DokumentArchiwalny], [NumerPozwolenia], [CzyZabezpieczenieGeneralneObciazaAIS], [OrganCelnySASP], [NrZgloszeniaNiekompletnego], [KwotaDoZaplatyZwrotu], [OkresRozliczeniowy], [ZglaszajacyPowiat], [DataUrodzeniaZglaszajacego], [NazwaPelnaZglaszajacego], [FormaOdroczenia], [ZglaszajacyGmina], [ZglaszajacyNrDomu], [RazemBezZwol], [ZaswiadczenieOZaleglosciach], [KwotaZabezpieczeniaJednorazowego], [TerminPlatnosci], [PeselZglaszajacego], [DataRejestracjiRDC] )
VALUES ([DataZwolnieniaTowaru], [RodzajZglaszajacego], [NIPKontrahentaZabezpieczeniaJednorazowego], [OdroczonyTerminPlatnosci], [RegonZglaszajacy], [DataObciazeniaZabezpieczeniaGeneralnego], [DataObciazeniaZabezpieczeniaJednorazowego], [ZglaszajacyMiejscowosc], [ZglaszajacyNumerVatUe], [DataPowiadomienia], [ObrotPocztowy], [NumerZglaszajacego], [KwotaZabezpieczeniaTSW], [DataArch], [ZglaszajacyKraj], [ZglaszajacyNrLokalu], [ZglaszajacyNrDokumentu], [ProceduraCelna], [NazwaZglaszajacego], [ZglaszajacyWojewodztwo], [NumerPozwoleniaSASP], [ZglaszajacyKodPocztowy], [ZglaszajacySystem],  [NumerZabezpieczniaJednorazowego], [RodzajZgloszenia], [DataPowstaniaDluguCelnego], [NipZglaszajacego], [NumerZgloszeniaCelnego], [ZglaszajacyUlica], [NazwiskoZglaszajacego], [ProceduraUproszczona], [ID_Pismo_xml], [ZglaszajacyPoczta], [DataZgloszeniaCelnego], [PozycjeRazem], [RaportWyslaniaSK], [ZglaszajacyUwagi], [KwotaZabezpieczeniaGeneralnego], [ImieZglaszajacego], [AIS], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [ZglaszajacyNrEori], [AdnotacjeIUwagi], [WpisDoRejestruDluguCelnego], [NumerZabezpieczeniaGeneralnego], [DokumentArchiwalny], [NumerPozwolenia], [CzyZabezpieczenieGeneralneObciazaAIS], [OrganCelnySASP], [NrZgloszeniaNiekompletnego], [KwotaDoZaplatyZwrotu], [OkresRozliczeniowy], [ZglaszajacyPowiat], [DataUrodzeniaZglaszajacego], [NazwaPelnaZglaszajacego], [FormaOdroczenia], [ZglaszajacyGmina], [ZglaszajacyNrDomu], [RazemBezZwol], [ZaswiadczenieOZaleglosciach], [KwotaZabezpieczeniaJednorazowego], [TerminPlatnosci], [PeselZglaszajacego], [DataRejestracjiRDC] );

SET @Merged = 1;
 END 

--WNSB_Dokument                  

IF @TableName = 'WNSB_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.WNSB_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.WNSB_Dokument) 
 MERGE INTO zef2DW.WNSB_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.WNSB_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.AdresProducenta=src.AdresProducenta, tgt.AkcjeCzyZarejestrowanyPlatnikWynik=src.AkcjeCzyZarejestrowanyPlatnikWynik, tgt.AkcjePozwoleniaWynik=src.AkcjePozwoleniaWynik, tgt.CzyPesel=src.CzyPesel, tgt.DataRejestracji=src.DataRejestracji, tgt.DataWniosku=src.DataWniosku, tgt.DataWplywu=src.DataWplywu, tgt.DataZlozenia=src.DataZlozenia, tgt.DoKorekty=src.DoKorekty, tgt.ListaZalacznikow=src.ListaZalacznikow, tgt.MiejsceWydania=src.MiejsceWydania, tgt.RodzajWyrobow=src.RodzajWyrobow, tgt.ImiePelnomocnika=src.ImiePelnomocnika, tgt.NazwiskoPelnomocnika=src.NazwiskoPelnomocnika, tgt.NrDowoduPelnomocnika=src.NrDowoduPelnomocnika, tgt.PeselPelnomocnika=src.PeselPelnomocnika, tgt.AdresPelnomocnika=src.AdresPelnomocnika, tgt.NrWniosku=src.NrWniosku, tgt.Oswiadczenie=src.Oswiadczenie, tgt.PodatnikDataUrodzenia=src.PodatnikDataUrodzenia, tgt.PodatnikNazwa=src.PodatnikNazwa, tgt.PodatnikNazwisko=src.PodatnikNazwisko, tgt.PodatnikNipRegon=src.PodatnikNipRegon, tgt.PodatnikPierwszeimie=src.PodatnikPierwszeimie, tgt.RazemDoZaplaty=src.RazemDoZaplaty, tgt.SumaKosztowWytworzenia=src.SumaKosztowWytworzenia, tgt.WartoscPodatkowychZnakowAkcyzy=src.WartoscPodatkowychZnakowAkcyzy, tgt.RodzajBanderoli=src.RodzajBanderoli, tgt.NazwaUrzedu=src.NazwaUrzedu, tgt.UserLogin=src.UserLogin, tgt.Uwagi=src.Uwagi, tgt.Typwyrobow=src.Typwyrobow, tgt.PodatnikNipKraj=src.PodatnikNipKraj, tgt.PodatnikKraj=src.PodatnikKraj, tgt.PodatnikNipWojewodztwo=src.PodatnikNipWojewodztwo, tgt.PodatnikWojewodztwo=src.PodatnikWojewodztwo, tgt.PodatnikNipPowiat=src.PodatnikNipPowiat, tgt.PodatnikPowiat=src.PodatnikPowiat, tgt.PodatnikNipGmina=src.PodatnikNipGmina, tgt.PodatnikGmina=src.PodatnikGmina, tgt.PodatnikNipUlica=src.PodatnikNipUlica, tgt.PodatnikUlica=src.PodatnikUlica, tgt.PodatnikNipNrDomu=src.PodatnikNipNrDomu, tgt.PodatnikNrDomu=src.PodatnikNrDomu, tgt.PodatnikNipNrLokalu=src.PodatnikNipNrLokalu, tgt.PodatnikNrLokalu=src.PodatnikNrLokalu, tgt.PodatnikNipMiejscowosc=src.PodatnikNipMiejscowosc, tgt.PodatnikMiejscowosc=src.PodatnikMiejscowosc, tgt.PodatnikNipKodPocztowy=src.PodatnikNipKodPocztowy, tgt.KodPocztowyPodatnika=src.KodPocztowyPodatnika, tgt.PodatnikNIPmiejscowoscPoczty=src.PodatnikNIPmiejscowoscPoczty, tgt.PodatnikPoczta=src.PodatnikPoczta, tgt.RaportWyslaniaSK=src.RaportWyslaniaSK, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, AdresProducenta, AkcjeCzyZarejestrowanyPlatnikWynik, AkcjePozwoleniaWynik, CzyPesel, DataRejestracji, DataWniosku, DataWplywu, DataZlozenia, DoKorekty, ListaZalacznikow, MiejsceWydania, RodzajWyrobow, ImiePelnomocnika, NazwiskoPelnomocnika, NrDowoduPelnomocnika, PeselPelnomocnika, AdresPelnomocnika, NrWniosku, Oswiadczenie, PodatnikDataUrodzenia, PodatnikNazwa, PodatnikNazwisko, PodatnikNipRegon, PodatnikPierwszeimie, RazemDoZaplaty, SumaKosztowWytworzenia, WartoscPodatkowychZnakowAkcyzy, RodzajBanderoli, NazwaUrzedu, UserLogin, Uwagi, Typwyrobow, PodatnikNipKraj, PodatnikKraj, PodatnikNipWojewodztwo, PodatnikWojewodztwo, PodatnikNipPowiat, PodatnikPowiat, PodatnikNipGmina, PodatnikGmina, PodatnikNipUlica, PodatnikUlica, PodatnikNipNrDomu, PodatnikNrDomu, PodatnikNipNrLokalu, PodatnikNrLokalu, PodatnikNipMiejscowosc, PodatnikMiejscowosc, PodatnikNipKodPocztowy, KodPocztowyPodatnika, PodatnikNIPmiejscowoscPoczty, PodatnikPoczta, RaportWyslaniaSK, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.AdresProducenta, src.AkcjeCzyZarejestrowanyPlatnikWynik, src.AkcjePozwoleniaWynik, src.CzyPesel, src.DataRejestracji, src.DataWniosku, src.DataWplywu, src.DataZlozenia, src.DoKorekty, src.ListaZalacznikow, src.MiejsceWydania, src.RodzajWyrobow, src.ImiePelnomocnika, src.NazwiskoPelnomocnika, src.NrDowoduPelnomocnika, src.PeselPelnomocnika, src.AdresPelnomocnika, src.NrWniosku, src.Oswiadczenie, src.PodatnikDataUrodzenia, src.PodatnikNazwa, src.PodatnikNazwisko, src.PodatnikNipRegon, src.PodatnikPierwszeimie, src.RazemDoZaplaty, src.SumaKosztowWytworzenia, src.WartoscPodatkowychZnakowAkcyzy, src.RodzajBanderoli, src.NazwaUrzedu, src.UserLogin, src.Uwagi, src.Typwyrobow, src.PodatnikNipKraj, src.PodatnikKraj, src.PodatnikNipWojewodztwo, src.PodatnikWojewodztwo, src.PodatnikNipPowiat, src.PodatnikPowiat, src.PodatnikNipGmina, src.PodatnikGmina, src.PodatnikNipUlica, src.PodatnikUlica, src.PodatnikNipNrDomu, src.PodatnikNrDomu, src.PodatnikNipNrLokalu, src.PodatnikNrLokalu, src.PodatnikNipMiejscowosc, src.PodatnikMiejscowosc, src.PodatnikNipKodPocztowy, src.KodPocztowyPodatnika, src.PodatnikNIPmiejscowoscPoczty, src.PodatnikPoczta, src.RaportWyslaniaSK, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--WPOZ_Dokument                  

IF @TableName = 'WPOZ_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.WPOZ_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.WPOZ_Dokument) 
 MERGE INTO zef2DW.WPOZ_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.WPOZ_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.DataWydania=src.DataWydania, tgt.DataDoreczenia=src.DataDoreczenia, tgt.OrganWydajacy=src.OrganWydajacy, tgt.NumerWniosku=src.NumerWniosku, tgt.NumerDecyzji=src.NumerDecyzji, tgt.NumerPostanowienia=src.NumerPostanowienia, tgt.NumerZabezpieczenia=src.NumerZabezpieczenia, tgt.DataZlozenia=src.DataZlozenia, tgt.KwotaZabezpieczenia=src.KwotaZabezpieczenia, tgt.KwotaPrzyjeta=src.KwotaPrzyjeta, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.PrzyjecieOdmowa=src.PrzyjecieOdmowa, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, DataWydania, DataDoreczenia, OrganWydajacy, NumerWniosku, NumerDecyzji, NumerPostanowienia, NumerZabezpieczenia, DataZlozenia, KwotaZabezpieczenia, KwotaPrzyjeta, AdnotacjeIUwagi, PrzyjecieOdmowa, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.DataWydania, src.DataDoreczenia, src.OrganWydajacy, src.NumerWniosku, src.NumerDecyzji, src.NumerPostanowienia, src.NumerZabezpieczenia, src.DataZlozenia, src.KwotaZabezpieczenia, src.KwotaPrzyjeta, src.AdnotacjeIUwagi, src.PrzyjecieOdmowa, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--WZAB_Dokument                  

IF @TableName = 'WZAB_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.WZAB_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.WZAB_Dokument) 
 MERGE INTO zef2DW.WZAB_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.WZAB_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.TypDochodu=src.TypDochodu, tgt.NumerWniosku=src.NumerWniosku, tgt.DataZlozeniaWniosku=src.DataZlozeniaWniosku, tgt.DataWplywuWniosku=src.DataWplywuWniosku, tgt.NumerDecyzji=src.NumerDecyzji, tgt.KwotaZabezpieczenia=src.KwotaZabezpieczenia, tgt.ProponowanaFormaZabezpieczen=src.ProponowanaFormaZabezpieczen, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, TypDochodu, NumerWniosku, DataZlozeniaWniosku, DataWplywuWniosku, NumerDecyzji, KwotaZabezpieczenia, ProponowanaFormaZabezpieczen, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.TypDochodu, src.NumerWniosku, src.DataZlozeniaWniosku, src.DataWplywuWniosku, src.NumerDecyzji, src.KwotaZabezpieczenia, src.ProponowanaFormaZabezpieczen, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--ZAKK_Dokument                  

IF @TableName = 'ZAKK_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.ZAKK_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.ZAKK_Dokument) 
 MERGE INTO zef2DW.ZAKK_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.ZAKK_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.Rodzaj=src.Rodzaj, tgt.NumerDokumentu=src.NumerDokumentu, tgt.Odbiorca=src.Odbiorca, tgt.AdresDostawy=src.AdresDostawy, tgt.NumerPodatnikaOdbiorca=src.NumerPodatnikaOdbiorca, tgt.Dostawca=src.Dostawca, tgt.AdresDostawcy=src.AdresDostawcy, tgt.NumerPodatnikaDostawca=src.NumerPodatnikaDostawca, tgt.AdresWysylki=src.AdresWysylki, tgt.DataWysylki=src.DataWysylki, tgt.Przewoznik=src.Przewoznik, tgt.WidAdresDostawy=src.WidAdresDostawy, tgt.DataDostawy=src.DataDostawy, tgt.DataNrFaktury=src.DataNrFaktury, tgt.RodzajPotwierdzenia=src.RodzajPotwierdzenia, tgt.KwotaAkcyzyRazem=src.KwotaAkcyzyRazem, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, Rodzaj, NumerDokumentu, Odbiorca, AdresDostawy, NumerPodatnikaOdbiorca, Dostawca, AdresDostawcy, NumerPodatnikaDostawca, AdresWysylki, DataWysylki, Przewoznik, WidAdresDostawy, DataDostawy, DataNrFaktury, RodzajPotwierdzenia, KwotaAkcyzyRazem, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.Rodzaj, src.NumerDokumentu, src.Odbiorca, src.AdresDostawy, src.NumerPodatnikaOdbiorca, src.Dostawca, src.AdresDostawcy, src.NumerPodatnikaDostawca, src.AdresWysylki, src.DataWysylki, src.Przewoznik, src.WidAdresDostawy, src.DataDostawy, src.DataNrFaktury, src.RodzajPotwierdzenia, src.KwotaAkcyzyRazem, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--ZAKP_Dokument                  

IF @TableName = 'ZAKP_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.ZAKP_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.ZAKP_Dokument) 
 MERGE INTO zef2DW.ZAKP_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.ZAKP_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.CzyBezterminowe=src.CzyBezterminowe, tgt.DataWydaniaPotwierdzenia=src.DataWydaniaPotwierdzenia, tgt.FormaZabezpieczeniaInna=src.FormaZabezpieczeniaInna, tgt.FormaZabezpieczeniaPokwitowanie=src.FormaZabezpieczeniaPokwitowanie, tgt.KwotaZabezpieczeniaAkcyzowego=src.KwotaZabezpieczeniaAkcyzowego, tgt.NazwaZglaszajacego=src.NazwaZglaszajacego, tgt.NipZglaszajacego=src.NipZglaszajacego, tgt.NumerZglaszajacego=src.NumerZglaszajacego, tgt.PeselZglaszajacego=src.PeselZglaszajacego, tgt.NumerDokumentu=src.NumerDokumentu, tgt.ZobowiazanieDoZlozZabezpieczenia=src.ZobowiazanieDoZlozZabezpieczenia, tgt.PotwierdzeniePokwitowanie=src.PotwierdzeniePokwitowanie, tgt.RegonZglaszajacego=src.RegonZglaszajacego, tgt.RodzajZobowiazan=src.RodzajZobowiazan, tgt.StatusPodmiotu=src.StatusPodmiotu, tgt.TerminDoDnia=src.TerminDoDnia, tgt.TerminOdDnia=src.TerminOdDnia, tgt.zabezpieczenieAkcyzowe=src.zabezpieczenieAkcyzowe, tgt.ZglaszajacyGmina=src.ZglaszajacyGmina, tgt.ZglaszajacyKodPocztowy=src.ZglaszajacyKodPocztowy, tgt.ZglaszajacyKraj=src.ZglaszajacyKraj, tgt.ZglaszajacyMiejscowosc=src.ZglaszajacyMiejscowosc, tgt.ZglaszajacyNrDokumentu=src.ZglaszajacyNrDokumentu, tgt.ZglaszajacyNrDomu=src.ZglaszajacyNrDomu, tgt.ZglaszajacyNrEori=src.ZglaszajacyNrEori, tgt.ZglaszajacyNrLokalu=src.ZglaszajacyNrLokalu, tgt.ZglaszajacyNumerVatUe=src.ZglaszajacyNumerVatUe, tgt.ZglaszajacyPoczta=src.ZglaszajacyPoczta, tgt.ZglaszajacyPowiat=src.ZglaszajacyPowiat, tgt.ZglaszajacyUlica=src.ZglaszajacyUlica, tgt.ZglaszajacyUwagi=src.ZglaszajacyUwagi, tgt.ZglaszajacyWojewodztwo=src.ZglaszajacyWojewodztwo, tgt.DataUrodzeniaZglaszajacego=src.DataUrodzeniaZglaszajacego, tgt.ImieZglaszajacego=src.ImieZglaszajacego, tgt.NazwaPelnaZglaszajacego=src.NazwaPelnaZglaszajacego, tgt.NazwiskoZglaszajacego=src.NazwiskoZglaszajacego, tgt.RodzajZglaszajacego=src.RodzajZglaszajacego, tgt.System=src.System, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, CzyBezterminowe, DataWydaniaPotwierdzenia, FormaZabezpieczeniaInna, FormaZabezpieczeniaPokwitowanie, KwotaZabezpieczeniaAkcyzowego, NazwaZglaszajacego, NipZglaszajacego, NumerZglaszajacego, PeselZglaszajacego, NumerDokumentu, ZobowiazanieDoZlozZabezpieczenia, PotwierdzeniePokwitowanie, RegonZglaszajacego, RodzajZobowiazan, StatusPodmiotu, TerminDoDnia, TerminOdDnia, zabezpieczenieAkcyzowe, ZglaszajacyGmina, ZglaszajacyKodPocztowy, ZglaszajacyKraj, ZglaszajacyMiejscowosc, ZglaszajacyNrDokumentu, ZglaszajacyNrDomu, ZglaszajacyNrEori, ZglaszajacyNrLokalu, ZglaszajacyNumerVatUe, ZglaszajacyPoczta, ZglaszajacyPowiat, ZglaszajacyUlica, ZglaszajacyUwagi, ZglaszajacyWojewodztwo, DataUrodzeniaZglaszajacego, ImieZglaszajacego, NazwaPelnaZglaszajacego, NazwiskoZglaszajacego, RodzajZglaszajacego, System, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.CzyBezterminowe, src.DataWydaniaPotwierdzenia, src.FormaZabezpieczeniaInna, src.FormaZabezpieczeniaPokwitowanie, src.KwotaZabezpieczeniaAkcyzowego, src.NazwaZglaszajacego, src.NipZglaszajacego, src.NumerZglaszajacego, src.PeselZglaszajacego, src.NumerDokumentu, src.ZobowiazanieDoZlozZabezpieczenia, src.PotwierdzeniePokwitowanie, src.RegonZglaszajacego, src.RodzajZobowiazan, src.StatusPodmiotu, src.TerminDoDnia, src.TerminOdDnia, src.zabezpieczenieAkcyzowe, src.ZglaszajacyGmina, src.ZglaszajacyKodPocztowy, src.ZglaszajacyKraj, src.ZglaszajacyMiejscowosc, src.ZglaszajacyNrDokumentu, src.ZglaszajacyNrDomu, src.ZglaszajacyNrEori, src.ZglaszajacyNrLokalu, src.ZglaszajacyNumerVatUe, src.ZglaszajacyPoczta, src.ZglaszajacyPowiat, src.ZglaszajacyUlica, src.ZglaszajacyUwagi, src.ZglaszajacyWojewodztwo, src.DataUrodzeniaZglaszajacego, src.ImieZglaszajacego, src.NazwaPelnaZglaszajacego, src.NazwiskoZglaszajacego, src.RodzajZglaszajacego, src.System, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--ZMWM_Dokument                  

IF @TableName = 'ZMWM_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.ZMWM_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.ZMWM_Dokument) 
 MERGE INTO zef2DW.ZMWM_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.ZMWM_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.IdentyfikatorPodatnika=src.IdentyfikatorPodatnika,
tgt.NrDokumentu=src.NrDokumentu, tgt.DataDokumentu=src.DataDokumentu, tgt.DataZmiany=src.DataZmiany, tgt.RodzajPodatku=src.RodzajPodatku, tgt.OrganPrzekazujacyNazwa=src.OrganPrzekazujacyNazwa, tgt.OrganPrzyjmujacy=src.OrganPrzyjmujacy, tgt.PrzekazywanyRodzajDokumentu=src.PrzekazywanyRodzajDokumentu, tgt.PrzekazywanyNumerDokumentu=src.PrzekazywanyNumerDokumentu, tgt.RepeaterPismoPierwotneId=src.RepeaterPismoPierwotneId, tgt.AdnotacjeIUwagi=src.AdnotacjeIUwagi, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorPodatnika,IdentyfikatorDokumentu, NrDokumentu, DataDokumentu, DataZmiany, RodzajPodatku, OrganPrzekazujacyNazwa, OrganPrzyjmujacy, PrzekazywanyRodzajDokumentu, PrzekazywanyNumerDokumentu, RepeaterPismoPierwotneId, AdnotacjeIUwagi, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorPodatnika, src.IdentyfikatorDokumentu, src.NrDokumentu, src.DataDokumentu, src.DataZmiany, src.RodzajPodatku, src.OrganPrzekazujacyNazwa, src.OrganPrzyjmujacy, src.PrzekazywanyRodzajDokumentu, src.PrzekazywanyNumerDokumentu, src.RepeaterPismoPierwotneId, src.AdnotacjeIUwagi, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--ZNPN_Dokument                  

IF @TableName = 'ZNPN_Dokument' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.ZNPN_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.ZNPN_Dokument) 
 MERGE INTO zef2DW.ZNPN_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.ZNPN_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.[DataWaznosciOd]=src.[DataWaznosciOd],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[KwotaWplaty]=src.[KwotaWplaty],
tgt.[PozycjeRazem]=src.[PozycjeRazem],
tgt.[NumerDokumentuWplaty]=src.[NumerDokumentuWplaty],
tgt.[DataOtrzymania]=src.[DataOtrzymania],
tgt.[KategoriaZezwolenia]=src.[KategoriaZezwolenia],
tgt.[NrZezwolenia]=src.[NrZezwolenia],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[NumerDrukuZezwolenia]=src.[NumerDrukuZezwolenia],
tgt.[DataWystawienia]=src.[DataWystawienia],
tgt.[OkresWaznosci]=src.[OkresWaznosci],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[MigracjaReczna]=src.[MigracjaReczna],
tgt.[Do]=src.[Do],
tgt.[DataArch]=src.[DataArch]
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT ([DataWaznosciOd], [ID_Pismo_xml], [KwotaWplaty], [PozycjeRazem], [NumerDokumentuWplaty], [DataOtrzymania], [KategoriaZezwolenia], [NrZezwolenia], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [NumerDrukuZezwolenia], [DataWystawienia], [OkresWaznosci], [AdnotacjeIUwagi], [MigracjaReczna], [Do], [DataArch] )
VALUES ([DataWaznosciOd], [ID_Pismo_xml], [KwotaWplaty], [PozycjeRazem], [NumerDokumentuWplaty], [DataOtrzymania], [KategoriaZezwolenia], [NrZezwolenia], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu], [NumerDrukuZezwolenia], [DataWystawienia], [OkresWaznosci], [AdnotacjeIUwagi], [MigracjaReczna], [Do], [DataArch] );

SET @Merged = 1;
 END 
               


--AZNN_POZYCJE

IF @TableName = 'AZNN_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.AZNN_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.AZNN_Pozycje) 
 MERGE INTO zef2DW.AZNN_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.AZNN_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.ZaleglosciRodzajDokumentu=src.ZaleglosciRodzajDokumentu, tgt.ZaleglosciNumerDokumentu=src.ZaleglosciNumerDokumentu, tgt.ZaleglosciRodzajNaleznosci=src.ZaleglosciRodzajNaleznosci, tgt.ZaleglosciTerminPlatnosci=src.ZaleglosciTerminPlatnosci, tgt.ZaleglosciKwotaNadplaty=src.ZaleglosciKwotaNadplaty, tgt.ZaleglosciOdsetki=src.ZaleglosciOdsetki, tgt.ZaleglosciOplataProlongacyjna=src.ZaleglosciOplataProlongacyjna, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, ZaleglosciRodzajDokumentu, ZaleglosciNumerDokumentu, ZaleglosciRodzajNaleznosci, ZaleglosciTerminPlatnosci, ZaleglosciKwotaNadplaty, ZaleglosciOdsetki, ZaleglosciOplataProlongacyjna, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.ZaleglosciRodzajDokumentu, src.ZaleglosciNumerDokumentu, src.ZaleglosciRodzajNaleznosci, src.ZaleglosciTerminPlatnosci, src.ZaleglosciKwotaNadplaty, src.ZaleglosciOdsetki, src.ZaleglosciOplataProlongacyjna, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 

--AZNN_Przelewy
IF @TableName = 'AZNN_Przelewy' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.AZNN_Przelewy WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.AZNN_Przelewy) 
MERGE INTO zef2DW.AZNN_Przelewy AS tgt
USING WA_StageHurtownia.zef2DW.AZNN_Przelewy AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.NazwaUrzeduSkarbowego=src.NazwaUrzeduSkarbowego, tgt.KodKontrahenta=src.KodKontrahenta, tgt.RachunekBankowy=src.RachunekBankowy, tgt.KwotaPrzelewu=src.KwotaPrzelewu, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, NazwaUrzeduSkarbowego, KodKontrahenta, RachunekBankowy, KwotaPrzelewu, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.NazwaUrzeduSkarbowego, src.KodKontrahenta, src.RachunekBankowy, src.KwotaPrzelewu, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 


--BO_Pozycje                     

IF @TableName = 'BO_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.BO_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.BO_Pozycje) 
 MERGE INTO zef2DW.BO_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.BO_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeKwota=src.PozycjeKwota, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeRodzajNaleznosci, PozycjeKwota, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosci, src.PozycjeKwota, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--DAKC_Pozycje                   

IF @TableName = 'DAKC_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DAKC_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DAKC_Pozycje) 
 MERGE INTO zef2DW.DAKC_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DAKC_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.PozycjaKwotaDecyzji=src.PozycjaKwotaDecyzji, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosci, PozycjaKwotaDecyzji, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosci, src.PozycjaKwotaDecyzji, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 

--DAKO_Pozycje                   

IF @TableName = 'DAKO_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DAKO_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DAKO_Pozycje) 
 MERGE INTO zef2DW.DAKO_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DAKO_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeKwotaZEwidencji=src.PozycjeKwotaZEwidencji, tgt.PozycjeKwotaDecyzji=src.PozycjeKwotaDecyzji, tgt.Saldo=src.Saldo, tgt.PozycjeTerminPlatnosci=src.PozycjeTerminPlatnosci, tgt.PozycjeNazleznosci=src.PozycjeNazleznosci, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeKwotaZEwidencji, PozycjeKwotaDecyzji, Saldo, PozycjeTerminPlatnosci, PozycjeNazleznosci, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeKwotaZEwidencji, src.PozycjeKwotaDecyzji, src.Saldo, src.PozycjeTerminPlatnosci, src.PozycjeNazleznosci, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--DAKO_Samochody                 

IF @TableName = 'DAKO_Samochody' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DAKO_Samochody WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DAKO_Samochody) 
 MERGE INTO zef2DW.DAKO_Samochody AS tgt
USING WA_StageHurtownia.zef2DW.DAKO_Samochody AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.SamochodyMarka=src.SamochodyMarka, tgt.SamochodyModel=src.SamochodyModel, tgt.SamochodyRokProdukcji=src.SamochodyRokProdukcji, tgt.SamochodyVIN=src.SamochodyVIN, tgt.SamochodyPojemnosc=src.SamochodyPojemnosc, tgt.SamochodyDataZaplaty=src.SamochodyDataZaplaty, tgt.SamochodyBlokada=src.SamochodyBlokada, tgt.SamochodyPierwotnePismoId=src.SamochodyPierwotnePismoId, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, SamochodyMarka, SamochodyModel, SamochodyRokProdukcji, SamochodyVIN, SamochodyPojemnosc, SamochodyDataZaplaty, SamochodyBlokada, SamochodyPierwotnePismoId, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.SamochodyMarka, src.SamochodyModel, src.SamochodyRokProdukcji, src.SamochodyVIN, src.SamochodyPojemnosc, src.SamochodyDataZaplaty, src.SamochodyBlokada, src.SamochodyPierwotnePismoId, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--DKOR_Potwierdzenie             

IF @TableName = 'DKOR_Potwierdzenie' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DKOR_Potwierdzenie WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DKOR_Potwierdzenie) 
 MERGE INTO zef2DW.DKOR_Potwierdzenie AS tgt
USING WA_StageHurtownia.zef2DW.DKOR_Potwierdzenie AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.DataWykonaniaPrzelewu=src.DataWykonaniaPrzelewu, tgt.KwotaPrzelewu=src.KwotaPrzelewu, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, DataWykonaniaPrzelewu, KwotaPrzelewu, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.DataWykonaniaPrzelewu, src.KwotaPrzelewu, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--DKOR_DokumentZaplaty           
IF @TableName = 'DKOR_DokumentZaplaty' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DKOR_DokumentZaplaty WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DKOR_DokumentZaplaty) 
 MERGE INTO zef2DW.DKOR_DokumentZaplaty AS tgt
USING WA_StageHurtownia.zef2DW.DKOR_DokumentZaplaty AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.FormaPlatnosci=src.FormaPlatnosci, tgt.NumerDokumentuZaplaty=src.NumerDokumentuZaplaty, tgt.DataDokumentuZaplaty=src.DataDokumentuZaplaty, tgt.Kwota=src.Kwota, tgt.Usunieto=src.Usunieto, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, FormaPlatnosci, NumerDokumentuZaplaty, DataDokumentuZaplaty, Kwota, Usunieto, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.FormaPlatnosci, src.NumerDokumentuZaplaty, src.DataDokumentuZaplaty, src.Kwota, src.Usunieto, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 
--DKOR_Pozycje                   
IF @TableName = 'DKOR_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DKOR_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DKOR_Pozycje) 
 MERGE INTO zef2DW.DKOR_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DKOR_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.KwotaNaleznosci=src.KwotaNaleznosci, tgt.KwotaDecyzji=src.KwotaDecyzji, tgt.CzyDokumentZwolniony=src.CzyDokumentZwolniony, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosci, KwotaNaleznosci, KwotaDecyzji, CzyDokumentZwolniony, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosci, src.KwotaNaleznosci, src.KwotaDecyzji, src.CzyDokumentZwolniony, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--DKPI_Pozycje                   
IF @TableName = 'DKPI_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DKPI_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DKPI_Pozycje) 
 MERGE INTO zef2DW.DKPI_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DKPI_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeKwota=src.PozycjeKwota, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeRodzajNaleznosci, PozycjeKwota, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosci, src.PozycjeKwota, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--DOOD_Pozycje                   
IF @TableName = 'DOOD_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOOD_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DOOD_Pozycje) 
 MERGE INTO zef2DW.DOOD_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DOOD_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeDataZaliczki=src.PozycjeDataZaliczki, tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeKwotaZaliczki=src.PozycjeKwotaZaliczki, tgt.PozycjeTerminPlatnosci=src.PozycjeTerminPlatnosci, tgt.PozycjeKwotaOdsetek=src.PozycjeKwotaOdsetek, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeDataZaliczki, PozycjeRodzajNaleznosci, PozycjeKwotaZaliczki, PozycjeTerminPlatnosci, PozycjeKwotaOdsetek, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeDataZaliczki, src.PozycjeRodzajNaleznosci, src.PozycjeKwotaZaliczki, src.PozycjeTerminPlatnosci, src.PozycjeKwotaOdsetek, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END                

--DOOP_Pierwotne                 
IF @TableName = 'DOOP_Pierwotne' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOOP_Pierwotne WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DOOP_Pierwotne) 
 MERGE INTO zef2DW.DOOP_Pierwotne AS tgt
USING WA_StageHurtownia.zef2DW.DOOP_Pierwotne AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PierwotneRodzaj=src.PierwotneRodzaj, tgt.PierwotneNumer=src.PierwotneNumer, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PierwotneRodzaj, PierwotneNumer, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PierwotneRodzaj, src.PierwotneNumer, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 
--DOOP_Pozycje                   
IF @TableName = 'DOOP_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOOP_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DOOP_Pozycje) 
 MERGE INTO zef2DW.DOOP_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DOOP_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeNumerDokumentu=src.PozycjeNumerDokumentu, tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeNumerRaty=src.PozycjeNumerRaty, tgt.PozycjeDataZaliczki=src.PozycjeDataZaliczki, tgt.PozycjeKwotaOdroczona=src.PozycjeKwotaOdroczona, tgt.PozycjeOdsetki=src.PozycjeOdsetki, tgt.PozycjeOplataProlongacyjna=src.PozycjeOplataProlongacyjna, tgt.PozycjeTerminPlatnosci=src.PozycjeTerminPlatnosci, tgt.PozycjeTerminPlatnosciOdroczonej=src.PozycjeTerminPlatnosciOdroczonej, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeNumerDokumentu, PozycjeRodzajNaleznosci, PozycjeNumerRaty, PozycjeDataZaliczki, PozycjeKwotaOdroczona, PozycjeOdsetki, PozycjeOplataProlongacyjna, PozycjeTerminPlatnosci, PozycjeTerminPlatnosciOdroczonej, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeNumerDokumentu, src.PozycjeRodzajNaleznosci, src.PozycjeNumerRaty, src.PozycjeDataZaliczki, src.PozycjeKwotaOdroczona, src.PozycjeOdsetki, src.PozycjeOplataProlongacyjna, src.PozycjeTerminPlatnosci, src.PozycjeTerminPlatnosciOdroczonej, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--DOPN_Pierwotny                 

IF @TableName = 'DOPN_Pierwotny' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOPN_Pierwotny WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DW.DOPN_Pierwotny) 
 MERGE INTO zef2DW.DOPN_Pierwotny AS tgt
USING WA_StageHurtownia.zef2DW.DOPN_Pierwotny AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PierwotnyRodzajDokumentu=src.PierwotnyRodzajDokumentu, tgt.PierwotnyNumerDokumentu=src.PierwotnyNumerDokumentu, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (PierwotnyRodzajDokumentu, PierwotnyNumerDokumentu, DataArch, ID_Pismo_xml)
VALUES (src.PierwotnyRodzajDokumentu, src.PierwotnyNumerDokumentu, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--DOPN_Pozycje                   

IF @TableName = 'DOPN_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOPN_Pozycje WHERE ID_Pismo_xml IN (SELECT ID_Pismo_xml FROM WA_StageHurtownia.zef2DW.DOPN_Pozycje) 
 MERGE INTO zef2DW.DOPN_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DOPN_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeKwota=src.PozycjeKwota, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (PozycjeRodzajNaleznosci, PozycjeKwota, DataArch, ID_Pismo_xml)
VALUES (src.PozycjeRodzajNaleznosci, src.PozycjeKwota, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 


--DOPO_Pierwotne                 

IF @TableName = 'DOPO_Pierwotne' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOPO_Pierwotne WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DOPO_Pierwotne) 
 MERGE INTO zef2DW.DOPO_Pierwotne AS tgt
USING WA_StageHurtownia.zef2DW.DOPO_Pierwotne AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PierwotneRodzaj=src.PierwotneRodzaj, tgt.PierwotneNumer=src.PierwotneNumer, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PierwotneRodzaj, PierwotneNumer, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PierwotneRodzaj, src.PierwotneNumer, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 
--DOPO_Pozycje                   
IF @TableName = 'DOPO_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOPO_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DOPO_Pozycje) 
 MERGE INTO zef2DW.DOPO_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DOPO_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeNumerDokumentu=src.PozycjeNumerDokumentu, tgt.SaldoEwidencji=src.SaldoEwidencji, tgt.PozycjeKwotaDecyzji=src.PozycjeKwotaDecyzji, tgt.PozycjeDataWplatyZaliczki=src.PozycjeDataWplatyZaliczki, tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeTerminPlatnosci=src.PozycjeTerminPlatnosci, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeNumerDokumentu, SaldoEwidencji, PozycjeKwotaDecyzji, PozycjeDataWplatyZaliczki, PozycjeRodzajNaleznosci, PozycjeTerminPlatnosci, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeNumerDokumentu, src.SaldoEwidencji, src.PozycjeKwotaDecyzji, src.PozycjeDataWplatyZaliczki, src.PozycjeRodzajNaleznosci, src.PozycjeTerminPlatnosci, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--DOPR_Pozycje                   
IF @TableName = 'DOPR_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DOPR_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DOPR_Pozycje) 
 MERGE INTO zef2DW.DOPR_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DOPR_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeKwota=src.PozycjeKwota, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeRodzajNaleznosci, PozycjeKwota, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosci, src.PozycjeKwota, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--DORA_Pozycje                   

IF @TableName = 'DORA_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DORA_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DORA_Pozycje) 
 MERGE INTO zef2DW.DORA_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DORA_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeNumerDokumentu=src.PozycjeNumerDokumentu, tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeDataZaliczki=src.PozycjeDataZaliczki, tgt.PozycjeKwotaNaleznosci=src.PozycjeKwotaNaleznosci, tgt.PozycjeKwotaRozkladana=src.PozycjeKwotaRozkladana, tgt.PozycjeTerminPlatnosci=src.PozycjeTerminPlatnosci, tgt.PozycjeTerminPierwszejRaty=src.PozycjeTerminPierwszejRaty, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeNumerDokumentu, PozycjeRodzajNaleznosci, PozycjeDataZaliczki, PozycjeKwotaNaleznosci, PozycjeKwotaRozkladana, PozycjeTerminPlatnosci, PozycjeTerminPierwszejRaty, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeNumerDokumentu, src.PozycjeRodzajNaleznosci, src.PozycjeDataZaliczki, src.PozycjeKwotaNaleznosci, src.PozycjeKwotaRozkladana, src.PozycjeTerminPlatnosci, src.PozycjeTerminPierwszejRaty, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--DORA_Pierwotne                 
IF @TableName = 'DORA_Pierwotne' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DORA_Pierwotne WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DORA_Pierwotne) 
 MERGE INTO zef2DW.DORA_Pierwotne AS tgt
USING WA_StageHurtownia.zef2DW.DORA_Pierwotne AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PierwotneRodzaj=src.PierwotneRodzaj, tgt.PierwotneNumer=src.PierwotneNumer, tgt.PierwotneKwotaNaleznosci=src.PierwotneKwotaNaleznosci, tgt.PierwotneKwotaRozkladana=src.PierwotneKwotaRozkladana, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PierwotneRodzaj, PierwotneNumer, PierwotneKwotaNaleznosci, PierwotneKwotaRozkladana, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PierwotneRodzaj, src.PierwotneNumer, src.PierwotneKwotaNaleznosci, src.PierwotneKwotaRozkladana, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 
--DORA_Raty                      
IF @TableName = 'DORA_Raty' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DORA_Raty WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DORA_Raty) 
 MERGE INTO zef2DW.DORA_Raty AS tgt
USING WA_StageHurtownia.zef2DW.DORA_Raty AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RatyNumerDokumentu=src.RatyNumerDokumentu, tgt.RatyRodzajNaleznosci=src.RatyRodzajNaleznosci, tgt.RatyNumer=src.RatyNumer, tgt.RatyTerminPlatnosci=src.RatyTerminPlatnosci, tgt.RatyKwota=src.RatyKwota, tgt.RatyOdsetki=src.RatyOdsetki, tgt.OplataProlongacyjna=src.OplataProlongacyjna, tgt.RatyA=src.RatyA, tgt.DataAnulowaniaRaty=src.DataAnulowaniaRaty, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RatyNumerDokumentu, RatyRodzajNaleznosci, RatyNumer, RatyTerminPlatnosci, RatyKwota, RatyOdsetki, OplataProlongacyjna, RatyA, DataAnulowaniaRaty, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RatyNumerDokumentu, src.RatyRodzajNaleznosci, src.RatyNumer, src.RatyTerminPlatnosci, src.RatyKwota, src.RatyOdsetki, src.OplataProlongacyjna, src.RatyA, src.DataAnulowaniaRaty, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END                

--DPDZ_Pozycje                   
IF @TableName = 'DPDZ_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DPDZ_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DPDZ_Pozycje) 
 MERGE INTO zef2DW.DPDZ_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DPDZ_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.KwotaNaleznosci=src.KwotaNaleznosci, tgt.MetodaPlatnosci=src.MetodaPlatnosci, tgt.CzyZwolniony=src.CzyZwolniony, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosci, KwotaNaleznosci, MetodaPlatnosci, CzyZwolniony, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosci, src.KwotaNaleznosci, src.MetodaPlatnosci, src.CzyZwolniony, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 
--DPDZ_DokumentZaplaty           
IF @TableName = 'DPDZ_DokumentZaplaty' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DPDZ_DokumentZaplaty WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DPDZ_DokumentZaplaty) 
 MERGE INTO zef2DW.DPDZ_DokumentZaplaty AS tgt
USING WA_StageHurtownia.zef2DW.DPDZ_DokumentZaplaty AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.DataWykonaniaPrzelewu=src.DataWykonaniaPrzelewu, tgt.KwotaPrzelewu=src.KwotaPrzelewu, tgt.FormaPlatnosci=src.FormaPlatnosci, tgt.NumerDokumentuZaplaty=src.NumerDokumentuZaplaty, tgt.DataDokumentuZaplaty=src.DataDokumentuZaplaty, tgt.DokumentZaplatyKwota=src.DokumentZaplatyKwota, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, DataWykonaniaPrzelewu, KwotaPrzelewu, FormaPlatnosci, NumerDokumentuZaplaty, DataDokumentuZaplaty, DokumentZaplatyKwota, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.DataWykonaniaPrzelewu, src.KwotaPrzelewu, src.FormaPlatnosci, src.NumerDokumentuZaplaty, src.DataDokumentuZaplaty, src.DokumentZaplatyKwota, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--DUNA_Pozycje                   
IF @TableName = 'DUNA_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DUNA_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DUNA_Pozycje) 
 MERGE INTO zef2DW.DUNA_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DUNA_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosciKod=src.PozycjeRodzajNaleznosciKod, tgt.PozycjeRataNr=src.PozycjeRataNr, tgt.PozycjeNaleznosci=src.PozycjeNaleznosci, tgt.PozycjeUmorzenie=src.PozycjeUmorzenie, tgt.Saldo=src.Saldo, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeRodzajNaleznosciKod, PozycjeRataNr, PozycjeNaleznosci, PozycjeUmorzenie, Saldo, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosciKod, src.PozycjeRataNr, src.PozycjeNaleznosci, src.PozycjeUmorzenie, src.Saldo, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--DUOD_Pozycje                   

IF @TableName = 'DUOD_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DUOD_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DUOD_Pozycje) 
 MERGE INTO zef2DW.DUOD_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DUOD_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosciKod=src.PozycjeRodzajNaleznosciKod, tgt.PozycjeNaleznosci=src.PozycjeNaleznosci, tgt.PozycjeTerminPlatnosci=src.PozycjeTerminPlatnosci, tgt.PozycjeKwotaOdKtorejUmorzonoOdsetki=src.PozycjeKwotaOdKtorejUmorzonoOdsetki, tgt.PozycjaDataOd=src.PozycjaDataOd, tgt.PozycjaDataDo=src.PozycjaDataDo, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeRodzajNaleznosciKod, PozycjeNaleznosci, PozycjeTerminPlatnosci, PozycjeKwotaOdKtorejUmorzonoOdsetki, PozycjaDataOd, PozycjaDataDo, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosciKod, src.PozycjeNaleznosci, src.PozycjeTerminPlatnosci, src.PozycjeKwotaOdKtorejUmorzonoOdsetki, src.PozycjaDataOd, src.PozycjaDataDo, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--DVIM_Pozycje                   
IF @TableName = 'DVIM_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DVIM_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DVIM_Pozycje) 
 MERGE INTO zef2DW.DVIM_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DVIM_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeKwotaDoZaplaty = src.PozycjeKwotaDoZaplaty, tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeVATIm=src.PozycjeVATIm, tgt.PozycjeVAT7=src.PozycjeVAT7, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (PozycjeKwotaDoZaplaty, IdentyfikatorDokumentu, PozycjeRodzajNaleznosci, PozycjeVATIm, PozycjeVAT7, DataArch, ID_Pismo_xml)
VALUES (src.PozycjeKwotaDoZaplaty, src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosci, src.PozycjeVATIm, src.PozycjeVAT7, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--DWNN_DokumentZaplaty           
IF @TableName = 'DWNN_DokumentZaplaty' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DWNN_DokumentZaplaty WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DWNN_DokumentZaplaty) 
 MERGE INTO zef2DW.DWNN_DokumentZaplaty AS tgt
USING WA_StageHurtownia.zef2DW.DWNN_DokumentZaplaty AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.FormaPlatnosci=src.FormaPlatnosci, tgt.NumerDokumentuZaplaty=src.NumerDokumentuZaplaty, tgt.DataDokumentuZaplaty=src.DataDokumentuZaplaty, tgt.DokumentZaplatyKwota=src.DokumentZaplatyKwota, tgt.DokumentZaplatyUsuniety=src.DokumentZaplatyUsuniety, tgt.MigracjaReczna=src.MigracjaReczna, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, FormaPlatnosci, NumerDokumentuZaplaty, DataDokumentuZaplaty, DokumentZaplatyKwota, DokumentZaplatyUsuniety, MigracjaReczna, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.FormaPlatnosci, src.NumerDokumentuZaplaty, src.DataDokumentuZaplaty, src.DokumentZaplatyKwota, src.DokumentZaplatyUsuniety, src.MigracjaReczna, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 
--DWNN_Potwierdzenie             

IF @TableName = 'DWNN_Potwierdzenie' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DWNN_Potwierdzenie WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DWNN_Potwierdzenie) 
 MERGE INTO zef2DW.DWNN_Potwierdzenie AS tgt
USING WA_StageHurtownia.zef2DW.DWNN_Potwierdzenie AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.DataWykonaniaPrzelewu=src.DataWykonaniaPrzelewu, tgt.KwotaPrzelewu=src.KwotaPrzelewu, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, DataWykonaniaPrzelewu, KwotaPrzelewu, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.DataWykonaniaPrzelewu, src.KwotaPrzelewu, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 
--DWNN_Pozycje                   
IF @TableName = 'DWNN_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DWNN_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DWNN_Pozycje) 
 MERGE INTO zef2DW.DWNN_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DWNN_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.KwotaNaleznosci=src.KwotaNaleznosci, tgt.MetodaPlatnosci=src.MetodaPlatnosci, tgt.CzyZwolnienieZZaplaty=src.CzyZwolnienieZZaplaty, tgt.CzyOdroczenieTerminuPlatnosci=src.CzyOdroczenieTerminuPlatnosci, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosci, KwotaNaleznosci, MetodaPlatnosci, CzyZwolnienieZZaplaty, CzyOdroczenieTerminuPlatnosci, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosci, src.KwotaNaleznosci, src.MetodaPlatnosci, src.CzyZwolnienieZZaplaty, src.CzyOdroczenieTerminuPlatnosci, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 



--DZMW_Pozycje                   

IF @TableName = 'DZMW_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DZMW_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DZMW_Pozycje) 
 MERGE INTO zef2DW.DZMW_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DZMW_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajNaleznosciKod=src.RodzajNaleznosciKod, tgt.StaraNaleznosc=src.StaraNaleznosc, tgt.NowaNaleznosc=src.NowaNaleznosc, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosciKod, StaraNaleznosc, NowaNaleznosc, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosciKod, src.StaraNaleznosc, src.NowaNaleznosc, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END                

--DZWR_Pierwotny                 
IF @TableName = 'DZWR_Pierwotny' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DZWR_Pierwotny WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DZWR_Pierwotny) 
 MERGE INTO zef2DW.DZWR_Pierwotny AS tgt
USING WA_StageHurtownia.zef2DW.DZWR_Pierwotny AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PierwotneRodzaj=src.PierwotneRodzaj, tgt.PierwotneNumer=src.PierwotneNumer, tgt.PierwotneDataUiszczenia=src.PierwotneDataUiszczenia, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PierwotneRodzaj, PierwotneNumer, PierwotneDataUiszczenia, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PierwotneRodzaj, src.PierwotneNumer, src.PierwotneDataUiszczenia, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--DZWR_Pozycje                   

IF @TableName = 'DZWR_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DZWR_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DZWR_Pozycje) 
 MERGE INTO zef2DW.DZWR_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.DZWR_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeKwotaNaleznosci=src.PozycjeKwotaNaleznosci, tgt.PozycjeKwotaWplat=src.PozycjeKwotaWplat, tgt.PozycjeKwotaZwrotu=src.PozycjeKwotaZwrotu, tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjePierwotnyNumerDokumentu=src.PozycjePierwotnyNumerDokumentu, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeKwotaNaleznosci, PozycjeKwotaWplat, PozycjeKwotaZwrotu, PozycjeRodzajNaleznosci, PozycjePierwotnyNumerDokumentu, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeKwotaNaleznosci, src.PozycjeKwotaWplat, src.PozycjeKwotaZwrotu, src.PozycjeRodzajNaleznosci, src.PozycjePierwotnyNumerDokumentu, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 
--DZWR_Samochody                 

IF @TableName = 'DZWR_Samochody' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.DZWR_Samochody WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.DZWR_Samochody) 
 MERGE INTO zef2DW.DZWR_Samochody AS tgt
USING WA_StageHurtownia.zef2DW.DZWR_Samochody AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.SamochodyMarka=src.SamochodyMarka, tgt.SamochodyModel=src.SamochodyModel, tgt.SamochodyRokProdukcji=src.SamochodyRokProdukcji, tgt.SamochodyVIN=src.SamochodyVIN, tgt.SamochodyPojemnosc=src.SamochodyPojemnosc, tgt.SamochodyDataZaplaty=src.SamochodyDataZaplaty, tgt.SamochodyZwrotCzesciowy=src.SamochodyZwrotCzesciowy, tgt.SamochodyZwrotCalkowity=src.SamochodyZwrotCalkowity, tgt.SamochodyNumerDokumentu=src.SamochodyNumerDokumentu, tgt.SamochodyPierwotnyPismoId=src.SamochodyPierwotnyPismoId, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, SamochodyMarka, SamochodyModel, SamochodyRokProdukcji, SamochodyVIN, SamochodyPojemnosc, SamochodyDataZaplaty, SamochodyZwrotCzesciowy, SamochodyZwrotCalkowity, SamochodyNumerDokumentu, SamochodyPierwotnyPismoId, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.SamochodyMarka, src.SamochodyModel, src.SamochodyRokProdukcji, src.SamochodyVIN, src.SamochodyPojemnosc, src.SamochodyDataZaplaty, src.SamochodyZwrotCzesciowy, src.SamochodyZwrotCalkowity, src.SamochodyNumerDokumentu, src.SamochodyPierwotnyPismoId, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--HIPN_DokumentSkojarzony        

IF @TableName = 'HIPN_DokumentSkojarzony' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.HIPN_DokumentSkojarzony WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.HIPN_DokumentSkojarzony) 
 MERGE INTO zef2DW.HIPN_DokumentSkojarzony AS tgt
USING WA_StageHurtownia.zef2DW.HIPN_DokumentSkojarzony AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.DokumentZabezpieczony=src.DokumentZabezpieczony, tgt.DataOperacji=src.DataOperacji, tgt.NumerDokumentuPowiazanego=src.NumerDokumentuPowiazanego, tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.Kwota=src.Kwota, tgt.AktualneSaldo=src.AktualneSaldo, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, DokumentZabezpieczony, DataOperacji, NumerDokumentuPowiazanego, RodzajNaleznosci, Kwota, AktualneSaldo, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.DokumentZabezpieczony, src.DataOperacji, src.NumerDokumentuPowiazanego, src.RodzajNaleznosci, src.Kwota, src.AktualneSaldo, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--HIPN_DokumentZabezpieczony     
IF @TableName = 'HIPN_DokumentZabezpieczony' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.HIPN_DokumentZabezpieczony WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.HIPN_DokumentZabezpieczony) 
 MERGE INTO zef2DW.HIPN_DokumentZabezpieczony AS tgt
USING WA_StageHurtownia.zef2DW.HIPN_DokumentZabezpieczony AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NumerDokumentu=src.NumerDokumentu, tgt.DataWpisu=src.DataWpisu, tgt.KwotaZabezpieczenia=src.KwotaZabezpieczenia, tgt.SaldoZabezpieczenia=src.SaldoZabezpieczenia, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajDokumentu, NumerDokumentu, DataWpisu, KwotaZabezpieczenia, SaldoZabezpieczenia, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajDokumentu, src.NumerDokumentu, src.DataWpisu, src.KwotaZabezpieczenia, src.SaldoZabezpieczenia, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--KPAD_Pozycje                   
IF @TableName = 'KPAD_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.KPAD_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.KPAD_Pozycje) 
 MERGE INTO zef2DW.KPAD_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.KPAD_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeKwota=src.PozycjeKwota, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeRodzajNaleznosci, PozycjeKwota, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosci, src.PozycjeKwota, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--KZPN_Pozycje                   

IF @TableName = 'KZPN_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.KZPN_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.KZPN_Pozycje) 
 MERGE INTO zef2DW.KZPN_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.KZPN_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeKwota=src.PozycjeKwota, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeRodzajNaleznosci, PozycjeKwota, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosci, src.PozycjeKwota, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--MAND_Pozycje                   
IF @TableName = 'MAND_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.MAND_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.MAND_Pozycje) 
 MERGE INTO zef2DW.MAND_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.MAND_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.Grzywna=src.Grzywna, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosci, Grzywna, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosci, src.Grzywna, src.DataArch, src.ID_Pismo_xml);


SET @Merged = 1;
 END 

--NCPR_Pozycje                   

IF @TableName = 'NCPR_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.NCPR_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.NCPR_Pozycje) 
 MERGE INTO zef2DW.NCPR_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.NCPR_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.Kwota=src.Kwota, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosci, Kwota, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosci, src.Kwota, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--ODPD_Pozycje                   

IF @TableName = 'ODPD_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.ODPD_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.ODPD_Pozycje) 
 MERGE INTO zef2DW.ODPD_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.ODPD_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosciKod=src.PozycjeRodzajNaleznosciKod, tgt.PozycjeRata=src.PozycjeRata, tgt.PozycjeNaleznosci=src.PozycjeNaleznosci, tgt.PozycjeOdpisPrzypis=src.PozycjeOdpisPrzypis, tgt.Saldo=src.Saldo, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeRodzajNaleznosciKod, PozycjeRata, PozycjeNaleznosci, PozycjeOdpisPrzypis, Saldo, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosciKod, src.PozycjeRata, src.PozycjeNaleznosci, src.PozycjeOdpisPrzypis, src.Saldo, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--ODPN_Potwierdzenie             

IF @TableName = 'ODPN_Potwierdzenie' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.ODPN_Potwierdzenie WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.ODPN_Potwierdzenie) 
 MERGE INTO zef2DW.ODPN_Potwierdzenie AS tgt
USING WA_StageHurtownia.zef2DW.ODPN_Potwierdzenie AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.DataWykonaniaPrzelewu=src.DataWykonaniaPrzelewu, tgt.KwotaPrzelewu=src.KwotaPrzelewu, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, DataWykonaniaPrzelewu, KwotaPrzelewu, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.DataWykonaniaPrzelewu, src.KwotaPrzelewu, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--ODPN_Pozycje                   

IF @TableName = 'ODPN_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.ODPN_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.ODPN_Pozycje) 
 MERGE INTO zef2DW.ODPN_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.ODPN_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.OdpisPrzypis=src.OdpisPrzypis, tgt.SaldoKoncowe=src.SaldoKoncowe, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, OdpisPrzypis, SaldoKoncowe, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.OdpisPrzypis, src.SaldoKoncowe, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--OKAR_Pozycje                   

IF @TableName = 'OKAR_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.OKAR_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.OKAR_Pozycje) 
 MERGE INTO zef2DW.OKAR_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.OKAR_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeKwota=src.PozycjeKwota, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeRodzajNaleznosci, PozycjeKwota, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosci, src.PozycjeKwota, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--OZWW_Pozycje                   

IF @TableName = 'OZWW_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.OZWW_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.OZWW_Pozycje) 
 MERGE INTO zef2DW.OZWW_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.OZWW_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosciKod=src.PozycjeRodzajNaleznosciKod, tgt.Saldo=src.Saldo, tgt.PozycjeKwotaWstrzymana=src.PozycjeKwotaWstrzymana, tgt.PozycjeTerminPlatnosci=src.PozycjeTerminPlatnosci, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeRodzajNaleznosciKod, Saldo, PozycjeKwotaWstrzymana, PozycjeTerminPlatnosci, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosciKod, src.Saldo, src.PozycjeKwotaWstrzymana, src.PozycjeTerminPlatnosci, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--PKPO_Pozycje                   

IF @TableName = 'PKPO_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.PKPO_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.PKPO_Pozycje) 
 MERGE INTO zef2DW.PKPO_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.PKPO_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.WysokoscKary=src.WysokoscKary, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosci, WysokoscKary, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosci, src.WysokoscKary, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 



--POPC_Pozycje                   

IF @TableName = 'POPC_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.POPC_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.POPC_Pozycje) 
 MERGE INTO zef2DW.POPC_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.POPC_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.KwotaOplaty=src.KwotaOplaty, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosci, KwotaOplaty, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosci, src.KwotaOplaty, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--POTS_Pierwotne                 

IF @TableName = 'POTS_Pierwotne' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.POTS_Pierwotne WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.POTS_Pierwotne) 
 MERGE INTO zef2DW.POTS_Pierwotne AS tgt
USING WA_StageHurtownia.zef2DW.POTS_Pierwotne AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
 tgt.PierwotnyRodzaj=src.PierwotnyRodzaj, tgt.PierwotnyNumer=src.PierwotnyNumer, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PierwotnyRodzaj, PierwotnyNumer, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PierwotnyRodzaj, src.PierwotnyNumer, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--POTS_Pozycje                   

IF @TableName = 'POTS_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.POTS_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.POTS_Pozycje) 
 MERGE INTO zef2DW.POTS_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.POTS_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.PozycjeTSW=src.PozycjeTSW, tgt.PozycjeKwota=src.PozycjeKwota, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeRodzajNaleznosci, PozycjeTSW, PozycjeKwota, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosci, src.PozycjeTSW, src.PozycjeKwota, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--POWK_Pozycje                   

IF @TableName = 'POWK_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.POWK_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.POWK_Pozycje) 
 MERGE INTO zef2DW.POWK_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.POWK_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeRodzajNaleznosciKod=src.PozycjeRodzajNaleznosciKod, tgt.PozycjeNumerDokumentu=src.PozycjeNumerDokumentu, tgt.RwOkres=src.RwOkres, tgt.DataPowstaniaObowiazkuPodatkowego=src.DataPowstaniaObowiazkuPodatkowego, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeRodzajNaleznosciKod, PozycjeNumerDokumentu, RwOkres, DataPowstaniaObowiazkuPodatkowego, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeRodzajNaleznosciKod, src.PozycjeNumerDokumentu, src.RwOkres, src.DataPowstaniaObowiazkuPodatkowego, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--POZA_Pozycje                   

IF @TableName = 'POZA_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.POZA_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.POZA_Pozycje) 
 MERGE INTO zef2DW.POZA_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.POZA_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PozycjeKwota=src.PozycjeKwota, tgt.PozycjeOdsetki=src.PozycjeOdsetki, tgt.PozycjeOplataProlongacyjna=src.PozycjeOplataProlongacyjna, tgt.PozycjeRodzajNaleznosci=src.PozycjeRodzajNaleznosci, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PozycjeKwota, PozycjeOdsetki, PozycjeOplataProlongacyjna, PozycjeRodzajNaleznosci, TerminPlatnosci, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PozycjeKwota, src.PozycjeOdsetki, src.PozycjeOplataProlongacyjna, src.PozycjeRodzajNaleznosci, src.TerminPlatnosci, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--POZA_Pierwotny                 


IF @TableName = 'POZA_Pierwotny' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.POZA_Pierwotny WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.POZA_Pierwotny) 
 MERGE INTO zef2DW.POZA_Pierwotny AS tgt
USING WA_StageHurtownia.zef2DW.POZA_Pierwotny AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PierwotneNumer=src.PierwotneNumer, tgt.PierwotneData=src.PierwotneData, tgt.PierwotneRodzaj=src.PierwotneRodzaj, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PierwotneNumer, PierwotneData, PierwotneRodzaj, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PierwotneNumer, src.PierwotneData, src.PierwotneRodzaj, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--PUPD_Pierwotne                 

IF @TableName = 'PUPD_Pierwotne' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.PUPD_Pierwotne WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.PUPD_Pierwotne) 
 MERGE INTO zef2DW.PUPD_Pierwotne AS tgt
USING WA_StageHurtownia.zef2DW.PUPD_Pierwotne AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.PierwtoneRodzaj=src.PierwtoneRodzaj, tgt.PierwotneNumer=src.PierwotneNumer, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, PierwtoneRodzaj, PierwotneNumer, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PierwtoneRodzaj, src.PierwotneNumer, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--SADS_DokumentZaplaty           

IF @TableName = 'SADS_DokumentZaplaty' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.SADS_DokumentZaplaty WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.SADS_DokumentZaplaty) 
 MERGE INTO zef2DW.SADS_DokumentZaplaty AS tgt
USING WA_StageHurtownia.zef2DW.SADS_DokumentZaplaty AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.FormaPlatnosci=src.FormaPlatnosci, tgt.DokumentZaplatyData = src.DokumentZaplatyData, tgt.NumerDokumentuZaplaty=src.NumerDokumentuZaplaty, tgt.DokumentZaplatyKwota=src.DokumentZaplatyKwota, tgt.DokumentZaplatyUsuniety=src.DokumentZaplatyUsuniety, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, FormaPlatnosci, DokumentZaplatyData, NumerDokumentuZaplaty, DokumentZaplatyKwota, DokumentZaplatyUsuniety, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.FormaPlatnosci, src.DokumentZaplatyData, src.NumerDokumentuZaplaty, src.DokumentZaplatyKwota, src.DokumentZaplatyUsuniety, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--SADS_Uzupelniajacy             

IF @TableName = 'SADS_Uzupelniajacy' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.SADS_Uzupelniajacy WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.SADS_Uzupelniajacy) 
 MERGE INTO zef2DW.SADS_Uzupelniajacy AS tgt
USING WA_StageHurtownia.zef2DW.SADS_Uzupelniajacy AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajNaleznosciUzup=src.RodzajNaleznosciUzup, tgt.KwotaNiekompletnaUzup=src.KwotaNiekompletnaUzup, tgt.MetodaPlatnosciUzup=src.MetodaPlatnosciUzup, tgt.xmlUzupZ=src.xmlUzupZ, tgt.OdroczenieTerminuPlatnosci=src.OdroczenieTerminuPlatnosci, tgt.SaldoNaleznosci=src.SaldoNaleznosci, tgt.KwotaUzupelniajaca=src.KwotaUzupelniajaca, tgt.MetodaPlatnosciUzup2=src.MetodaPlatnosciUzup2, tgt.xmlUzupZ2=src.xmlUzupZ2, tgt.xmlUzupO2=src.xmlUzupO2, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosciUzup, KwotaNiekompletnaUzup, MetodaPlatnosciUzup, xmlUzupZ, OdroczenieTerminuPlatnosci, SaldoNaleznosci, KwotaUzupelniajaca, MetodaPlatnosciUzup2, xmlUzupZ2, xmlUzupO2, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosciUzup, src.KwotaNiekompletnaUzup, src.MetodaPlatnosciUzup, src.xmlUzupZ, src.OdroczenieTerminuPlatnosci, src.SaldoNaleznosci, src.KwotaUzupelniajaca, src.MetodaPlatnosciUzup2, src.xmlUzupZ2, src.xmlUzupO2, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--SADS_Potwierdzenie             

IF @TableName = 'SADS_Potwierdzenie' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.SADS_Potwierdzenie WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.SADS_Potwierdzenie) 
 MERGE INTO zef2DW.SADS_Potwierdzenie AS tgt
USING WA_StageHurtownia.zef2DW.SADS_Potwierdzenie AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.DataWykonaniaPrzelewu=src.DataWykonaniaPrzelewu, tgt.KwotaPrzelewu=src.KwotaPrzelewu, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, DataWykonaniaPrzelewu, KwotaPrzelewu, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.DataWykonaniaPrzelewu, src.KwotaPrzelewu, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--SADS_Pozycje                   

IF @TableName = 'SADS_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.SADS_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.SADS_Pozycje) 
 MERGE INTO zef2DW.SADS_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.SADS_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.MetodaPlatnosci=src.MetodaPlatnosci, tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.KwotaNaleznosci=src.KwotaNaleznosci, tgt.CzyZwolnienieZZaplaty=src.CzyZwolnienieZZaplaty, tgt.CzyOdroczenieTerminuPlatnosci=src.CzyOdroczenieTerminuPlatnosci, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, MetodaPlatnosci, RodzajNaleznosci, KwotaNaleznosci, CzyZwolnienieZZaplaty, CzyOdroczenieTerminuPlatnosci, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.MetodaPlatnosci, src.RodzajNaleznosci, src.KwotaNaleznosci, src.CzyZwolnienieZZaplaty, src.CzyOdroczenieTerminuPlatnosci, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--SADU_Pozycje                   

IF @TableName = 'SADU_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.SADU_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.SADU_Pozycje) 
 MERGE INTO zef2DW.SADU_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.SADU_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.CzyZwolnienieZZaplaty=src.CzyZwolnienieZZaplaty, tgt.CzyOdroczenieTerminuPlatnosci=src.CzyOdroczenieTerminuPlatnosci, tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.KwotaNaleznosci=src.KwotaNaleznosci, tgt.MetodaPlatnosci=src.MetodaPlatnosci, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, CzyZwolnienieZZaplaty, CzyOdroczenieTerminuPlatnosci, RodzajNaleznosci, KwotaNaleznosci, MetodaPlatnosci, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.CzyZwolnienieZZaplaty, src.CzyOdroczenieTerminuPlatnosci, src.RodzajNaleznosci, src.KwotaNaleznosci, src.MetodaPlatnosci, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 
--SADU_Uzupelniajacy             

IF @TableName = 'SADU_Uzupelniajacy' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.SADU_Uzupelniajacy WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.SADU_Uzupelniajacy) 
 MERGE INTO zef2DW.SADU_Uzupelniajacy AS tgt
USING WA_StageHurtownia.zef2DW.SADU_Uzupelniajacy AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajNaleznosciUzup=src.RodzajNaleznosciUzup, tgt.KwotaNiekompletnyUzup=src.KwotaNiekompletnyUzup, tgt.MetodaPlatnosciUzup=src.MetodaPlatnosciUzup, tgt.xmlUzupZ=src.xmlUzupZ, tgt.OdroczenieTerminuPlatnosci=src.OdroczenieTerminuPlatnosci, tgt.SaldoNaleznosci=src.SaldoNaleznosci, tgt.KwotaUzupelniajacaUzup=src.KwotaUzupelniajacaUzup, tgt.MetodaPlatnosciUzup2=src.MetodaPlatnosciUzup2, tgt.xmlUzupZ2=src.xmlUzupZ2, tgt.xmlUzupO2=src.xmlUzupO2, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosciUzup, KwotaNiekompletnyUzup, MetodaPlatnosciUzup, xmlUzupZ, OdroczenieTerminuPlatnosci, SaldoNaleznosci, KwotaUzupelniajacaUzup, MetodaPlatnosciUzup2, xmlUzupZ2, xmlUzupO2, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosciUzup, src.KwotaNiekompletnyUzup, src.MetodaPlatnosciUzup, src.xmlUzupZ, src.OdroczenieTerminuPlatnosci, src.SaldoNaleznosci, src.KwotaUzupelniajacaUzup, src.MetodaPlatnosciUzup2, src.xmlUzupZ2, src.xmlUzupO2, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--UPWK_Okresy                    

IF @TableName = 'UPWK_Okresy' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.UPWK_Okresy WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.UPWK_Okresy) 
 MERGE INTO zef2DW.UPWK_Okresy AS tgt
USING WA_StageHurtownia.zef2DW.UPWK_Okresy AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.Okres=src.Okres, tgt.DataArch=src.DataArch, tgt.DataObowiazkuPodatkowego=src.DataObowiazkuPodatkowego
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, Okres, DataArch, ID_Pismo_xml, DataObowiazkuPodatkowego)
VALUES (src.IdentyfikatorDokumentu, src.Okres, src.DataArch, src.ID_Pismo_xml, src.DataObowiazkuPodatkowego);

SET @Merged = 1;
 END 

--USAD_Uzupelniajacy             

IF @TableName = 'USAD_Uzupelniajacy' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.USAD_Uzupelniajacy WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.USAD_Uzupelniajacy) 
MERGE INTO zef2DW.USAD_Uzupelniajacy AS tgt
USING WA_StageHurtownia.zef2DW.USAD_Uzupelniajacy AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.RodzajNaleznosciUzup = src.RodzajNaleznosciUzup,  tgt.KwotaNaleznosciZgloszenieNiekompletne = src.KwotaNaleznosciZgloszenieNiekompletne, tgt.MetodaPlatnosciZgloszenieNiekompletne = src.MetodaPlatnosciZgloszenieNiekompletne , tgt.CzyZwolnienieZZaplatyZgloszenieNiekompletne = src.CzyZwolnienieZZaplatyZgloszenieNiekompletne, tgt.CzyOdroczenieTerminuPlatnosciZgloszenieNiekompletne = src.CzyOdroczenieTerminuPlatnosciZgloszenieNiekompletne, tgt.KwotaNaleznosciZgloszeniaUzupelniajacego=src.KwotaNaleznosciZgloszeniaUzupelniajacego, tgt.SaldoNaleznosci=src.SaldoNaleznosci, tgt.MetodaPlatnosci=src.MetodaPlatnosci, tgt.CzyOdroczenieTerminuPlatnosci=src.CzyOdroczenieTerminuPlatnosci, tgt.CzyZwolnienieZZaplaty=src.CzyZwolnienieZZaplaty, tgt.ID_Pismo_xml=src.ID_Pismo_xml, tgt.DataArch=src.DataArch
WHEN NOT MATCHED
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosciUzup, KwotaNaleznosciZgloszenieNiekompletne , MetodaPlatnosciZgloszenieNiekompletne , CzyZwolnienieZZaplatyZgloszenieNiekompletne, CzyOdroczenieTerminuPlatnosciZgloszenieNiekompletne, KwotaNaleznosciZgloszeniaUzupelniajacego, SaldoNaleznosci, MetodaPlatnosci, CzyOdroczenieTerminuPlatnosci, CzyZwolnienieZZaplaty, ID_Pismo_xml, DataArch)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosciUzup, src.KwotaNaleznosciZgloszenieNiekompletne , src.MetodaPlatnosciZgloszenieNiekompletne , src.CzyZwolnienieZZaplatyZgloszenieNiekompletne, src.CzyOdroczenieTerminuPlatnosciZgloszenieNiekompletne, src.KwotaNaleznosciZgloszeniaUzupelniajacego, src.SaldoNaleznosci, src.MetodaPlatnosci, src.CzyOdroczenieTerminuPlatnosci, src.CzyZwolnienieZZaplaty, src.ID_Pismo_xml, src.DataArch);
SET @Merged = 1;
 END 

 --USAD_Pozycje

 IF @TableName = 'USAD_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.USAD_Uzupelniajacy WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.USAD_Uzupelniajacy) 
 MERGE INTO zef2DW.USAD_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.USAD_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.KwotaNaleznosci=src.KwotaNaleznosci, tgt.MetodaPlatnosci=src.MetodaPlatnosci, tgt.CzyZwolnienieZZaplaty=src.CzyZwolnienieZZaplaty, tgt.CzyOdroczenieTerminuPlatnosci=src.CzyOdroczenieTerminuPlatnosci, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN NOT MATCHED
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosci, KwotaNaleznosci, MetodaPlatnosci, CzyZwolnienieZZaplaty, CzyOdroczenieTerminuPlatnosci, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosci, src.KwotaNaleznosci, src.MetodaPlatnosci, src.CzyZwolnienieZZaplaty, src.CzyOdroczenieTerminuPlatnosci, src.DataArch, src.ID_Pismo_xml);
 SET @Merged = 1;
 END 

  --USAD_DokumentZaplaty

 IF @TableName = 'USAD_DokumentZaplaty' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.USAD_Uzupelniajacy WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.USAD_Uzupelniajacy) 
 MERGE INTO zef2DW.USAD_DokumentZaplaty AS tgt
USING WA_StageHurtownia.zef2DW.USAD_DokumentZaplaty AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.FormaPlatnosci=src.FormaPlatnosci, tgt.NumerDokumentuZaplaty=src.NumerDokumentuZaplaty, tgt.DokumentZaplatyData=src.DokumentZaplatyData, tgt.DokumentZaplatyKwota=src.DokumentZaplatyKwota, tgt.DokumentZaplatyUsuniety=src.DokumentZaplatyUsuniety, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN NOT MATCHED
THEN INSERT (IdentyfikatorDokumentu, FormaPlatnosci, NumerDokumentuZaplaty, DokumentZaplatyData, DokumentZaplatyKwota, DokumentZaplatyUsuniety, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.FormaPlatnosci, src.NumerDokumentuZaplaty, src.DokumentZaplatyData, src.DokumentZaplatyKwota, src.DokumentZaplatyUsuniety, src.DataArch, src.ID_Pismo_xml);

  SET @Merged = 1;
 END 


--USAD_Potwierdzenie

 IF @TableName = 'USAD_Potwierdzenie' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.USAD_Uzupelniajacy WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.USAD_Uzupelniajacy) 
 MERGE INTO zef2DW.USAD_Potwierdzenie AS tgt
USING WA_StageHurtownia.zef2DW.USAD_Potwierdzenie AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.DataWykonaniaPrzelewu=src.DataWykonaniaPrzelewu, tgt.KwotaPrzelewu=src.KwotaPrzelewu, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN NOT MATCHED
THEN INSERT (IdentyfikatorDokumentu, DataWykonaniaPrzelewu, KwotaPrzelewu, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.DataWykonaniaPrzelewu, src.KwotaPrzelewu, src.DataArch, src.ID_Pismo_xml);

  SET @Merged = 1;
 END              


--WNSB_Banderola                 

IF @TableName = 'WNSB_Banderola' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.WNSB_Banderola WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.WNSB_Banderola) 
 MERGE INTO zef2DW.WNSB_Banderola AS tgt
USING WA_StageHurtownia.zef2DW.WNSB_Banderola AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.BanderolaFormat=src.BanderolaFormat, tgt.BanderolaSymbol=src.BanderolaSymbol, tgt.BanderolaSymbol2=src.BanderolaSymbol2, tgt.BanderolaIlosc=src.BanderolaIlosc, tgt.BanderolaWartosc=src.BanderolaWartosc, tgt.BanderolaWartosc2=src.BanderolaWartosc2, tgt.BanderolaKosztWytworzenia=src.BanderolaKosztWytworzenia, tgt.BanderolaKosztWytworzenia2=src.BanderolaKosztWytworzenia2, tgt.BanderolaSumaNaleznosci=src.BanderolaSumaNaleznosci, tgt.BanderolaSumaWytworzenia=src.BanderolaSumaWytworzenia, tgt.BanderolaRodzajBanderoli=src.BanderolaRodzajBanderoli, tgt.RodzajWyrobow=src.RodzajWyrobow, tgt.BanderolaWyroby=src.BanderolaWyroby, tgt.BanderolaTytulPlatnosci=src.BanderolaTytulPlatnosci, tgt.BanderolaTytulPlatnosci2=src.BanderolaTytulPlatnosci2, tgt.BanderolaTytulPlatnosciWytworzenia=src.BanderolaTytulPlatnosciWytworzenia, tgt.BanderolaTytulPlatnosciWytworzenia2=src.BanderolaTytulPlatnosciWytworzenia2, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, BanderolaFormat, BanderolaSymbol, BanderolaSymbol2, BanderolaIlosc, BanderolaWartosc, BanderolaWartosc2, BanderolaKosztWytworzenia, BanderolaKosztWytworzenia2, BanderolaSumaNaleznosci, BanderolaSumaWytworzenia, BanderolaRodzajBanderoli, RodzajWyrobow, BanderolaWyroby, BanderolaTytulPlatnosci, BanderolaTytulPlatnosci2, BanderolaTytulPlatnosciWytworzenia, BanderolaTytulPlatnosciWytworzenia2, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.BanderolaFormat, src.BanderolaSymbol, src.BanderolaSymbol2, src.BanderolaIlosc, src.BanderolaWartosc, src.BanderolaWartosc2, src.BanderolaKosztWytworzenia, src.BanderolaKosztWytworzenia2, src.BanderolaSumaNaleznosci, src.BanderolaSumaWytworzenia, src.BanderolaRodzajBanderoli, src.RodzajWyrobow, src.BanderolaWyroby, src.BanderolaTytulPlatnosci, src.BanderolaTytulPlatnosci2, src.BanderolaTytulPlatnosciWytworzenia, src.BanderolaTytulPlatnosciWytworzenia2, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
END


--ZAKK_Opis_Wyrobow              

IF @TableName = 'ZAKK_Opis_Wyrobow' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.ZAKK_Opis_Wyrobow WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.ZAKK_Opis_Wyrobow) 
 MERGE INTO zef2DW.ZAKK_Opis_Wyrobow AS tgt
USING WA_StageHurtownia.zef2DW.ZAKK_Opis_Wyrobow AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.NazwaWyrobu=src.NazwaWyrobu, tgt.Ilosc=src.Ilosc, tgt.KodCN=src.KodCN, tgt.KwotaAkcyzy=src.KwotaAkcyzy, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, NazwaWyrobu, Ilosc, KodCN, KwotaAkcyzy, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.NazwaWyrobu, src.Ilosc, src.KodCN, src.KwotaAkcyzy, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 

--ZNPN_Pozycje                   


IF @TableName = 'ZNPN_Pozycje' BEGIN 
 DELETE FROM WA_Hurtownia.zef2DW.ZNPN_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.ZNPN_Pozycje) 
 MERGE INTO zef2DW.ZNPN_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.ZNPN_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U', 'I')
THEN UPDATE SET
tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.KwotaNaleznosci=src.KwotaNaleznosci, tgt.DataArch=src.DataArch
WHEN MATCHED AND src.operacja = 'D' THEN DELETE 
 WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosci, KwotaNaleznosci, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosci, src.KwotaNaleznosci, src.DataArch, src.ID_Pismo_xml);

SET @Merged = 1;
 END 


-- ZZ9

--IOZA_Dokument            
IF @TableName = 'IOZA_Dokument' BEGIN 
DELETE FROM WA_Hurtownia.zef2DW.IOZA_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.IOZA_Dokument)
MERGE INTO zef2DW.IOZA_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.IOZA_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.[SumaOplatProlongacyjnych]=src.[SumaOplatProlongacyjnych],
tgt.[PodstawaPrawna]=src.[PodstawaPrawna],
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[DataPostanowienia]=src.[DataPostanowienia],
tgt.[SumaOdsetek]=src.[SumaOdsetek],
tgt.[SumaNaleznosci]=src.[SumaNaleznosci],
tgt.[Uzasadnienie]=src.[Uzasadnienie],
tgt.[DataWplaty]=src.[DataWplaty],
tgt.[Instancja]=src.[Instancja],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],
tgt.[NumerPostanowienia]=src.[NumerPostanowienia],
tgt.[NumerWplaty]=src.[NumerWplaty],
tgt.[UtrzymanieUchylenie]=src.[UtrzymanieUchylenie],

tgt.[SygnaturaPostanowieniaSadu]=src.[SygnaturaPostanowieniaSadu],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[NazwaWplacajacego]=src.[NazwaWplacajacego],
tgt.[DataDoreczenia]=src.[DataDoreczenia],
tgt.[DataArch]=src.[DataArch]
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT ([SumaOplatProlongacyjnych], [PodstawaPrawna], [ID_Pismo_xml], [DataPostanowienia], [SumaOdsetek], [SumaNaleznosci], [Uzasadnienie], [DataWplaty], [Instancja], [IdentyfikatorPodatnika], [NumerPostanowienia], [NumerWplaty], [UtrzymanieUchylenie], [IdentyfikatorDokumentu],  [SygnaturaPostanowieniaSadu], [AdnotacjeIUwagi], [NazwaWplacajacego], [DataDoreczenia], [DataArch] )
VALUES ([SumaOplatProlongacyjnych], [PodstawaPrawna], [ID_Pismo_xml], [DataPostanowienia], [SumaOdsetek], [SumaNaleznosci], [Uzasadnienie], [DataWplaty], [Instancja], [IdentyfikatorPodatnika], [NumerPostanowienia], [NumerWplaty], [UtrzymanieUchylenie], [IdentyfikatorDokumentu],  [SygnaturaPostanowieniaSadu], [AdnotacjeIUwagi], [NazwaWplacajacego], [DataDoreczenia], [DataArch] );

SET @Merged = 1;
 END 

--IOZA_Pierwotne            
IF @TableName = 'IOZA_Pierwotne' BEGIN 
DELETE FROM WA_Hurtownia.zef2DW.IOZA_Pierwotne WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.IOZA_Pierwotne) 
MERGE INTO zef2DW.IOZA_Pierwotne AS tgt
USING WA_StageHurtownia.zef2DW.IOZA_Pierwotne AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.PierwotneRodzaj=src.PierwotneRodzaj, tgt.PierwotneNumer=src.PierwotneNumer, tgt.PierwotneData=src.PierwotneData, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, PierwotneRodzaj, PierwotneNumer, PierwotneData, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.PierwotneRodzaj, src.PierwotneNumer, src.PierwotneData, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 

--IOZA_Pozycje            
IF @TableName = 'IOZA_Pozycje' BEGIN 
DELETE FROM WA_Hurtownia.zef2DW.IOZA_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.IOZA_Pozycje) 
MERGE INTO zef2DW.IOZA_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.IOZA_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.TerminPlatnosci=src.TerminPlatnosci, tgt.PozycjeKwota=src.PozycjeKwota, tgt.PozycjeOdsetki=src.PozycjeOdsetki, tgt.OplataProlongacyjna=src.OplataProlongacyjna, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosci, TerminPlatnosci, PozycjeKwota, PozycjeOdsetki, OplataProlongacyjna, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosci, src.TerminPlatnosci, src.PozycjeKwota, src.PozycjeOdsetki, src.OplataProlongacyjna, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 


--KZD_Dokument            
IF @TableName = 'KZD_Dokument' BEGIN
DELETE FROM WA_Hurtownia.zef2DW.KZD_Dokument WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.KZD_Dokument)
MERGE INTO zef2DW.KZD_Dokument AS tgt
USING WA_StageHurtownia.zef2DW.KZD_Dokument AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml],
tgt.[DataWydaniaDecyzji]=src.[DataWydaniaDecyzji],
tgt.[NumerDecyzji]=src.[NumerDecyzji],
tgt.[NumerPokwitowania]=src.[NumerPokwitowania],
tgt.[IdentyfikatorPodatnika]=src.[IdentyfikatorPodatnika],

tgt.[KwotaKaucji]=src.[KwotaKaucji],
tgt.[KaraRazem]=src.[KaraRazem],
tgt.[AdnotacjeIUwagi]=src.[AdnotacjeIUwagi],
tgt.[DataOtrzymaniaDecyzji]=src.[DataOtrzymaniaDecyzji],
tgt.[DataArch]=src.[DataArch]
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT ([ID_Pismo_xml], [DataWydaniaDecyzji], [NumerDecyzji], [NumerPokwitowania], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu],  [KwotaKaucji], [KaraRazem], [AdnotacjeIUwagi], [DataOtrzymaniaDecyzji], [DataArch] )
VALUES ([ID_Pismo_xml], [DataWydaniaDecyzji], [NumerDecyzji], [NumerPokwitowania], [IdentyfikatorPodatnika], [IdentyfikatorDokumentu],  [KwotaKaucji], [KaraRazem], [AdnotacjeIUwagi], [DataOtrzymaniaDecyzji], [DataArch] );
SET @Merged = 1;
 END 

--KZD_Pozycje            
IF @TableName = 'KZD_Pozycje' BEGIN 
DELETE FROM WA_Hurtownia.zef2DW.KZD_Pozycje WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.KZD_Pozycje) 
MERGE INTO zef2DW.KZD_Pozycje AS tgt
USING WA_StageHurtownia.zef2DW.KZD_Pozycje AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.RodzajNaleznosci=src.RodzajNaleznosci, tgt.PozycjeKwota=src.PozycjeKwota, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, RodzajNaleznosci, PozycjeKwota, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.RodzajNaleznosci, src.PozycjeKwota, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 

 --OKAR_Wplaty            
IF @TableName = 'OKAR_Wplaty' BEGIN 
DELETE FROM WA_Hurtownia.zef2DW.OKAR_Wplaty WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.OKAR_Wplaty) 
MERGE INTO zef2DW.OKAR_Wplaty AS tgt
USING WA_StageHurtownia.zef2DW.OKAR_Wplaty AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.KwotaWplaty=src.KwotaWplaty, tgt.NumerDokWplaty=src.NumerDokWplaty, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, KwotaWplaty, NumerDokWplaty, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.KwotaWplaty, src.NumerDokWplaty, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 

--POPC_Wplaty            
IF @TableName = 'POPC_Wplaty' BEGIN 
DELETE FROM WA_Hurtownia.zef2DW.POPC_Wplaty WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.POPC_Wplaty) 
MERGE INTO zef2DW.POPC_Wplaty AS tgt
USING WA_StageHurtownia.zef2DW.POPC_Wplaty AS src
ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
WHEN MATCHED AND src.operacja IN ('U','I')
THEN UPDATE SET
tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.KwotaWplaty=src.KwotaWplaty, tgt.NumerDokWplaty=src.NumerDokWplaty, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
WHEN MATCHED AND src.operacja ='D' THEN DELETE
WHEN NOT MATCHED AND src.operacja IN ('U','I')
THEN INSERT (IdentyfikatorDokumentu, KwotaWplaty, NumerDokWplaty, DataArch, ID_Pismo_xml)
VALUES (src.IdentyfikatorDokumentu, src.KwotaWplaty, src.NumerDokWplaty, src.DataArch, src.ID_Pismo_xml);
SET @Merged = 1;
 END 


--KontrahentSolidarny            
IF @TableName = 'KontrahentSolidarny' BEGIN 
DELETE FROM WA_Hurtownia.zef2DW.KontrahentSolidarny WHERE IdentyfikatorDokumentu IN (SELECT IdentyfikatorDokumentu FROM WA_StageHurtownia.zef2DW.KontrahentSolidarny) 
	MERGE INTO zef2DW.KontrahentSolidarny AS tgt
	USING WA_StageHurtownia.zef2DW.KontrahentSolidarny AS src
	ON (tgt.ID_Pismo_xml=src.ID_Pismo_xml)
	WHEN MATCHED AND src.operacja IN ('U','I')
	THEN UPDATE SET
	tgt.IdentyfikatorDokumentu=src.IdentyfikatorDokumentu, tgt.SolidarnyNazwaKontrahenta=src.SolidarnyNazwaKontrahenta, tgt.SolidarnyDataPowiadomienia=src.SolidarnyDataPowiadomienia, tgt.SolidarnyTerminPlatnosci=src.SolidarnyTerminPlatnosci, tgt.SolidarnyNazwaPelna=src.SolidarnyNazwaPelna, tgt.SolidarnyNIP=src.SolidarnyNIP, tgt.SolidarnyREGON=src.SolidarnyREGON, tgt.SolidarnyRodzajKontrahenta=src.SolidarnyRodzajKontrahenta, tgt.SolidarnyNazwisko=src.SolidarnyNazwisko, tgt.SolidarnyImie=src.SolidarnyImie, tgt.SolidarnyDataUrodzenia=src.SolidarnyDataUrodzenia, tgt.SolidarnyPesel=src.SolidarnyPesel, tgt.SolidarnyKraj=src.SolidarnyKraj, tgt.SolidarnyWojewodztwo=src.SolidarnyWojewodztwo, tgt.SolidarnyPowiat=src.SolidarnyPowiat, tgt.SolidarnyGmina=src.SolidarnyGmina, tgt.SolidarnyUlica=src.SolidarnyUlica, tgt.SolidarnyNrDomu=src.SolidarnyNrDomu, tgt.SolidarnyNrLokalu=src.SolidarnyNrLokalu, tgt.SolidarnyMiejscowosc=src.SolidarnyMiejscowosc, tgt.SolidarnyKodPocztowy=src.SolidarnyKodPocztowy, tgt.SolidarnyPoczta=src.SolidarnyPoczta, tgt.SolidarnyNrDokumentu=src.SolidarnyNrDokumentu, tgt.SolidarnyEORI=src.SolidarnyEORI, tgt.SolidarnyNumerVATUE=src.SolidarnyNumerVATUE, tgt.SolidarnyNumerPodatnika=src.SolidarnyNumerPodatnika, tgt.SolidarnySystem=src.SolidarnySystem, tgt.DataArch=src.DataArch, tgt.ID_Pismo_xml=src.ID_Pismo_xml
	WHEN MATCHED AND src.operacja ='D' THEN DELETE
	WHEN NOT MATCHED AND src.operacja IN ('U','I')
	THEN INSERT (IdentyfikatorDokumentu, SolidarnyNazwaKontrahenta, SolidarnyDataPowiadomienia, SolidarnyTerminPlatnosci, SolidarnyNazwaPelna, SolidarnyNIP, SolidarnyREGON, SolidarnyRodzajKontrahenta, SolidarnyNazwisko, SolidarnyImie, SolidarnyDataUrodzenia, SolidarnyPesel, SolidarnyKraj, SolidarnyWojewodztwo, SolidarnyPowiat, SolidarnyGmina, SolidarnyUlica, SolidarnyNrDomu, SolidarnyNrLokalu, SolidarnyMiejscowosc, SolidarnyKodPocztowy, SolidarnyPoczta, SolidarnyNrDokumentu, SolidarnyEORI, SolidarnyNumerVATUE, SolidarnyNumerPodatnika, SolidarnySystem, DataArch, ID_Pismo_xml)
	VALUES (src.IdentyfikatorDokumentu, src.SolidarnyNazwaKontrahenta, src.SolidarnyDataPowiadomienia, src.SolidarnyTerminPlatnosci, src.SolidarnyNazwaPelna, src.SolidarnyNIP, src.SolidarnyREGON, src.SolidarnyRodzajKontrahenta, src.SolidarnyNazwisko, src.SolidarnyImie, src.SolidarnyDataUrodzenia, src.SolidarnyPesel, src.SolidarnyKraj, src.SolidarnyWojewodztwo, src.SolidarnyPowiat, src.SolidarnyGmina, src.SolidarnyUlica, src.SolidarnyNrDomu, src.SolidarnyNrLokalu, src.SolidarnyMiejscowosc, src.SolidarnyKodPocztowy, src.SolidarnyPoczta, src.SolidarnyNrDokumentu, src.SolidarnyEORI, src.SolidarnyNumerVATUE, src.SolidarnyNumerPodatnika, src.SolidarnySystem, src.DataArch, src.ID_Pismo_xml);






IF (@Merged = 0)
	BEGIN
			DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
			THROW 51002, @Info, 0;
				END
			END;