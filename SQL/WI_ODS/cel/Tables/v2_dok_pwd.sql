CREATE TABLE [cel].[v2_dok_pwd] (
    [idDokNr]                         BIGINT          NOT NULL,
    [Procedura]                       VARCHAR (2)     NULL,
    [LiczbaOpakowan]                  INT             NULL,
    [MasaBrutto]                      DECIMAL (14, 3) NULL,
    [WartoscStatystyczna]             BIGINT          NULL,
    [Zbiorcze]                        BIT             NULL,
    [UCPowiadomienia]                 VARCHAR (8)     NULL,
    [Lokalizacja_Miejsce]             VARCHAR (17)    NULL,
    [idUpowazniony]                   INT             NULL,
    [idOdbiorca]                      INT             NULL,
    [Tranzyt_Rodzaj]                  VARCHAR (4)     NULL,
    [TerminDostarczenia]              DATETIME        NULL,
    [Zamkniecia_Ilosc]                SMALLINT        NULL,
    [Zamkniecia_Zdejmujacy]           VARCHAR (35)    NULL,
    [ZwolnienieTowaru]                CHAR (1)        NULL,
    [TerminPU]                        DATETIME        NULL,
    [Zefir]                           CHAR (1)        NULL,
    [Sprostowanie_NrCelina]           VARCHAR (40)    NULL,
    [Sprostowanie_Nr]                 SMALLINT        NULL,
    [Sprostowanie_Data]               DATETIME        NULL,
    [idUpowaznionyEORI]               VARCHAR (20)    NULL,
    [idOdbiorcaEORI]                  VARCHAR (20)    NULL,
    [idZglaszajacyPrzedstawiciel]     INT             NULL,
    [idZglaszajacyPrzedstawicielEORI] VARCHAR (20)    NULL,
    CONSTRAINT [PK_V2_DOK_PWD] PRIMARY KEY CLUSTERED ([idDokNr] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_PWD_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr]),
    CONSTRAINT [FK_DOK_PWD_KONTRAHENCI] FOREIGN KEY ([idUpowazniony]) REFERENCES [cel].[v2_kontrahenci] ([idKntr]),
    CONSTRAINT [FK_DOK_PWD_KONTRAHENCI_ZP] FOREIGN KEY ([idZglaszajacyPrzedstawiciel]) REFERENCES [cel].[v2_kontrahenci] ([idKntr])
);


GO
CREATE NONCLUSTERED INDEX [IDX_UPOWAZNIONY_KONTRAHENT]
    ON [cel].[v2_dok_pwd]([idUpowazniony] ASC)
    ON [FG_CEL];

