﻿

-- ==============================================
-- Author:		Gwidon Jóźwiak
-- Create date: 2015-08-26
-- Description:	
-- ===============================================

CREATE PROCEDURE [zef2].[MergeTableFromStageODS] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
		END

		-- WFW
		IF @TableName = 'Pismo' BEGIN
			MERGE INTO zef2.Pismo AS tgt
			USING WI_StageODS.zef2.Pismo AS src
			ON (tgt.IDPisma=src.IDPisma)
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.IDSprawyG                            = src.IDSprawyG
				,tgt.NumerPisma                           = src.NumerPisma
				,tgt.NumerKolejnyPismaWSprawie            = src.NumerKolejnyPismaWSprawie
				,tgt.UNP                                  = src.UNP
				,tgt.IDJednostki                          = src.IDJednostki
				,tgt.DataCzasWprowadzenia                 = src.DataCzasWprowadzenia
				,tgt.PismoDotyczy                         = src.PismoDotyczy
				,tgt.IDPismaNaKtoreJestOdpowiedzia        = src.IDPismaNaKtoreJestOdpowiedzia
				,tgt.IDKierunkuPisma                      = src.IDKierunkuPisma
				,tgt.IDSposobuObslugiPisma                = src.IDSposobuObslugiPisma
				,tgt.MaksymalnaDataCzasOdpowiedzi         = src.MaksymalnaDataCzasOdpowiedzi
				,tgt.LiczbaGodzinDlaPowiadomienia         = src.LiczbaGodzinDlaPowiadomienia
				,tgt.NumerPismaPrzychodzacego             = src.NumerPismaPrzychodzacego
				,tgt.DataWyslaniaPisma                    = src.DataWyslaniaPisma
				,tgt.DataCzasRozpatrzeniaPisma            = src.DataCzasRozpatrzeniaPisma
				,tgt.DataCzasWygenerowaniaOdpowiedzi      = src.DataCzasWygenerowaniaOdpowiedzi
				,tgt.DostepneDoOdczytu                    = src.DostepneDoOdczytu
				,tgt.DataWplynieciaOdpowiedzi             = src.DataWplynieciaOdpowiedzi
				,tgt.IDAutoraPisma                        = src.IDAutoraPisma
				,tgt.IDPionu                              = src.IDPionu
				,tgt.Adresat                              = src.Adresat
				,tgt.DataCzasZaznaczeniaWyslania          = src.DataCzasZaznaczeniaWyslania
				,tgt.SlowaKluczowe                        = src.SlowaKluczowe
				,tgt.IDStatusuPismaRoboczego              = src.IDStatusuPismaRoboczego
				,tgt.DekretacjaXML                        = src.DekretacjaXML
				,tgt.NowaSprawaXML                        = src.NowaSprawaXML
				,tgt.NazwaDostawcy                        = src.NazwaDostawcy
				,tgt.LoginDostawcy                        = src.LoginDostawcy
				,tgt.Slowniki                             = src.Slowniki
				,tgt.NrListuPoleconego                    = src.NrListuPoleconego
				,tgt.Archiwum                             = src.Archiwum
				,tgt.OsobaZanoszaca                       = src.OsobaZanoszaca
				,tgt.IDPriorytetu                         = src.IDPriorytetu
				,tgt.DataWplyniecia                       = src.DataWplyniecia
				,tgt.IDTypuPisma                          = src.IDTypuPisma
				,tgt.IDTypuFormularza                     = src.IDTypuFormularza
				,tgt.IDAkceptujacego                      = src.IDAkceptujacego
				,tgt.IdMetadaneObiektu                    = src.IdMetadaneObiektu
				,tgt.INT01                                = src.INT01
				,tgt.INT02                                = src.INT02
				,tgt.INT03                                = src.INT03
				,tgt.INT04                                = src.INT04
				,tgt.INT05                                = src.INT05
				,tgt.INT06                                = src.INT06
				,tgt.INT07                                = src.INT07
				,tgt.INT08                                = src.INT08
				,tgt.INT09                                = src.INT09
				,tgt.INT10                                = src.INT10
				,tgt.INT11                                = src.INT11
				,tgt.INT12                                = src.INT12
				,tgt.INT13                                = src.INT13
				,tgt.INT14                                = src.INT14
				,tgt.INT15                                = src.INT15
				,tgt.BIT01                                = src.BIT01
				,tgt.BIT02                                = src.BIT02
				,tgt.BIT03                                = src.BIT03
				,tgt.BIT04                                = src.BIT04
				,tgt.BIT05                                = src.BIT05
				,tgt.BIT06                                = src.BIT06
				,tgt.BIT07                                = src.BIT07
				,tgt.BIT08                                = src.BIT08
				,tgt.BIT09                                = src.BIT09
				,tgt.BIT10                                = src.BIT10
				,tgt.TXT01                                = src.TXT01
				,tgt.TXT02                                = src.TXT02
				,tgt.TXT03                                = src.TXT03
				,tgt.TXT04                                = src.TXT04
				,tgt.TXT05                                = src.TXT05
				,tgt.TXT06                                = src.TXT06
				,tgt.TXT07                                = src.TXT07
				,tgt.TXT08                                = src.TXT08
				,tgt.TXT09                                = src.TXT09
				,tgt.TXT10                                = src.TXT10
				,tgt.TXT11                                = src.TXT11
				,tgt.TXT12                                = src.TXT12
				,tgt.TXT13                                = src.TXT13
				,tgt.TXT14                                = src.TXT14
				,tgt.TXT15                                = src.TXT15
				,tgt.Usuniete                             = src.Usuniete
				,tgt.DataOstatniejModyfikacji             = src.DataOstatniejModyfikacji
				,tgt.WersjaElektroniczna                  = src.WersjaElektroniczna
				,tgt.NumerPismaUnp                        = src.NumerPismaUnp
				,tgt.IDOryginalu                          = src.IDOryginalu
				,tgt.IDInstancji                          = src.IDInstancji
				,tgt.IDAutoraOstatniejModyfikacji         = src.IDAutoraOstatniejModyfikacji
				,tgt.Data01                               = src.Data01
				,tgt.Data02                               = src.Data02
				,tgt.Data03                               = src.Data03
				,tgt.Data04                               = src.Data04
				,tgt.Data05                               = src.Data05
				,tgt.Data06                               = src.Data06
				,tgt.DATA07                               = src.DATA07
				,tgt.DATA08                               = src.DATA08
				,tgt.DATA09                               = src.DATA09
				,tgt.DATA10                               = src.DATA10
				,tgt.DATA11                               = src.DATA11
				,tgt.DATA12                               = src.DATA12
				,tgt.DATA13                               = src.DATA13
				,tgt.DATA14                               = src.DATA14
				,tgt.DATA15                               = src.DATA15
				,tgt.Kwota01                              = src.Kwota01
				,tgt.Kwota02                              = src.Kwota02
				,tgt.Kwota03                              = src.Kwota03
				,tgt.Kwota04                              = src.Kwota04
				,tgt.Kwota05                              = src.Kwota05
				,tgt.KWOTA06                              = src.KWOTA06
				,tgt.KWOTA07                              = src.KWOTA07
				,tgt.KWOTA08                              = src.KWOTA08
				,tgt.KWOTA09                              = src.KWOTA09
				,tgt.KWOTA10                              = src.KWOTA10
				,tgt.KWOTA11                              = src.KWOTA11
				,tgt.KWOTA12                              = src.KWOTA12
				,tgt.KWOTA13                              = src.KWOTA13
				,tgt.KWOTA14                              = src.KWOTA14
				,tgt.KWOTA15                              = src.KWOTA15
				,tgt.Liczba01                             = src.Liczba01
				,tgt.Liczba02                             = src.Liczba02
				,tgt.DaneXML                              = src.DaneXML
				,tgt.DataStemplaPocztowego                = src.DataStemplaPocztowego
				,tgt.IDPoziomJawnosci                     = src.IDPoziomJawnosci
				,tgt.IdTypuLimitowanego                   = src.IdTypuLimitowanego
				,tgt.IDZastepcyWykonujacego               = src.IDZastepcyWykonujacego
				,tgt.ZalacznikiOpis                       = src.ZalacznikiOpis
				,tgt.ZalacznikiIlosc                      = src.ZalacznikiIlosc
				,tgt.KodKreskowy                          = src.KodKreskowy
				,tgt.Pismo_ZNosnikaDanych                 = src.Pismo_ZNosnikaDanych
				,tgt.Pismo_OdwzorowanoWCalosci            = src.Pismo_OdwzorowanoWCalosci
				,tgt.PismoEPUAP_Status                    = src.PismoEPUAP_Status
				,tgt.PismoEPUAP_Podmiot                   = src.PismoEPUAP_Podmiot
				,tgt.PismoEPUAP_Skrzynka                  = src.PismoEPUAP_Skrzynka
				,tgt.PismoEPUAP_CzyDodanyKontrahent       = src.PismoEPUAP_CzyDodanyKontrahent
				,tgt.ZamknijSprawe                        = src.ZamknijSprawe
				,tgt.StatusDanychKontrahenta              = src.StatusDanychKontrahenta
				,tgt.Oryginal_W                           = src.Oryginal_W
				,tgt.Przeczytano                          = src.Przeczytano
				,tgt.DatePrzywroceniaZArchiwum            = src.DatePrzywroceniaZArchiwum
				,tgt.DotyczySprawy                        = src.DotyczySprawy
				,tgt.TrescPisma                           = src.TrescPisma
				,tgt.TrescPismaDane                       = src.TrescPismaDane
				,tgt.IDJednostkiOrganizacyjnej            = src.IDJednostkiOrganizacyjnej
				,tgt.ObszarTematyczny                     = src.ObszarTematyczny
				,tgt.Dostep                               = src.Dostep
				,tgt.Jezyk                                = src.Jezyk
				,tgt.Format                               = src.Format
				,tgt.Typ                                  = src.Typ
				,tgt.IDJRWA                               = src.IDJRWA
				,tgt.IDPismaCRD                           = src.IDPismaCRD
				,tgt.xDaneXML                             = src.xDaneXML
				,tgt.IDJednostkiBazowe                    = src.IDJednostkiBazowe
				,tgt.FullTextSearch                       = src.FullTextSearch
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT (IDPisma
						,IDSprawyG
						,NumerPisma
						,NumerKolejnyPismaWSprawie
						,UNP
						,IDJednostki
						,DataCzasWprowadzenia
						,PismoDotyczy
						,IDPismaNaKtoreJestOdpowiedzia
						,IDKierunkuPisma
						,IDSposobuObslugiPisma
						,MaksymalnaDataCzasOdpowiedzi
						,LiczbaGodzinDlaPowiadomienia
						,NumerPismaPrzychodzacego
						,DataWyslaniaPisma
						,DataCzasRozpatrzeniaPisma
						,DataCzasWygenerowaniaOdpowiedzi
						,DostepneDoOdczytu
						,DataWplynieciaOdpowiedzi
						,IDAutoraPisma
						,IDPionu
						,Adresat
						,DataCzasZaznaczeniaWyslania
						,SlowaKluczowe
						,IDStatusuPismaRoboczego
						,DekretacjaXML
						,NowaSprawaXML
						,NazwaDostawcy
						,LoginDostawcy
						,Slowniki
						,NrListuPoleconego
						,Archiwum
						,OsobaZanoszaca
						,IDPriorytetu
						,DataWplyniecia
						,IDTypuPisma
						,IDTypuFormularza
						,IDAkceptujacego
						,IdMetadaneObiektu
						,INT01
						,INT02
						,INT03
						,INT04
						,INT05
						,INT06
						,INT07
						,INT08
						,INT09
						,INT10
						,INT11
						,INT12
						,INT13
						,INT14
						,INT15
						,BIT01
						,BIT02
						,BIT03
						,BIT04
						,BIT05
						,BIT06
						,BIT07
						,BIT08
						,BIT09
						,BIT10
						,TXT01
						,TXT02
						,TXT03
						,TXT04
						,TXT05
						,TXT06
						,TXT07
						,TXT08
						,TXT09
						,TXT10
						,TXT11
						,TXT12
						,TXT13
						,TXT14
						,TXT15
						,Usuniete
						,DataOstatniejModyfikacji
						,WersjaElektroniczna
						,NumerPismaUnp
						,IDOryginalu
						,IDInstancji
						,IDAutoraOstatniejModyfikacji
						,Data01
						,Data02
						,Data03
						,Data04
						,Data05
						,Data06
						,DATA07
						,DATA08
						,DATA09
						,DATA10
						,DATA11
						,DATA12
						,DATA13
						,DATA14
						,DATA15
						,Kwota01
						,Kwota02
						,Kwota03
						,Kwota04
						,Kwota05
						,KWOTA06
						,KWOTA07
						,KWOTA08
						,KWOTA09
						,KWOTA10
						,KWOTA11
						,KWOTA12
						,KWOTA13
						,KWOTA14
						,KWOTA15
						,Liczba01
						,Liczba02
						,DaneXML
						,DataStemplaPocztowego
						,IDPoziomJawnosci
						,IdTypuLimitowanego
						,IDZastepcyWykonujacego
						,ZalacznikiOpis
						,ZalacznikiIlosc
						,KodKreskowy
						,Pismo_ZNosnikaDanych
						,Pismo_OdwzorowanoWCalosci
						,PismoEPUAP_Status
						,PismoEPUAP_Podmiot
						,PismoEPUAP_Skrzynka
						,PismoEPUAP_CzyDodanyKontrahent
						,ZamknijSprawe
						,StatusDanychKontrahenta
						,Oryginal_W
						,Przeczytano
						,DatePrzywroceniaZArchiwum
						,DotyczySprawy
						,TrescPisma
						,TrescPismaDane
						,IDJednostkiOrganizacyjnej
						,ObszarTematyczny
						,Dostep
						,Jezyk
						,Format
						,Typ
						,IDJRWA
						,IDPismaCRD
						,xDaneXML
						,IDJednostkiBazowe
						,FullTextSearch
						)
			VALUES ( src.IDPisma
					,src.IDSprawyG
					,src.NumerPisma
					,src.NumerKolejnyPismaWSprawie
					,src.UNP
					,src.IDJednostki
					,src.DataCzasWprowadzenia
					,src.PismoDotyczy
					,src.IDPismaNaKtoreJestOdpowiedzia
					,src.IDKierunkuPisma
					,src.IDSposobuObslugiPisma
					,src.MaksymalnaDataCzasOdpowiedzi
					,src.LiczbaGodzinDlaPowiadomienia
					,src.NumerPismaPrzychodzacego
					,src.DataWyslaniaPisma
					,src.DataCzasRozpatrzeniaPisma
					,src.DataCzasWygenerowaniaOdpowiedzi
					,src.DostepneDoOdczytu
					,src.DataWplynieciaOdpowiedzi
					,src.IDAutoraPisma
					,src.IDPionu
					,src.Adresat
					,src.DataCzasZaznaczeniaWyslania
					,src.SlowaKluczowe
					,src.IDStatusuPismaRoboczego
					,src.DekretacjaXML
					,src.NowaSprawaXML
					,src.NazwaDostawcy
					,src.LoginDostawcy
					,src.Slowniki
					,src.NrListuPoleconego
					,src.Archiwum
					,src.OsobaZanoszaca
					,src.IDPriorytetu
					,src.DataWplyniecia
					,src.IDTypuPisma
					,src.IDTypuFormularza
					,src.IDAkceptujacego
					,src.IdMetadaneObiektu
					,src.INT01
					,src.INT02
					,src.INT03
					,src.INT04
					,src.INT05
					,src.INT06
					,src.INT07
					,src.INT08
					,src.INT09
					,src.INT10
					,src.INT11
					,src.INT12
					,src.INT13
					,src.INT14
					,src.INT15
					,src.BIT01
					,src.BIT02
					,src.BIT03
					,src.BIT04
					,src.BIT05
					,src.BIT06
					,src.BIT07
					,src.BIT08
					,src.BIT09
					,src.BIT10
					,src.TXT01
					,src.TXT02
					,src.TXT03
					,src.TXT04
					,src.TXT05
					,src.TXT06
					,src.TXT07
					,src.TXT08
					,src.TXT09
					,src.TXT10
					,src.TXT11
					,src.TXT12
					,src.TXT13
					,src.TXT14
					,src.TXT15
					,src.Usuniete
					,src.DataOstatniejModyfikacji
					,src.WersjaElektroniczna
					,src.NumerPismaUnp
					,src.IDOryginalu
					,src.IDInstancji
					,src.IDAutoraOstatniejModyfikacji
					,src.Data01
					,src.Data02
					,src.Data03
					,src.Data04
					,src.Data05
					,src.Data06
					,src.DATA07
					,src.DATA08
					,src.DATA09
					,src.DATA10
					,src.DATA11
					,src.DATA12
					,src.DATA13
					,src.DATA14
					,src.DATA15
					,src.Kwota01
					,src.Kwota02
					,src.Kwota03
					,src.Kwota04
					,src.Kwota05
					,src.KWOTA06
					,src.KWOTA07
					,src.KWOTA08
					,src.KWOTA09
					,src.KWOTA10
					,src.KWOTA11
					,src.KWOTA12
					,src.KWOTA13
					,src.KWOTA14
					,src.KWOTA15
					,src.Liczba01
					,src.Liczba02
					,src.DaneXML
					,src.DataStemplaPocztowego
					,src.IDPoziomJawnosci
					,src.IdTypuLimitowanego
					,src.IDZastepcyWykonujacego
					,src.ZalacznikiOpis
					,src.ZalacznikiIlosc
					,src.KodKreskowy
					,src.Pismo_ZNosnikaDanych
					,src.Pismo_OdwzorowanoWCalosci
					,src.PismoEPUAP_Status
					,src.PismoEPUAP_Podmiot
					,src.PismoEPUAP_Skrzynka
					,src.PismoEPUAP_CzyDodanyKontrahent
					,src.ZamknijSprawe
					,src.StatusDanychKontrahenta
					,src.Oryginal_W
					,src.Przeczytano
					,src.DatePrzywroceniaZArchiwum
					,src.DotyczySprawy
					,src.TrescPisma
					,src.TrescPismaDane
					,src.IDJednostkiOrganizacyjnej
					,src.ObszarTematyczny
					,src.Dostep
					,src.Jezyk
					,src.Format
					,src.Typ
					,src.IDJRWA
					,src.IDPismaCRD
					,src.xDaneXML
					,src.IDJednostkiBazowe
					,src.FullTextSearch
					);
			SET @Merged = 1;
		END

		IF @TableName = 'Pismo_Historia' BEGIN
			MERGE INTO zef2.Pismo_Historia AS tgt
			USING WI_StageODS.zef2.Pismo_Historia AS src
			ON (tgt.[IDPisma_Historia]=src.[IDPisma_Historia])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[IDPisma]                            = src.[IDPisma]
				,tgt.[IDSprawyG]                          = src.[IDSprawyG]
				,tgt.[NumerPisma]                         = src.[NumerPisma]
				,tgt.[NumerKolejnyPismaWSprawie]          = src.[NumerKolejnyPismaWSprawie]
				,tgt.[UNP]                                = src.[UNP]
				,tgt.[IDJednostki]                        = src.[IDJednostki]
				,tgt.[DataCzasWprowadzenia]               = src.[DataCzasWprowadzenia]
				,tgt.[PismoDotyczy]                       = src.[PismoDotyczy]
				,tgt.[IDPismaNaKtoreJestOdpowiedzia]      = src.[IDPismaNaKtoreJestOdpowiedzia]
				,tgt.[IDKierunkuPisma]                    = src.[IDKierunkuPisma]
				,tgt.[IDSposobuObslugiPisma]              = src.[IDSposobuObslugiPisma]
				,tgt.[MaksymalnaDataCzasOdpowiedzi]       = src.[MaksymalnaDataCzasOdpowiedzi]
				,tgt.[LiczbaGodzinDlaPowiadomienia]       = src.[LiczbaGodzinDlaPowiadomienia]
				,tgt.[NumerPismaPrzychodzacego]           = src.[NumerPismaPrzychodzacego]
				,tgt.[DataWyslaniaPisma]                  = src.[DataWyslaniaPisma]
				,tgt.[DataCzasRozpatrzeniaPisma]          = src.[DataCzasRozpatrzeniaPisma]
				,tgt.[DataCzasWygenerowaniaOdpowiedzi]    = src.[DataCzasWygenerowaniaOdpowiedzi]
				,tgt.[DostepneDoOdczytu]                  = src.[DostepneDoOdczytu]
				,tgt.[DataWplynieciaOdpowiedzi]           = src.[DataWplynieciaOdpowiedzi]
				,tgt.[IDAutoraPisma]                      = src.[IDAutoraPisma]
				,tgt.[IDPionu]                            = src.[IDPionu]
				,tgt.[Adresat]                            = src.[Adresat]
				,tgt.[DataCzasZaznaczeniaWyslania]        = src.[DataCzasZaznaczeniaWyslania]
				,tgt.[SlowaKluczowe]                      = src.[SlowaKluczowe]
				,tgt.[IDStatusuPismaRoboczego]            = src.[IDStatusuPismaRoboczego]
				,tgt.[DekretacjaXML]                      = src.[DekretacjaXML]
				,tgt.[NazwaDostawcy]                      = src.[NazwaDostawcy]
				,tgt.[LoginDostawcy]                      = src.[LoginDostawcy]
				,tgt.[Slowniki]                           = src.[Slowniki]
				,tgt.[NrListuPoleconego]                  = src.[NrListuPoleconego]
				,tgt.[Archiwum]                           = src.[Archiwum]
				,tgt.[DataOd]                             = src.[DataOd]
				,tgt.[DataDo]                             = src.[DataDo]
				,tgt.[PoprzednieIDPisma_Historia]         = src.[PoprzednieIDPisma_Historia]
				,tgt.[OsobaZanoszaca]                     = src.[OsobaZanoszaca]
				,tgt.[IDPriorytetu]                       = src.[IDPriorytetu]
				,tgt.[DataWplyniecia]                     = src.[DataWplyniecia]
				,tgt.[IDTypuPisma]                        = src.[IDTypuPisma]
				,tgt.[IDTypuFormularza]                   = src.[IDTypuFormularza]
				,tgt.[IDAkceptujacego]                    = src.[IDAkceptujacego]
				,tgt.[INT01]                              = src.[INT01]
				,tgt.[INT02]                              = src.[INT02]
				,tgt.[INT03]                              = src.[INT03]
				,tgt.[INT04]                              = src.[INT04]
				,tgt.[INT05]                              = src.[INT05]
				,tgt.[INT06]                              = src.[INT06]
				,tgt.[INT07]                              = src.[INT07]
				,tgt.[INT08]                              = src.[INT08]
				,tgt.[INT09]                              = src.[INT09]
				,tgt.[INT10]                              = src.[INT10]
				,tgt.[INT11]                              = src.[INT11]
				,tgt.[INT12]                              = src.[INT12]
				,tgt.[INT13]                              = src.[INT13]
				,tgt.[INT14]                              = src.[INT14]
				,tgt.[INT15]                              = src.[INT15]
				,tgt.[BIT01]                              = src.[BIT01]
				,tgt.[BIT02]                              = src.[BIT02]
				,tgt.[BIT03]                              = src.[BIT03]
				,tgt.[BIT04]                              = src.[BIT04]
				,tgt.[BIT05]                              = src.[BIT05]
				,tgt.[BIT06]                              = src.[BIT06]
				,tgt.[BIT07]                              = src.[BIT07]
				,tgt.[BIT08]                              = src.[BIT08]
				,tgt.[BIT09]                              = src.[BIT09]
				,tgt.[BIT10]                              = src.[BIT10]
				,tgt.[TXT01]                              = src.[TXT01]
				,tgt.[TXT02]                              = src.[TXT02]
				,tgt.[TXT03]                              = src.[TXT03]
				,tgt.[TXT04]                              = src.[TXT04]
				,tgt.[TXT05]                              = src.[TXT05]
				,tgt.[TXT06]                              = src.[TXT06]
				,tgt.[TXT07]                              = src.[TXT07]
				,tgt.[TXT08]                              = src.[TXT08]
				,tgt.[TXT09]                              = src.[TXT09]
				,tgt.[TXT10]                              = src.[TXT10]
				,tgt.[TXT11]                              = src.[TXT11]
				,tgt.[TXT12]                              = src.[TXT12]
				,tgt.[TXT13]                              = src.[TXT13]
				,tgt.[TXT14]                              = src.[TXT14]
				,tgt.[TXT15]                              = src.[TXT15]
				,tgt.[Usuniete]                           = src.[Usuniete]
				,tgt.[IDAutoraOstatniejModyfikacji]       = src.[IDAutoraOstatniejModyfikacji]
				,tgt.[Data01]                             = src.[Data01]
				,tgt.[Data02]                             = src.[Data02]
				,tgt.[Data03]                             = src.[Data03]
				,tgt.[Data04]                             = src.[Data04]
				,tgt.[Data05]                             = src.[Data05]
				,tgt.[Data06]                             = src.[Data06]
				,tgt.[Kwota01]                            = src.[Kwota01]
				,tgt.[Kwota02]                            = src.[Kwota02]
				,tgt.[Kwota03]                            = src.[Kwota03]
				,tgt.[Kwota04]                            = src.[Kwota04]
				,tgt.[Kwota05]                            = src.[Kwota05]
				,tgt.[Liczba01]                           = src.[Liczba01]
				,tgt.[Liczba02]                           = src.[Liczba02]
				,tgt.[DataOstatniejModyfikacji]           = src.[DataOstatniejModyfikacji]
				,tgt.[WersjaElektroniczna]                = src.[WersjaElektroniczna]
				,tgt.[NumerPismaUnp]                      = src.[NumerPismaUnp]
				,tgt.[IDOryginalu]                        = src.[IDOryginalu]
				,tgt.[IDInstancji]                        = src.[IDInstancji]
				,tgt.[DataStemplaPocztowego]              = src.[DataStemplaPocztowego]
				,tgt.[IDPoziomJawnosci]                   = src.[IDPoziomJawnosci]
				,tgt.[IdTypuLimitowanego]                 = src.[IdTypuLimitowanego]
				,tgt.[ZalacznikiOpis]                     = src.[ZalacznikiOpis]
				,tgt.[ZalacznikiIlosc]                    = src.[ZalacznikiIlosc]
				,tgt.[KodKreskowy]                        = src.[KodKreskowy]
				,tgt.[Pismo_ZNosnikaDanych]               = src.[Pismo_ZNosnikaDanych]
				,tgt.[Pismo_OdwzorowanoWCalosci]          = src.[Pismo_OdwzorowanoWCalosci]
				,tgt.[PismoEPUAP_Status]                  = src.[PismoEPUAP_Status]
				,tgt.[PismoEPUAP_Podmiot]                 = src.[PismoEPUAP_Podmiot]
				,tgt.[PismoEPUAP_Skrzynka]                = src.[PismoEPUAP_Skrzynka]
				,tgt.[PismoEPUAP_CzyDodanyKontrahent]     = src.[PismoEPUAP_CzyDodanyKontrahent]
				,tgt.[StatusDanychKontrahenta]            = src.[StatusDanychKontrahenta]
				,tgt.[DaneXML]                            = src.[DaneXML]
				,tgt.[Oryginal_W]                         = src.[Oryginal_W]
				,tgt.[TrescPisma]                         = src.[TrescPisma]
				,tgt.[IDJednostkiOrganizacyjnej]          = src.[IDJednostkiOrganizacyjnej]
				,tgt.[ObszarTematyczny]                   = src.[ObszarTematyczny]
				,tgt.[Dostep]                             = src.[Dostep]
				,tgt.[Jezyk]                              = src.[Jezyk]
				,tgt.[Format]                             = src.[Format]
				,tgt.[Typ]                                = src.[Typ]
				,tgt.[IDJRWA]                             = src.[IDJRWA]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([IDPisma_Historia]
						,[IDPisma]
						,[IDSprawyG]
						,[NumerPisma]
						,[NumerKolejnyPismaWSprawie]
						,[UNP]
						,[IDJednostki]
						,[DataCzasWprowadzenia]
						,[PismoDotyczy]
						,[IDPismaNaKtoreJestOdpowiedzia]
						,[IDKierunkuPisma]
						,[IDSposobuObslugiPisma]
						,[MaksymalnaDataCzasOdpowiedzi]
						,[LiczbaGodzinDlaPowiadomienia]
						,[NumerPismaPrzychodzacego]
						,[DataWyslaniaPisma]
						,[DataCzasRozpatrzeniaPisma]
						,[DataCzasWygenerowaniaOdpowiedzi]
						,[DostepneDoOdczytu]
						,[DataWplynieciaOdpowiedzi]
						,[IDAutoraPisma]
						,[IDPionu]
						,[Adresat]
						,[DataCzasZaznaczeniaWyslania]
						,[SlowaKluczowe]
						,[IDStatusuPismaRoboczego]
						,[DekretacjaXML]
						,[NazwaDostawcy]
						,[LoginDostawcy]
						,[Slowniki]
						,[NrListuPoleconego]
						,[Archiwum]
						,[DataOd]
						,[DataDo]
						,[PoprzednieIDPisma_Historia]
						,[OsobaZanoszaca]
						,[IDPriorytetu]
						,[DataWplyniecia]
						,[IDTypuPisma]
						,[IDTypuFormularza]
						,[IDAkceptujacego]
						,[INT01]
						,[INT02]
						,[INT03]
						,[INT04]
						,[INT05]
						,[INT06]
						,[INT07]
						,[INT08]
						,[INT09]
						,[INT10]
						,[INT11]
						,[INT12]
						,[INT13]
						,[INT14]
						,[INT15]
						,[BIT01]
						,[BIT02]
						,[BIT03]
						,[BIT04]
						,[BIT05]
						,[BIT06]
						,[BIT07]
						,[BIT08]
						,[BIT09]
						,[BIT10]
						,[TXT01]
						,[TXT02]
						,[TXT03]
						,[TXT04]
						,[TXT05]
						,[TXT06]
						,[TXT07]
						,[TXT08]
						,[TXT09]
						,[TXT10]
						,[TXT11]
						,[TXT12]
						,[TXT13]
						,[TXT14]
						,[TXT15]
						,[Usuniete]
						,[IDAutoraOstatniejModyfikacji]
						,[Data01]
						,[Data02]
						,[Data03]
						,[Data04]
						,[Data05]
						,[Data06]
						,[Kwota01]
						,[Kwota02]
						,[Kwota03]
						,[Kwota04]
						,[Kwota05]
						,[Liczba01]
						,[Liczba02]
						,[DataOstatniejModyfikacji]
						,[WersjaElektroniczna]
						,[NumerPismaUnp]
						,[IDOryginalu]
						,[IDInstancji]
						,[DataStemplaPocztowego]
						,[IDPoziomJawnosci]
						,[IdTypuLimitowanego]
						,[ZalacznikiOpis]
						,[ZalacznikiIlosc]
						,[KodKreskowy]
						,[Pismo_ZNosnikaDanych]
						,[Pismo_OdwzorowanoWCalosci]
						,[PismoEPUAP_Status]
						,[PismoEPUAP_Podmiot]
						,[PismoEPUAP_Skrzynka]
						,[PismoEPUAP_CzyDodanyKontrahent]
						,[StatusDanychKontrahenta]
						,[DaneXML]
						,[Oryginal_W]
						,[TrescPisma]
						,[IDJednostkiOrganizacyjnej]
						,[ObszarTematyczny]
						,[Dostep]
						,[Jezyk]
						,[Format]
						,[Typ]
						,[IDJRWA])
			VALUES ( src.[IDPisma_Historia]
					,src.[IDPisma]
					,src.[IDSprawyG]
					,src.[NumerPisma]
					,src.[NumerKolejnyPismaWSprawie]
					,src.[UNP]
					,src.[IDJednostki]
					,src.[DataCzasWprowadzenia]
					,src.[PismoDotyczy]
					,src.[IDPismaNaKtoreJestOdpowiedzia]
					,src.[IDKierunkuPisma]
					,src.[IDSposobuObslugiPisma]
					,src.[MaksymalnaDataCzasOdpowiedzi]
					,src.[LiczbaGodzinDlaPowiadomienia]
					,src.[NumerPismaPrzychodzacego]
					,src.[DataWyslaniaPisma]
					,src.[DataCzasRozpatrzeniaPisma]
					,src.[DataCzasWygenerowaniaOdpowiedzi]
					,src.[DostepneDoOdczytu]
					,src.[DataWplynieciaOdpowiedzi]
					,src.[IDAutoraPisma]
					,src.[IDPionu]
					,src.[Adresat]
					,src.[DataCzasZaznaczeniaWyslania]
					,src.[SlowaKluczowe]
					,src.[IDStatusuPismaRoboczego]
					,src.[DekretacjaXML]
					,src.[NazwaDostawcy]
					,src.[LoginDostawcy]
					,src.[Slowniki]
					,src.[NrListuPoleconego]
					,src.[Archiwum]
					,src.[DataOd]
					,src.[DataDo]
					,src.[PoprzednieIDPisma_Historia]
					,src.[OsobaZanoszaca]
					,src.[IDPriorytetu]
					,src.[DataWplyniecia]
					,src.[IDTypuPisma]
					,src.[IDTypuFormularza]
					,src.[IDAkceptujacego]
					,src.[INT01]
					,src.[INT02]
					,src.[INT03]
					,src.[INT04]
					,src.[INT05]
					,src.[INT06]
					,src.[INT07]
					,src.[INT08]
					,src.[INT09]
					,src.[INT10]
					,src.[INT11]
					,src.[INT12]
					,src.[INT13]
					,src.[INT14]
					,src.[INT15]
					,src.[BIT01]
					,src.[BIT02]
					,src.[BIT03]
					,src.[BIT04]
					,src.[BIT05]
					,src.[BIT06]
					,src.[BIT07]
					,src.[BIT08]
					,src.[BIT09]
					,src.[BIT10]
					,src.[TXT01]
					,src.[TXT02]
					,src.[TXT03]
					,src.[TXT04]
					,src.[TXT05]
					,src.[TXT06]
					,src.[TXT07]
					,src.[TXT08]
					,src.[TXT09]
					,src.[TXT10]
					,src.[TXT11]
					,src.[TXT12]
					,src.[TXT13]
					,src.[TXT14]
					,src.[TXT15]
					,src.[Usuniete]
					,src.[IDAutoraOstatniejModyfikacji]
					,src.[Data01]
					,src.[Data02]
					,src.[Data03]
					,src.[Data04]
					,src.[Data05]
					,src.[Data06]
					,src.[Kwota01]
					,src.[Kwota02]
					,src.[Kwota03]
					,src.[Kwota04]
					,src.[Kwota05]
					,src.[Liczba01]
					,src.[Liczba02]
					,src.[DataOstatniejModyfikacji]
					,src.[WersjaElektroniczna]
					,src.[NumerPismaUnp]
					,src.[IDOryginalu]
					,src.[IDInstancji]
					,src.[DataStemplaPocztowego]
					,src.[IDPoziomJawnosci]
					,src.[IdTypuLimitowanego]
					,src.[ZalacznikiOpis]
					,src.[ZalacznikiIlosc]
					,src.[KodKreskowy]
					,src.[Pismo_ZNosnikaDanych]
					,src.[Pismo_OdwzorowanoWCalosci]
					,src.[PismoEPUAP_Status]
					,src.[PismoEPUAP_Podmiot]
					,src.[PismoEPUAP_Skrzynka]
					,src.[PismoEPUAP_CzyDodanyKontrahent]
					,src.[StatusDanychKontrahenta]
					,src.[DaneXML]
					,src.[Oryginal_W]
					,src.[TrescPisma]
					,src.[IDJednostkiOrganizacyjnej]
					,src.[ObszarTematyczny]
					,src.[Dostep]
					,src.[Jezyk]
					,src.[Format]
					,src.[Typ]
					,src.[IDJRWA]);
			SET @Merged = 1;
		END

		IF @TableName = 'Pismo_XML' BEGIN
			MERGE INTO zef2.Pismo_XML AS tgt
			USING WI_StageODS.zef2.Pismo_XML AS src
			ON (tgt.[ID_Pismo_xml]=src.[ID_Pismo_xml]) AND (tgt.[DataArch]=src.[DataArch])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[IDPisma]       = src.[IDPisma]
				,tgt.[DaneXML]       = src.[DaneXML]
				,tgt.[xDaneXML]      = src.[xDaneXML]
				,tgt.[DataDanych]    = src.[DataDanych]
				,tgt.[DataArch]      = src.[DataArch]
				,tgt.[ProcName]		 = src.[ProcName]	
				,tgt.[uid]           = src.[uid]
				,tgt.[DataZlozeniaDeklaracji] = src.[DataZlozeniaDeklaracji]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([IDPisma]
						,[DaneXML]
						,[xDaneXML]
						,[DataDanych]
						,[DataArch]
						,[ProcName]
						,[uid]
						,[DataZlozeniaDeklaracji]
						,[ID_Pismo_xml])
			VALUES ( src.[IDPisma]
					,src.[DaneXML]
					,src.[xDaneXML]
					,src.[DataDanych]
					,src.[DataArch]
					,src.[ProcName]
					,src.[uid]
					,src.[DataZlozeniaDeklaracji]
					,src.[ID_Pismo_xml]);
			SET @Merged = 1;
		END

		IF @TableName = 'Pismo_XML_Historia' BEGIN
			MERGE INTO zef2.Pismo_XML_Historia AS tgt
			USING WI_StageODS.zef2.Pismo_XML_Historia AS src
			ON (tgt.[IDPismaXML_Historia]=src.[IDPismaXML_Historia]) AND (tgt.[DataArch]=src.[DataArch])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[DataOd]                         = src.[DataOd]
				,tgt.[DataDo]                         = src.[DataDo]
				,tgt.[PoprzednieIDPismaXML_Historia]  = src.[PoprzednieIDPismaXML_Historia]
				,tgt.[IDPisma]                        = src.[IDPisma]
				--,tgt.[DaneXML]                        = src.[DaneXML]
				,tgt.[xDaneXML]                       = src.[xDaneXML]
				,tgt.[DataDanych]                     = src.[DataDanych]
				,tgt.[DataArch]                       = src.[DataArch]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([IDPismaXML_Historia]
						,[DataOd]
						,[DataDo]
						,[PoprzednieIDPismaXML_Historia]
						,[IDPisma]
						--,[DaneXML]
						,[xDaneXML]
						,[DataDanych]
						,[DataArch])
			VALUES ( src.[IDPismaXML_Historia]
					,src.[DataOd]
					,src.[DataDo]
					,src.[PoprzednieIDPismaXML_Historia]
					,src.[IDPisma]
					--,src.[DaneXML]
					,src.[xDaneXML]
					,src.[DataDanych]
					,src.[DataArch]);
			SET @Merged = 1;
		END

		IF @TableName = 'Dedykowane_OpisyStatusow' BEGIN
			MERGE INTO zef2.Dedykowane_OpisyStatusow AS tgt
			USING WI_StageODS.zef2.Dedykowane_OpisyStatusow AS src
			ON (tgt.[ID_Dedykowane_OpisyStatusow]=src.[ID_Dedykowane_OpisyStatusow])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				tgt.[IDStatusu] = src.[IDStatusu]
			   ,tgt.[Opis]		= src.[Opis]
			   ,tgt.[IDKierunkuPisma] = src.[IDKierunkuPisma]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ( [IDKierunkuPisma]
						 ,[IDStatusu]
						 ,[Opis]
						 ,[ID_Dedykowane_OpisyStatusow]
						)
			VALUES ( src.[IDKierunkuPisma]
					,src.[IDStatusu]
					,src.[Opis]
					,src.[ID_Dedykowane_OpisyStatusow]
			);
			SET @Merged = 1;
		END

		IF @TableName = 'Komorka' BEGIN
			MERGE INTO zef2.Komorka AS tgt
			USING WI_StageODS.zef2.Komorka AS src
			ON (tgt.[IDKomorki]=src.[IDKomorki])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[NazwaKomorki]             = src.[NazwaKomorki]
				,tgt.[IDTypuKomorki]            = src.[IDTypuKomorki]
				,tgt.[IDKomorkiNadrzednej]      = src.[IDKomorkiNadrzednej]
				,tgt.[IDSzefa]                  = src.[IDSzefa]
				,tgt.[Sciezka]                  = src.[Sciezka]
				,tgt.[IDOsobyDomyslnej]         = src.[IDOsobyDomyslnej]
				,tgt.[KodKomorki]               = src.[KodKomorki]
				,tgt.[Aktywna]                  = src.[Aktywna]
				,tgt.[IDSposobuObslugiPismaP]   = src.[IDSposobuObslugiPismaP]
				,tgt.[KodKomorkiZnak]           = src.[KodKomorkiZnak]
				,tgt.[TylkoSzef]                = src.[TylkoSzef]
				,tgt.[Opis]                     = src.[Opis]
				,tgt.[IdKomorkiKancelaria]      = src.[IdKomorkiKancelaria]
				,tgt.[IDJednostkiOrganizacyjnej]= src.[IDJednostkiOrganizacyjnej]
				,tgt.[IdMetadaneObiektu]        = src.[IdMetadaneObiektu]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([IDKomorki]
						,[NazwaKomorki]
						,[IDTypuKomorki]
						,[IDKomorkiNadrzednej]
						,[IDSzefa]
						,[Sciezka]
						,[IDOsobyDomyslnej]
						,[KodKomorki]
						,[Aktywna]
						,[IDSposobuObslugiPismaP]
						,[KodKomorkiZnak]
						,[TylkoSzef]
						,[Opis]
						,[IdKomorkiKancelaria]
						,[IDJednostkiOrganizacyjnej]
						,[IdMetadaneObiektu]
						)
			VALUES ( src.[IDKomorki]
					,src.[NazwaKomorki]
					,src.[IDTypuKomorki]
					,src.[IDKomorkiNadrzednej]
					,src.[IDSzefa]
					,src.[Sciezka]
					,src.[IDOsobyDomyslnej]
					,src.[KodKomorki]
					,src.[Aktywna]
					,src.[IDSposobuObslugiPismaP]
					,src.[KodKomorkiZnak]
					,src.[TylkoSzef]
					,src.[Opis]
					,src.[IdKomorkiKancelaria]
					,src.[IDJednostkiOrganizacyjnej]
					,src.[IdMetadaneObiektu]
					);
			SET @Merged = 1;
		END

		IF @TableName = 'Pracownik' BEGIN
			MERGE INTO zef2.Pracownik AS tgt
			USING WI_StageODS.zef2.Pracownik AS src
			ON (tgt.[IDPracownika]=src.[IDPracownika])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[Login]                           = src.[Login]
				,tgt.[Imie]                            = src.[Imie]
				,tgt.[Nazwisko]                        = src.[Nazwisko]
				,tgt.[Inicjaly]                        = src.[Inicjaly]
				,tgt.[NumerTelefonu]                   = src.[NumerTelefonu]
				,tgt.[NumerFaksu]                      = src.[NumerFaksu]
				,tgt.[EMail]                           = src.[EMail]
				,tgt.[IDKomorki]                       = src.[IDKomorki]
				,tgt.[IDKomorkiZatrudnienia]           = src.[IDKomorkiZatrudnienia]
				,tgt.[IDStanowiska]                    = src.[IDStanowiska]
				,tgt.[IDPrzelozonego]                  = src.[IDPrzelozonego]
				,tgt.[IDPionu]                         = src.[IDPionu]
				,tgt.[Aktywny]                         = src.[Aktywny]
				,tgt.[Skaner]                          = src.[Skaner]
				,tgt.[ZakresUpowaznieniaDO]            = src.[ZakresUpowaznieniaDO]
				,tgt.[AkceptacjaPrzezSekretariat]      = src.[AkceptacjaPrzezSekretariat]
				,tgt.[Koszyk]                          = src.[Koszyk]
				,tgt.[Archiwista]                      = src.[Archiwista]
				,tgt.[AkceptacjaPIN]                   = src.[AkceptacjaPIN]
				,tgt.[CzyAktAD]                        = src.[CzyAktAD]
				,tgt.[IDJednostkiOrganizacyjnej]       = src.[IDJednostkiOrganizacyjnej]
				,tgt.[LiderZespolu]                    = src.[LiderZespolu]
				,tgt.[PrMer]                           = src.[PrMer]
				,tgt.[DataOd]                          = src.[DataOd]
				,tgt.[DataDo]                          = src.[DataDo]
				,tgt.[IdMetadaneObiektu]               = src.[IdMetadaneObiektu]
				,tgt.[UrzadMiastoWydaniaDecyzji]       = src.[UrzadMiastoWydaniaDecyzji]
				,tgt.[UrzadMiejsceWydaniaDecyzji]      = src.[UrzadMiejsceWydaniaDecyzji]
				,tgt.[UrzadAdresJednostkaUlica]        = src.[UrzadAdresJednostkaUlica]
				,tgt.[UrzadAdresJednostkaKodPocztowy]  = src.[UrzadAdresJednostkaKodPocztowy]
				,tgt.[UrzadAdresJednostkaMiasto]       = src.[UrzadAdresJednostkaMiasto]
				,tgt.[UrzadAdresJednostkaNrDomu]       = src.[UrzadAdresJednostkaNrDomu]
				,tgt.[UrzadAdresJednostkaNrLokalu]     = src.[UrzadAdresJednostkaNrLokalu]
				,tgt.[UrzadMiejcePracyUlica]           = src.[UrzadMiejcePracyUlica]
				,tgt.[UrzadMiejcePracyKodPocztowy]     = src.[UrzadMiejcePracyKodPocztowy]
				,tgt.[UrzadMiejcePracyMiasto]          = src.[UrzadMiejcePracyMiasto]
				,tgt.[UrzadMiejcePracyNrDomu]          = src.[UrzadMiejcePracyNrDomu]
				,tgt.[UrzadMiejcePracyNrLokalu]        = src.[UrzadMiejcePracyNrLokalu]
				,tgt.[UrzadStrona]                     = src.[UrzadStrona]
				,tgt.[UrzadFax]                        = src.[UrzadFax]
				,tgt.[UrzadTelefon]                    = src.[UrzadTelefon]
				,tgt.[UrzadEmail]                      = src.[UrzadEmail]
				,tgt.[UrzadInfo]                       = src.[UrzadInfo]
				,tgt.[PodstawaPrawna]                  = src.[PodstawaPrawna]
				,tgt.[OdNiniejszejDecyzji]             = src.[OdNiniejszejDecyzji]
				,tgt.[Rozdzielnik]                     = src.[Rozdzielnik]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([IDPracownika]
						,[Login]
						,[Imie]
						,[Nazwisko]
						,[Inicjaly]
						,[NumerTelefonu]
						,[NumerFaksu]
						,[EMail]
						,[IDKomorki]
						,[IDKomorkiZatrudnienia]
						,[IDStanowiska]
						,[IDPrzelozonego]
						,[IDPionu]
						,[Aktywny]
						,[Skaner]
						,[ZakresUpowaznieniaDO]
						,[AkceptacjaPrzezSekretariat]
						,[Koszyk]
						,[Archiwista]
						,[AkceptacjaPIN]
						,[CzyAktAD]
						,[IDJednostkiOrganizacyjnej]
						,[LiderZespolu]
						,[PrMer]
						,[DataOd]
						,[DataDo]
						,[IdMetadaneObiektu]
						,[UrzadMiastoWydaniaDecyzji]
						,[UrzadMiejsceWydaniaDecyzji]
						,[UrzadAdresJednostkaUlica]
						,[UrzadAdresJednostkaKodPocztowy]
						,[UrzadAdresJednostkaMiasto]
						,[UrzadAdresJednostkaNrDomu]
						,[UrzadAdresJednostkaNrLokalu]
						,[UrzadMiejcePracyUlica]
						,[UrzadMiejcePracyKodPocztowy]
						,[UrzadMiejcePracyMiasto]
						,[UrzadMiejcePracyNrDomu]
						,[UrzadMiejcePracyNrLokalu]
						,[UrzadStrona]
						,[UrzadFax]
						,[UrzadTelefon]
						,[UrzadEmail]
						,[UrzadInfo]
						,[PodstawaPrawna]
						,[OdNiniejszejDecyzji]
						,[Rozdzielnik]
						)
			VALUES ( src.[IDPracownika]
					,src.[Login]
					,src.[Imie]
					,src.[Nazwisko]
					,src.[Inicjaly]
					,src.[NumerTelefonu]
					,src.[NumerFaksu]
					,src.[EMail]
					,src.[IDKomorki]
					,src.[IDKomorkiZatrudnienia]
					,src.[IDStanowiska]
					,src.[IDPrzelozonego]
					,src.[IDPionu]
					,src.[Aktywny]
					,src.[Skaner]
					,src.[ZakresUpowaznieniaDO]
					,src.[AkceptacjaPrzezSekretariat]
					,src.[Koszyk]
					,src.[Archiwista]
					,src.[AkceptacjaPIN]
					,src.[CzyAktAD]
					,src.[IDJednostkiOrganizacyjnej]
					,src.[LiderZespolu]
					,src.[PrMer]
					,src.[DataOd]
					,src.[DataDo]
					,src.[IdMetadaneObiektu]
					,src.[UrzadMiastoWydaniaDecyzji]
					,src.[UrzadMiejsceWydaniaDecyzji]
					,src.[UrzadAdresJednostkaUlica]
					,src.[UrzadAdresJednostkaKodPocztowy]
					,src.[UrzadAdresJednostkaMiasto]
					,src.[UrzadAdresJednostkaNrDomu]
					,src.[UrzadAdresJednostkaNrLokalu]
					,src.[UrzadMiejcePracyUlica]
					,src.[UrzadMiejcePracyKodPocztowy]
					,src.[UrzadMiejcePracyMiasto]
					,src.[UrzadMiejcePracyNrDomu]
					,src.[UrzadMiejcePracyNrLokalu]
					,src.[UrzadStrona]
					,src.[UrzadFax]
					,src.[UrzadTelefon]
					,src.[UrzadEmail]
					,src.[UrzadInfo]
					,src.[PodstawaPrawna]
					,src.[OdNiniejszejDecyzji]
					,src.[Rozdzielnik]);
			SET @Merged = 1;
		END

		IF @TableName = 'Priorytet' BEGIN
			MERGE INTO zef2.Priorytet AS tgt
			USING WI_StageODS.zef2.Priorytet AS src
			ON (tgt.[IDPriorytetu]=src.[IDPriorytetu])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
			   tgt.[Nazwa] = src.[Nazwa]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([IDPriorytetu]
						,[Nazwa])
			VALUES (src.[IDPriorytetu]
				   ,src.[Nazwa]);
			SET @Merged = 1;
		END

		IF @TableName = 'KierunekPisma' BEGIN
			MERGE INTO zef2.KierunekPisma AS tgt
			USING WI_StageODS.zef2.KierunekPisma AS src
			ON (tgt.[IDKierunkuPisma]=src.[IDKierunkuPisma])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[KierunekPisma]   = src.[KierunekPisma]
				,tgt.[UrlNowe]         = src.[UrlNowe]
				,tgt.[UrlSzczegoly]    = src.[UrlSzczegoly]
				,tgt.[UrlWyszukiwanie] = src.[UrlWyszukiwanie]
				,tgt.[Mapowanie]       = src.[Mapowanie]
				,tgt.[Aktywny]         = src.[Aktywny]
				,tgt.[Symbol]          = src.[Symbol]
				,tgt.[IDTypuPisma]     = src.[IDTypuPisma]
				,tgt.[IDGrupy]         = src.[IDGrupy]
				,tgt.[UrlEdycja]       = src.[UrlEdycja]
				,tgt.[Opis]            = src.[Opis]
				,tgt.[WObsluzonych]    = src.[WObsluzonych]
				,tgt.[czyCOW]          = src.[czyCOW]
				,tgt.[czyCR]           = src.[czyCR]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([IDKierunkuPisma]
						,[KierunekPisma]
						,[UrlNowe]
						,[UrlSzczegoly]
						,[UrlWyszukiwanie]
						,[Mapowanie]
						,[Aktywny]
						,[Symbol]
						,[IDTypuPisma]
						,[IDGrupy]
						,[UrlEdycja]
						,[Opis]
						,[WObsluzonych]
						,[czyCOW]
						,[czyCR])
			VALUES ( src.[IDKierunkuPisma]
					,src.[KierunekPisma]
					,src.[UrlNowe]
					,src.[UrlSzczegoly]
					,src.[UrlWyszukiwanie]
					,src.[Mapowanie]
					,src.[Aktywny]
					,src.[Symbol]
					,src.[IDTypuPisma]
					,src.[IDGrupy]
					,src.[UrlEdycja]
					,src.[Opis]
					,src.[WObsluzonych]
					,src.[czyCOW]
					,src.[czyCR]);
			SET @Merged = 1;
		END

		IF @TableName = 'rodzaj_deklaracji' BEGIN
			MERGE INTO zef2.rodzaj_deklaracji AS tgt
			USING WI_StageODS.zef2.rodzaj_deklaracji AS src
			ON (tgt.[idTech]=src.[idTech])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[TXT01]       = src.[TXT01]
				,tgt.[TXT02]       = src.[TXT02]
				,tgt.[dateFrom]    = src.[dateFrom]
				,tgt.[dateTo]      = src.[dateTo]
				,tgt.[deleted]     = src.[deleted]
				,tgt.[description] = src.[description]
				,tgt.[idBiz]       = src.[idBiz]
				,tgt.[idBizParent] = src.[idBizParent]
				,tgt.[name]        = src.[name]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([idTech]
						,[TXT01]
						,[TXT02]
						,[dateFrom]
						,[dateTo]
						,[deleted]
						,[description]
						,[idBiz]
						,[idBizParent]
						,[name])
			VALUES ( src.[idTech]
					,src.[TXT01]
					,src.[TXT02]
					,src.[dateFrom]
					,src.[dateTo]
					,src.[deleted]
					,src.[description]
					,src.[idBiz]
					,src.[idBizParent]
					,src.[name]);
			SET @Merged = 1;
		END
		
		IF @TableName = 'formy' BEGIN
			MERGE INTO zef2.formy AS tgt
			USING WI_StageODS.zef2.formy AS src
			ON (tgt.[idTech]=src.[idTech])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[TXT01]       = src.[TXT01]
				,tgt.[TXT02]       = src.[TXT02]
				,tgt.[dateFrom]    = src.[dateFrom]
				,tgt.[dateTo]      = src.[dateTo]
				,tgt.[deleted]     = src.[deleted]
				,tgt.[description] = src.[description]
				,tgt.[idBiz]       = src.[idBiz]
				,tgt.[idBizParent] = src.[idBizParent]
				,tgt.[name]        = src.[name]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([idTech]
						,[TXT01]
						,[TXT02]
						,[dateFrom]
						,[dateTo]
						,[deleted]
						,[description]
						,[idBiz]
						,[idBizParent]
						,[name])
			VALUES ( src.[idTech]
					,src.[TXT01]
					,src.[TXT02]
					,src.[dateFrom]
					,src.[dateTo]
					,src.[deleted]
					,src.[description]
					,src.[idBiz]
					,src.[idBizParent]
					,src.[name]);
			SET @Merged = 1;
		END

		IF @TableName = 'PismoPowiazane' BEGIN
			MERGE INTO zef2.PismoPowiazane AS tgt
			USING WI_StageODS.zef2.PismoPowiazane AS src
			ON (tgt.[IDPismoPowiazane]=src.[IDPismoPowiazane])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
			   tgt.[IDPisma] = src.[IDPisma]
			   ,tgt.[IDPismaPowiazanego] = src.[IDPismaPowiazanego]
			   ,tgt.[IDTypuPowiazania] = src.[IDTypuPowiazania]
			   ,tgt.[DataWiazania] = src.[DataWiazania]
			   ,tgt.[Notatka] = src.[Notatka]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([IDPismoPowiazane]
						,[IDPisma]
						,[IDPismaPowiazanego]
						,[IDTypuPowiazania]
						,[DataWiazania]
						,[Notatka])						
			VALUES (src.[IDPismoPowiazane]
				   ,src.[IDPisma]
				   ,src.[IDPismaPowiazanego]
				   ,src.[IDTypuPowiazania]				   
				   ,src.[DataWiazania]
				   ,src.[Notatka]);
			SET @Merged = 1;
		END


		
		IF @TableName = 'TypPowiazania' BEGIN
			MERGE INTO zef2.TypPowiazania AS tgt
			USING WI_StageODS.zef2.TypPowiazania AS src
			ON (tgt.[IDTypuPowiazania]=src.[IDTypuPowiazania])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
			   tgt.[NazwaTypuPowiazania] = src.[NazwaTypuPowiazania]
			   ,tgt.[NazwaTypuPowiazaniaTekst2] = src.[NazwaTypuPowiazaniaTekst2]
			   ,tgt.[CzyUzytkownikModyfikacja] = src.[CzyUzytkownikModyfikacja]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([IDTypuPowiazania]
						,[NazwaTypuPowiazania]
						,[NazwaTypuPowiazaniaTekst2]
						,[CzyUzytkownikModyfikacja]						
						)
			VALUES (src.[IDTypuPowiazania]
				   ,src.[NazwaTypuPowiazania]
				   ,src.[NazwaTypuPowiazaniaTekst2]
				   ,src.[CzyUzytkownikModyfikacja]);
			SET @Merged = 1;
		END
			
		-- SK
		IF @TableName = 'KPfinstatementTable' BEGIN
			MERGE INTO zef2.KPfinstatementTable AS tgt
			USING WI_StageODS.zef2.KPfinstatementTable AS src
			ON (tgt.[RECID]=src.[RECID])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[OPERATIONDATE]                   = src.[OPERATIONDATE]
				,tgt.[FINSTATEMENTID]                  = src.[FINSTATEMENTID]
				,tgt.[DESCRIPTION]                     = src.[DESCRIPTION]
				,tgt.[VOUCHER]                         = src.[VOUCHER]
				,tgt.[POSTED]                          = src.[POSTED]
				,tgt.[FINSTATEMENTTYPE]                = src.[FINSTATEMENTTYPE]
				,tgt.[DISPOSERNUM]                     = src.[DISPOSERNUM]
				,tgt.[FINSTATEMENTSEQID]               = src.[FINSTATEMENTSEQID]
				,tgt.[REFFINANCIALOPERATIONID]         = src.[REFFINANCIALOPERATIONID]
				,tgt.[VOUCHERSEQID]                    = src.[VOUCHERSEQID]
				,tgt.[OFFSETPOSTINGPROFILE]            = src.[OFFSETPOSTINGPROFILE]
				,tgt.[SUBUNITID]                       = src.[SUBUNITID]
				,tgt.[NOTES]                           = src.[NOTES]
				,tgt.[SUMMARY]                         = src.[SUMMARY]
				,tgt.[XMLSUBDOCUMENT]                  = src.[XMLSUBDOCUMENT]
				,tgt.[VERSIONONDATE]                   = src.[VERSIONONDATE]
				,tgt.[FINSTATEMENTDEF_FK]              = src.[FINSTATEMENTDEF_FK]
				,tgt.[ORGANIZATIONUNIT_FK]             = src.[ORGANIZATIONUNIT_FK]
				,tgt.[STATUS]                          = src.[STATUS]
				,tgt.[STATUSNAMEID]                    = src.[STATUSNAMEID]
				,tgt.[FINSTATEMENTTABLEPARENT_FK]      = src.[FINSTATEMENTTABLEPARENT_FK]
				,tgt.[ISAGGREGATE]                     = src.[ISAGGREGATE]
				,tgt.[SENTTOPARENTUNIT]                = src.[SENTTOPARENTUNIT]
				,tgt.[APPROVED]                        = src.[APPROVED]
				,tgt.[AGGRFINSTATEMENTIDPATH]          = src.[AGGRFINSTATEMENTIDPATH]
				,tgt.[PART]                            = src.[PART]
				,tgt.[ISGENERATED]                     = src.[ISGENERATED]
				,tgt.[LEVEL_]                          = src.[LEVEL_]
				,tgt.[AGGRLEVEL]                       = src.[AGGRLEVEL]
				,tgt.[RECIPIENT]                       = src.[RECIPIENT]
				,tgt.[RECEIVED]                        = src.[RECEIVED]
				,tgt.[CANCELLED]                       = src.[CANCELLED]
				,tgt.[FINSTATEMENTTYPEDEF_FK]          = src.[FINSTATEMENTTYPEDEF_FK]
				,tgt.[EXPLANATION]                     = src.[EXPLANATION]
				,tgt.[MODIFIEDDATETIME]                = src.[MODIFIEDDATETIME]
				,tgt.[MODIFIEDBY]                      = src.[MODIFIEDBY]
				,tgt.[MODIFIEDTRANSACTIONID]           = src.[MODIFIEDTRANSACTIONID]
				,tgt.[CREATEDDATETIME]                 = src.[CREATEDDATETIME]
				,tgt.[CREATEDBY]                       = src.[CREATEDBY]
				,tgt.[CREATEDTRANSACTIONID]            = src.[CREATEDTRANSACTIONID]
				,tgt.[RECVERSION]                      = src.[RECVERSION]
				,tgt.[PARTITION]                       = src.[PARTITION]
				,tgt.[FINSTATEMENTTABLECANCELLED_FK]   = src.[FINSTATEMENTTABLECANCELLED_FK]
				,tgt.[SENDDATE]                        = src.[SENDDATE]
				,tgt.[GENERATEDDATETIME]               = src.[GENERATEDDATETIME]
				,tgt.[GENERATEDDATETIMETZID]           = src.[GENERATEDDATETIMETZID]
				,tgt.[POSTEDDATETIME]                  = src.[POSTEDDATETIME]
				,tgt.[POSTEDDATETIMETZID]              = src.[POSTEDDATETIMETZID]
				,tgt.[REVERSED]                        = src.[REVERSED]
				,tgt.[REVERSEDDATETIME]                = src.[REVERSEDDATETIME]
				,tgt.[REVERSEDDATETIMETZID]            = src.[REVERSEDDATETIMETZID]
				,tgt.[REVERSEDBY]                      = src.[REVERSEDBY]
				,tgt.[VOUCHERREVERSE]					= src.[VOUCHERREVERSE]
				,tgt.[TREZORPROCESSCODE]				= src.[TREZORPROCESSCODE]
				,tgt.[TREZORENTITYTYPE]					= src.[TREZORENTITYTYPE]
				,tgt.[TREZORENTITYID]					= src.[TREZORENTITYID]
				,tgt.[TREZORCUSTOMVERSIONKEYCOMP]		= src.[TREZORCUSTOMVERSIONKEYCOMP]
				,tgt.[TREZORXML]						= src.[TREZORXML]
				,tgt.[STATUSTREZOR]						= src.[STATUSTREZOR]

			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([OPERATIONDATE]
						,[FINSTATEMENTID]
						,[DESCRIPTION]
						,[VOUCHER]
						,[POSTED]
						,[FINSTATEMENTTYPE]
						,[DISPOSERNUM]
						,[FINSTATEMENTSEQID]
						,[REFFINANCIALOPERATIONID]
						,[VOUCHERSEQID]
						,[OFFSETPOSTINGPROFILE]
						,[SUBUNITID]
						,[NOTES]
						,[SUMMARY]
						,[XMLSUBDOCUMENT]
						,[VERSIONONDATE]
						,[FINSTATEMENTDEF_FK]
						,[ORGANIZATIONUNIT_FK]
						,[STATUS]
						,[STATUSNAMEID]
						,[FINSTATEMENTTABLEPARENT_FK]
						,[ISAGGREGATE]
						,[SENTTOPARENTUNIT]
						,[APPROVED]
						,[AGGRFINSTATEMENTIDPATH]
						,[PART]
						,[ISGENERATED]
						,[LEVEL_]
						,[AGGRLEVEL]
						,[RECIPIENT]
						,[RECEIVED]
						,[CANCELLED]
						,[FINSTATEMENTTYPEDEF_FK]
						,[EXPLANATION]
						,[MODIFIEDDATETIME]
						,[MODIFIEDBY]
						,[MODIFIEDTRANSACTIONID]
						,[CREATEDDATETIME]
						,[CREATEDBY]
						,[CREATEDTRANSACTIONID]
						,[RECVERSION]
						,[PARTITION]
						,[RECID]
						,[FINSTATEMENTTABLECANCELLED_FK]
						,[SENDDATE]
						,[GENERATEDDATETIME]
						,[GENERATEDDATETIMETZID]
						,[POSTEDDATETIME]
						,[POSTEDDATETIMETZID]
						,[REVERSED]
						,[REVERSEDDATETIME]
						,[REVERSEDDATETIMETZID]
						,[REVERSEDBY]
						,[VOUCHERREVERSE]
						,[TREZORPROCESSCODE]
						,[TREZORENTITYTYPE]
						,[TREZORENTITYID]
						,[TREZORCUSTOMVERSIONKEYCOMP]
						,[TREZORXML]
						,[STATUSTREZOR])
			VALUES ( src.[OPERATIONDATE]
					,src.[FINSTATEMENTID]
					,src.[DESCRIPTION]
					,src.[VOUCHER]
					,src.[POSTED]
					,src.[FINSTATEMENTTYPE]
					,src.[DISPOSERNUM]
					,src.[FINSTATEMENTSEQID]
					,src.[REFFINANCIALOPERATIONID]
					,src.[VOUCHERSEQID]
					,src.[OFFSETPOSTINGPROFILE]
					,src.[SUBUNITID]
					,src.[NOTES]
					,src.[SUMMARY]
					,src.[XMLSUBDOCUMENT]
					,src.[VERSIONONDATE]
					,src.[FINSTATEMENTDEF_FK]
					,src.[ORGANIZATIONUNIT_FK]
					,src.[STATUS]
					,src.[STATUSNAMEID]
					,src.[FINSTATEMENTTABLEPARENT_FK]
					,src.[ISAGGREGATE]
					,src.[SENTTOPARENTUNIT]
					,src.[APPROVED]
					,src.[AGGRFINSTATEMENTIDPATH]
					,src.[PART]
					,src.[ISGENERATED]
					,src.[LEVEL_]
					,src.[AGGRLEVEL]
					,src.[RECIPIENT]
					,src.[RECEIVED]
					,src.[CANCELLED]
					,src.[FINSTATEMENTTYPEDEF_FK]
					,src.[EXPLANATION]
					,src.[MODIFIEDDATETIME]
					,src.[MODIFIEDBY]
					,src.[MODIFIEDTRANSACTIONID]
					,src.[CREATEDDATETIME]
					,src.[CREATEDBY]
					,src.[CREATEDTRANSACTIONID]
					,src.[RECVERSION]
					,src.[PARTITION]
					,src.[RECID]
					,src.[FINSTATEMENTTABLECANCELLED_FK]
					,src.[SENDDATE]
					,src.[GENERATEDDATETIME]
					,src.[GENERATEDDATETIMETZID]
					,src.[POSTEDDATETIME]
					,src.[POSTEDDATETIMETZID]
					,src.[REVERSED]
					,src.[REVERSEDDATETIME]
					,src.[REVERSEDDATETIMETZID]
					,src.[REVERSEDBY]
					,src.[VOUCHERREVERSE]
					,src.[TREZORPROCESSCODE]
					,src.[TREZORENTITYTYPE]
					,src.[TREZORENTITYID]
					,src.[TREZORCUSTOMVERSIONKEYCOMP]
					,src.[TREZORXML]
					,src.[STATUSTREZOR]);
			SET @Merged = 1;
		END

		IF @TableName = 'KPfinstatementTrans' BEGIN
			MERGE INTO zef2.KPfinstatementTrans AS tgt
			USING WI_StageODS.zef2.KPfinstatementTrans AS src
			ON (tgt.[RECID]=src.[RECID])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[DESCRIPTION]                = src.[DESCRIPTION]
				,tgt.[LINENUM]                    = src.[LINENUM]
				,tgt.[VALUE]                      = src.[VALUE]
				,tgt.[VALUE2_]                    = src.[VALUE2_]
				,tgt.[VALUE3_]                    = src.[VALUE3_]
				,tgt.[VALUE4_]                    = src.[VALUE4_]
				,tgt.[VALUE5_]                    = src.[VALUE5_]
				,tgt.[VALUE6_]                    = src.[VALUE6_]
				,tgt.[VALUE7_]                    = src.[VALUE7_]
				,tgt.[VALUE8_]                    = src.[VALUE8_]
				,tgt.[VALUE9_]                    = src.[VALUE9_]
				,tgt.[VALUE10_]                   = src.[VALUE10_]
				,tgt.[VALUE11_]                   = src.[VALUE11_]
				,tgt.[VALUE12_]                   = src.[VALUE12_]
				,tgt.[VALUE13_]                   = src.[VALUE13_]
				,tgt.[VALUE14_]                   = src.[VALUE14_]
				,tgt.[VALUE15_]                   = src.[VALUE15_]
				,tgt.[VALUE16_]                   = src.[VALUE16_]
				,tgt.[VALUE17_]                   = src.[VALUE17_]
				,tgt.[VALUE18_]                   = src.[VALUE18_]
				,tgt.[VALUE19_]                   = src.[VALUE19_]
				,tgt.[VALUE20_]                   = src.[VALUE20_]
				,tgt.[MARKER]                     = src.[MARKER]
				,tgt.[ROWID]                      = src.[ROWID]
				,tgt.[FINSTATEMENTTABLE_FK]       = src.[FINSTATEMENTTABLE_FK]
				,tgt.[DEFAULTDIMENSION_FK]        = src.[DEFAULTDIMENSION_FK]
				,tgt.[DATACLASSIFICATION_FK]      = src.[DATACLASSIFICATION_FK]
				,tgt.[DATACLASSSECTION]           = src.[DATACLASSSECTION]
				,tgt.[DATACLASSSUBSECTION]        = src.[DATACLASSSUBSECTION]
				,tgt.[DATACLASSPARAGRAPH]         = src.[DATACLASSPARAGRAPH]
				,tgt.[DATACLASSPROJECTID]         = src.[DATACLASSPROJECTID]
				,tgt.[DATACLASSPROGRAMID]         = src.[DATACLASSPROGRAMID]
				,tgt.[DATACLASSEMPLOYMENTGROUPID] = src.[DATACLASSEMPLOYMENTGROUPID]
				,tgt.[LEDGERDIMENSION_FK]         = src.[LEDGERDIMENSION_FK]
				,tgt.[MODIFIEDDATETIME]           = src.[MODIFIEDDATETIME]
				,tgt.[MODIFIEDBY]                 = src.[MODIFIEDBY]
				,tgt.[MODIFIEDTRANSACTIONID]      = src.[MODIFIEDTRANSACTIONID]
				,tgt.[CREATEDDATETIME]            = src.[CREATEDDATETIME]
				,tgt.[CREATEDBY]                  = src.[CREATEDBY]
				,tgt.[CREATEDTRANSACTIONID]       = src.[CREATEDTRANSACTIONID]
				,tgt.[RECVERSION]                 = src.[RECVERSION]
				,tgt.[PARTITION]                  = src.[PARTITION]
				,tgt.[DATACLASSWORKID]            = src.[DATACLASSWORKID]
				,tgt.[DATACLASSPART]              = src.[DATACLASSPART]
				,tgt.[PROGRAMNAMEFORSTATEMENT]    = src.[PROGRAMNAMEFORSTATEMENT]
				,tgt.[CUSTNAME]                   = src.[CUSTNAME]
				,tgt.[CUSTADDRES]                 = src.[CUSTADDRES]
				,tgt.[PRZYCZYNYDECYZJIUMORZENIA]  = src.[PRZYCZYNYDECYZJIUMORZENIA]
				,tgt.[WRITEOFFCAUSE]              = src.[WRITEOFFCAUSE]
				,tgt.[TREZORPOSITIONCODE]         = src.[TREZORPOSITIONCODE]
				,tgt.[TREZORCHAPTERCODE]          = src.[TREZORCHAPTERCODE]
				,tgt.[DATACLASSPARAGRAPH1]        = src.[DATACLASSPARAGRAPH1]
				,tgt.[REMARKS]                    = src.[REMARKS]
				,tgt.[DATACLASSQUALEX]            = src.[DATACLASSQUALEX]
				,tgt.[DATACLASSQUALIN]            = src.[DATACLASSQUALIN]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([DESCRIPTION]
						,[LINENUM]
						,[VALUE]
						,[VALUE2_]
						,[VALUE3_]
						,[VALUE4_]
						,[VALUE5_]
						,[VALUE6_]
						,[VALUE7_]
						,[VALUE8_]
						,[VALUE9_]
						,[VALUE10_]
						,[VALUE11_]
						,[VALUE12_]
						,[VALUE13_]
						,[VALUE14_]
						,[VALUE15_]
						,[VALUE16_]
						,[VALUE17_]
						,[VALUE18_]
						,[VALUE19_]
						,[VALUE20_]
						,[MARKER]
						,[ROWID]
						,[FINSTATEMENTTABLE_FK]
						,[DEFAULTDIMENSION_FK]
						,[DATACLASSIFICATION_FK]
						,[DATACLASSSECTION]
						,[DATACLASSSUBSECTION]
						,[DATACLASSPARAGRAPH]
						,[DATACLASSPROJECTID]
						,[DATACLASSPROGRAMID]
						,[DATACLASSEMPLOYMENTGROUPID]
						,[LEDGERDIMENSION_FK]
						,[MODIFIEDDATETIME]
						,[MODIFIEDBY]
						,[MODIFIEDTRANSACTIONID]
						,[CREATEDDATETIME]
						,[CREATEDBY]
						,[CREATEDTRANSACTIONID]
						,[RECVERSION]
						,[PARTITION]
						,[RECID]
						,[DATACLASSWORKID]
						,[DATACLASSPART]
						,[PROGRAMNAMEFORSTATEMENT]
						,[CUSTNAME]
						,[CUSTADDRES]
						,[PRZYCZYNYDECYZJIUMORZENIA]
						,[WRITEOFFCAUSE]
						,[TREZORPOSITIONCODE]
						,[TREZORCHAPTERCODE]
						,[DATACLASSPARAGRAPH1]
						,[REMARKS]
						,[DATACLASSQUALEX]
						,[DATACLASSQUALIN]
)
			VALUES ( src.[DESCRIPTION]
					,src.[LINENUM]
					,src.[VALUE]
					,src.[VALUE2_]
					,src.[VALUE3_]
					,src.[VALUE4_]
					,src.[VALUE5_]
					,src.[VALUE6_]
					,src.[VALUE7_]
					,src.[VALUE8_]
					,src.[VALUE9_]
					,src.[VALUE10_]
					,src.[VALUE11_]
					,src.[VALUE12_]
					,src.[VALUE13_]
					,src.[VALUE14_]
					,src.[VALUE15_]
					,src.[VALUE16_]
					,src.[VALUE17_]
					,src.[VALUE18_]
					,src.[VALUE19_]
					,src.[VALUE20_]
					,src.[MARKER]
					,src.[ROWID]
					,src.[FINSTATEMENTTABLE_FK]
					,src.[DEFAULTDIMENSION_FK]
					,src.[DATACLASSIFICATION_FK]
					,src.[DATACLASSSECTION]
					,src.[DATACLASSSUBSECTION]
					,src.[DATACLASSPARAGRAPH]
					,src.[DATACLASSPROJECTID]
					,src.[DATACLASSPROGRAMID]
					,src.[DATACLASSEMPLOYMENTGROUPID]
					,src.[LEDGERDIMENSION_FK]
					,src.[MODIFIEDDATETIME]
					,src.[MODIFIEDBY]
					,src.[MODIFIEDTRANSACTIONID]
					,src.[CREATEDDATETIME]
					,src.[CREATEDBY]
					,src.[CREATEDTRANSACTIONID]
					,src.[RECVERSION]
					,src.[PARTITION]
					,src.[RECID]
					,src.[DATACLASSWORKID]
					,src.[DATACLASSPART]
					,src.[PROGRAMNAMEFORSTATEMENT]
					,src.[CUSTNAME]
					,src.[CUSTADDRES]
					,src.[PRZYCZYNYDECYZJIUMORZENIA]
					,src.[WRITEOFFCAUSE]
					,src.[TREZORPOSITIONCODE]
					,src.[TREZORCHAPTERCODE]
					,src.[DATACLASSPARAGRAPH1]
					,src.[REMARKS]
					,src.[DATACLASSQUALEX]
					,src.[DATACLASSQUALIN]  );
			SET @Merged = 1;
		END

		IF @TableName = 'KPorganizationUnitTable' BEGIN
			MERGE INTO zef2.KPorganizationUnitTable AS tgt
			USING WI_StageODS.zef2.KPorganizationUnitTable AS src
			ON (tgt.[RECID]=src.[RECID])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[ORGANIZATIONUNITID]          = src.[ORGANIZATIONUNITID]
				,tgt.[NAME]                        = src.[NAME]
				,tgt.[BLOCKED]                     = src.[BLOCKED]
				,tgt.[LEVEL1]                      = src.[LEVEL1]
				,tgt.[LEVEL2]                      = src.[LEVEL2]
				,tgt.[LEVEL3]                      = src.[LEVEL3]
				,tgt.[LEVEL4]                      = src.[LEVEL4]
				,tgt.[ORGANIZATIONUNITPARENT_FK]   = src.[ORGANIZATIONUNITPARENT_FK]
				,tgt.[LEVEL5]                      = src.[LEVEL5]
				,tgt.[UNITDATAAREAID]              = src.[UNITDATAAREAID]
				,tgt.[DEPARTMENT_FK]               = src.[DEPARTMENT_FK]
				,tgt.[ENFORCEMENTAUTHORITY]        = src.[ENFORCEMENTAUTHORITY]
				,tgt.[TREZORID]                    = src.[TREZORID]
				,tgt.[PART]                        = src.[PART]
				,tgt.[TAXAUTHORITY]                = src.[TAXAUTHORITY]
				,tgt.[LOCATION_FK]                 = src.[LOCATION_FK]
				,tgt.[DEL_EMAILINTERESTDECISION]   = src.[DEL_EMAILINTERESTDECISION]
				,tgt.[EMAILIDPAYMENTDEMAND]        = src.[EMAILIDPAYMENTDEMAND]
				,tgt.[DEL_EMAILTW]                 = src.[DEL_EMAILTW]
				,tgt.[USERTW]                      = src.[USERTW]
				,tgt.[FINSTATEMENTNAME]            = src.[FINSTATEMENTNAME]
				,tgt.[REGNUM]                      = src.[REGNUM]
				,tgt.[VISIBLEINDIMATTRIBUTEVIEW]   = src.[VISIBLEINDIMATTRIBUTEVIEW]
				,tgt.[TWNAME]                      = src.[TWNAME]
				,tgt.[DEL_EMAILIDDEPOSITSUMAPPL]   = src.[DEL_EMAILIDDEPOSITSUMAPPL]
				,tgt.[DEL_EMAILDEPOSITSUMAPPL]     = src.[DEL_EMAILDEPOSITSUMAPPL]
				,tgt.[MODIFIEDDATETIME]            = src.[MODIFIEDDATETIME]
				,tgt.[MODIFIEDBY]                  = src.[MODIFIEDBY]
				,tgt.[MODIFIEDTRANSACTIONID]       = src.[MODIFIEDTRANSACTIONID]
				,tgt.[CREATEDDATETIME]             = src.[CREATEDDATETIME]
				,tgt.[CREATEDBY]                   = src.[CREATEDBY]
				,tgt.[CREATEDTRANSACTIONID]        = src.[CREATEDTRANSACTIONID]
				,tgt.[RECVERSION]                  = src.[RECVERSION]
				,tgt.[PARTITION]                   = src.[PARTITION]
				,tgt.[NUMSEQCUST_FK]               = src.[NUMSEQCUST_FK]
				,tgt.[CUSTACCOUNT]                 = src.[CUSTACCOUNT]
				,tgt.[VISIBLEINREGULOFPROTECTION]  = src.[VISIBLEINREGULOFPROTECTION]
				,tgt.[ORGANIZATIONUNITIDSHORT]     = src.[ORGANIZATIONUNITIDSHORT]
				,tgt.[ISRECEIVER]                  = src.[ISRECEIVER]
				,tgt.[NAMEFORLIMITS]               = src.[NAMEFORLIMITS]
				,tgt.[LOCATIONEA_FK]               = src.[LOCATIONEA_FK]
				,tgt.[TAXTREZORID]					= src.[TAXTREZORID]
				,tgt.[TREZORBUDGETUNIT]				= src.[TREZORBUDGETUNIT]

			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([ORGANIZATIONUNITID]
						,[NAME]
						,[BLOCKED]
						,[LEVEL1]
						,[LEVEL2]
						,[LEVEL3]
						,[LEVEL4]
						,[ORGANIZATIONUNITPARENT_FK]
						,[LEVEL5]
						,[UNITDATAAREAID]
						,[DEPARTMENT_FK]
						,[ENFORCEMENTAUTHORITY]
						,[TREZORID]
						,[PART]
						,[TAXAUTHORITY]
						,[LOCATION_FK]
						,[DEL_EMAILINTERESTDECISION]
						,[EMAILIDPAYMENTDEMAND]
						,[DEL_EMAILTW]
						,[USERTW]
						,[FINSTATEMENTNAME]
						,[REGNUM]
						,[VISIBLEINDIMATTRIBUTEVIEW]
						,[TWNAME]
						,[DEL_EMAILIDDEPOSITSUMAPPL]
						,[DEL_EMAILDEPOSITSUMAPPL]
						,[MODIFIEDDATETIME]
						,[MODIFIEDBY]
						,[MODIFIEDTRANSACTIONID]
						,[CREATEDDATETIME]
						,[CREATEDBY]
						,[CREATEDTRANSACTIONID]
						,[RECVERSION]
						,[PARTITION]
						,[RECID]
						,[NUMSEQCUST_FK]
						,[CUSTACCOUNT]
						,[VISIBLEINREGULOFPROTECTION]
						,[ORGANIZATIONUNITIDSHORT]
						,[ISRECEIVER]
						,[NAMEFORLIMITS]
						,[LOCATIONEA_FK]
						,[TAXTREZORID]
						,[TREZORBUDGETUNIT])
			VALUES ( src.[ORGANIZATIONUNITID]
					,src.[NAME]
					,src.[BLOCKED]
					,src.[LEVEL1]
					,src.[LEVEL2]
					,src.[LEVEL3]
					,src.[LEVEL4]
					,src.[ORGANIZATIONUNITPARENT_FK]
					,src.[LEVEL5]
					,src.[UNITDATAAREAID]
					,src.[DEPARTMENT_FK]
					,src.[ENFORCEMENTAUTHORITY]
					,src.[TREZORID]
					,src.[PART]
					,src.[TAXAUTHORITY]
					,src.[LOCATION_FK]
					,src.[DEL_EMAILINTERESTDECISION]
					,src.[EMAILIDPAYMENTDEMAND]
					,src.[DEL_EMAILTW]
					,src.[USERTW]
					,src.[FINSTATEMENTNAME]
					,src.[REGNUM]
					,src.[VISIBLEINDIMATTRIBUTEVIEW]
					,src.[TWNAME]
					,src.[DEL_EMAILIDDEPOSITSUMAPPL]
					,src.[DEL_EMAILDEPOSITSUMAPPL]
					,src.[MODIFIEDDATETIME]
					,src.[MODIFIEDBY]
					,src.[MODIFIEDTRANSACTIONID]
					,src.[CREATEDDATETIME]
					,src.[CREATEDBY]
					,src.[CREATEDTRANSACTIONID]
					,src.[RECVERSION]
					,src.[PARTITION]
					,src.[RECID]
					,src.[NUMSEQCUST_FK]
					,src.[CUSTACCOUNT]
					,src.[VISIBLEINREGULOFPROTECTION]
					,src.[ORGANIZATIONUNITIDSHORT]
					,src.[ISRECEIVER]
					,src.[NAMEFORLIMITS]
					,src.[LOCATIONEA_FK]
					,src.[TAXTREZORID]
					,src.[TREZORBUDGETUNIT]);
			SET @Merged = 1;
		END

		IF @TableName = 'KPProgramTable' BEGIN
			MERGE INTO zef2.KPProgramTable AS tgt
			USING WI_StageODS.zef2.KPProgramTable AS src
			ON (tgt.[RECID]=src.[RECID])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[DESCRIPTION]               = src.[DESCRIPTION]
				,tgt.[NAME]                      = src.[NAME]
				,tgt.[PROGRAMID]                 = src.[PROGRAMID]
				,tgt.[BLOCKED]                   = src.[BLOCKED]
				,tgt.[FROMDATE]                  = src.[FROMDATE]
				,tgt.[VISIBLEINDIMATTRIBUTEVIEW] = src.[VISIBLEINDIMATTRIBUTEVIEW]
				,tgt.[MODIFIEDDATETIME]          = src.[MODIFIEDDATETIME]
				,tgt.[MODIFIEDBY]                = src.[MODIFIEDBY]
				,tgt.[MODIFIEDTRANSACTIONID]     = src.[MODIFIEDTRANSACTIONID]
				,tgt.[CREATEDDATETIME]           = src.[CREATEDDATETIME]
				,tgt.[CREATEDBY]                 = src.[CREATEDBY]
				,tgt.[CREATEDTRANSACTIONID]      = src.[CREATEDTRANSACTIONID]
				,tgt.[RECVERSION]                = src.[RECVERSION]
				,tgt.[PARTITION]                 = src.[PARTITION]
				,tgt.[PROGRAMGROUPTABLE_FK]      = src.[PROGRAMGROUPTABLE_FK]
				,tgt.[NAMEFORSTATEMENT]          = src.[NAMEFORSTATEMENT]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([DESCRIPTION]
						,[NAME]
						,[PROGRAMID]
						,[BLOCKED]
						,[FROMDATE]
						,[VISIBLEINDIMATTRIBUTEVIEW]
						,[MODIFIEDDATETIME]
						,[MODIFIEDBY]
						,[MODIFIEDTRANSACTIONID]
						,[CREATEDDATETIME]
						,[CREATEDBY]
						,[CREATEDTRANSACTIONID]
						,[RECVERSION]
						,[PARTITION]
						,[RECID]
						,[PROGRAMGROUPTABLE_FK]
						,[NAMEFORSTATEMENT])
			VALUES ( src.[DESCRIPTION]
					,src.[NAME]
					,src.[PROGRAMID]
					,src.[BLOCKED]
					,src.[FROMDATE]
					,src.[VISIBLEINDIMATTRIBUTEVIEW]
					,src.[MODIFIEDDATETIME]
					,src.[MODIFIEDBY]
					,src.[MODIFIEDTRANSACTIONID]
					,src.[CREATEDDATETIME]
					,src.[CREATEDBY]
					,src.[CREATEDTRANSACTIONID]
					,src.[RECVERSION]
					,src.[PARTITION]
					,src.[RECID]
					,src.[PROGRAMGROUPTABLE_FK]
					,src.[NAMEFORSTATEMENT]);
			SET @Merged = 1;
		END

		IF @TableName = 'KPEmploymentGroup' BEGIN
			MERGE INTO zef2.KPEmploymentGroup AS tgt
			USING WI_StageODS.zef2.KPEmploymentGroup AS src
			ON (tgt.[RECID]=src.[RECID])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[EMPLOYMENTGROUPID]        = src.[EMPLOYMENTGROUPID]
				,tgt.[NAME]                     = src.[NAME]
				,tgt.[MODIFIEDDATETIME]         = src.[MODIFIEDDATETIME]
				,tgt.[MODIFIEDBY]               = src.[MODIFIEDBY]
				,tgt.[MODIFIEDTRANSACTIONID]    = src.[MODIFIEDTRANSACTIONID]
				,tgt.[CREATEDDATETIME]          = src.[CREATEDDATETIME]
				,tgt.[CREATEDBY]                = src.[CREATEDBY]
				,tgt.[CREATEDTRANSACTIONID]     = src.[CREATEDTRANSACTIONID]
				,tgt.[RECVERSION]               = src.[RECVERSION]
				,tgt.[PARTITION]                = src.[PARTITION]
				,tgt.[FINSTATEMENTEMPLGROUPID]  = src.[FINSTATEMENTEMPLGROUPID]
				,tgt.[BLOCKED]                  = src.[BLOCKED]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([EMPLOYMENTGROUPID]
						,[NAME]
						,[MODIFIEDDATETIME]
						,[MODIFIEDBY]
						,[MODIFIEDTRANSACTIONID]
						,[CREATEDDATETIME]
						,[CREATEDBY]
						,[CREATEDTRANSACTIONID]
						,[RECVERSION]
						,[PARTITION]
						,[RECID]
						,[FINSTATEMENTEMPLGROUPID]
						,[BLOCKED])
			VALUES ( src.[EMPLOYMENTGROUPID]
					,src.[NAME]
					,src.[MODIFIEDDATETIME]
					,src.[MODIFIEDBY]
					,src.[MODIFIEDTRANSACTIONID]
					,src.[CREATEDDATETIME]
					,src.[CREATEDBY]
					,src.[CREATEDTRANSACTIONID]
					,src.[RECVERSION]
					,src.[PARTITION]
					,src.[RECID]
					,src.[FINSTATEMENTEMPLGROUPID]
					,src.[BLOCKED]);
			SET @Merged = 1;
		END

		IF @TableName = 'KPClassificationAttributeTable' BEGIN
			MERGE INTO zef2.KPClassificationAttributeTable AS tgt
			USING WI_StageODS.zef2.KPClassificationAttributeTable AS src
			ON (tgt.[RECID]=src.[RECID])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[ATTRIBUTEID]                      = src.[ATTRIBUTEID]
				,tgt.[NAME]                             = src.[NAME]
				,tgt.[BLOCKED]                          = src.[BLOCKED]
				,tgt.[TYPE]                             = src.[TYPE]
				,tgt.[SUBTYPE]                          = src.[SUBTYPE]
				,tgt.[CLASSIFICATIONATTRIBUTEPARENT_FK] = src.[CLASSIFICATIONATTRIBUTEPARENT_FK]
				,tgt.[REQUIREDINCLASSIFICATION_PROGRAM] = src.[REQUIREDINCLASSIFICATION_PROGRAM]
				,tgt.[REQUIREDINCLASSIFICATION_PROJECT] = src.[REQUIREDINCLASSIFICATION_PROJECT]
				,tgt.[DEFAULTEMPLOYMENTGROUP_FK]        = src.[DEFAULTEMPLOYMENTGROUP_FK]
				,tgt.[ECONGROUPGENERAL_FK]              = src.[ECONGROUPGENERAL_FK]
				,tgt.[VISIBLEINDIMATTRIBUTEVIEW]        = src.[VISIBLEINDIMATTRIBUTEVIEW]
				,tgt.[DEFAULTBGTTYPE_FK]                = src.[DEFAULTBGTTYPE_FK]
				,tgt.[MODIFIEDDATETIME]                 = src.[MODIFIEDDATETIME]
				,tgt.[MODIFIEDBY]                       = src.[MODIFIEDBY]
				,tgt.[MODIFIEDTRANSACTIONID]            = src.[MODIFIEDTRANSACTIONID]
				,tgt.[CREATEDDATETIME]                  = src.[CREATEDDATETIME]
				,tgt.[CREATEDBY]                        = src.[CREATEDBY]
				,tgt.[CREATEDTRANSACTIONID]             = src.[CREATEDTRANSACTIONID]
				,tgt.[RECVERSION]                       = src.[RECVERSION]
				,tgt.[PARTITION]                        = src.[PARTITION]
				,tgt.[REQUIREDEMPLGROUPFORLIMITS]       = src.[REQUIREDEMPLGROUPFORLIMITS]
				,tgt.[NATIVESUBSECTION_IC]              = src.[NATIVESUBSECTION_IC]
				,tgt.[NATIVESUBSECTION_IS]              = src.[NATIVESUBSECTION_IS]
				,tgt.[NATIVESUBSECTION_UKS]             = src.[NATIVESUBSECTION_UKS]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([ATTRIBUTEID]
						,[NAME]
						,[BLOCKED]
						,[TYPE]
						,[SUBTYPE]
						,[CLASSIFICATIONATTRIBUTEPARENT_FK]
						,[REQUIREDINCLASSIFICATION_PROGRAM]
						,[REQUIREDINCLASSIFICATION_PROJECT]
						,[DEFAULTEMPLOYMENTGROUP_FK]
						,[ECONGROUPGENERAL_FK]
						,[VISIBLEINDIMATTRIBUTEVIEW]
						,[DEFAULTBGTTYPE_FK]
						,[MODIFIEDDATETIME]
						,[MODIFIEDBY]
						,[MODIFIEDTRANSACTIONID]
						,[CREATEDDATETIME]
						,[CREATEDBY]
						,[CREATEDTRANSACTIONID]
						,[RECVERSION]
						,[PARTITION]
						,[RECID]
						,[REQUIREDEMPLGROUPFORLIMITS]
						,[NATIVESUBSECTION_IC]
						,[NATIVESUBSECTION_IS]
						,[NATIVESUBSECTION_UKS])
			VALUES ( src.[ATTRIBUTEID]
					,src.[NAME]
					,src.[BLOCKED]
					,src.[TYPE]
					,src.[SUBTYPE]
					,src.[CLASSIFICATIONATTRIBUTEPARENT_FK]
					,src.[REQUIREDINCLASSIFICATION_PROGRAM]
					,src.[REQUIREDINCLASSIFICATION_PROJECT]
					,src.[DEFAULTEMPLOYMENTGROUP_FK]
					,src.[ECONGROUPGENERAL_FK]
					,src.[VISIBLEINDIMATTRIBUTEVIEW]
					,src.[DEFAULTBGTTYPE_FK]
					,src.[MODIFIEDDATETIME]
					,src.[MODIFIEDBY]
					,src.[MODIFIEDTRANSACTIONID]
					,src.[CREATEDDATETIME]
					,src.[CREATEDBY]
					,src.[CREATEDTRANSACTIONID]
					,src.[RECVERSION]
					,src.[PARTITION]
					,src.[RECID]
					,src.[REQUIREDEMPLGROUPFORLIMITS]
					,src.[NATIVESUBSECTION_IC]
					,src.[NATIVESUBSECTION_IS]
					,src.[NATIVESUBSECTION_UKS]);
			SET @Merged = 1;
		END

		IF @TableName = 'KPfinstatementTypeDef' BEGIN
			MERGE INTO zef2.KPfinstatementTypeDef AS tgt
			USING WI_StageODS.zef2.KPfinstatementTypeDef AS src
			ON (tgt.[RECID]=src.[RECID])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[FINSTATEMENTTYPEDEFID]     = src.[FINSTATEMENTTYPEDEFID]
				,tgt.[DESCRIPTION]               = src.[DESCRIPTION]
				,tgt.[FINSTATEMENTTYPE]          = src.[FINSTATEMENTTYPE]
				,tgt.[PERIODTYPE]                = src.[PERIODTYPE]
				,tgt.[FINSTATEMENTTYPEDEFGENID]  = src.[FINSTATEMENTTYPEDEFGENID]
				,tgt.[MODIFIEDDATETIME]          = src.[MODIFIEDDATETIME]
				,tgt.[MODIFIEDBY]                = src.[MODIFIEDBY]
				,tgt.[MODIFIEDTRANSACTIONID]     = src.[MODIFIEDTRANSACTIONID]
				,tgt.[CREATEDDATETIME]           = src.[CREATEDDATETIME]
				,tgt.[CREATEDBY]                 = src.[CREATEDBY]
				,tgt.[CREATEDTRANSACTIONID]      = src.[CREATEDTRANSACTIONID]
				,tgt.[RECVERSION]                = src.[RECVERSION]
				,tgt.[PARTITION]                 = src.[PARTITION]
				,tgt.[MRDOSRODZAJDOK]            = src.[MRDOSRODZAJDOK]
				,tgt.[MRDOSIMPORT]               = src.[MRDOSIMPORT]
				,tgt.[CONSOLIDATION]             = src.[CONSOLIDATION]
				,tgt.[MODULE]                    = src.[MODULE]
				,tgt.[ALLOWTOALLDATAAREA]        = src.[ALLOWTOALLDATAAREA]
				,tgt.[DOCUMENTCODE]              = src.[DOCUMENTCODE]
				,tgt.[ALLOWSENDTOTREZOR]         = src.[ALLOWSENDTOTREZOR]
				,tgt.[TREZORPROCESSCODE]         = src.[TREZORPROCESSCODE]
				,tgt.[USERGROUPID]               = src.[USERGROUPID]
				,tgt.[FINSTATEMENTUNITTYPE]      = src.[FINSTATEMENTUNITTYPE]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([FINSTATEMENTTYPEDEFID]
						,[DESCRIPTION]
						,[FINSTATEMENTTYPE]
						,[PERIODTYPE]
						,[FINSTATEMENTTYPEDEFGENID]
						,[MODIFIEDDATETIME]
						,[MODIFIEDBY]
						,[MODIFIEDTRANSACTIONID]
						,[CREATEDDATETIME]
						,[CREATEDBY]
						,[CREATEDTRANSACTIONID]
						,[RECVERSION]
						,[PARTITION]
						,[RECID]
						,[MRDOSRODZAJDOK]
						,[MRDOSIMPORT]
						,[CONSOLIDATION]
						,[MODULE]
						,[ALLOWTOALLDATAAREA]
						,[DOCUMENTCODE]
						,[ALLOWSENDTOTREZOR]
						,[TREZORPROCESSCODE]
						,[USERGROUPID]
						,[FINSTATEMENTUNITTYPE])
			VALUES ( src.[FINSTATEMENTTYPEDEFID]
					,src.[DESCRIPTION]
					,src.[FINSTATEMENTTYPE]
					,src.[PERIODTYPE]
					,src.[FINSTATEMENTTYPEDEFGENID]
					,src.[MODIFIEDDATETIME]
					,src.[MODIFIEDBY]
					,src.[MODIFIEDTRANSACTIONID]
					,src.[CREATEDDATETIME]
					,src.[CREATEDBY]
					,src.[CREATEDTRANSACTIONID]
					,src.[RECVERSION]
					,src.[PARTITION]
					,src.[RECID]
					,src.[MRDOSRODZAJDOK]
					,src.[MRDOSIMPORT]
					,src.[CONSOLIDATION]
					,src.[MODULE]
					,src.[ALLOWTOALLDATAAREA]
					,src.[DOCUMENTCODE]
					,src.[ALLOWSENDTOTREZOR]
					,src.[TREZORPROCESSCODE]
					,src.[USERGROUPID]
					,src.[FINSTATEMENTUNITTYPE]);
			SET @Merged = 1;
		END

		IF @TableName = 'KPFinstatementDef' BEGIN
			MERGE INTO zef2.KPFinstatementDef AS tgt
			USING WI_StageODS.zef2.KPFinstatementDef AS src
			ON (tgt.[RECID]=src.[RECID])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[FINSTATEMENTDEFSEQID]                = src.[FINSTATEMENTDEFSEQID]    
				,tgt.[DOCUTYPEID]                          = src.[DOCUTYPEID]
				,tgt.[XMLINTERVAL]                         = src.[XMLINTERVAL]
				,tgt.[XMLTAG]                              = src.[XMLTAG]
				,tgt.[XMLDOCUMENTNAME]                     = src.[XMLDOCUMENTNAME]
				,tgt.[POSTTOACCOUNT]                       = src.[POSTTOACCOUNT]
				,tgt.[POSTTOTRANS]                         = src.[POSTTOTRANS]
				,tgt.[POSTINGLEVEL]                        = src.[POSTINGLEVEL]
				,tgt.[VOUCHERSEQID]                        = src.[VOUCHERSEQID]
				,tgt.[XMLSUBDOCUMENT]                      = src.[XMLSUBDOCUMENT]
				,tgt.[CALCPLANONLYNOZERO]                  = src.[CALCPLANONLYNOZERO]
				,tgt.[AUTOCREATE]                          = src.[AUTOCREATE]
				,tgt.[DATEFROM]                            = src.[DATEFROM]
				,tgt.[BLOCKED]                             = src.[BLOCKED]
				,tgt.[FINSTATEMENTDEFVERSIONID]            = src.[FINSTATEMENTDEFVERSIONID]
				,tgt.[MANDATORYCLASSIFICATION]             = src.[MANDATORYCLASSIFICATION]
				,tgt.[DYNAMICROWS]                         = src.[DYNAMICROWS]
				,tgt.[DEFAULTCONSOLIDATED_FK]              = src.[DEFAULTCONSOLIDATED_FK]
				,tgt.[DEFAULTAGGR_FK]                      = src.[DEFAULTAGGR_FK]
				,tgt.[DEFAULTSTATEMENT_FK]                 = src.[DEFAULTSTATEMENT_FK]
				,tgt.[FINSTATEMENTTYPEDEF_FK]              = src.[FINSTATEMENTTYPEDEF_FK]
				,tgt.[PROJECTNOYES]                        = src.[PROJECTNOYES]
				,tgt.[PROGRAMNOYES]                        = src.[PROGRAMNOYES]
				,tgt.[PARAGRAPHNOYES]                      = src.[PARAGRAPHNOYES]
				,tgt.[SUBSECTIONNOYES]                     = src.[SUBSECTIONNOYES]
				,tgt.[SECTIONNOYES]                        = src.[SECTIONNOYES]
				,tgt.[EMPLOYMENTGROUPNOYES]                = src.[EMPLOYMENTGROUPNOYES]
				,tgt.[FINSTATEMENTTYPE]                    = src.[FINSTATEMENTTYPE]
				,tgt.[PART]                                = src.[PART]
				,tgt.[RECIPIENT]                           = src.[RECIPIENT]
				,tgt.[PROTECTEDDOCUTYPEID]                 = src.[PROTECTEDDOCUTYPEID]
				,tgt.[CHECKCLASSNAME]                      = src.[CHECKCLASSNAME]
				,tgt.[DATAPREPCLASSNAME]                   = src.[DATAPREPCLASSNAME]
				,tgt.[MODIFIEDDATETIME]                    = src.[MODIFIEDDATETIME]
				,tgt.[MODIFIEDBY]                          = src.[MODIFIEDBY]
				,tgt.[MODIFIEDTRANSACTIONID]               = src.[MODIFIEDTRANSACTIONID]
				,tgt.[CREATEDDATETIME]                     = src.[CREATEDDATETIME]
				,tgt.[CREATEDBY]                           = src.[CREATEDBY]
				,tgt.[CREATEDTRANSACTIONID]                = src.[CREATEDTRANSACTIONID]
				,tgt.[RECVERSION]                          = src.[RECVERSION]
				,tgt.[PARTITION]                           = src.[PARTITION]
				,tgt.[PARTNOYES]                           = src.[PARTNOYES]
				,tgt.[WORKNOYES]                           = src.[WORKNOYES]
				,tgt.[DESCNOYES]                           = src.[DESCNOYES]
				,tgt.[ROWIDNOYES]                          = src.[ROWIDNOYES]
				,tgt.[MRDOSIMPORT]                         = src.[MRDOSIMPORT]
				,tgt.[FINCONSOLIDATIONFIELDIDX]            = src.[FINCONSOLIDATIONFIELDIDX]
				,tgt.[FINCONSOLIDATIONORGUNITTABLE_FK]     = src.[FINCONSOLIDATIONORGUNITTABLE_FK]
				,tgt.[REPORTMENUITEMNAME]                  = src.[REPORTMENUITEMNAME]
				,tgt.[REMARKSNOYES]							= src.[REMARKSNOYES]
				,tgt.[TREZORIMPORTCLASSNAME]				= src.[TREZORIMPORTCLASSNAME]

			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([FINSTATEMENTDEFSEQID]
						,[DOCUTYPEID]
						,[XMLINTERVAL]
						,[XMLTAG]
						,[XMLDOCUMENTNAME]
						,[POSTTOACCOUNT]
						,[POSTTOTRANS]
						,[POSTINGLEVEL]
						,[VOUCHERSEQID]
						,[XMLSUBDOCUMENT]
						,[CALCPLANONLYNOZERO]
						,[AUTOCREATE]
						,[DATEFROM]
						,[BLOCKED]
						,[FINSTATEMENTDEFVERSIONID]
						,[MANDATORYCLASSIFICATION]
						,[DYNAMICROWS]
						,[DEFAULTCONSOLIDATED_FK]
						,[DEFAULTAGGR_FK]
						,[DEFAULTSTATEMENT_FK]
						,[FINSTATEMENTTYPEDEF_FK]
						,[PROJECTNOYES]
						,[PROGRAMNOYES]
						,[PARAGRAPHNOYES]
						,[SUBSECTIONNOYES]
						,[SECTIONNOYES]
						,[EMPLOYMENTGROUPNOYES]
						,[FINSTATEMENTTYPE]
						,[PART]
						,[RECIPIENT]
						,[PROTECTEDDOCUTYPEID]
						,[CHECKCLASSNAME]
						,[DATAPREPCLASSNAME]
						,[MODIFIEDDATETIME]
						,[MODIFIEDBY]
						,[MODIFIEDTRANSACTIONID]
						,[CREATEDDATETIME]
						,[CREATEDBY]
						,[CREATEDTRANSACTIONID]
						,[RECVERSION]
						,[PARTITION]
						,[RECID]
						,[PARTNOYES]
						,[WORKNOYES]
						,[DESCNOYES]
						,[ROWIDNOYES]
						,[MRDOSIMPORT]
						,[FINCONSOLIDATIONFIELDIDX]
						,[FINCONSOLIDATIONORGUNITTABLE_FK]
						,[REPORTMENUITEMNAME]
						,[REMARKSNOYES]
						,[TREZORIMPORTCLASSNAME])

			VALUES ( src.[FINSTATEMENTDEFSEQID]
					,src.[DOCUTYPEID]
					,src.[XMLINTERVAL]
					,src.[XMLTAG]
					,src.[XMLDOCUMENTNAME]
					,src.[POSTTOACCOUNT]
					,src.[POSTTOTRANS]
					,src.[POSTINGLEVEL]
					,src.[VOUCHERSEQID]
					,src.[XMLSUBDOCUMENT]
					,src.[CALCPLANONLYNOZERO]
					,src.[AUTOCREATE]
					,src.[DATEFROM]
					,src.[BLOCKED]
					,src.[FINSTATEMENTDEFVERSIONID]
					,src.[MANDATORYCLASSIFICATION]
					,src.[DYNAMICROWS]
					,src.[DEFAULTCONSOLIDATED_FK]
					,src.[DEFAULTAGGR_FK]
					,src.[DEFAULTSTATEMENT_FK]
					,src.[FINSTATEMENTTYPEDEF_FK]
					,src.[PROJECTNOYES]
					,src.[PROGRAMNOYES]
					,src.[PARAGRAPHNOYES]
					,src.[SUBSECTIONNOYES]
					,src.[SECTIONNOYES]
					,src.[EMPLOYMENTGROUPNOYES]
					,src.[FINSTATEMENTTYPE]
					,src.[PART]
					,src.[RECIPIENT]
					,src.[PROTECTEDDOCUTYPEID]
					,src.[CHECKCLASSNAME]
					,src.[DATAPREPCLASSNAME]
					,src.[MODIFIEDDATETIME]
					,src.[MODIFIEDBY]
					,src.[MODIFIEDTRANSACTIONID]
					,src.[CREATEDDATETIME]
					,src.[CREATEDBY]
					,src.[CREATEDTRANSACTIONID]
					,src.[RECVERSION]
					,src.[PARTITION]
					,src.[RECID]
					,src.[PARTNOYES]
					,src.[WORKNOYES]
					,src.[DESCNOYES]
					,src.[ROWIDNOYES]
					,src.[MRDOSIMPORT]
					,src.[FINCONSOLIDATIONFIELDIDX]
					,src.[FINCONSOLIDATIONORGUNITTABLE_FK]
					,src.[REPORTMENUITEMNAME]
					,src.[REMARKSNOYES]
					,src.[TREZORIMPORTCLASSNAME]);
			SET @Merged = 1;
		END

		IF @TableName = 'KPfinstatementFielddef' BEGIN
			MERGE INTO zef2.KPfinstatementFielddef AS tgt
			USING WI_StageODS.zef2.KPfinstatementFielddef AS src
			ON (tgt.[RECID]=src.[RECID])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[LABEL]                    = src.[LABEL]
				,tgt.[ALLOWEDIT]                = src.[ALLOWEDIT]
				,tgt.[FIELDIDX]                 = src.[FIELDIDX]
				,tgt.[ORDERFLD]                 = src.[ORDERFLD]
				,tgt.[FINANCIALPLAN]            = src.[FINANCIALPLAN]
				,tgt.[EXECUTION]                = src.[EXECUTION]
				,tgt.[CALCULATED]               = src.[CALCULATED]
				,tgt.[XMLTAG]                   = src.[XMLTAG]
				,tgt.[FIELDSSUM]                = src.[FIELDSSUM]
				,tgt.[ROWID]                    = src.[ROWID]
				,tgt.[FINSTATEMENTDEF_FK]       = src.[FINSTATEMENTDEF_FK]
				,tgt.[MODIFIEDDATETIME]         = src.[MODIFIEDDATETIME]
				,tgt.[MODIFIEDBY]               = src.[MODIFIEDBY]
				,tgt.[MODIFIEDTRANSACTIONID]    = src.[MODIFIEDTRANSACTIONID]
				,tgt.[CREATEDDATETIME]          = src.[CREATEDDATETIME]
				,tgt.[CREATEDBY]                = src.[CREATEDBY]
				,tgt.[CREATEDTRANSACTIONID]     = src.[CREATEDTRANSACTIONID]
				,tgt.[RECVERSION]               = src.[RECVERSION]
				,tgt.[PARTITION]                = src.[PARTITION]
				,tgt.[MRDOSTAG]                 = src.[MRDOSTAG]
				,tgt.[TREZOREXCLUDEFROMXML]		= src.[TREZOREXCLUDEFROMXML]
				,tgt.[AMOUNTROUNDOFF]			= src.[AMOUNTROUNDOFF]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([LABEL]
						,[ALLOWEDIT]
						,[FIELDIDX]
						,[ORDERFLD]
						,[FINANCIALPLAN]
						,[EXECUTION]
						,[CALCULATED]
						,[XMLTAG]
						,[FIELDSSUM]
						,[ROWID]
						,[FINSTATEMENTDEF_FK]
						,[MODIFIEDDATETIME]
						,[MODIFIEDBY]
						,[MODIFIEDTRANSACTIONID]
						,[CREATEDDATETIME]
						,[CREATEDBY]
						,[CREATEDTRANSACTIONID]
						,[RECVERSION]
						,[PARTITION]
						,[RECID]
						,[MRDOSTAG]
						,[TREZOREXCLUDEFROMXML]
						,[AMOUNTROUNDOFF])
			VALUES ( src.[LABEL]
					,src.[ALLOWEDIT]
					,src.[FIELDIDX]
					,src.[ORDERFLD]
					,src.[FINANCIALPLAN]
					,src.[EXECUTION]
					,src.[CALCULATED]
					,src.[XMLTAG]
					,src.[FIELDSSUM]
					,src.[ROWID]
					,src.[FINSTATEMENTDEF_FK]
					,src.[MODIFIEDDATETIME]
					,src.[MODIFIEDBY]
					,src.[MODIFIEDTRANSACTIONID]
					,src.[CREATEDDATETIME]
					,src.[CREATEDBY]
					,src.[CREATEDTRANSACTIONID]
					,src.[RECVERSION]
					,src.[PARTITION]
					,src.[RECID]
					,src.[MRDOSTAG]
					,src.[TREZOREXCLUDEFROMXML]
					,src.[AMOUNTROUNDOFF]);
			SET @Merged = 1;
		END

		IF @TableName = 'KPfinstatementRowDef' BEGIN
			MERGE INTO zef2.KPfinstatementRowDef AS tgt
			USING WI_StageODS.zef2.KPfinstatementRowDef AS src
			ON (tgt.[RECID]=src.[RECID])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[ROWID]                   = src.[ROWID]
				,tgt.[NAME]                    = src.[NAME]
				,tgt.[NUM]                     = src.[NUM]
				,tgt.[XMLTAG]                  = src.[XMLTAG]
				,tgt.[CALCEXPRESSION]          = src.[CALCEXPRESSION]
				,tgt.[DYNAMICROW]              = src.[DYNAMICROW]
				,tgt.[DATETO]                  = src.[DATETO]
				,tgt.[CONSOLIDATEDROWID]       = src.[CONSOLIDATEDROWID]
				,tgt.[FINSTATEMENTDEF_FK]      = src.[FINSTATEMENTDEF_FK]
				,tgt.[HEADERROW]               = src.[HEADERROW]
				,tgt.[MODIFIEDDATETIME]        = src.[MODIFIEDDATETIME]
				,tgt.[MODIFIEDBY]              = src.[MODIFIEDBY]
				,tgt.[MODIFIEDTRANSACTIONID]   = src.[MODIFIEDTRANSACTIONID]
				,tgt.[CREATEDDATETIME]         = src.[CREATEDDATETIME]
				,tgt.[CREATEDBY]               = src.[CREATEDBY]
				,tgt.[CREATEDTRANSACTIONID]    = src.[CREATEDTRANSACTIONID]
				,tgt.[RECVERSION]              = src.[RECVERSION]
				,tgt.[PARTITION]               = src.[PARTITION]
				,tgt.[KPFINSTATEMENTROWTYPE]   = src.[KPFINSTATEMENTROWTYPE]
				,tgt.[TREZORCHAPTERCODE]	   = src.[TREZORCHAPTERCODE]
				,tgt.[TREZORPOSITIONCODE]	   = src.[TREZORPOSITIONCODE]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([ROWID]
						,[NAME]
						,[NUM]
						,[XMLTAG]
						,[CALCEXPRESSION]
						,[DYNAMICROW]
						,[DATETO]
						,[CONSOLIDATEDROWID]
						,[FINSTATEMENTDEF_FK]
						,[HEADERROW]
						,[MODIFIEDDATETIME]
						,[MODIFIEDBY]
						,[MODIFIEDTRANSACTIONID]
						,[CREATEDDATETIME]
						,[CREATEDBY]
						,[CREATEDTRANSACTIONID]
						,[RECVERSION]
						,[PARTITION]
						,[RECID]
						,[KPFINSTATEMENTROWTYPE]
						,[TREZORCHAPTERCODE]
						,[TREZORPOSITIONCODE])
			VALUES ( src.[ROWID]
					,src.[NAME]
					,src.[NUM]
					,src.[XMLTAG]
					,src.[CALCEXPRESSION]
					,src.[DYNAMICROW]
					,src.[DATETO]
					,src.[CONSOLIDATEDROWID]
					,src.[FINSTATEMENTDEF_FK]
					,src.[HEADERROW]
					,src.[MODIFIEDDATETIME]
					,src.[MODIFIEDBY]
					,src.[MODIFIEDTRANSACTIONID]
					,src.[CREATEDDATETIME]
					,src.[CREATEDBY]
					,src.[CREATEDTRANSACTIONID]
					,src.[RECVERSION]
					,src.[PARTITION]
					,src.[RECID]
					,src.[KPFINSTATEMENTROWTYPE]
					,src.[TREZORCHAPTERCODE]
					,src.[TREZORPOSITIONCODE]);
			SET @Merged = 1;
		END

		IF @TableName = 'KPJournalStatusTable' BEGIN
			MERGE INTO zef2.KPJournalStatusTable AS tgt
			USING WI_StageODS.zef2.KPJournalStatusTable AS src
			ON (tgt.[STATUSNAMEID]  = src.[STATUSNAMEID] AND tgt.[PARTITION] = src.[PARTITION])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[STATUSNAME]             = src.[STATUSNAME]
				,tgt.[STARTSTATUSID]          = src.[STARTSTATUSID]
				,tgt.[MODIFIEDDATETIME]       = src.[MODIFIEDDATETIME]
				,tgt.[MODIFIEDBY]             = src.[MODIFIEDBY]
				,tgt.[MODIFIEDTRANSACTIONID]  = src.[MODIFIEDTRANSACTIONID]
				,tgt.[CREATEDDATETIME]        = src.[CREATEDDATETIME]
				,tgt.[DEL_CREATEDTIME]        = src.[DEL_CREATEDTIME]
				,tgt.[CREATEDBY]              = src.[CREATEDBY]
				,tgt.[CREATEDTRANSACTIONID]   = src.[CREATEDTRANSACTIONID]
				,tgt.[RECVERSION]             = src.[RECVERSION]
				,tgt.[RECID]                  = src.[RECID]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([STATUSNAME]
						,[STATUSNAMEID]
						,[STARTSTATUSID]
						,[MODIFIEDDATETIME]
						,[MODIFIEDBY]
						,[MODIFIEDTRANSACTIONID]
						,[CREATEDDATETIME]
						,[DEL_CREATEDTIME]
						,[CREATEDBY]
						,[CREATEDTRANSACTIONID]
						,[RECVERSION]
						,[PARTITION]
						,[RECID])
			VALUES ( src.[STATUSNAME]
					,src.[STATUSNAMEID]
					,src.[STARTSTATUSID]
					,src.[MODIFIEDDATETIME]
					,src.[MODIFIEDBY]
					,src.[MODIFIEDTRANSACTIONID]
					,src.[CREATEDDATETIME]
					,src.[DEL_CREATEDTIME]
					,src.[CREATEDBY]
					,src.[CREATEDTRANSACTIONID]
					,src.[RECVERSION]
					,src.[PARTITION]
					,src.[RECID]);
			SET @Merged = 1;
		END

		IF @TableName = 'KPJournalStatusLine' BEGIN
			MERGE INTO zef2.KPJournalStatusLine AS tgt
			USING WI_StageODS.zef2.KPJournalStatusLine AS src
			ON (tgt.[STATUS]=src.[STATUS] AND tgt.[STATUSNAMEID] = src.[STATUSNAMEID] AND tgt.[PARTITION] = src.[PARTITION])
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[POSTINGREADY]                       = src.[POSTINGREADY]
				,tgt.[GROUPIDSTATUS]                      = src.[GROUPIDSTATUS]
				,tgt.[CHECK_]                             = src.[CHECK_]
				,tgt.[ALLOWEDIT]                          = src.[ALLOWEDIT]
				,tgt.[APPROVETRANS]                       = src.[APPROVETRANS]
				,tgt.[POSITION]                           = src.[POSITION]
				,tgt.[AMOUNTLIMITFROM]                    = src.[AMOUNTLIMITFROM]
				,tgt.[AMOUNTLIMITTO]                      = src.[AMOUNTLIMITTO]
				,tgt.[REGACCEPTREADY]                     = src.[REGACCEPTREADY]
				,tgt.[REGDOCUMENTDEL]                     = src.[REGDOCUMENTDEL]
				,tgt.[FINSTATEMENTTABLEAPPROVED]          = src.[FINSTATEMENTTABLEAPPROVED]
				,tgt.[FINSTATEMENTTABLESENTTOPARENTUNIT]  = src.[FINSTATEMENTTABLESENTTOPARENTUNIT]
				,tgt.[ACTIVECANCEL]                       = src.[ACTIVECANCEL]
				,tgt.[BGTSENTTOPARENT]                    = src.[BGTSENTTOPARENT]
				,tgt.[BGTSENTTOCHILD]                     = src.[BGTSENTTOCHILD]
				,tgt.[ALLOWEDITGROUP]                     = src.[ALLOWEDITGROUP]
				,tgt.[BGTXMLGENERATED]                    = src.[BGTXMLGENERATED]
				,tgt.[ALLOWSTATUSCANCEL]                  = src.[ALLOWSTATUSCANCEL]
				,tgt.[ALLOWSTATUSCANCELGROUP]             = src.[ALLOWSTATUSCANCELGROUP]
				,tgt.[ALLOWSTATUSBACKGROUP]               = src.[ALLOWSTATUSBACKGROUP]
				,tgt.[ALLOWSTATUSBACK]                    = src.[ALLOWSTATUSBACK]
				,tgt.[DISABLECHANGESTATUS]                = src.[DISABLECHANGESTATUS]
				,tgt.[COMMENTMANDATORYONSET]              = src.[COMMENTMANDATORYONSET]
				,tgt.[COMMENTMANDATORYONBACK]             = src.[COMMENTMANDATORYONBACK]
				,tgt.[COMMENTMANDATORYONCANCEL]           = src.[COMMENTMANDATORYONCANCEL]
				,tgt.[BGTSENTTODECISION]                  = src.[BGTSENTTODECISION]
				,tgt.[BGTSENTTODECISIONPARENT]            = src.[BGTSENTTODECISIONPARENT]
				,tgt.[STOPONERROR]                        = src.[STOPONERROR]
				,tgt.[STATUSAUTONEXT]                     = src.[STATUSAUTONEXT]
				,tgt.[DONTSTOPONPLANERROR]                = src.[DONTSTOPONPLANERROR]
				,tgt.[ALLOWCHANGETRANSDATE]               = src.[ALLOWCHANGETRANSDATE]
				,tgt.[REGAUTOACCEPTJOURNAL]               = src.[REGAUTOACCEPTJOURNAL]
				,tgt.[FINSTATEMENTTABLECANCELLED]         = src.[FINSTATEMENTTABLECANCELLED]
				,tgt.[FINSTATEMENTTABLERECEIVED]          = src.[FINSTATEMENTTABLERECEIVED]
				,tgt.[FINSTATEMENTTABLECHECKRECEIVED]     = src.[FINSTATEMENTTABLECHECKRECEIVED]
				,tgt.[STATUSAUTOFIRST]                    = src.[STATUSAUTOFIRST]
				,tgt.[MODIFIEDDATETIME]                   = src.[MODIFIEDDATETIME]
				,tgt.[MODIFIEDBY]                         = src.[MODIFIEDBY]
				,tgt.[MODIFIEDTRANSACTIONID]              = src.[MODIFIEDTRANSACTIONID]
				,tgt.[CREATEDDATETIME]                    = src.[CREATEDDATETIME]
				,tgt.[DEL_CREATEDTIME]                    = src.[DEL_CREATEDTIME]
				,tgt.[CREATEDBY]                          = src.[CREATEDBY]
				,tgt.[CREATEDTRANSACTIONID]               = src.[CREATEDTRANSACTIONID]
				,tgt.[RECVERSION]                         = src.[RECVERSION]
				,tgt.[RECID]                              = src.[RECID]
				,tgt.[REGJOURNALSTATUSALLOWCANCEL]        = src.[REGJOURNALSTATUSALLOWCANCEL]
				,tgt.[REGWITHAUCTIONALLOWEDIT]            = src.[REGWITHAUCTIONALLOWEDIT]
				,tgt.[SENDER]                             = src.[SENDER]
				,tgt.[RECIPIENT]                          = src.[RECIPIENT]
				,tgt.[STATUSEXT]                          = src.[STATUSEXT]
				,tgt.[CHECKLISTENABLED]                   = src.[CHECKLISTENABLED]
				,tgt.[CHECKLISTSETUPGROUP]                = src.[CHECKLISTSETUPGROUP]
				,tgt.[ALLOWORDERTOCASH]						= src.[ALLOWORDERTOCASH]
				,tgt.[BGTRECEIVED]							= src.[BGTRECEIVED]

			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([STATUS]
						,[POSTINGREADY]
						,[GROUPIDSTATUS]
						,[CHECK_]
						,[ALLOWEDIT]
						,[STATUSNAMEID]
						,[APPROVETRANS]
						,[POSITION]
						,[AMOUNTLIMITFROM]
						,[AMOUNTLIMITTO]
						,[REGACCEPTREADY]
						,[REGDOCUMENTDEL]
						,[FINSTATEMENTTABLEAPPROVED]
						,[FINSTATEMENTTABLESENTTOPARENTUNIT]
						,[ACTIVECANCEL]
						,[BGTSENTTOPARENT]
						,[BGTSENTTOCHILD]
						,[ALLOWEDITGROUP]
						,[BGTXMLGENERATED]
						,[ALLOWSTATUSCANCEL]
						,[ALLOWSTATUSCANCELGROUP]
						,[ALLOWSTATUSBACKGROUP]
						,[ALLOWSTATUSBACK]
						,[DISABLECHANGESTATUS]
						,[COMMENTMANDATORYONSET]
						,[COMMENTMANDATORYONBACK]
						,[COMMENTMANDATORYONCANCEL]
						,[BGTSENTTODECISION]
						,[BGTSENTTODECISIONPARENT]
						,[STOPONERROR]
						,[STATUSAUTONEXT]
						,[DONTSTOPONPLANERROR]
						,[ALLOWCHANGETRANSDATE]
						,[REGAUTOACCEPTJOURNAL]
						,[FINSTATEMENTTABLECANCELLED]
						,[FINSTATEMENTTABLERECEIVED]
						,[FINSTATEMENTTABLECHECKRECEIVED]
						,[STATUSAUTOFIRST]
						,[MODIFIEDDATETIME]
						,[MODIFIEDBY]
						,[MODIFIEDTRANSACTIONID]
						,[CREATEDDATETIME]
						,[DEL_CREATEDTIME]
						,[CREATEDBY]
						,[CREATEDTRANSACTIONID]
						,[RECVERSION]
						,[PARTITION]
						,[RECID]
						,[REGJOURNALSTATUSALLOWCANCEL]
						,[REGWITHAUCTIONALLOWEDIT]
						,[SENDER]
						,[RECIPIENT]
						,[STATUSEXT]
						,[CHECKLISTENABLED]
						,[CHECKLISTSETUPGROUP]
						,[ALLOWORDERTOCASH]
						,[BGTRECEIVED])
			VALUES ( src.[STATUS]
					,src.[POSTINGREADY]
					,src.[GROUPIDSTATUS]
					,src.[CHECK_]
					,src.[ALLOWEDIT]
					,src.[STATUSNAMEID]
					,src.[APPROVETRANS]
					,src.[POSITION]
					,src.[AMOUNTLIMITFROM]
					,src.[AMOUNTLIMITTO]
					,src.[REGACCEPTREADY]
					,src.[REGDOCUMENTDEL]
					,src.[FINSTATEMENTTABLEAPPROVED]
					,src.[FINSTATEMENTTABLESENTTOPARENTUNIT]
					,src.[ACTIVECANCEL]
					,src.[BGTSENTTOPARENT]
					,src.[BGTSENTTOCHILD]
					,src.[ALLOWEDITGROUP]
					,src.[BGTXMLGENERATED]
					,src.[ALLOWSTATUSCANCEL]
					,src.[ALLOWSTATUSCANCELGROUP]
					,src.[ALLOWSTATUSBACKGROUP]
					,src.[ALLOWSTATUSBACK]
					,src.[DISABLECHANGESTATUS]
					,src.[COMMENTMANDATORYONSET]
					,src.[COMMENTMANDATORYONBACK]
					,src.[COMMENTMANDATORYONCANCEL]
					,src.[BGTSENTTODECISION]
					,src.[BGTSENTTODECISIONPARENT]
					,src.[STOPONERROR]
					,src.[STATUSAUTONEXT]
					,src.[DONTSTOPONPLANERROR]
					,src.[ALLOWCHANGETRANSDATE]
					,src.[REGAUTOACCEPTJOURNAL]
					,src.[FINSTATEMENTTABLECANCELLED]
					,src.[FINSTATEMENTTABLERECEIVED]
					,src.[FINSTATEMENTTABLECHECKRECEIVED]
					,src.[STATUSAUTOFIRST]
					,src.[MODIFIEDDATETIME]
					,src.[MODIFIEDBY]
					,src.[MODIFIEDTRANSACTIONID]
					,src.[CREATEDDATETIME]
					,src.[DEL_CREATEDTIME]
					,src.[CREATEDBY]
					,src.[CREATEDTRANSACTIONID]
					,src.[RECVERSION]
					,src.[PARTITION]
					,src.[RECID]
					,src.[REGJOURNALSTATUSALLOWCANCEL]
					,src.[REGWITHAUCTIONALLOWEDIT]
					,src.[SENDER]
					,src.[RECIPIENT]
					,src.[STATUSEXT]
					,src.[CHECKLISTENABLED]
					,src.[CHECKLISTSETUPGROUP]
					,src.[ALLOWORDERTOCASH]
					,src.[BGTRECEIVED]);
			SET @Merged = 1;
		END
		
		IF @TableName = 'orbeon_form_data' BEGIN
			MERGE INTO zef2.orbeon_form_data AS tgt
			USING WI_StageODS.zef2.orbeon_form_data AS src
			ON (tgt.id1=src.id1)
			WHEN MATCHED AND src.operacja IN ('U', 'I')
			THEN UPDATE SET
				 tgt.[app]                     = src.[app]
				,tgt.[created]                 = src.[created]
				,tgt.[deleted]                 = src.[deleted]
				,tgt.[document_id]             = src.[document_id]
				,tgt.[form]                    = src.[form]
				,tgt.[last_modified]           = src.[last_modified]
				,tgt.[searchAppName]           = src.[searchAppName]
				,tgt.[searchFormDescription]   = src.[searchFormDescription]
				,tgt.[searchFormName]          = src.[searchFormName]
				,tgt.[searchFormTitle]         = src.[searchFormTitle]
				,tgt.[taskCompleted]           = src.[taskCompleted]
				,tgt.[taskId]                  = src.[taskId]
				,tgt.[username]                = src.[username]
				,tgt.[xml]                     = src.[xml]
				,tgt.[pUid]                    = src.[pUid]
				,tgt.[uid]                     = src.[uid]
				,tgt.[migration]               = src.[migration]
			WHEN MATCHED AND src.operacja = 'D' THEN DELETE
			WHEN NOT MATCHED AND src.operacja IN ('U', 'I')
			THEN INSERT ([id1]
						,[app]
						,[created]
						,[deleted]
						,[document_id]
						,[form]
						,[last_modified]
						,[searchAppName]
						,[searchFormDescription]
						,[searchFormName]
						,[searchFormTitle]
						,[taskCompleted]
						,[taskId]
						,[username]
						,[xml]
						,[pUid]
						,[uid]
						,[migration])
			VALUES ( src.[id1]
					,src.[app]
					,src.[created]
					,src.[deleted]
					,src.[document_id]
					,src.[form]
					,src.[last_modified]
					,src.[searchAppName]
					,src.[searchFormDescription]
					,src.[searchFormName]
					,src.[searchFormTitle]
					,src.[taskCompleted]
					,src.[taskId]
					,src.[username]
					,src.[xml]
					,src.[pUid]
					,src.[uid]
					,src.[migration]);
			SET @Merged = 1;
		END	

IF (@Merged = 0)
	BEGIN
			DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
			THROW 51002, @Info, 0;
				END
			END;