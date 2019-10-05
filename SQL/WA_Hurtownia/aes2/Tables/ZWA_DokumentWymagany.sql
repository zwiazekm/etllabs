CREATE TABLE [aes2].[ZWA_DokumentWymagany] (
    [Id]               NUMERIC (19)   NOT NULL,
    [StanNaGranicy]    NCHAR (1)      NOT NULL,
    [StanNaGranicyKom] NVARCHAR (420) NULL,
    [KodDokWym]        NVARCHAR (4)   NULL,
    [KodDokWymPid]     NVARCHAR (4)   NULL,
    [NrDokWym]         NVARCHAR (105) NULL,
    [IdTowarZWA]       NUMERIC (19)   NULL,
    [Tranzyt]          INT            NULL,
    CONSTRAINT [ZWA_DokumentWymagany$PK_ZWA_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWA_DokumentWymagany_IdTowarZWA__ZWA_Towar_id] FOREIGN KEY ([IdTowarZWA]) REFERENCES [aes2].[ZWA_Towar] ([Id])
);

