CREATE TABLE [cel].[v2_dok_sad] (
    [idDokNr]                 BIGINT          NOT NULL,
    [IdDok]                   VARCHAR (30)    NULL,
    [Typ]                     CHAR (1)        NULL,
    [Podtyp]                  VARCHAR (1)     NULL,
    [Powiadomienie]           BIT             NULL,
    [TypWPR1]                 VARCHAR (2)     NULL,
    [P1a]                     VARCHAR (2)     NULL,
    [P1b]                     CHAR (1)        NULL,
    [P1c]                     VARCHAR (5)     NULL,
    [ListyTowarowe]           INT             NULL,
    [LiczbaPozycji]           SMALLINT        NULL,
    [LiczbaOpakowan]          INT             NULL,
    [KrajWysylki]             VARCHAR (2)     NULL,
    [KrajPrzeznaczenia]       VARCHAR (2)     NULL,
    [Kontenery]               BIT             NULL,
    [RodzajTransakcji]        VARCHAR (2)     NULL,
    [MasaBrutto]              DECIMAL (14, 3) NULL,
    [PlatnoscOdroczona]       VARCHAR (25)    NULL,
    [idGlownyZobowiazany]     INT             NULL,
    [idOdbiorcaKarty3]        INT             NULL,
    [idUpowaznionyOdbiorca]   INT             NULL,
    [KodDost]                 VARCHAR (3)     NULL,
    [MiejsceDost]             VARCHAR (35)    NULL,
    [MiejsceKodDost]          CHAR (1)        NULL,
    [SzczegolyWartosci]       CHAR (1)        NULL,
    [Waluta]                  VARCHAR (3)     NULL,
    [Wartosc]                 DECIMAL (17, 2) NULL,
    [KursWaluty]              DECIMAL (10, 4) NULL,
    [KodWynKontr]             VARCHAR (2)     NULL,
    [TerminDostarczenia]      DATETIME        NULL,
    [IloscZamkniec]           SMALLINT        NULL,
    [TerminPU]                DATETIME        NULL,
    [ZwolnienieTowaru]        CHAR (1)        NULL,
    [PotwierdzenieWywozu]     CHAR (1)        NULL,
    [NrCelina2]               VARCHAR (40)    NULL,
    [Zefir]                   CHAR (1)        NULL,
    [RejestrDluguCelnego]     VARCHAR (20)    NULL,
    [Wykaz]                   VARCHAR (30)    NULL,
    [PozycjaWykazu]           INT             NULL,
    [DostarczenieSAD]         CHAR (1)        NULL,
    [TerminNaSAD]             DATETIME        NULL,
    [idZglaszajacy]           INT             NULL,
    [Zgla_Przedstawicielstwo] CHAR (1)        NULL,
    [Zgla_Wskaznik]           VARCHAR (5)     NULL,
    [Zgla_NrWpisu]            VARCHAR (35)    NULL,
    [Zgla_DataWpisu]          DATETIME        NULL,
    [Sprostowanie_NrCelina]   VARCHAR (40)    NULL,
    [Sprostowanie_Nr]         SMALLINT        NULL,
    [Sprostowanie_Data]       DATETIME        NULL,
    [DataDoKalkulacji]        DATETIME        NULL,
    [DataPowiadomienia]       DATETIME        NULL,
    [IDPowiadomieniaODlugu]   VARCHAR (40)    NULL,
    [AdnotacjeUrzedowe]       VARCHAR (3000)  NULL,
    [idZglaszajacyEORI]       VARCHAR (20)    NULL,
    CONSTRAINT [PK_V2_DOK_SAD] PRIMARY KEY CLUSTERED ([idDokNr] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_SAD_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr]),
    CONSTRAINT [FK_DOK_SAD_KONT_ZGLASZ] FOREIGN KEY ([idZglaszajacy]) REFERENCES [cel].[v2_kontrahenci] ([idKntr]),
    CONSTRAINT [FK_DOK_SAD_KONTR_ODB] FOREIGN KEY ([idOdbiorcaKarty3]) REFERENCES [cel].[v2_kontrahenci] ([idKntr]),
    CONSTRAINT [FK_DOK_SAD_KONTR_UPOW] FOREIGN KEY ([idUpowaznionyOdbiorca]) REFERENCES [cel].[v2_kontrahenci] ([idKntr]),
    CONSTRAINT [FK_DOK_SAD_KONTR_ZOBOW] FOREIGN KEY ([idGlownyZobowiazany]) REFERENCES [cel].[v2_kontrahenci] ([idKntr])
);


GO
CREATE NONCLUSTERED INDEX [IDX_IDDOK]
    ON [cel].[v2_dok_sad]([IdDok] ASC)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [IDX_ODBIORCAKARTY_KONTRAHENT]
    ON [cel].[v2_dok_sad]([idOdbiorcaKarty3] ASC)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [IDX_UPOWAZNIONYODBIORCA_KONTRAHENT]
    ON [cel].[v2_dok_sad]([idUpowaznionyOdbiorca] ASC)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [IDX_ZGLASZAJACY_KONTRAHENT]
    ON [cel].[v2_dok_sad]([idZglaszajacy] ASC)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [IDX_ZOBOWIAZANY_KONTRAHENT]
    ON [cel].[v2_dok_sad]([idGlownyZobowiazany] ASC)
    ON [FG_CEL];

