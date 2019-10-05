CREATE TABLE [wald].[wal_dgt_kopia_v2_dok_info] (
    [idDokNr]       BIGINT       NOT NULL,
    [idDok]         VARCHAR (30) NULL,
    [RodzDok]       VARCHAR (4)  NULL,
    [Status]        CHAR (1)     NULL,
    [NrCelina]      VARCHAR (40) NULL,
    [ExtractDate]   DATETIME     NULL,
    [DataPrzyjecia] DATETIME     NULL,
    [Flaga]         CHAR (1)     NULL,
    [generacjaId]   INT          NOT NULL,
    CONSTRAINT [PK_wal_dgt_kopia_v2_dok_info] PRIMARY KEY CLUSTERED ([idDokNr] ASC) ON [WaldDane]
);

