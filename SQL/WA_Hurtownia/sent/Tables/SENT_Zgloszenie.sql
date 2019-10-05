﻿CREATE TABLE [sent].[SENT_Zgloszenie] (
    [IdZgloszenia]                           BIGINT          IDENTITY (1, 1) NOT NULL,
    [HistoriaZgloszenia]                     BIGINT          NOT NULL,
    [IdSENT]                                 INT             NULL,
    [NumerZgloszenia]                        CHAR (18)       NULL,
    [KluczOdbiorcy]                          CHAR (7)        NULL,
    [KluczNadawcy]                           CHAR (7)        NULL,
    [KluczKierowcy]                          CHAR (7)        NULL,
    [ZgloszenieOswiadczenieOUpowaznieniu]    BIT             NULL,
    [ZgloszenieNumerWlasnyDokumentu]         VARCHAR (70)    NULL,
    [ZgloszenieRodzaj]                       CHAR (3)        NULL,
    [ZgloszenieNameSpace]                    VARCHAR (255)   NULL,
    [ZgloszenieStatus]                       CHAR (1)        NULL,
    [ZgloszenieTymczasowe]                   BIT             NULL,
    [ZgloszenieDataRejestracji]              DATETIME        NULL,
    [ZgloszenieRejestrujacy]                 VARCHAR (255)   NULL,
    [ZgloszenieDataZmiany]                   DATETIME        NULL,
    [ZgloszenieZmieniajacy]                  VARCHAR (255)   NULL,
    [ZgloszenieIdSEAP]                       VARCHAR (36)    NULL,
    [ZgloszenieIdSISCROF]                    VARCHAR (17)    NULL,
    [ZgloszenieSysRef]                       VARCHAR (255)   NULL,
    [ZgloszenieNrWplywu]                     VARCHAR (30)    NULL,
    [ZgloszenieNrWysylki]                    VARCHAR (30)    NULL,
    [ZgloszenieUwagi]                        VARCHAR (2000)  NULL,
    [ZgloszenieAnulowaneUwagi]               VARCHAR (2000)  NULL,
    [ZgloszenieDyrektywa]                    BIT             NULL,
    [ZgloszenieKontrola]                     BIT             NULL,
    [ZgloszenieAnalizaRyzyka]                BIT             NULL,
    [ZgloszenieDecyzja]                      BIT             NULL,
    [NadawcaIdSISC]                          VARCHAR (17)    NULL,
    [NadawcaPelnaNazwa]                      VARCHAR (300)   NULL,
    [NadawcaNip]                             VARCHAR (10)    NULL,
    [NadawcaRodzajIdentyfikatora]            VARCHAR (10)    NULL,
    [NadawcaNumerIdentyfikatora]             VARCHAR (32)    NULL,
    [NadawcaKraj]                            CHAR (2)        NULL,
    [NadawcaKodPocztowy]                     VARCHAR (9)     NULL,
    [NadawcaMiejscowosc]                     VARCHAR (60)    NULL,
    [NadawcaUlica]                           VARCHAR (80)    NULL,
    [NadawcaNrDomu]                          VARCHAR (10)    NULL,
    [NadawcaNrLokalu]                        VARCHAR (10)    NULL,
    [OdbiorcaIdSISC]                         VARCHAR (17)    NULL,
    [OdbiorcaPelnaNazwa]                     VARCHAR (300)   NULL,
    [OdbiorcaNip]                            VARCHAR (10)    NULL,
    [OdbiorcaRodzajIdentyfikatora]           VARCHAR (10)    NULL,
    [OdbiorcaNumerIdentyfikatora]            VARCHAR (32)    NULL,
    [OdbiorcaKraj]                           CHAR (2)        NULL,
    [OdbiorcaKodPocztowy]                    VARCHAR (9)     NULL,
    [OdbiorcaMiejscowosc]                    VARCHAR (60)    NULL,
    [OdbiorcaUlica]                          VARCHAR (80)    NULL,
    [OdbiorcaNrDomu]                         VARCHAR (10)    NULL,
    [OdbiorcaNrLokalu]                       VARCHAR (10)    NULL,
    [PrzewoznikIdSISC]                       VARCHAR (17)    NULL,
    [PrzewoznikPelnaNazwa]                   VARCHAR (300)   NULL,
    [PrzewoznikNip]                          VARCHAR (10)    NULL,
    [PrzewoznikRodzajIdentyfikatora]         VARCHAR (10)    NULL,
    [PrzewoznikNumerIdentyfikatora]          VARCHAR (32)    NULL,
    [PrzewoznikKraj]                         CHAR (2)        NULL,
    [PrzewoznikKodPocztowy]                  VARCHAR (9)     NULL,
    [PrzewoznikMiejscowosc]                  VARCHAR (60)    NULL,
    [PrzewoznikUlica]                        VARCHAR (80)    NULL,
    [PrzewoznikNrDomu]                       VARCHAR (10)    NULL,
    [PrzewoznikNrLokalu]                     VARCHAR (10)    NULL,
    [SrodekTransportuNumerCiagnika]          VARCHAR (89)    NULL,
    [SrodekTransportuNumerNaczepy]           VARCHAR (35)    NULL,
    [SrodekTransportuNrZezwoleniaDrogowego]  VARCHAR (32)    NULL,
    [SrodekTransportuNrLokalizatora]         VARCHAR (30)    NULL,
    [TowarKodKlasyfikacjiCN]                 VARCHAR (50)    NULL,
    [TowarKodKlasyfikacjiPKWiU]              VARCHAR (17)    NULL,
    [TowarNazwa]                             VARCHAR (500)   NULL,
    [TowarIlosc]                             DECIMAL (19, 4) NULL,
    [TowarJednostkaMiary]                    VARCHAR (15)    NULL,
    [TowarMasaNetto]                         DECIMAL (19, 4) NULL,
    [TowarMasaBrutto]                        DECIMAL (19, 4) NULL,
    [TowarWartoscNetto]                      DECIMAL (19, 4) NULL,
    [TowarWaluta]                            VARCHAR (3)     NULL,
    [TowarRodzajDokumentuTowarzyszacego]     VARCHAR (32)    NULL,
    [TowarNrDokumentuTowarzyszacego]         VARCHAR (32)    NULL,
    [TransportZaladunekKraj]                 CHAR (2)        NULL,
    [TransportZaladunekKodPocztowy]          VARCHAR (9)     NULL,
    [TransportZaladunekMiejscowosc]          VARCHAR (60)    NULL,
    [TransportZaladunekUlica]                VARCHAR (80)    NULL,
    [TransportZaladunekNrDomu]               VARCHAR (10)    NULL,
    [TransportZaladunekNrLokalu]             VARCHAR (10)    NULL,
    [TransportDostawaKraj]                   CHAR (2)        NULL,
    [TransportDostawaKodPocztowy]            VARCHAR (9)     NULL,
    [TransportDostawaMiejscowosc]            VARCHAR (60)    NULL,
    [TransportDostawaUlica]                  VARCHAR (80)    NULL,
    [TransportDostawaNrDomu]                 VARCHAR (10)    NULL,
    [TransportDostawaNrLokalu]               VARCHAR (10)    NULL,
    [TransportDataPlanowanegoPrzewozu]       DATETIME        NULL,
    [TransportDataRozpoczeciaPrzewozu]       DATETIME        NULL,
    [TransportDataZakonczeniaPrzewozu]       DATETIME        NULL,
    [TrasaWjazdMiejsce]                      VARCHAR (255)   NULL,
    [TrasaWjazdNrDrogi]                      VARCHAR (8)     NULL,
    [TrasaWjazdData]                         DATETIME        NULL,
    [TrasaWyjazdMiejsce]                     VARCHAR (255)   NULL,
    [TrasaWyjazdNrDrogi]                     VARCHAR (8)     NULL,
    [TrasaWyjazdData]                        DATETIME        NULL,
    [ZakonczeniePrzewozuZgodnyZeZgloszeniem] BIT             NULL,
    [ZakonczeniePrzewozuRodzajNiezgodnosci]  VARCHAR (32)    NULL,
    [ZakonczeniePrzewozuUwagi]               VARCHAR (2000)  NULL,
    [ZakonczeniePrzewozuData]                DATETIME        NULL,
    [KopertaWebService]                      VARCHAR (50)    NULL,
    [WsOdciskPalcaCertyfikatu]               VARCHAR (255)   NULL,
    [WsUzytkownik]                           VARCHAR (255)   NULL,
    [WsHaslo]                                VARCHAR (255)   NULL,
    [WsAdresKanaluZwrotnego]                 VARCHAR (400)   NULL,
    [KopertaEmail]                           VARCHAR (255)   NULL,
    [KopertaData]                            DATETIME        NULL,
    [Email1]                                 VARCHAR (255)   NULL,
    [Email2]                                 VARCHAR (255)   NULL,
    [Email3]                                 VARCHAR (255)   NULL,
    [ZgloszenieSumaKontrolna]                VARCHAR (50)    NULL,
    [ZgloszenieIdSISCROP]                    VARCHAR (17)    NULL,
    [ZgloszenieIdSISCP]                      VARCHAR (17)    NULL,
    [ZgloszenieNowyKlucz]                    CHAR (5)        NULL,
    [WsFromSISC]                             BIT             NULL,
    [NumerSentZb]                            CHAR (20)       NULL,
    [TransportZaladunekTERC]                 VARCHAR (9)     NULL,
    [TransportZaladunekSIMC]                 VARCHAR (9)     NULL,
    [TransportZaladunekULIC]                 VARCHAR (7)     NULL,
    [TransportDostawaTERC]                   VARCHAR (9)     NULL,
    [TransportDostawaSIMC]                   VARCHAR (9)     NULL,
    [TransportDostawaULIC]                   VARCHAR (7)     NULL,
    [TowarIloscDostarczona]                  REAL            NULL,
    [ZgloszenieBiezace]                      BIT             NULL,
    CONSTRAINT [SENT_Zgloszenie$PK_HistoriaZgloszenia] PRIMARY KEY CLUSTERED ([IdZgloszenia] ASC) ON [FG_SENT]
);

