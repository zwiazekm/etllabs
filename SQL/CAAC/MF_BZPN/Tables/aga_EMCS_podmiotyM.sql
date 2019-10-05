CREATE TABLE [MF\BZPN].[aga_EMCS_podmiotyM] (
    [M]                           INT            NULL,
    [Miesiac]                     VARCHAR (11)   NOT NULL,
    [Nr_akcyzowy_Wysyłającego]    VARCHAR (13)   NOT NULL,
    [NIP_wysyłającego]            VARCHAR (12)   NULL,
    [Wysylający_Nazwa]            NVARCHAR (546) NOT NULL,
    [Wysylający_Ulica]            NVARCHAR (195) NOT NULL,
    [Wysylający_Ulica_Nr_domu]    NVARCHAR (33)  NULL,
    [Wysylający_Kod_pocztowy]     NVARCHAR (30)  NOT NULL,
    [Wysylający_Miejscowość]      NVARCHAR (150) NOT NULL,
    [Wysylający_Kod_Języka]       VARCHAR (2)    NOT NULL,
    [NR_składu_Podatkowego_Wysyl] VARCHAR (13)   NULL,
    [Skład_Nazwa_Podmiotu_Wysyl]  NVARCHAR (546) NULL,
    [Skład_Ulica_Wysyl]           NVARCHAR (195) NULL,
    [Skład_Ulica_Nr_domu_Wysyl]   NVARCHAR (33)  NULL,
    [Skład_Kod_pocztowy_Wysyl]    NVARCHAR (30)  NULL,
    [Skład_Miasto_Wysyl]          NVARCHAR (150) NULL,
    [Skład_Kod_języka_Wysyl]      VARCHAR (2)    NULL,
    [Towar]                       VARCHAR (8)    NULL,
    [Ilosc]                       NUMERIC (38)   NULL,
    [masa]                        NUMERIC (38)   NULL,
    [MiejsceOdbioru]              VARCHAR (2)    NULL
);

