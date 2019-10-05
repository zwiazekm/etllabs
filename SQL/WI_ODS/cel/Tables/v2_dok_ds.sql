CREATE TABLE [cel].[v2_dok_ds] (
    [idDokNr]                           BIGINT        NOT NULL,
    [UCDeklaracji]                      VARCHAR (8)   NULL,
    [Lokalizacja_Miejsce]               VARCHAR (17)  NULL,
    [Lokalizacja_UC]                    VARCHAR (8)   NULL,
    [Lokalizacja_Opis]                  VARCHAR (35)  NULL,
    [idPrzedstawiajacy]                 INT           NULL,
    [TerminNaPrzeznaczenie]             DATETIME      NULL,
    [PotwierdzenieWywozu]               CHAR (1)      NULL,
    [NrCelina2]                         VARCHAR (40)  NULL,
    [Sprostowanie_NrCelina]             VARCHAR (40)  NULL,
    [Sprostowanie_Nr]                   SMALLINT      NULL,
    [Sprostowanie_Data]                 DATETIME      NULL,
    [idPrzedstawiajacyEORI]             VARCHAR (20)  NULL,
    [MiejsceZlozeniaTowaru_UlicaNumer]  VARCHAR (35)  NULL,
    [MiejsceZlozeniaTowaru_KodPocztowy] VARCHAR (9)   NULL,
    [MiejsceZlozeniaTowaru_Miejscowosc] VARCHAR (35)  NULL,
    [TelefonFaks]                       VARCHAR (35)  NULL,
    [AEO]                               VARCHAR (18)  NULL,
    [Uwagi]                             VARCHAR (260) NULL,
    CONSTRAINT [PK_V2_DOK_DS] PRIMARY KEY CLUSTERED ([idDokNr] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_DS_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr]),
    CONSTRAINT [FK_DOK_DS_KONTR] FOREIGN KEY ([idPrzedstawiajacy]) REFERENCES [cel].[v2_kontrahenci] ([idKntr])
);


GO
CREATE NONCLUSTERED INDEX [IDX_PRZEDSTAWIAJACY_KONTRAHENT]
    ON [cel].[v2_dok_ds]([idPrzedstawiajacy] ASC)
    ON [FG_CEL];

