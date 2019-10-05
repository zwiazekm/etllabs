CREATE TABLE [aes2].[ZWA_DokumentWymagany] (
    [Id]               NUMERIC (19)   NOT NULL,
    [StanNaGranicy]    NCHAR (1)      NOT NULL,
    [StanNaGranicyKom] NVARCHAR (420) NULL,
    [KodDokWym]        NVARCHAR (4)   NULL,
    [KodDokWymPid]     NVARCHAR (4)   NULL,
    [NrDokWym]         NVARCHAR (105) NULL,
    [IdTowarZWA]       NUMERIC (19)   NULL,
    [Tranzyt]          INT            NULL,
    CONSTRAINT [ZWA_DokumentWymagany$PK_ZWA_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC)
);

