CREATE TABLE [cel].[v2_dok_dpdz] (
    [idDokNr]             BIGINT          NOT NULL,
    [idZglaszajacy]       INT             NULL,
    [LiczbaPozycji]       SMALLINT        NULL,
    [LiczbaOpakowan]      INT             NULL,
    [KrajWysylki]         VARCHAR (2)     NULL,
    [KrajPrzeznaczenia]   VARCHAR (2)     NULL,
    [MasaBrutto]          DECIMAL (14, 3) NULL,
    [ZwolnienieTowaru]    CHAR (1)        NULL,
    [PotwierdzenieWywozu] CHAR (1)        NULL,
    [NrCelina2]           VARCHAR (40)    NULL,
    [Zefir]               CHAR (1)        NULL,
    [RejestrDluguCelnego] VARCHAR (20)    NULL,
    [Wykaz]               VARCHAR (30)    NULL,
    [PozycjaWykazu]       INT             NULL,
    [Typ]                 VARCHAR (2)     NULL,
    [UCZgloszenia]        VARCHAR (8)     NULL,
    [Lokalizacja_Miejsce] VARCHAR (17)    NULL,
    [Lokalizacja_UC]      VARCHAR (8)     NULL,
    [Lokalizacja_Opis]    VARCHAR (35)    NULL,
    [Waluta]              VARCHAR (3)     NULL,
    [Wartosc]             DECIMAL (17, 2) NULL,
    [KursWaluty]          DECIMAL (10, 4) NULL,
    [idNadawca]           INT             NULL,
    [idOdbiorca]          INT             NULL,
    CONSTRAINT [PK_V2_DOK_DPDZ] PRIMARY KEY CLUSTERED ([idDokNr] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_DPDZ_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr]),
    CONSTRAINT [FK_DOK_DPDZ_KONTRAHENCI] FOREIGN KEY ([idZglaszajacy]) REFERENCES [cel].[v2_kontrahenci] ([idKntr])
);


GO
CREATE NONCLUSTERED INDEX [IDX_ZGLASZAJACY_KONTRAHENT]
    ON [cel].[v2_dok_dpdz]([idZglaszajacy] ASC)
    ON [FG_CEL];

