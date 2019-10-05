

-- =============================================
-- Author:	
-- Create date: 2014-08-07
-- Description:	Procedura czyści wszystkie tabele zc przygotowując je do zasilenia (przyrostowego) z systemu WI_ODS
-- =============================================
CREATE PROCEDURE [zc].[TruncateAllStageZC_Celina]
AS
BEGIN

	SET NOCOUNT ON;

		TRUNCATE TABLE [zc].[DT_Podmiot];
		TRUNCATE TABLE [zc].[DT_Dokument];
		TRUNCATE TABLE [zc].[DT_Dyrektywa];
		TRUNCATE TABLE [zc].[DT_Historia];
		TRUNCATE TABLE [zc].[DT_SrodekPrzewozowy];
		TRUNCATE TABLE [zc].[DT_Kontener];
		TRUNCATE TABLE [zc].[DT_Powiazanie];
		TRUNCATE TABLE [zc].[DT_Towar];
		TRUNCATE TABLE [zc].[DT_ZamkniecieCelne];

		TRUNCATE TABLE [zc].[INNY_Dokument];
		TRUNCATE TABLE [zc].[INNY_Towar];
		TRUNCATE TABLE [zc].[INNY_Powiazanie];
		TRUNCATE TABLE [zc].[INNY_Dyrektywa];
		TRUNCATE TABLE [zc].[INNY_Historia];

		TRUNCATE TABLE [zc].[PSP_Dokument];
		TRUNCATE TABLE [zc].[PSP_Dyrektywa];
		TRUNCATE TABLE [zc].[PSP_Historia];
		TRUNCATE TABLE [zc].[PSP_Podmiot];
		TRUNCATE TABLE [zc].[PSP_Powiazanie];
		TRUNCATE TABLE [zc].[PSP_SrodekPrzewozowy];

		TRUNCATE TABLE [zc].[PW_Dokument];
		TRUNCATE TABLE [zc].[PW_SrodekPrzewozowy];
		TRUNCATE TABLE [zc].[PW_Kontener];
		TRUNCATE TABLE [zc].[PW_Powiazanie];
		TRUNCATE TABLE [zc].[PW_Historia];

		TRUNCATE TABLE [zc].[SADG_Dokument];
		TRUNCATE TABLE [zc].[SADG_Dyrektywa];
		TRUNCATE TABLE [zc].[SADG_Historia];
		TRUNCATE TABLE [zc].[SADG_SrodekPrzewozowy];
		TRUNCATE TABLE [zc].[SADG_Kontener];
		TRUNCATE TABLE [zc].[SADG_Powiazanie];
		TRUNCATE TABLE [zc].[SADG_Towar];

		TRUNCATE TABLE [zc].[ST_Dokument];
		TRUNCATE TABLE [zc].[ST_DanePrzywozuWywozu];
		TRUNCATE TABLE [zc].[ST_Dyrektywa];
		TRUNCATE TABLE [zc].[ST_Historia];
		TRUNCATE TABLE [zc].[ST_Podmiot];
		TRUNCATE TABLE [zc].[ST_Powiazanie];

		TRUNCATE TABLE [zc].[DPDZ_Skladajacy];
		TRUNCATE TABLE [zc].[DPDZ_Kontrahent];
		TRUNCATE TABLE [zc].[DPDZ_Dokument];
		TRUNCATE TABLE [zc].[DPDZ_Towar];
		TRUNCATE TABLE [zc].[DPDZ_DokumentWymagany];
		TRUNCATE TABLE [zc].[DPDZ_Dyrektywa];
		TRUNCATE TABLE [zc].[DPDZ_Historia];
		TRUNCATE TABLE [zc].[DPDZ_IloscTowaru];
		TRUNCATE TABLE [zc].[DPDZ_InformacjaDodatkowa];
		TRUNCATE TABLE [zc].[DPDZ_KodDodatkowyPL];
		TRUNCATE TABLE [zc].[DPDZ_KodDodatkowyUE];
		TRUNCATE TABLE [zc].[DPDZ_OplataDoPozycji];
		TRUNCATE TABLE [zc].[DPDZ_Powiazanie];
		TRUNCATE TABLE [zc].[DPDZ_Srodek];

		TRUNCATE TABLE [zc].[DS_Kontrahent];
		TRUNCATE TABLE [zc].[DS_Skladajacy];
		TRUNCATE TABLE [zc].[DS_Dokument];
		TRUNCATE TABLE [zc].[DS_DokumentPoprzedni];
		TRUNCATE TABLE [zc].[DS_Dyrektywa];
		TRUNCATE TABLE [zc].[DS_Historia];
		TRUNCATE TABLE [zc].[DS_Kontener];
		TRUNCATE TABLE [zc].[DS_KontenerZamkniecie];
		TRUNCATE TABLE [zc].[DS_Powiazanie];
		TRUNCATE TABLE [zc].[DS_SrodekPrzewozowy];
		TRUNCATE TABLE [zc].[DS_Towar];
		TRUNCATE TABLE [zc].[DS_TransportZamkniecie];

		TRUNCATE TABLE [zc].[PWD_Skladajacy];
		TRUNCATE TABLE [zc].[PWD_Kontrahent];
		TRUNCATE TABLE [zc].[PWD_Dokument];
		TRUNCATE TABLE [zc].[PWD_DokumentPoprzedni];
		TRUNCATE TABLE [zc].[PWD_DokumentWymagany];
		TRUNCATE TABLE [zc].[PWD_Dyrektywa];
		TRUNCATE TABLE [zc].[PWD_Historia];
		TRUNCATE TABLE [zc].[PWD_Towar];
		TRUNCATE TABLE [zc].[PWD_Kontener];
		TRUNCATE TABLE [zc].[PWD_Powiazanie];
		TRUNCATE TABLE [zc].[PWD_Transport];
		TRUNCATE TABLE [zc].[PWD_TransportZamkniecie];
		TRUNCATE TABLE [zc].[PWD_InformacjaDodatkowa];

		TRUNCATE TABLE [zc].[SAD_Skladajacy];
		TRUNCATE TABLE [zc].[SAD_Kontrahent];
		TRUNCATE TABLE [zc].[SAD_Dokument];
		TRUNCATE TABLE [zc].[SAD_Towar];
		TRUNCATE TABLE [zc].[SAD_DokumentPoprzedni];
		TRUNCATE TABLE [zc].[SAD_DokumentWymagany];
		TRUNCATE TABLE [zc].[SAD_Dyrektywa];
		TRUNCATE TABLE [zc].[SAD_Historia];
		TRUNCATE TABLE [zc].[SAD_IloscTowaru];
		TRUNCATE TABLE [zc].[SAD_InformacjaDodatkowa];
		TRUNCATE TABLE [zc].[SAD_KodDodatkowyPL];
		TRUNCATE TABLE [zc].[SAD_KodDodatkowyUE];
		TRUNCATE TABLE [zc].[SAD_Kontener];
		TRUNCATE TABLE [zc].[SAD_Kontyngent];
		TRUNCATE TABLE [zc].[SAD_Korekta];
		TRUNCATE TABLE [zc].[SAD_Nadawca];
		TRUNCATE TABLE [zc].[SAD_Odbiorca];
		TRUNCATE TABLE [zc].[SAD_Opakowanie];
		TRUNCATE TABLE [zc].[SAD_Oplata];
		TRUNCATE TABLE [zc].[SAD_Podklasyfikacja];
		TRUNCATE TABLE [zc].[SAD_Powiazanie];
		TRUNCATE TABLE [zc].[SAD_SrodekPrzewozowy];
		TRUNCATE TABLE [zc].[SAD_SzczegolyWartosci];
		TRUNCATE TABLE [zc].[SAD_Transport];
		TRUNCATE TABLE [zc].[SAD_UrzadKontrolny];
		TRUNCATE TABLE [zc].[SAD_Zamkniecie];

END