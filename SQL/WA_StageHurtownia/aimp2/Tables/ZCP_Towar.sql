﻿CREATE TABLE [aimp2].[ZCP_Towar] (
    [IdPozycji]                              NUMERIC (19)    NOT NULL,
    [IdDok]                                  NUMERIC (19)    NULL,
    [AGRIM]                                  BIT             NOT NULL,
    [SaldoARR]                               NVARCHAR (4)    NULL,
    [StatusPrzetwarzaniaPozycjiARR]          NVARCHAR (4)    NULL,
    [IdKupujacegoOsobaFizyczna]              NUMERIC (19)    NULL,
    [IdPodmiotuDoKontaktu]                   NUMERIC (19)    NULL,
    [IdOdbiorcyPodmiotGospodarczy]           NUMERIC (19)    NULL,
    [IdSprzedajacegoPodmiotGospodarczy]      NUMERIC (19)    NULL,
    [IdNadawcyPodmiotGospodarczy]            NUMERIC (19)    NULL,
    [DataDoKalkulacji1]                      DATETIME2 (3)   NULL,
    [DataDoKalkulacji2]                      DATETIME2 (3)   NULL,
    [KodCN]                                  NVARCHAR (8)    NULL,
    [RzeczywistyKodTowarowy]                 NVARCHAR (8)    NULL,
    [IdPodmiotuZPozwNaSamoobslugeCelna]      NUMERIC (19)    NULL,
    [KontynuacjaProcesu]                     BIT             NOT NULL,
    [KrajPrzeznaczenia]                      NVARCHAR (2)    NULL,
    [KrajPrzeznaczeniaPid]                   INT             NULL,
    [KrajPrzeznaczeniaRegion]                NVARCHAR (9)    NULL,
    [KrajPrzeznaczeniaRegionPid]             INT             NULL,
    [KrajWysylki]                            NVARCHAR (2)    NULL,
    [KrajWysylkiPid]                         INT             NULL,
    [KrajPochodzenia]                        NVARCHAR (2)    NULL,
    [KrajPochodzeniaPid]                     INT             NULL,
    [WynikWalidacjiCRX_REX]                  INT             NULL,
    [KodWaluty]                              NVARCHAR (3)    NULL,
    [KodWalutyPid]                           INT             NULL,
    [KodCUS]                                 NVARCHAR (18)   NULL,
    [IdDecyzjiAdminUsuwajacejPozycje]        NUMERIC (19)    NULL,
    [OpisNieprawidlowosci]                   NVARCHAR (1024) NULL,
    [EAD]                                    BIT             NOT NULL,
    [EMCSNumerARC]                           NVARCHAR (35)   NULL,
    [EMCSKodCN]                              NVARCHAR (8)    NULL,
    [EMCSMasaNetto]                          NUMERIC (16, 6) NULL,
    [EMCSStatusPrzetwarzaniaPozycji]         NVARCHAR (4)    NULL,
    [EMCSTryb]                               NCHAR (2)       NULL,
    [MasaBrutto]                             NUMERIC (16, 6) NULL,
    [ZarejestrowaneZabezpieczenie]           BIT             NOT NULL,
    [IdPozycjiZdefiniowanejPDS]              NUMERIC (19)    NULL,
    [IdDanychCelnychPozycjiPDS]              NUMERIC (19)    NULL,
    [DataUniewaznienia]                      DATETIME2 (3)   NULL,
    [UniewaznionoPozycjeManualnie]           BIT             NOT NULL,
    [PowodUniewaznieniaPozycji]              NVARCHAR (1024) NULL,
    [PowodOdrzuceniaUniewaznieniaPozycji]    NVARCHAR (1024) NULL,
    [NumerWlasnyWnioskuOUniewaznienie]       NVARCHAR (35)   NULL,
    [KodTowarowy]                            NVARCHAR (8)    NULL,
    [OpisPozycji]                            NVARCHAR (1000) NULL,
    [NumerPozycji]                           NUMERIC (5)     NULL,
    [Wartosc]                                DECIMAL (16, 2) NULL,
    [TrescAdnotacjiUrzedowych]               NVARCHAR (2000) NULL,
    [NrPozycjiSrodkaTARIC]                   NUMERIC (2)     NULL,
    [KodTypuSrodkaTARIC]                     NVARCHAR (3)    NULL,
    [MasaNetto]                              NUMERIC (16, 6) NULL,
    [RzeczywistaMasaNetto]                   NUMERIC (16, 3) NULL,
    [Adnotacje]                              NVARCHAR (260)  NULL,
    [IdKupujacegoPodmiotGospodarczy]         NUMERIC (19)    NULL,
    [IdOsobyDoKontaktu]                      NUMERIC (19)    NULL,
    [IdOdbiorcyOsobaFizyczna]                NUMERIC (19)    NULL,
    [IdSprzedajacegoOsobaFizyczna]           NUMERIC (19)    NULL,
    [IdNadawcyOsobaFizyczna]                 NUMERIC (19)    NULL,
    [ZaksiegowanoZerowePlatnosciZEFIR]       BIT             NOT NULL,
    [KodKrajuPreferencyjnegoPochodzenia]     NVARCHAR (2)    NULL,
    [KodKrajuPreferencyjnegoPochodzeniaPid]  INT             NULL,
    [NumerReferencyjnyPrzesylki]             NVARCHAR (35)   NULL,
    [PlatnoscZarejestrowana]                 BIT             NOT NULL,
    [KodPreferencji]                         NVARCHAR (3)    NULL,
    [KodPreferencjiPid]                      INT             NULL,
    [KodProceduryPoprzedniej]                NVARCHAR (2)    NULL,
    [KodProceduryPoprzedniejPid]             INT             NULL,
    [KodProceduryWnioskowanej]               NVARCHAR (7)    NULL,
    [KodProceduryWnioskowanejPid]            INT             NULL,
    [ZrealizowanePlatnosciZEFIR]             BIT             NOT NULL,
    [IloscTowaru]                            NUMERIC (16, 6) NULL,
    [IloscTowaruUzupelniajacaJednostkaMiary] NUMERIC (16, 6) NULL,
    [DataZwolnieniaTowaru]                   DATETIME2 (3)   NULL,
    [PodstawaUregulowaniaStatusu]            NVARCHAR (35)   NULL,
    [TerminUregulowaniaStatusu]              DATETIME2 (3)   NULL,
    [SposobUregulowaniaStatusu]              NVARCHAR (1024) NULL,
    [StatusWyslaniaPozycjiDoOSOZ]            NVARCHAR (20)   NOT NULL,
    [StatusWyslaniaPozycjiDoZEFIR]           NVARCHAR (20)   NOT NULL,
    [WyslanoKomunikatZC272]                  BIT             NOT NULL,
    [EMCSOczekiwanie]                        NCHAR (1)       NULL,
    [KodTARIC]                               NVARCHAR (2)    NULL,
    [TQSOdrzucenie]                          BIT             NOT NULL,
    [IdZgloszeniaUzupelniajacego]            NUMERIC (19)    NULL,
    [VAT7DecyzjaAdministracyjna]             BIT             NULL,
    [VAT7Zamkniecia]                         BIT             NOT NULL,
    [VAT7DataCzasZaplaty]                    DATETIME        NULL,
    [WynikWeryfikacji]                       NVARCHAR (4)    NULL,
    [DanePokontrolne]                        NTEXT           NULL,
    [StatusPozycji]                          NVARCHAR (4)    NULL,
    [LiczbaSprostowanWyslanychDoZEFIR]       INT             NULL,
    CONSTRAINT [ZCP_Towar_PK] PRIMARY KEY CLUSTERED ([IdPozycji] ASC)
);

