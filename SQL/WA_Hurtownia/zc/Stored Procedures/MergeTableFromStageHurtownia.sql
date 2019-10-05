-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-08-06
-- Description:	Merge z WA_StageHurtownia do WA_Hurtownia.
-- =============================================

CREATE PROCEDURE [zc].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END
	
	IF @TableName = 'DWA_Dokument' BEGIN
		MERGE INTO zc.DWA_Dokument AS tgt
		USING [WA_StageHurtownia].zc.DWA_Dokument AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Status=src.Status, tgt.NrWlasny=src.NrWlasny, tgt.MRN=src.MRN, tgt.CRN=src.CRN, tgt.UrzadZlozenia=src.UrzadZlozenia, tgt.UrzadWyprowadzenia=src.UrzadWyprowadzenia, tgt.UrzadWyprowadzeniaZm=src.UrzadWyprowadzeniaZm, tgt.SpecyficzneOkolicznosci=src.SpecyficzneOkolicznosci, tgt.LiczbaPozycji=src.LiczbaPozycji, tgt.LiczbaPozycjiNaGranicy=src.LiczbaPozycjiNaGranicy, tgt.LiczbaPozycjiNaGranicyKom=src.LiczbaPozycjiNaGranicyKom, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.LiczbaOpakowanNaGranicy=src.LiczbaOpakowanNaGranicy, tgt.LiczbaOpakowanNaGranicyKom=src.LiczbaOpakowanNaGranicyKom, tgt.MasaBrutto=src.MasaBrutto, tgt.MasaBruttoNaGranicy=src.MasaBruttoNaGranicy, tgt.MasaBruttoNaGranicyKom=src.MasaBruttoNaGranicyKom, tgt.KodTypOplatTransp=src.KodTypOplatTransp, tgt.PodpisElektroniczny=src.PodpisElektroniczny, tgt.EmailZwrotny=src.EmailZwrotny, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.DataZgody=src.DataZgody, tgt.Data=src.Data, tgt.Miejsce=src.Miejsce, tgt.Telefon=src.Telefon
		WHEN NOT MATCHED
		THEN INSERT (Id, Status, NrWlasny, MRN, CRN, UrzadZlozenia, UrzadWyprowadzenia, UrzadWyprowadzeniaZm, SpecyficzneOkolicznosci, LiczbaPozycji, LiczbaPozycjiNaGranicy, LiczbaPozycjiNaGranicyKom, LiczbaOpakowan, LiczbaOpakowanNaGranicy, LiczbaOpakowanNaGranicyKom, MasaBrutto, MasaBruttoNaGranicy, MasaBruttoNaGranicyKom, KodTypOplatTransp, PodpisElektroniczny, EmailZwrotny, DataPrzyjecia, DataZgody, Data, Miejsce, Telefon)
		VALUES (src.Id, src.Status, src.NrWlasny, src.MRN, src.CRN, src.UrzadZlozenia, src.UrzadWyprowadzenia, src.UrzadWyprowadzeniaZm, src.SpecyficzneOkolicznosci, src.LiczbaPozycji, src.LiczbaPozycjiNaGranicy, src.LiczbaPozycjiNaGranicyKom, src.LiczbaOpakowan, src.LiczbaOpakowanNaGranicy, src.LiczbaOpakowanNaGranicyKom, src.MasaBrutto, src.MasaBruttoNaGranicy, src.MasaBruttoNaGranicyKom, src.KodTypOplatTransp, src.PodpisElektroniczny, src.EmailZwrotny, src.DataPrzyjecia, src.DataZgody, src.Data, src.Miejsce, src.Telefon);
		SET @Merged = 1;
	END

	IF @TableName = 'DWA_Trasa' BEGIN
		MERGE INTO zc.DWA_Trasa AS tgt
		USING [WA_StageHurtownia].zc.DWA_Trasa AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kraj=src.Kraj, tgt.IdDokDWA=src.IdDokDWA
		WHEN NOT MATCHED
		THEN INSERT (Id, Kraj, IdDokDWA)
		VALUES (src.Id, src.Kraj, src.IdDokDWA);
		SET @Merged = 1;
	END
	
	IF @TableName = 'DWA_Towar' BEGIN
		MERGE INTO zc.DWA_Towar AS tgt
		USING [WA_StageHurtownia].zc.DWA_Towar AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrPozycji=src.NrPozycji, tgt.CRN=src.CRN, tgt.CRNNaGranicy=src.CRNNaGranicy, tgt.TowNiebezp=src.TowNiebezp, tgt.TowNiebezpNaGranicy=src.TowNiebezpNaGranicy, tgt.OpisTowaru=src.OpisTowaru, tgt.OpisTowaruNaGranicy=src.OpisTowaruNaGranicy, tgt.KodTowarowy=src.KodTowarowy, tgt.KodTowarowyNaGranicy=src.KodTowarowyNaGranicy, tgt.MasaBrutto=src.MasaBrutto, tgt.MasaBruttoNaGranicy=src.MasaBruttoNaGranicy, tgt.OplTransp=src.OplTransp, tgt.OplTranspNaGranicy=src.OplTranspNaGranicy, tgt.IdDokDWA=src.IdDokDWA
		WHEN NOT MATCHED
		THEN INSERT (Id, NrPozycji, CRN, CRNNaGranicy, TowNiebezp, TowNiebezpNaGranicy, OpisTowaru, OpisTowaruNaGranicy, KodTowarowy, KodTowarowyNaGranicy, MasaBrutto, MasaBruttoNaGranicy, OplTransp, OplTranspNaGranicy, IdDokDWA)
		VALUES (src.Id, src.NrPozycji, src.CRN, src.CRNNaGranicy, src.TowNiebezp, src.TowNiebezpNaGranicy, src.OpisTowaru, src.OpisTowaruNaGranicy, src.KodTowarowy, src.KodTowarowyNaGranicy, src.MasaBrutto, src.MasaBruttoNaGranicy, src.OplTransp, src.OplTranspNaGranicy, src.IdDokDWA);
		SET @Merged = 1;
	END
	
	IF @TableName = 'DWA_Opakowanie' BEGIN
		MERGE INTO zc.DWA_Opakowanie AS tgt
		USING [WA_StageHurtownia].zc.DWA_Opakowanie AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajOpakowan=src.RodzajOpakowan, tgt.ZnakiOpakowan=src.ZnakiOpakowan, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.LiczbaSztuk=src.LiczbaSztuk, tgt.StanOpakowanNaGranicy=src.StanOpakowanNaGranicy, tgt.IdTowarDWA=src.IdTowarDWA
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzajOpakowan, ZnakiOpakowan, LiczbaOpakowan, LiczbaSztuk, StanOpakowanNaGranicy, IdTowarDWA)
		VALUES (src.Id, src.RodzajOpakowan, src.ZnakiOpakowan, src.LiczbaOpakowan, src.LiczbaSztuk, src.StanOpakowanNaGranicy, src.IdTowarDWA);
		SET @Merged = 1;
	END
	
	IF @TableName = 'DWA_Kontener' BEGIN
		MERGE INTO zc.DWA_Kontener AS tgt
		USING [WA_StageHurtownia].zc.DWA_Kontener AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrKontenera=src.NrKontenera, tgt.StanKontenera=src.StanKontenera, tgt.IdTowarDWA=src.IdTowarDWA
		WHEN NOT MATCHED
		THEN INSERT (Id, NrKontenera, StanKontenera, IdTowarDWA)
		VALUES (src.Id, src.NrKontenera, src.StanKontenera, src.IdTowarDWA);
		SET @Merged = 1;
	END
	
	IF @TableName = 'DWA_ZamkniecieCelne' BEGIN
		MERGE INTO zc.DWA_ZamkniecieCelne AS tgt
		USING [WA_StageHurtownia].zc.DWA_ZamkniecieCelne AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrZamkniecia=src.NrZamkniecia, tgt.IdDokDWA=src.IdDokDWA
		WHEN NOT MATCHED
		THEN INSERT (Id, NrZamkniecia, IdDokDWA)
		VALUES (src.Id, src.NrZamkniecia, src.IdDokDWA);
		SET @Merged = 1;
	END
	
	IF @TableName = 'DWA_DokumentWymagany' BEGIN
		MERGE INTO zc.DWA_DokumentWymagany AS tgt
		USING [WA_StageHurtownia].zc.DWA_DokumentWymagany AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodDokZrodl=src.KodDokZrodl, tgt.NrDokWym=src.NrDokWym, tgt.StanNaGranicy=src.StanNaGranicy, tgt.StanNaGranicyKom=src.StanNaGranicyKom, tgt.IdTowarDWA=src.IdTowarDWA
		WHEN NOT MATCHED
		THEN INSERT (Id, KodDokZrodl, NrDokWym, StanNaGranicy, StanNaGranicyKom, IdTowarDWA)
		VALUES (src.Id, src.KodDokZrodl, src.NrDokWym, src.StanNaGranicy, src.StanNaGranicyKom, src.IdTowarDWA);
		SET @Merged = 1;
	END
	
	IF @TableName = 'DWA_TowarPodmiot' BEGIN
		MERGE INTO zc.DWA_TowarPodmiot AS tgt
		USING [WA_StageHurtownia].zc.DWA_TowarPodmiot AS src
		ON (tgt.Id=src.Id AND tgt.RodzPodmiotu=src.RodzPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TIN=src.TIN, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.REGON=src.REGON, tgt.EORI=src.EORI, tgt.IdTowarDWA=src.IdTowarDWA
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzPodmiotu, TIN, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, REGON, EORI, IdTowarDWA)
		VALUES (src.Id, src.RodzPodmiotu, src.TIN, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.REGON, src.EORI, src.IdTowarDWA);
		SET @Merged = 1;	
	END
	
	IF @TableName = 'DWA_Podmiot' BEGIN
		MERGE INTO zc.DWA_Podmiot AS tgt
		USING [WA_StageHurtownia].zc.DWA_Podmiot AS src
		ON (tgt.Id=src.Id AND tgt.RodzPodmiotu=src.RodzPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TIN=src.TIN, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.REGON=src.REGON, tgt.EORI=src.EORI, tgt.IdDokDWA=src.IdDokDWA
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzPodmiotu, TIN, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, REGON, EORI, IdDokDWA)
		VALUES (src.Id, src.RodzPodmiotu, src.TIN, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.REGON, src.EORI, src.IdDokDWA);
		SET @Merged = 1;				
	END
	
	IF @TableName = 'DWU_Trasa' BEGIN
		MERGE INTO zc.DWU_Trasa AS tgt
		USING [WA_StageHurtownia].zc.DWU_Trasa AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kraj=src.Kraj, tgt.IdDokDWU=src.IdDokDWU
		WHEN NOT MATCHED
		THEN INSERT (Id, Kraj, IdDokDWU)
		VALUES (src.Id, src.Kraj, src.IdDokDWU);	
		SET @Merged = 1;
	END

	IF @TableName = 'DWU_Towar' BEGIN
		MERGE INTO zc.DWU_Towar AS tgt
		USING [WA_StageHurtownia].zc.DWU_Towar AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrPozycji=src.NrPozycji, tgt.CRN=src.CRN, tgt.TowNiebezp=src.TowNiebezp, tgt.OpisTowaru=src.OpisTowaru, tgt.KodTowarowy=src.KodTowarowy, tgt.MasaBrutto=src.MasaBrutto, tgt.OplatyTransportowe=src.OplatyTransportowe, tgt.IdDokDWU=src.IdDokDWU
		WHEN NOT MATCHED
		THEN INSERT (Id, NrPozycji, CRN, TowNiebezp, OpisTowaru, KodTowarowy, MasaBrutto, OplatyTransportowe, IdDokDWU)
		VALUES (src.Id, src.NrPozycji, src.CRN, src.TowNiebezp, src.OpisTowaru, src.KodTowarowy, src.MasaBrutto, src.OplatyTransportowe, src.IdDokDWU);
		SET @Merged = 1;
	END
	
	IF @TableName = 'DWU_Kontener' BEGIN
		MERGE INTO zc.DWU_Kontener AS tgt
		USING [WA_StageHurtownia].zc.DWU_Kontener AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrKontenera=src.NrKontenera, tgt.IdTowarDWU=src.IdTowarDWU
		WHEN NOT MATCHED
		THEN INSERT (Id, NrKontenera, IdTowarDWU)
		VALUES (src.Id, src.NrKontenera, src.IdTowarDWU);
		SET @Merged = 1;	
	END
	
	IF @TableName = 'DWU_DokumentWymagany' BEGIN
		MERGE INTO zc.DWU_DokumentWymagany AS tgt
		USING [WA_StageHurtownia].zc.DWU_DokumentWymagany AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodDokWym=src.KodDokWym, tgt.NrDokWym=src.NrDokWym, tgt.IdTowarDWU=src.IdTowarDWU
		WHEN NOT MATCHED
		THEN INSERT (Id, KodDokWym, NrDokWym, IdTowarDWU)
		VALUES (src.Id, src.KodDokWym, src.NrDokWym, src.IdTowarDWU);	
		SET @Merged = 1;
	END
	
	IF @TableName = 'DWU_ZamkniecieCelne' BEGIN
		MERGE INTO zc.DWU_ZamkniecieCelne AS tgt
		USING [WA_StageHurtownia].zc.DWU_ZamkniecieCelne AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrZamkniecia=src.NrZamkniecia, tgt.IdDokDWU=src.IdDokDWU
		WHEN NOT MATCHED
		THEN INSERT (Id, NrZamkniecia, IdDokDWU)
		VALUES (src.Id, src.NrZamkniecia, src.IdDokDWU);
		SET @Merged = 1;
	END
	
	IF @TableName = 'DWU_Opakowanie' BEGIN
		MERGE INTO zc.DWU_Opakowanie AS tgt
		USING [WA_StageHurtownia].zc.DWU_Opakowanie AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.LiczbaSztuk=src.LiczbaSztuk, tgt.RodzajOpakowan=src.RodzajOpakowan, tgt.ZnakiOpakowan=src.ZnakiOpakowan, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.IdTowarDWU=src.IdTowarDWU
		WHEN NOT MATCHED
		THEN INSERT (Id, LiczbaSztuk, RodzajOpakowan, ZnakiOpakowan, LiczbaOpakowan, IdTowarDWU)
		VALUES (src.Id, src.LiczbaSztuk, src.RodzajOpakowan, src.ZnakiOpakowan, src.LiczbaOpakowan, src.IdTowarDWU);
		SET @Merged = 1;
	END
	
	IF @TableName = 'DWU_WynikAnalizyRyzyka' BEGIN
		MERGE INTO zc.DWU_WynikAnalizyRyzyka AS tgt
		USING [WA_StageHurtownia].zc.DWU_WynikAnalizyRyzyka AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrPozycji=src.NrPozycji, tgt.KodAnalizyRyzyka=src.KodAnalizyRyzyka, tgt.OpisKoduAnalizyRyzyka=src.OpisKoduAnalizyRyzyka, tgt.IdDokDWU=src.IdDokDWU
		WHEN NOT MATCHED
		THEN INSERT (Id, NrPozycji, KodAnalizyRyzyka, OpisKoduAnalizyRyzyka, IdDokDWU)
		VALUES (src.Id, src.NrPozycji, src.KodAnalizyRyzyka, src.OpisKoduAnalizyRyzyka, src.IdDokDWU);
		SET @Merged = 1;
	END
	
	IF @TableName = 'DWU_TowarPodmiot' BEGIN
		MERGE INTO zc.DWU_TowarPodmiot AS tgt
		USING [WA_StageHurtownia].zc.DWU_TowarPodmiot AS src
		ON (tgt.Id=src.Id AND tgt.RodzPodmiotu=src.RodzPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TIN=src.TIN, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.REGON=src.REGON, tgt.EORI=src.EORI, tgt.IdTowarDWU=src.IdTowarDWU
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzPodmiotu, TIN, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, REGON, EORI, IdTowarDWU)
		VALUES (src.Id, src.RodzPodmiotu, src.TIN, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.REGON, src.EORI, src.IdTowarDWU);		
		SET @Merged = 1;
	END
	
	IF @TableName = 'DWU_Dokument' BEGIN
		MERGE INTO zc.DWU_Dokument AS tgt
		USING [WA_StageHurtownia].zc.DWU_Dokument AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Status=src.Status, tgt.NrWlasny=src.NrWlasny, tgt.MRN=src.MRN, tgt.CRN=src.CRN, tgt.UCZlozenia=src.UCZlozenia, tgt.UCWyprowadzenia=src.UCWyprowadzenia, tgt.SpecyficzneOkolicznosci=src.SpecyficzneOkolicznosci, tgt.LiczbaPozycji=src.LiczbaPozycji, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.MasaBrutto=src.MasaBrutto, tgt.KodTypOplatTransp=src.KodTypOplatTransp, tgt.PodpisElektroniczny=src.PodpisElektroniczny, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.DataZgody=src.DataZgody, tgt.Data=src.Data, tgt.Miejsce=src.Miejsce
		WHEN NOT MATCHED
		THEN INSERT (Id, Status, NrWlasny, MRN, CRN, UCZlozenia, UCWyprowadzenia, SpecyficzneOkolicznosci, LiczbaPozycji, LiczbaOpakowan, MasaBrutto, KodTypOplatTransp, PodpisElektroniczny, DataPrzyjecia, DataZgody, Data, Miejsce)
		VALUES (src.Id, src.Status, src.NrWlasny, src.MRN, src.CRN, src.UCZlozenia, src.UCWyprowadzenia, src.SpecyficzneOkolicznosci, src.LiczbaPozycji, src.LiczbaOpakowan, src.MasaBrutto, src.KodTypOplatTransp, src.PodpisElektroniczny, src.DataPrzyjecia, src.DataZgody, src.Data, src.Miejsce);	
		SET @Merged = 1;
	END
	
	IF @TableName = 'MEX_Dokument' BEGIN
		MERGE INTO zc.MEX_Dokument AS tgt
		USING [WA_StageHurtownia].zc.MEX_Dokument AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Status=src.Status, tgt.NrWlasny=src.NrWlasny, tgt.MRX=src.MRX, tgt.UCWyprowadzenia=src.UCWyprowadzenia, tgt.LiczbaPozycji=src.LiczbaPozycji, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.MasaBrutto=src.MasaBrutto, tgt.KodWynikuKontroli=src.KodWynikuKontroli, tgt.Miejsce=src.Miejsce, tgt.DataPrzedstawienia=src.DataPrzedstawienia, tgt.Data=src.Data, tgt.DataPrzyjeciaNaEwid=src.DataPrzyjeciaNaEwid
		WHEN NOT MATCHED
		THEN INSERT (Id, Status, NrWlasny, MRX, UCWyprowadzenia, LiczbaPozycji, LiczbaOpakowan, MasaBrutto, KodWynikuKontroli, Miejsce, DataPrzedstawienia, Data, DataPrzyjeciaNaEwid)
		VALUES (src.Id, src.Status, src.NrWlasny, src.MRX, src.UCWyprowadzenia, src.LiczbaPozycji, src.LiczbaOpakowan, src.MasaBrutto, src.KodWynikuKontroli, src.Miejsce, src.DataPrzedstawienia, src.Data, src.DataPrzyjeciaNaEwid);	
		SET @Merged = 1;
	END
	
	IF @TableName = 'MEX_Przewoznik' BEGIN
		MERGE INTO zc.MEX_Przewoznik AS tgt
		USING [WA_StageHurtownia].zc.MEX_Przewoznik AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TIN=src.TIN, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.IdDokMEX=src.IdDokMEX
		WHEN NOT MATCHED
		THEN INSERT (Id, TIN, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, IdDokMEX)
		VALUES (src.Id, src.TIN, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.IdDokMEX);
		SET @Merged = 1;		
	END
	
	IF @TableName = 'MEX_DaneCelne' BEGIN
		MERGE INTO zc.MEX_DaneCelne AS tgt
		USING [WA_StageHurtownia].zc.MEX_DaneCelne AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.MRN=src.MRN, tgt.WywozCzesciowy=src.WywozCzesciowy, tgt.NrPozycji=src.NrPozycji, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.LiczbaSztuk=src.LiczbaSztuk, tgt.MasaBrutto=src.MasaBrutto, tgt.IdTowarMEX=src.IdTowarMEX
		WHEN NOT MATCHED
		THEN INSERT (Id, MRN, WywozCzesciowy, NrPozycji, LiczbaOpakowan, LiczbaSztuk, MasaBrutto, IdTowarMEX)
		VALUES (src.Id, src.MRN, src.WywozCzesciowy, src.NrPozycji, src.LiczbaOpakowan, src.LiczbaSztuk, src.MasaBrutto, src.IdTowarMEX);	
		SET @Merged = 1;
	END
	
	IF @TableName = 'MEX_Towar' BEGIN
		MERGE INTO zc.MEX_Towar AS tgt
		USING [WA_StageHurtownia].zc.MEX_Towar AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrPozycji=src.NrPozycji, tgt.NrDokPrzewozowego=src.NrDokPrzewozowego, tgt.KodTowarowy=src.KodTowarowy, tgt.MasaBrutto=src.MasaBrutto, tgt.OpisTowaru=src.OpisTowaru, tgt.OpakowanieRodzaj=src.OpakowanieRodzaj, tgt.OpakowanieZnaki=src.OpakowanieZnaki, tgt.OpakowanieLiczba=src.OpakowanieLiczba, tgt.OpakowanieLiczbaSztuk=src.OpakowanieLiczbaSztuk, tgt.IdDokMEX=src.IdDokMEX
		WHEN NOT MATCHED
		THEN INSERT (Id, NrPozycji, NrDokPrzewozowego, KodTowarowy, MasaBrutto, OpisTowaru, OpakowanieRodzaj, OpakowanieZnaki, OpakowanieLiczba, OpakowanieLiczbaSztuk, IdDokMEX)
		VALUES (src.Id, src.NrPozycji, src.NrDokPrzewozowego, src.KodTowarowy, src.MasaBrutto, src.OpisTowaru, src.OpakowanieRodzaj, src.OpakowanieZnaki, src.OpakowanieLiczba, src.OpakowanieLiczbaSztuk, src.IdDokMEX);	
		SET @Merged = 1;
	END
		
	IF @TableName = 'PDS_Podmiot' BEGIN
		MERGE INTO zc.PDS_Podmiot AS tgt
		USING [WA_StageHurtownia].zc.PDS_Podmiot AS src
		ON (tgt.Id=src.Id AND tgt.RodzajPodmiotu=src.RodzajPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TIN=src.TIN, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.IdDokPDS=src.IdDokPDS
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzajPodmiotu, TIN, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, IdDokPDS)
		VALUES (src.Id, src.RodzajPodmiotu, src.TIN, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.IdDokPDS);	
		SET @Merged = 1;
	END
	
	IF @TableName = 'PDS_Zamkniecie' BEGIN
		MERGE INTO zc.PDS_Zamkniecie AS tgt
		USING [WA_StageHurtownia].zc.PDS_Zamkniecie AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NumerZnaki=src.NumerZnaki, tgt.IdDokPDS=src.IdDokPDS
		WHEN NOT MATCHED
		THEN INSERT (Id, NumerZnaki, IdDokPDS)
		VALUES (src.Id, src.NumerZnaki, src.IdDokPDS);
		SET @Merged = 1;
	END
	
	IF @TableName = 'PDS_Kontener' BEGIN
		MERGE INTO zc.PDS_Kontener AS tgt
		USING [WA_StageHurtownia].zc.PDS_Kontener AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrKontenera=src.NrKontenera, tgt.StanKontenera=src.StanKontenera, tgt.IdTowarPDS=src.IdTowarPDS
		WHEN NOT MATCHED
		THEN INSERT (Id, NrKontenera, StanKontenera, IdTowarPDS)
		VALUES (src.Id, src.NrKontenera, src.StanKontenera, src.IdTowarPDS);	
		SET @Merged = 1;
	END
	
	IF @TableName = 'PDS_Trasa' BEGIN
		MERGE INTO zc.PDS_Trasa AS tgt
		USING [WA_StageHurtownia].zc.PDS_Trasa AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kraj=src.Kraj, tgt.IdDokPDS=src.IdDokPDS
		WHEN NOT MATCHED
		THEN INSERT (Id, Kraj, IdDokPDS)
		VALUES (src.Id, src.Kraj, src.IdDokPDS);	
		SET @Merged = 1;
	END
	
	IF @TableName = 'PDS_KolejnyUrzadWprowadzenia' BEGIN
		MERGE INTO zc.PDS_KolejnyUrzadWprowadzenia AS tgt
		USING [WA_StageHurtownia].zc.PDS_KolejnyUrzadWprowadzenia AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.UCWprowadzenia=src.UCWprowadzenia, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.IdDokPDS=src.IdDokPDS
		WHEN NOT MATCHED
		THEN INSERT (Id, UCWprowadzenia, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, IdDokPDS)
		VALUES (src.Id, src.UCWprowadzenia, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.IdDokPDS);	
		SET @Merged = 1;
	END
	
	IF @TableName = 'PDS_TowarPodmiot' BEGIN
		MERGE INTO zc.PDS_TowarPodmiot AS tgt
		USING [WA_StageHurtownia].zc.PDS_TowarPodmiot AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajPodmiotu=src.RodzajPodmiotu, tgt.TIN=src.TIN, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.IdTowarPDS=src.IdTowarPDS
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzajPodmiotu, TIN, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, IdTowarPDS)
		VALUES (src.Id, src.RodzajPodmiotu, src.TIN, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.IdTowarPDS);	
		SET @Merged = 1;
	END
	
	IF @TableName = 'PDS_TransportNaGranicy' BEGIN
		MERGE INTO zc.PDS_TransportNaGranicy AS tgt
		USING [WA_StageHurtownia].zc.PDS_TransportNaGranicy AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajTransportuNaGranicy=src.RodzajTransportuNaGranicy, tgt.ZnakiTranspNaGranicy=src.ZnakiTranspNaGranicy, tgt.Kraj=src.Kraj, tgt.StanTransportuNaGranicy=src.StanTransportuNaGranicy, tgt.KrajUCWprow=src.KrajUCWprow, tgt.Komentarz=src.Komentarz, tgt.IdTowarPDS=src.IdTowarPDS
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzajTransportuNaGranicy, ZnakiTranspNaGranicy, Kraj, StanTransportuNaGranicy, KrajUCWprow, Komentarz, IdTowarPDS)
		VALUES (src.Id, src.RodzajTransportuNaGranicy, src.ZnakiTranspNaGranicy, src.Kraj, src.StanTransportuNaGranicy, src.KrajUCWprow, src.Komentarz, src.IdTowarPDS);	
		SET @Merged = 1;
	END
	
	IF @TableName = 'PDS_Opakowanie' BEGIN
		MERGE INTO zc.PDS_Opakowanie AS tgt
		USING [WA_StageHurtownia].zc.PDS_Opakowanie AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajOpakowanPid=src.RodzajOpakowanPid, tgt.RodzajNaGranicyPid=src.RodzajNaGranicyPid, tgt.ZnakiOpakowan=src.ZnakiOpakowan, tgt.ZnakiNaGranicy=src.ZnakiNaGranicy, tgt.LiczbaSztuk=src.LiczbaSztuk, tgt.LiczbaSztukNaGranicy=src.LiczbaSztukNaGranicy, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.LiczbaOpakowanNaGranicy=src.LiczbaOpakowanNaGranicy, tgt.StanOpakowanNaGranicy=src.StanOpakowanNaGranicy, tgt.IdTowarPDS=src.IdTowarPDS
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzajOpakowanPid, RodzajNaGranicyPid, ZnakiOpakowan, ZnakiNaGranicy, LiczbaSztuk, LiczbaSztukNaGranicy, LiczbaOpakowan, LiczbaOpakowanNaGranicy, StanOpakowanNaGranicy, IdTowarPDS)
		VALUES (src.Id, src.RodzajOpakowanPid, src.RodzajNaGranicyPid, src.ZnakiOpakowan, src.ZnakiNaGranicy, src.LiczbaSztuk, src.LiczbaSztukNaGranicy, src.LiczbaOpakowan, src.LiczbaOpakowanNaGranicy, src.StanOpakowanNaGranicy, src.IdTowarPDS);
		SET @Merged = 1;
	END
	
	IF @TableName = 'PDS_DokumentWymagany' BEGIN
		MERGE INTO zc.PDS_DokumentWymagany AS tgt
		USING [WA_StageHurtownia].zc.PDS_DokumentWymagany AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodDokWym=src.KodDokWym, tgt.NrDokWym=src.NrDokWym, tgt.IdTowarPDS=src.IdTowarPDS
		WHEN NOT MATCHED
		THEN INSERT (Id, KodDokWym, NrDokWym, IdTowarPDS)
		VALUES (src.Id, src.KodDokWym, src.NrDokWym, src.IdTowarPDS);
		SET @Merged = 1;
	END
	
	IF @TableName = 'PDS_InformacjaDodatkowa' BEGIN
		MERGE INTO zc.PDS_InformacjaDodatkowa AS tgt
		USING [WA_StageHurtownia].zc.PDS_InformacjaDodatkowa AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodInfDodatkowej=src.KodInfDodatkowej, tgt.IdTowarPDS=src.IdTowarPDS
		WHEN NOT MATCHED
		THEN INSERT (Id, KodInfDodatkowej, IdTowarPDS)
		VALUES (src.Id, src.KodInfDodatkowej, src.IdTowarPDS);
		SET @Merged = 1;
	END
	
	IF @TableName = 'PDS_Towar' BEGIN
		MERGE INTO zc.PDS_Towar AS tgt
		USING [WA_StageHurtownia].zc.PDS_Towar AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrPozycji=src.NrPozycji, tgt.CRN=src.CRN, tgt.CRNUCWprow=src.CRNUCWprow, tgt.OpisTowaru=src.OpisTowaru, tgt.OpisTowaruUCWprow=src.OpisTowaruUCWprow, tgt.KodTowarowy=src.KodTowarowy, tgt.KodTowarowyUCWprow=src.KodTowarowyUCWprow, tgt.MsceZaladunku=src.MsceZaladunku, tgt.MsceZaladunkuUCWprow=src.MsceZaladunkuUCWprow, tgt.MsceZaladunkuUCWprowKom=src.MsceZaladunkuUCWprowKom, tgt.MsceWyladunku=src.MsceWyladunku, tgt.MsceWyladunkuUCWprow=src.MsceWyladunkuUCWprow, tgt.MsceWyladunkuUCWprowKom=src.MsceWyladunkuUCWprowKom, tgt.UCWprowadzenia=src.UCWprowadzenia, tgt.MasaBrutto=src.MasaBrutto, tgt.MasaBruttoUCWprow=src.MasaBruttoUCWprow, tgt.MasaBruttoSaldowanie=src.MasaBruttoSaldowanie, tgt.KodTowNiebezp=src.KodTowNiebezp, tgt.KodTowNiebezpUCWprow=src.KodTowNiebezpUCWprow, tgt.KodTowNiebezpUCWprowKom=src.KodTowNiebezpUCWprowKom, tgt.OplTransp=src.OplTransp, tgt.OplTranspUCWprow=src.OplTranspUCWprow, tgt.OplTranspUCWprowKom=src.OplTranspUCWprowKom, tgt.IloscOpakowanSaldowanie=src.IloscOpakowanSaldowanie, tgt.StanPozTowUCWprow=src.StanPozTowUCWprow, tgt.StanPozTowUCWprowKom=src.StanPozTowUCWprowKom, tgt.Status=src.Status, tgt.CzyPozBilansowana=src.CzyPozBilansowana, tgt.CzyRoznicaIlosciPozycji=src.CzyRoznicaIlosciPozycji, tgt.Typ=src.Typ, tgt.AnalizaRyzyka=src.AnalizaRyzyka, tgt.Manualna=src.Manualna, tgt.NrReferencyjny=src.NrReferencyjny, tgt.EmailPodmiotu=src.EmailPodmiotu, tgt.IdPlacowki=src.IdPlacowki, tgt.NrWlasny=src.NrWlasny, tgt.PodpisCyfrowy=src.PodpisCyfrowy, tgt.IdDokPDS=src.IdDokPDS, tgt.FlagaOptimisticLock=src.FlagaOptimisticLock
		WHEN NOT MATCHED
		THEN INSERT (Id, NrPozycji, CRN, CRNUCWprow, OpisTowaru, OpisTowaruUCWprow, KodTowarowy, KodTowarowyUCWprow, MsceZaladunku, MsceZaladunkuUCWprow, MsceZaladunkuUCWprowKom, MsceWyladunku, MsceWyladunkuUCWprow, MsceWyladunkuUCWprowKom, UCWprowadzenia, MasaBrutto, MasaBruttoUCWprow, MasaBruttoSaldowanie, KodTowNiebezp, KodTowNiebezpUCWprow, KodTowNiebezpUCWprowKom, OplTransp, OplTranspUCWprow, OplTranspUCWprowKom, IloscOpakowanSaldowanie, StanPozTowUCWprow, StanPozTowUCWprowKom, Status, CzyPozBilansowana, CzyRoznicaIlosciPozycji, Typ, AnalizaRyzyka, Manualna, NrReferencyjny, EmailPodmiotu, IdPlacowki, NrWlasny, PodpisCyfrowy, IdDokPDS, FlagaOptimisticLock)
		VALUES (src.Id, src.NrPozycji, src.CRN, src.CRNUCWprow, src.OpisTowaru, src.OpisTowaruUCWprow, src.KodTowarowy, src.KodTowarowyUCWprow, src.MsceZaladunku, src.MsceZaladunkuUCWprow, src.MsceZaladunkuUCWprowKom, src.MsceWyladunku, src.MsceWyladunkuUCWprow, src.MsceWyladunkuUCWprowKom, src.UCWprowadzenia, src.MasaBrutto, src.MasaBruttoUCWprow, src.MasaBruttoSaldowanie, src.KodTowNiebezp, src.KodTowNiebezpUCWprow, src.KodTowNiebezpUCWprowKom, src.OplTransp, src.OplTranspUCWprow, src.OplTranspUCWprowKom, src.IloscOpakowanSaldowanie, src.StanPozTowUCWprow, src.StanPozTowUCWprowKom, src.Status, src.CzyPozBilansowana, src.CzyRoznicaIlosciPozycji, src.Typ, src.AnalizaRyzyka, src.Manualna, src.NrReferencyjny, src.EmailPodmiotu, src.IdPlacowki, src.NrWlasny, src.PodpisCyfrowy, src.IdDokPDS, src.FlagaOptimisticLock);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'PTW_Podmiot' BEGIN
		MERGE INTO zc.PTW_Podmiot AS tgt
		USING [WA_StageHurtownia].zc.PTW_Podmiot AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TIN=src.TIN, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.RodzajPodmiotu=src.RodzajPodmiotu, tgt.IdDokPTW=src.IdDokPTW
		WHEN NOT MATCHED
		THEN INSERT (Id, TIN, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, RodzajPodmiotu, IdDokPTW)
		VALUES (src.Id, src.TIN, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.RodzajPodmiotu, src.IdDokPTW);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'PTW_Towar' BEGIN
		MERGE INTO zc.PTW_Towar AS tgt
		USING [WA_StageHurtownia].zc.PTW_Towar AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrPozTow=src.NrPozTow, tgt.ZnacznikWprowadzenia=src.ZnacznikWprowadzenia, tgt.DokPrzewozowyKod=src.DokPrzewozowyKod, tgt.DokPrzewozowyNr=src.DokPrzewozowyNr, tgt.IdDokPTW=src.IdDokPTW
		WHEN NOT MATCHED
		THEN INSERT (Id, NrPozTow, ZnacznikWprowadzenia, DokPrzewozowyKod, DokPrzewozowyNr, IdDokPTW)
		VALUES (src.Id, src.NrPozTow, src.ZnacznikWprowadzenia, src.DokPrzewozowyKod, src.DokPrzewozowyNr, src.IdDokPTW);	
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'PTW_DaneCelne' BEGIN
		MERGE INTO zc.PTW_DaneCelne AS tgt
		USING [WA_StageHurtownia].zc.PTW_DaneCelne AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.MRN=src.MRN, tgt.Kraj=src.Kraj, tgt.FlagaModyfikacji=src.FlagaModyfikacji, tgt.FlagaIE303=src.FlagaIE303, tgt.FlagaOdrzucenie=src.FlagaOdrzucenie, tgt.FlagaOdrzuceniePrzyczyna=src.FlagaOdrzuceniePrzyczyna, tgt.ZnacznikWprowadzenia=src.ZnacznikWprowadzenia, tgt.Szczegoly=src.Szczegoly, tgt.IdDokPTW=src.IdDokPTW
		WHEN NOT MATCHED
		THEN INSERT (Id, MRN, Kraj, FlagaModyfikacji, FlagaIE303, FlagaOdrzucenie, FlagaOdrzuceniePrzyczyna, ZnacznikWprowadzenia, Szczegoly, IdDokPTW)
		VALUES (src.Id, src.MRN, src.Kraj, src.FlagaModyfikacji, src.FlagaIE303, src.FlagaOdrzucenie, src.FlagaOdrzuceniePrzyczyna, src.ZnacznikWprowadzenia, src.Szczegoly, src.IdDokPTW);	
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWA_Towar' BEGIN
		MERGE INTO zc.ZWA_Towar AS tgt
		USING [WA_StageHurtownia].zc.ZWA_Towar AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrPozycji=src.NrPozycji, tgt.StanTowaruNaGranicy=src.StanTowaruNaGranicy, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.OpisTowaru=src.OpisTowaru, tgt.OpisTowaruNaGranicy=src.OpisTowaruNaGranicy, tgt.KodTowarowy=src.KodTowarowy, tgt.KodTowarowyNaGranicy=src.KodTowarowyNaGranicy, tgt.MasaBrutto=src.MasaBrutto, tgt.MasaBruttoNaGranicy=src.MasaBruttoNaGranicy, tgt.MasaNetto=src.MasaNetto, tgt.MasaNettoNaGranicy=src.MasaNettoNaGranicy, tgt.KodTypOplTransp=src.KodTypOplTransp, tgt.ProceduraWnioskowana=src.ProceduraWnioskowana, tgt.ProceduraWymagana=src.ProceduraWymagana, tgt.ProceduraKrajowa=src.ProceduraKrajowa, tgt.WalutaWartosciStat=src.WalutaWartosciStat, tgt.WartoscStatystyczna=src.WartoscStatystyczna, tgt.CRN=src.CRN, tgt.TowarNiebezpieczny=src.TowarNiebezpieczny, tgt.KodScalony=src.KodScalony, tgt.KodTARIC=src.KodTARIC, tgt.DodKodTARIC1=src.DodKodTARIC1, tgt.DodKodTARIC2=src.DodKodTARIC2, tgt.KodDod=src.KodDod, tgt.IdDokZWA=src.IdDokZWA
		WHEN NOT MATCHED
		THEN INSERT (Id, NrPozycji, StanTowaruNaGranicy, KrajWysylki, KrajPrzeznaczenia, OpisTowaru, OpisTowaruNaGranicy, KodTowarowy, KodTowarowyNaGranicy, MasaBrutto, MasaBruttoNaGranicy, MasaNetto, MasaNettoNaGranicy, KodTypOplTransp, ProceduraWnioskowana, ProceduraWymagana, ProceduraKrajowa, WalutaWartosciStat, WartoscStatystyczna, CRN, TowarNiebezpieczny, KodScalony, KodTARIC, DodKodTARIC1, DodKodTARIC2, KodDod, IdDokZWA)
		VALUES (src.Id, src.NrPozycji, src.StanTowaruNaGranicy, src.KrajWysylki, src.KrajPrzeznaczenia, src.OpisTowaru, src.OpisTowaruNaGranicy, src.KodTowarowy, src.KodTowarowyNaGranicy, src.MasaBrutto, src.MasaBruttoNaGranicy, src.MasaNetto, src.MasaNettoNaGranicy, src.KodTypOplTransp, src.ProceduraWnioskowana, src.ProceduraWymagana, src.ProceduraKrajowa, src.WalutaWartosciStat, src.WartoscStatystyczna, src.CRN, src.TowarNiebezpieczny, src.KodScalony, src.KodTARIC, src.DodKodTARIC1, src.DodKodTARIC2, src.KodDod, src.IdDokZWA);	
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWA_Opakowanie' BEGIN
		MERGE INTO zc.ZWA_Opakowanie AS tgt
		USING [WA_StageHurtownia].zc.ZWA_Opakowanie AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajOpakowan=src.RodzajOpakowan, tgt.ZnakiOpakowan=src.ZnakiOpakowan, tgt.LiczbaOpak=src.LiczbaOpak, tgt.LiczbaSztuk=src.LiczbaSztuk, tgt.StanOpakowanNaGranicy=src.StanOpakowanNaGranicy, tgt.IdTowarZWA=src.IdTowarZWA
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzajOpakowan, ZnakiOpakowan, LiczbaOpak, LiczbaSztuk, StanOpakowanNaGranicy, IdTowarZWA)
		VALUES (src.Id, src.RodzajOpakowan, src.ZnakiOpakowan, src.LiczbaOpak, src.LiczbaSztuk, src.StanOpakowanNaGranicy, src.IdTowarZWA);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWA_Kontener' BEGIN
		MERGE INTO zc.ZWA_Kontener AS tgt
		USING [WA_StageHurtownia].zc.ZWA_Kontener AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrKontenera=src.NrKontenera, tgt.StanKontenera=src.StanKontenera, tgt.IdTowarZWA=src.IdTowarZWA
		WHEN NOT MATCHED
		THEN INSERT (Id, NrKontenera, StanKontenera, IdTowarZWA)
		VALUES (src.Id, src.NrKontenera, src.StanKontenera, src.IdTowarZWA);	
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWA_DokumentPoprzedni' BEGIN
		MERGE INTO zc.ZWA_DokumentPoprzedni AS tgt
		USING [WA_StageHurtownia].zc.ZWA_DokumentPoprzedni AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodDokPoprz=src.KodDokPoprz, tgt.NrDokPoprz=src.NrDokPoprz, tgt.IdTowarZWA=src.IdTowarZWA
		WHEN NOT MATCHED
		THEN INSERT (Id, KodDokPoprz, NrDokPoprz, IdTowarZWA)
		VALUES (src.Id, src.KodDokPoprz, src.NrDokPoprz, src.IdTowarZWA);	
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWA_DokumentWymagany' BEGIN
		MERGE INTO zc.ZWA_DokumentWymagany AS tgt
		USING [WA_StageHurtownia].zc.ZWA_DokumentWymagany AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodDokWym=src.KodDokWym, tgt.NrDokWym=src.NrDokWym, tgt.StanNaGranicy=src.StanNaGranicy, tgt.GranicaKom=src.GranicaKom, tgt.IdTowarZWA=src.IdTowarZWA
		WHEN NOT MATCHED
		THEN INSERT (Id, KodDokWym, NrDokWym, StanNaGranicy, GranicaKom, IdTowarZWA)
		VALUES (src.Id, src.KodDokWym, src.NrDokWym, src.StanNaGranicy, src.GranicaKom, src.IdTowarZWA);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWA_InformacjaDodatkowa' BEGIN
		MERGE INTO zc.ZWA_InformacjaDodatkowa AS tgt
		USING [WA_StageHurtownia].zc.ZWA_InformacjaDodatkowa AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodInfDod=src.KodInfDod, tgt.IdTowarZWA=src.IdTowarZWA
		WHEN NOT MATCHED
		THEN INSERT (Id, KodInfDod, IdTowarZWA)
		VALUES (src.Id, src.KodInfDod, src.IdTowarZWA);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWA_ZamkniecieCelne' BEGIN
		MERGE INTO zc.ZWA_ZamkniecieCelne AS tgt
		USING [WA_StageHurtownia].zc.ZWA_ZamkniecieCelne AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZnakiZamkniec=src.ZnakiZamkniec, tgt.IdDokZWA=src.IdDokZWA
		WHEN NOT MATCHED
		THEN INSERT (Id, ZnakiZamkniec, IdDokZWA)
		VALUES (src.Id, src.ZnakiZamkniec, src.IdDokZWA);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWA_Komentarz' BEGIN
		MERGE INTO zc.ZWA_Komentarz AS tgt
		USING [WA_StageHurtownia].zc.ZWA_Komentarz AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Komentarz=src.Komentarz, tgt.IdDokZWA=src.IdDokZWA
		WHEN NOT MATCHED
		THEN INSERT (Id, Komentarz, IdDokZWA)
		VALUES (src.Id, src.Komentarz, src.IdDokZWA);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWA_TowarKomentarz' BEGIN
		MERGE INTO zc.ZWA_TowarKomentarz AS tgt
		USING [WA_StageHurtownia].zc.ZWA_TowarKomentarz AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Komentarz=src.Komentarz, tgt.IdTowarZWA=src.IdTowarZWA
		WHEN NOT MATCHED
		THEN INSERT (Id, Komentarz, IdTowarZWA)
		VALUES (src.Id, src.Komentarz, src.IdTowarZWA);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWA_Podmiot' BEGIN
		MERGE INTO zc.ZWA_Podmiot AS tgt
		USING [WA_StageHurtownia].zc.ZWA_Podmiot AS src
		ON (tgt.Id=src.Id AND tgt.RodzPodmiotu=src.RodzPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TIN=src.TIN, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.IdDokZWA=src.IdDokZWA
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzPodmiotu, TIN, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, IdDokZWA)
		VALUES (src.Id, src.RodzPodmiotu, src.TIN, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.IdDokZWA);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWA_Dokument' BEGIN
		MERGE INTO zc.ZWA_Dokument AS tgt
		USING [WA_StageHurtownia].zc.ZWA_Dokument AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Status=src.Status, tgt.MRN=src.MRN, tgt.NrWlasny=src.NrWlasny, tgt.UrzadWywozu=src.UrzadWywozu, tgt.UrzadWyprDekl=src.UrzadWyprDekl, tgt.UrzadWypr=src.UrzadWypr, tgt.UrzadWyprZm=src.UrzadWyprZm, tgt.CzyECS=src.CzyECS, tgt.KodEAD=src.KodEAD, tgt.Skladowanie=src.Skladowanie, tgt.[1a]=src.[1a], tgt.LiczbaPoz=src.LiczbaPoz, tgt.LiczbaPozNaGranicy=src.LiczbaPozNaGranicy, tgt.LiczbaPozNaGranicyKom=src.LiczbaPozNaGranicyKom, tgt.LiczbaOpak=src.LiczbaOpak, tgt.LiczbaOpakNaGranicy=src.LiczbaOpakNaGranicy, tgt.LiczbaOpakNaGranicyKom=src.LiczbaOpakNaGranicyKom, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.Kontenery=src.Kontenery, tgt.MasaBrutto=src.MasaBrutto, tgt.MasaBruttoNaGranicy=src.MasaBruttoNaGranicy, tgt.MasaBruttoNaGranicyKom=src.MasaBruttoNaGranicyKom, tgt.EmailZwrotny=src.EmailZwrotny, tgt.TerminUrzadWypr=src.TerminUrzadWypr, tgt.TerminWysylkiKontr=src.TerminWysylkiKontr, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.DataZwolnienia=src.DataZwolnienia, tgt.CRN=src.CRN, tgt.KodTypOplatTransp=src.KodTypOplatTransp, tgt.SpecyficzneOkolicznosci=src.SpecyficzneOkolicznosci, tgt.DataWyslania=src.DataWyslania, tgt.DataPrzedstawienia=src.DataPrzedstawienia, tgt.PrzedstTowUC=src.PrzedstTowUC, tgt.PrzedstTowPozaUCKod=src.PrzedstTowPozaUCKod, tgt.PrzedstTowPozaUCBezKodu=src.PrzedstTowPozaUCBezKodu, tgt.SkladTowPozaUCKod=src.SkladTowPozaUCKod, tgt.SkladTowPozaUCBezKodu=src.SkladTowPozaUCBezKodu, tgt.ZnakiSrodkaPrzewoz=src.ZnakiSrodkaPrzewoz, tgt.ZnakiSrodkaPrzewozNaGranicy=src.ZnakiSrodkaPrzewozNaGranicy, tgt.ZnakiSrodkaPrzewozNaGranicyKom=src.ZnakiSrodkaPrzewozNaGranicyKom, tgt.KontrolaWywozKod=src.KontrolaWywozKod, tgt.ZamkCelneLiczba=src.ZamkCelneLiczba, tgt.KontrolaWyprKod=src.KontrolaWyprKod, tgt.KontrolaWyprStan=src.KontrolaWyprStan, tgt.Miejsce=src.Miejsce, tgt.DataPowiadomienia=src.DataPowiadomienia, tgt.Data=src.Data
		WHEN NOT MATCHED
		THEN INSERT (Id, Status, MRN, NrWlasny, UrzadWywozu, UrzadWyprDekl, UrzadWypr, UrzadWyprZm, CzyECS, KodEAD, Skladowanie, [1a], LiczbaPoz, LiczbaPozNaGranicy, LiczbaPozNaGranicyKom, LiczbaOpak, LiczbaOpakNaGranicy, LiczbaOpakNaGranicyKom, KrajWysylki, KrajPrzeznaczenia, Kontenery, MasaBrutto, MasaBruttoNaGranicy, MasaBruttoNaGranicyKom, EmailZwrotny, TerminUrzadWypr, TerminWysylkiKontr, DataPrzyjecia, DataZwolnienia, CRN, KodTypOplatTransp, SpecyficzneOkolicznosci, DataWyslania, DataPrzedstawienia, PrzedstTowUC, PrzedstTowPozaUCKod, PrzedstTowPozaUCBezKodu, SkladTowPozaUCKod, SkladTowPozaUCBezKodu, ZnakiSrodkaPrzewoz, ZnakiSrodkaPrzewozNaGranicy, ZnakiSrodkaPrzewozNaGranicyKom, KontrolaWywozKod, ZamkCelneLiczba, KontrolaWyprKod, KontrolaWyprStan, Miejsce, DataPowiadomienia, Data)
		VALUES (src.Id, src.Status, src.MRN, src.NrWlasny, src.UrzadWywozu, src.UrzadWyprDekl, src.UrzadWypr, src.UrzadWyprZm, src.CzyECS, src.KodEAD, src.Skladowanie, src.[1a], src.LiczbaPoz, src.LiczbaPozNaGranicy, src.LiczbaPozNaGranicyKom, src.LiczbaOpak, src.LiczbaOpakNaGranicy, src.LiczbaOpakNaGranicyKom, src.KrajWysylki, src.KrajPrzeznaczenia, src.Kontenery, src.MasaBrutto, src.MasaBruttoNaGranicy, src.MasaBruttoNaGranicyKom, src.EmailZwrotny, src.TerminUrzadWypr, src.TerminWysylkiKontr, src.DataPrzyjecia, src.DataZwolnienia, src.CRN, src.KodTypOplatTransp, src.SpecyficzneOkolicznosci, src.DataWyslania, src.DataPrzedstawienia, src.PrzedstTowUC, src.PrzedstTowPozaUCKod, src.PrzedstTowPozaUCBezKodu, src.SkladTowPozaUCKod, src.SkladTowPozaUCBezKodu, src.ZnakiSrodkaPrzewoz, src.ZnakiSrodkaPrzewozNaGranicy, src.ZnakiSrodkaPrzewozNaGranicyKom, src.KontrolaWywozKod, src.ZamkCelneLiczba, src.KontrolaWyprKod, src.KontrolaWyprStan, src.Miejsce, src.DataPowiadomienia, src.Data);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_Zglaszajacy' BEGIN
		MERGE INTO zc.ZWU_Zglaszajacy AS tgt
		USING [WA_StageHurtownia].zc.ZWU_Zglaszajacy AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TIN=src.TIN, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.REGON=src.REGON, tgt.EORI=src.EORI, tgt.Przedstawicielstwo=src.Przedstawicielstwo, tgt.WskaznikEksportera=src.WskaznikEksportera, tgt.DataWpisuNaListe=src.DataWpisuNaListe, tgt.NrWpisuNaListe=src.NrWpisuNaListe, tgt.IdDokZWU=src.IdDokZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, TIN, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, REGON, EORI, Przedstawicielstwo, WskaznikEksportera, DataWpisuNaListe, NrWpisuNaListe, IdDokZWU)
		VALUES (src.Id, src.TIN, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.REGON, src.EORI, src.Przedstawicielstwo, src.WskaznikEksportera, src.DataWpisuNaListe, src.NrWpisuNaListe, src.IdDokZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_Trasa' BEGIN
		MERGE INTO zc.ZWU_Trasa AS tgt
		USING [WA_StageHurtownia].zc.ZWU_Trasa AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kraj=src.Kraj, tgt.IdDokZWU=src.IdDokZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, Kraj, IdDokZWU)
		VALUES (src.Id, src.Kraj, src.IdDokZWU);		
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_Kontener' BEGIN
		MERGE INTO zc.ZWU_Kontener AS tgt
		USING [WA_StageHurtownia].zc.ZWU_Kontener AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrKontenera=src.NrKontenera, tgt.StanKontenera=src.StanKontenera, tgt.IdTowarZWU=src.IdTowarZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, NrKontenera, StanKontenera, IdTowarZWU)
		VALUES (src.Id, src.NrKontenera, src.StanKontenera, src.IdTowarZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_Korekta' BEGIN
		MERGE INTO zc.ZWU_Korekta AS tgt
		USING [WA_StageHurtownia].zc.ZWU_Korekta AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodKorekty=src.KodKorekty, tgt.Wartosc=src.Wartosc, tgt.IdTowarZWU=src.IdTowarZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, KodKorekty, Wartosc, IdTowarZWU)
		VALUES (src.Id, src.KodKorekty, src.Wartosc, src.IdTowarZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_ZamkniecieCelne' BEGIN
		MERGE INTO zc.ZWU_ZamkniecieCelne AS tgt
		USING [WA_StageHurtownia].zc.ZWU_ZamkniecieCelne AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZnakiZamkniec=src.ZnakiZamkniec, tgt.IdDokZWU=src.IdDokZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, ZnakiZamkniec, IdDokZWU)
		VALUES (src.Id, src.ZnakiZamkniec, src.IdDokZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_Komentarz' BEGIN
		MERGE INTO zc.ZWU_Komentarz AS tgt
		USING [WA_StageHurtownia].zc.ZWU_Komentarz AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Komentarz=src.Komentarz, tgt.IdDokZWU=src.IdDokZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, Komentarz, IdDokZWU)
		VALUES (src.Id, src.Komentarz, src.IdDokZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_TowarKomentarz' BEGIN
		MERGE INTO zc.ZWU_TowarKomentarz AS tgt
		USING [WA_StageHurtownia].zc.ZWU_TowarKomentarz AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Komentarz=src.Komentarz, tgt.IdTowarZWU=src.IdTowarZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, Komentarz, IdTowarZWU)
		VALUES (src.Id, src.Komentarz, src.IdTowarZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_Towar' BEGIN
		MERGE INTO zc.ZWU_Towar AS tgt
		USING [WA_StageHurtownia].zc.ZWU_Towar AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrPozycji=src.NrPozycji, tgt.StanNaGranicy=src.StanNaGranicy, tgt.CRN=src.CRN, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajPochodzeniaPid=src.KrajPochodzeniaPid, tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.TowarNiebezpieczny=src.TowarNiebezpieczny, tgt.OpisTowaru=src.OpisTowaru, tgt.OpisTowaruNaGranicy=src.OpisTowaruNaGranicy, tgt.KodTowarowy=src.KodTowarowy, tgt.KodTowarowyNaGranicy=src.KodTowarowyNaGranicy, tgt.KodTARIC=src.KodTARIC, tgt.KodDodUE=src.KodDodUE, tgt.KodDodPL=src.KodDodPL, tgt.MasaBrutto=src.MasaBrutto, tgt.MasaBruttoNaGranicy=src.MasaBruttoNaGranicy, tgt.MasaNetto=src.MasaNetto, tgt.MasaNettoNaGranicy=src.MasaNettoNaGranicy, tgt.Procedura=src.Procedura, tgt.ProceduraPoprz=src.ProceduraPoprz, tgt.ProceduraSzczegoly=src.ProceduraSzczegoly, tgt.IloscUjm=src.IloscUjm, tgt.OplTranspKod=src.OplTranspKod, tgt.KodTypOplatTransp=src.KodTypOplatTransp, tgt.IdDokZWU=src.IdDokZWU, tgt.WartoscStatystyczna=src.WartoscStatystyczna, tgt.Waluta=src.Waluta, tgt.SumaOplat=src.SumaOplat
		WHEN NOT MATCHED
		THEN INSERT (Id, NrPozycji, StanNaGranicy, CRN, KrajWysylki, KrajPochodzeniaPid, KrajPrzeznaczenia, TowarNiebezpieczny, OpisTowaru, OpisTowaruNaGranicy, KodTowarowy, KodTowarowyNaGranicy, KodTARIC, KodDodUE, KodDodPL, MasaBrutto, MasaBruttoNaGranicy, MasaNetto, MasaNettoNaGranicy, Procedura, ProceduraPoprz, ProceduraSzczegoly, IloscUjm, OplTranspKod, KodTypOplatTransp, IdDokZWU, WartoscStatystyczna, Waluta, SumaOplat)
		VALUES (src.Id, src.NrPozycji, src.StanNaGranicy, src.CRN, src.KrajWysylki, src.KrajPochodzeniaPid, src.KrajPrzeznaczenia, src.TowarNiebezpieczny, src.OpisTowaru, src.OpisTowaruNaGranicy, src.KodTowarowy, src.KodTowarowyNaGranicy, src.KodTARIC, src.KodDodUE, src.KodDodPL, src.MasaBrutto, src.MasaBruttoNaGranicy, src.MasaNetto, src.MasaNettoNaGranicy, src.Procedura, src.ProceduraPoprz, src.ProceduraSzczegoly, src.IloscUjm, src.OplTranspKod, src.KodTypOplatTransp, src.IdDokZWU, src.WartoscStatystyczna, src.Waluta, src.SumaOplat);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_Opakowanie' BEGIN
		MERGE INTO zc.ZWU_Opakowanie AS tgt
		USING [WA_StageHurtownia].zc.ZWU_Opakowanie AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajOpakowan=src.RodzajOpakowan, tgt.ZnakiOpakowan=src.ZnakiOpakowan, tgt.LiczbaOpak=src.LiczbaOpak, tgt.LiczbaSztuk=src.LiczbaSztuk, tgt.StanOpakowanNaGranicy=src.StanOpakowanNaGranicy, tgt.IdTowarZWU=src.IdTowarZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzajOpakowan, ZnakiOpakowan, LiczbaOpak, LiczbaSztuk, StanOpakowanNaGranicy, IdTowarZWU)
		VALUES (src.Id, src.RodzajOpakowan, src.ZnakiOpakowan, src.LiczbaOpak, src.LiczbaSztuk, src.StanOpakowanNaGranicy, src.IdTowarZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_Ilosc' BEGIN
		MERGE INTO zc.ZWU_Ilosc AS tgt
		USING [WA_StageHurtownia].zc.ZWU_Ilosc AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Jm=src.Jm, tgt.KwalifikatorJm=src.KwalifikatorJm, tgt.Ilosc=src.Ilosc, tgt.IdTowarZwu=src.IdTowarZwu
		WHEN NOT MATCHED
		THEN INSERT (Id, Jm, KwalifikatorJm, Ilosc, IdTowarZwu)
		VALUES (src.Id, src.Jm, src.KwalifikatorJm, src.Ilosc, src.IdTowarZwu);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_DokumentPoprzedni' BEGIN
		MERGE INTO zc.ZWU_DokumentPoprzedni AS tgt
		USING [WA_StageHurtownia].zc.ZWU_DokumentPoprzedni AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodDokPoprz=src.KodDokPoprz, tgt.NrDokPoprz=src.NrDokPoprz, tgt.IdTowarZWU=src.IdTowarZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, KodDokPoprz, NrDokPoprz, IdTowarZWU)
		VALUES (src.Id, src.KodDokPoprz, src.NrDokPoprz, src.IdTowarZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_DokumentWymagany' BEGIN
		MERGE INTO zc.ZWU_DokumentWymagany AS tgt
		USING [WA_StageHurtownia].zc.ZWU_DokumentWymagany AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodDokWym=src.KodDokWym, tgt.NrDokWym=src.NrDokWym, tgt.StanNaGranicy=src.StanNaGranicy, tgt.GranicaKom=src.GranicaKom, tgt.IdTowarZWU=src.IdTowarZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, KodDokWym, NrDokWym, StanNaGranicy, GranicaKom, IdTowarZWU)
		VALUES (src.Id, src.KodDokWym, src.NrDokWym, src.StanNaGranicy, src.GranicaKom, src.IdTowarZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_InformacjaDodatkowa' BEGIN
		MERGE INTO zc.ZWU_InformacjaDodatkowa AS tgt
		USING [WA_StageHurtownia].zc.ZWU_InformacjaDodatkowa AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodInfDod=src.KodInfDod, tgt.Tekst=src.Tekst, tgt.IdTowarZWU=src.IdTowarZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, KodInfDod, Tekst, IdTowarZWU)
		VALUES (src.Id, src.KodInfDod, src.Tekst, src.IdTowarZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_Oplata' BEGIN
		MERGE INTO zc.ZWU_Oplata AS tgt
		USING [WA_StageHurtownia].zc.ZWU_Oplata AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SumaOplat=src.SumaOplat, tgt.Typ=src.Typ, tgt.Podstawa=src.Podstawa, tgt.Stawka=src.Stawka, tgt.Kwota=src.Kwota, tgt.MP=src.MP, tgt.IdTowarZWU=src.IdTowarZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, SumaOplat, Typ, Podstawa, Stawka, Kwota, MP, IdTowarZWU)
		VALUES (src.Id, src.SumaOplat, src.Typ, src.Podstawa, src.Stawka, src.Kwota, src.MP, src.IdTowarZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_KodDodatkowyUE' BEGIN
		MERGE INTO zc.ZWU_KodDodatkowyUE AS tgt
		USING [WA_StageHurtownia].zc.ZWU_KodDodatkowyUE AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodUE=src.KodUE, tgt.IdTowarZWU=src.IdTowarZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, KodUE, IdTowarZWU)
		VALUES (src.Id, src.KodUE, src.IdTowarZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_KodDodatkowyPL' BEGIN
		MERGE INTO zc.ZWU_KodDodatkowyPL AS tgt
		USING [WA_StageHurtownia].zc.ZWU_KodDodatkowyPL AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodPL=src.KodPL, tgt.IdTowarZWU=src.IdTowarZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, KodPL, IdTowarZWU)
		VALUES (src.Id, src.KodPL, src.IdTowarZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_TowarPodmiot' BEGIN
		MERGE INTO zc.ZWU_TowarPodmiot AS tgt
		USING [WA_StageHurtownia].zc.ZWU_TowarPodmiot AS src
		ON (tgt.Id=src.Id AND tgt.RodzPodmiotu=src.RodzPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TIN=src.TIN, tgt.REGON=src.REGON, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.EORI=src.EORI, tgt.IdTowarZWU=src.IdTowarZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzPodmiotu, TIN, REGON, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, EORI, IdTowarZWU)
		VALUES (src.Id, src.RodzPodmiotu, src.TIN, src.REGON, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.EORI, src.IdTowarZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_Podmiot' BEGIN
		MERGE INTO zc.ZWU_Podmiot AS tgt
		USING [WA_StageHurtownia].zc.ZWU_Podmiot AS src
		ON (tgt.Id=src.Id AND tgt.RodzPodmiotu=src.RodzPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TIN=src.TIN, tgt.REGON=src.REGON, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.EORI=src.EORI, tgt.IdDokZWU=src.IdDokZWU
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzPodmiotu, TIN, REGON, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, EORI, IdDokZWU)
		VALUES (src.Id, src.RodzPodmiotu, src.TIN, src.REGON, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.EORI, src.IdDokZWU);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWU_Dokument' BEGIN
		MERGE INTO zc.ZWU_Dokument AS tgt
		USING [WA_StageHurtownia].zc.ZWU_Dokument AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Status=src.Status, tgt.NrWlasny=src.NrWlasny, tgt.MRN=src.MRN, tgt.CRN=src.CRN, tgt.UrzadWywozu=src.UrzadWywozu, tgt.UrzadWyprowadzenia=src.UrzadWyprowadzenia, tgt.UrzadWyprowadzeniaZm=src.UrzadWyprowadzeniaZm, tgt.ProceduraUproszczona=src.ProceduraUproszczona, tgt.Skladowanie=src.Skladowanie, tgt.TowarNiebezpieczny=src.TowarNiebezpieczny, tgt.SpecyficzneOkolicznosci=src.SpecyficzneOkolicznosci, tgt.[1a]=src.[1a], tgt.[1b]=src.[1b], tgt.LiczbaPoz=src.LiczbaPoz, tgt.LiczbaPozNaGranicy=src.LiczbaPozNaGranicy, tgt.LiczbaPozNaGranicyKom=src.LiczbaPozNaGranicyKom, tgt.LiczbaOpak=src.LiczbaOpak, tgt.LiczbaOpakNaGranicy=src.LiczbaOpakNaGranicy, tgt.LiczbaOpakNaGranicyKom=src.LiczbaOpakNaGranicyKom, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.Kontenery=src.Kontenery, tgt.MasaBrutto=src.MasaBrutto, tgt.MasaBruttoNaGranicy=src.MasaBruttoNaGranicy, tgt.MasaBruttoNaGranicyKom=src.MasaBruttoNaGranicyKom, tgt.KodWarunkowDostawy=src.KodWarunkowDostawy, tgt.MiejsceDostawy=src.MiejsceDostawy, tgt.KodMiejscaDostawy=src.KodMiejscaDostawy, tgt.DataPrzyjeciaNaEwid=src.DataPrzyjeciaNaEwid, tgt.Wartosc=src.Wartosc, tgt.KodWaluty=src.KodWaluty, tgt.KursWaluty=src.KursWaluty, tgt.KodRodzajuTransakcji=src.KodRodzajuTransakcji, tgt.SumaOplat=src.SumaOplat, tgt.PodpisElektroniczny=src.PodpisElektroniczny, tgt.TerminZwolnieniePU=src.TerminZwolnieniePU, tgt.TerminUrzadWyprowadzenia=src.TerminUrzadWyprowadzenia, tgt.TerminWysylkiPotwierdzenia=src.TerminWysylkiPotwierdzenia, tgt.DataWyprowadzenia=src.DataWyprowadzenia, tgt.DataZatrzymania=src.DataZatrzymania, tgt.KodTypOplatTransp=src.KodTypOplatTransp, tgt.UC=src.UC, tgt.MiejsceKodPozaUC=src.MiejsceKodPozaUC, tgt.MiejsceBezKoduPozaUC=src.MiejsceBezKoduPozaUC, tgt.TrWewnRodzaj=src.TrWewnRodzaj, tgt.TrWewnZnaki=src.TrWewnZnaki, tgt.TrWewnZnakiNaGranicy=src.TrWewnZnakiNaGranicy, tgt.TrWewnZnakiNaGranicyKom=src.TrWewnZnakiNaGranicyKom, tgt.TrDeklRodzaj=src.TrDeklRodzaj, tgt.TrDeklZnaki=src.TrDeklZnaki, tgt.TrDeklKraj=src.TrDeklKraj, tgt.KontrWywozKod=src.KontrWywozKod, tgt.KontrWywozTermin=src.KontrWywozTermin, tgt.ZamkCelneLiczba=src.ZamkCelneLiczba, tgt.KontrWyprKod=src.KontrWyprKod, tgt.KontrWyprStan=src.KontrWyprStan, tgt.Miejsce=src.Miejsce, tgt.Data=src.Data, tgt.ImieNazwisko=src.ImieNazwisko, tgt.Stanowisko=src.Stanowisko
		WHEN NOT MATCHED
		THEN INSERT (Id, Status, NrWlasny, MRN, CRN, UrzadWywozu, UrzadWyprowadzenia, UrzadWyprowadzeniaZm, ProceduraUproszczona, Skladowanie, TowarNiebezpieczny, SpecyficzneOkolicznosci, [1a], [1b], LiczbaPoz, LiczbaPozNaGranicy, LiczbaPozNaGranicyKom, LiczbaOpak, LiczbaOpakNaGranicy, LiczbaOpakNaGranicyKom, KrajWysylki, KrajPrzeznaczenia, Kontenery, MasaBrutto, MasaBruttoNaGranicy, MasaBruttoNaGranicyKom, KodWarunkowDostawy, MiejsceDostawy, KodMiejscaDostawy, DataPrzyjeciaNaEwid, Wartosc, KodWaluty, KursWaluty, KodRodzajuTransakcji, SumaOplat, PodpisElektroniczny, TerminZwolnieniePU, TerminUrzadWyprowadzenia, TerminWysylkiPotwierdzenia, DataWyprowadzenia, DataZatrzymania, KodTypOplatTransp, UC, MiejsceKodPozaUC, MiejsceBezKoduPozaUC, TrWewnRodzaj, TrWewnZnaki, TrWewnZnakiNaGranicy, TrWewnZnakiNaGranicyKom, TrDeklRodzaj, TrDeklZnaki, TrDeklKraj, KontrWywozKod, KontrWywozTermin, ZamkCelneLiczba, KontrWyprKod, KontrWyprStan, Miejsce, Data, ImieNazwisko, Stanowisko)
		VALUES (src.Id, src.Status, src.NrWlasny, src.MRN, src.CRN, src.UrzadWywozu, src.UrzadWyprowadzenia, src.UrzadWyprowadzeniaZm, src.ProceduraUproszczona, src.Skladowanie, src.TowarNiebezpieczny, src.SpecyficzneOkolicznosci, src.[1a], src.[1b], src.LiczbaPoz, src.LiczbaPozNaGranicy, src.LiczbaPozNaGranicyKom, src.LiczbaOpak, src.LiczbaOpakNaGranicy, src.LiczbaOpakNaGranicyKom, src.KrajWysylki, src.KrajPrzeznaczenia, src.Kontenery, src.MasaBrutto, src.MasaBruttoNaGranicy, src.MasaBruttoNaGranicyKom, src.KodWarunkowDostawy, src.MiejsceDostawy, src.KodMiejscaDostawy, src.DataPrzyjeciaNaEwid, src.Wartosc, src.KodWaluty, src.KursWaluty, src.KodRodzajuTransakcji, src.SumaOplat, src.PodpisElektroniczny, src.TerminZwolnieniePU, src.TerminUrzadWyprowadzenia, src.TerminWysylkiPotwierdzenia, src.DataWyprowadzenia, src.DataZatrzymania, src.KodTypOplatTransp, src.UC, src.MiejsceKodPozaUC, src.MiejsceBezKoduPozaUC, src.TrWewnRodzaj, src.TrWewnZnaki, src.TrWewnZnakiNaGranicy, src.TrWewnZnakiNaGranicyKom, src.TrDeklRodzaj, src.TrDeklZnaki, src.TrDeklKraj, src.KontrWywozKod, src.KontrWywozTermin, src.ZamkCelneLiczba, src.KontrWyprKod, src.KontrWyprStan, src.Miejsce, src.Data, src.ImieNazwisko, src.Stanowisko);
		SET @Merged = 1;
	END
	
	ELSE IF @TableName = 'ZWA_TowarPodmiot' BEGIN
		MERGE INTO zc.ZWA_TowarPodmiot AS tgt
		USING [WA_StageHurtownia].zc.ZWA_TowarPodmiot AS src
		ON (tgt.Id=src.Id AND tgt.RodzPodmiotu=src.RodzPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TIN=src.TIN, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.IdTowarZWA=src.IdTowarZWA
		WHEN NOT MATCHED
		THEN INSERT (Id, RodzPodmiotu, TIN, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, IdTowarZWA)
		VALUES (src.Id, src.RodzPodmiotu, src.TIN, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.IdTowarZWA);
		SET @Merged = 1;
	END
	
	IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END