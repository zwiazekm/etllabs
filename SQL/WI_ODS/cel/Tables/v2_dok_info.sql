CREATE TABLE [cel].[v2_dok_info] (
    [idDokNr]                 BIGINT       NOT NULL,
    [idDok]                   VARCHAR (40) NULL,
    [RodzDok]                 VARCHAR (4)  NULL,
    [Status]                  CHAR (1)     NULL,
    [NrCelina]                VARCHAR (40) NULL,
    [XMLVer]                  VARCHAR (7)  NULL,
    [ExtractDate]             DATETIME     NULL,
    [UC]                      VARCHAR (8)  NULL,
    [Pas]                     VARCHAR (2)  NULL,
    [DataPrzyjecia]           DATETIME     NULL,
    [DataPrzedstawienia]      DATETIME     NULL,
    [EmailPodmiotu]           VARCHAR (80) NULL,
    [NrWlasny]                VARCHAR (14) NULL,
    [Miejsce]                 VARCHAR (35) NULL,
    [Data]                    DATETIME     NULL,
    [idSkladajacy]            INT          NULL,
    [Bilansowanie]            CHAR (1)     NULL,
    [TerminBilansowania]      DATETIME     NULL,
    [Flaga]                   CHAR (1)     NULL,
    [PodpisanyElektronicznie] CHAR (1)     NULL,
    CONSTRAINT [PK_V2_DOK_INFO] PRIMARY KEY CLUSTERED ([idDokNr] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_INFO_SKLADAJACY] FOREIGN KEY ([idSkladajacy]) REFERENCES [cel].[v2_skladajacy] ([idSkladajacy])
);


GO
CREATE NONCLUSTERED INDEX [IDX_SKLADAJACY]
    ON [cel].[v2_dok_info]([idSkladajacy] ASC)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [idx_v2_dok_info_dataprzyjecia]
    ON [cel].[v2_dok_info]([DataPrzyjecia] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_v2_dok_info]
    ON [cel].[v2_dok_info]([idDok] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];

