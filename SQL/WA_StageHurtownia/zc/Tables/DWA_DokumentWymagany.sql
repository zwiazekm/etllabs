CREATE TABLE [zc].[DWA_DokumentWymagany] (
    [Id]               DECIMAL (19)  NOT NULL,
    [KodDokZrodl]      VARCHAR (4)   NULL,
    [NrDokWym]         VARCHAR (35)  NULL,
    [StanNaGranicy]    CHAR (1)      NULL,
    [StanNaGranicyKom] VARCHAR (140) NULL,
    [IdTowarDWA]       DECIMAL (19)  NULL,
    CONSTRAINT [PK_DWA_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC)
);

