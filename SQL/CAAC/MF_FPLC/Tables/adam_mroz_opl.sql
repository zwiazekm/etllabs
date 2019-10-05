CREATE TABLE [MF\FPLC].[adam_mroz_opl] (
    [status_deklaracji]      NVARCHAR (4)    NULL,
    [status_pozycji]         NVARCHAR (4)    NULL,
    [RodzDok]                VARCHAR (20)    NULL,
    [P1b]                    NVARCHAR (5)    NULL,
    [rok_miesiąc]            VARCHAR (4)     NULL,
    [data_przyjęcia]         VARCHAR (10)    NULL,
    [Urząd_celny_zgłoszenia] NVARCHAR (8)    NULL,
    [NrZgloszenia]           NVARCHAR (35)   NULL,
    [NrPozycji]              NUMERIC (5)     NULL,
    [Procedura]              NVARCHAR (7)    NULL,
    [Typ]                    NVARCHAR (3)    NULL,
    [podstawa]               NUMERIC (16, 2) NULL,
    [Stawka]                 NUMERIC (17, 2) NULL,
    [kwota]                  NUMERIC (16, 2) NULL,
    [MP]                     NVARCHAR (1)    NULL
);

