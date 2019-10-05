CREATE TABLE [zc].[MEX_Dokument] (
    [Id]                  DECIMAL (19)    NOT NULL,
    [Status]              CHAR (1)        NULL,
    [NrWlasny]            VARCHAR (22)    NULL,
    [MRX]                 VARCHAR (35)    NULL,
    [UCWyprowadzenia]     VARCHAR (8)     NULL,
    [LiczbaPozycji]       INT             NULL,
    [LiczbaOpakowan]      DECIMAL (19)    NULL,
    [MasaBrutto]          DECIMAL (18, 3) NULL,
    [KodWynikuKontroli]   CHAR (2)        NULL,
    [Miejsce]             NVARCHAR (35)   NULL,
    [DataPrzedstawienia]  DATETIME        NULL,
    [Data]                DATETIME        NULL,
    [DataPrzyjeciaNaEwid] DATETIME        NULL,
    CONSTRAINT [PK_MEX_Dokument] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC]
);

