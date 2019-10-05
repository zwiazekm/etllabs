CREATE TABLE [zc].[DWU_DokumentWymagany] (
    [Id]         DECIMAL (19) NOT NULL,
    [KodDokWym]  VARCHAR (4)  NULL,
    [NrDokWym]   VARCHAR (35) NULL,
    [IdTowarDWU] DECIMAL (19) NULL,
    CONSTRAINT [PK_DWU_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC)
);

