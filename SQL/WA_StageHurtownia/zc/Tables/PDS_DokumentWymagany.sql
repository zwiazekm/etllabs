CREATE TABLE [zc].[PDS_DokumentWymagany] (
    [Id]           DECIMAL (19) NOT NULL,
    [KodDokWym]    VARCHAR (4)  NULL,
    [NrDokWym]     VARCHAR (35) NULL,
    [KodDokWymPid] INT          NULL,
    [IdTowarPDS]   DECIMAL (19) NULL,
    CONSTRAINT [PK_PDS_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC)
);

