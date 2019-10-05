CREATE TABLE [stat].[dgt_kopia_v2_dok_info] (
    [idDokNr]            BIGINT       NOT NULL,
    [idDok]              VARCHAR (30) NULL,
    [RodzDok]            VARCHAR (4)  NULL,
    [Status]             CHAR (1)     NULL,
    [NrCelina]           VARCHAR (40) NULL,
    [XMLVer]             VARCHAR (7)  NULL,
    [ExtractDate]        DATETIME     NULL,
    [UC]                 VARCHAR (8)  NULL,
    [Pas]                VARCHAR (2)  NULL,
    [DataPrzyjecia]      DATETIME     NULL,
    [DataPrzedstawienia] DATETIME     NULL,
    [EmailPodmiotu]      VARCHAR (80) NULL,
    [NrWlasny]           VARCHAR (14) NULL,
    [Miejsce]            VARCHAR (35) NULL,
    [Data]               DATETIME     NULL,
    [idSkladajacy]       INT          NULL,
    [Bilansowanie]       CHAR (1)     NULL,
    [TerminBilansowania] DATETIME     NULL,
    [Flaga]              CHAR (1)     NULL,
    [generacjaId]        INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_v2_dok_info] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [generacjaId] ASC) ON [StatDane]
);


GO
CREATE STATISTICS [Bilansowanie]
    ON [stat].[dgt_kopia_v2_dok_info]([Bilansowanie]);


GO
CREATE STATISTICS [DataPrzedstawienia]
    ON [stat].[dgt_kopia_v2_dok_info]([DataPrzedstawienia]);


GO
CREATE STATISTICS [EmailPodmiotu]
    ON [stat].[dgt_kopia_v2_dok_info]([EmailPodmiotu]);


GO
CREATE STATISTICS [Flaga]
    ON [stat].[dgt_kopia_v2_dok_info]([Flaga]);


GO
CREATE STATISTICS [idSkladajacy]
    ON [stat].[dgt_kopia_v2_dok_info]([idSkladajacy]);


GO
CREATE STATISTICS [Miejsce]
    ON [stat].[dgt_kopia_v2_dok_info]([Miejsce]);


GO
CREATE STATISTICS [NrCelina]
    ON [stat].[dgt_kopia_v2_dok_info]([NrCelina]);


GO
CREATE STATISTICS [NrWlasny]
    ON [stat].[dgt_kopia_v2_dok_info]([NrWlasny]);


GO
CREATE STATISTICS [Pas]
    ON [stat].[dgt_kopia_v2_dok_info]([Pas]);


GO
CREATE STATISTICS [RodzDok]
    ON [stat].[dgt_kopia_v2_dok_info]([RodzDok]);


GO
CREATE STATISTICS [TerminBilansowania]
    ON [stat].[dgt_kopia_v2_dok_info]([TerminBilansowania]);


GO
CREATE STATISTICS [UC]
    ON [stat].[dgt_kopia_v2_dok_info]([UC]);


GO
CREATE STATISTICS [XMLVer]
    ON [stat].[dgt_kopia_v2_dok_info]([XMLVer]);

