CREATE TABLE [aes2].[MEX_Dokument] (
    [Id]                    NUMERIC (19)    NOT NULL,
    [MasaBrutto]            NUMERIC (18, 3) NULL,
    [KodWynikuKontroli]     NVARCHAR (2)    NULL,
    [KodWynikuKontroliPid]  INT             NULL,
    [UrzadWyprowadzenia]    NVARCHAR (8)    NOT NULL,
    [UrzadWyprowadzeniaPid] INT             NOT NULL,
    [LiczbaPozycji]         INT             NULL,
    [LiczbaOpakowan]        NUMERIC (19)    NULL,
    [DataPrzedstawienia]    DATETIME2 (3)   NULL,
    [Status]                NCHAR (1)       NOT NULL,
    [Miejsce]               NVARCHAR (105)  NULL,
    [Data]                  DATETIME2 (3)   NULL,
    [DataPrzyjeciaNaEwid]   DATETIME2 (3)   NULL,
    [NrWlasny]              NVARCHAR (22)   NULL,
    [MRX]                   NVARCHAR (35)   NULL,
    CONSTRAINT [MEX_Dokument$PK_MEX_Dokument] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2]
);

