CREATE TABLE [MF\BZPN].[aga_EMCS_podmiotyM_nabycia] (
    [M]                             INT            NULL,
    [Miesiac]                       VARCHAR (11)   NOT NULL,
    [Odbierający_NR]                NVARCHAR (48)  NULL,
    [Odbierający_Nazwa]             NVARCHAR (546) NULL,
    [Odbierający_Ulica]             NVARCHAR (195) NULL,
    [Odbierający_Ulica_NR_domu]     NVARCHAR (33)  NULL,
    [Odbierający_Kod_pocztowy]      NVARCHAR (30)  NULL,
    [Odbierający_Miejscowosc]       NVARCHAR (150) NULL,
    [Odbierający_Kod_języka]        VARCHAR (2)    NULL,
    [Nr_Miejsca_Dostawy]            NVARCHAR (48)  NULL,
    [Miejsce_Dostawy_Nazwa]         NVARCHAR (546) NULL,
    [Miejsce_Dostawy_Ulica]         NVARCHAR (195) NULL,
    [Miejsce_Dostawy_Ulica_Nr_domu] NVARCHAR (33)  NULL,
    [Miejsce_Dostawy_Kod_pocztowy]  NVARCHAR (30)  NULL,
    [Miejsce_Dostawy_Miejscowosc]   NVARCHAR (150) NULL,
    [Towar]                         VARCHAR (8)    NULL,
    [Ilosc]                         NUMERIC (38)   NULL,
    [masa]                          NUMERIC (38)   NULL,
    [MiejsceWysyłki]                VARCHAR (2)    NULL
);

