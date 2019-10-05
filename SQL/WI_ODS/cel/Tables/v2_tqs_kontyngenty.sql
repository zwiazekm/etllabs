CREATE TABLE [cel].[v2_tqs_kontyngenty] (
    [Nr_porzadkowy]         VARCHAR (6)     NOT NULL,
    [Kraj_pochodzenia]      VARCHAR (2)     NULL,
    [Data_otwarcia]         DATETIME        NULL,
    [Data_koncowa]          DATETIME        NULL,
    [Status]                CHAR (1)        NULL,
    [Data_zablokowania]     DATETIME        NULL,
    [Data_wyczerpania]      DATETIME        NULL,
    [Wielkosc_poczatkowa]   DECIMAL (21, 5) NULL,
    [Aktualne_saldo]        DECIMAL (21, 5) NULL,
    [Procent_wykorzystania] DECIMAL (5, 2)  NULL,
    [data otw]              VARCHAR (255)   NULL
) ON [FG_CEL];

