CREATE TABLE [aes2].[ZWP_DokumentWymagany] (
    [Id]               NUMERIC (19)   NOT NULL,
    [StanNaGranicy]    NCHAR (1)      NOT NULL,
    [StanNaGranicyKom] NVARCHAR (840) NULL,
    [KodDokWym]        NVARCHAR (4)   NULL,
    [KodDokWymPid]     NVARCHAR (4)   NULL,
    [NrDokWym]         NVARCHAR (210) NULL,
    [IdTowarZWP]       NUMERIC (19)   NULL,
    [Tranzyt]          INT            NULL,
    CONSTRAINT [ZWP_DokumentWymagany$PK_ZWP_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC)
);

