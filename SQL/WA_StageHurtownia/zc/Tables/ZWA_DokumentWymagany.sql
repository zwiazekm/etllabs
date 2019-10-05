CREATE TABLE [zc].[ZWA_DokumentWymagany] (
    [Id]            DECIMAL (19)   NOT NULL,
    [KodDokWym]     VARCHAR (4)    NULL,
    [KodDokWymPid]  INT            NULL,
    [NrDokWym]      NVARCHAR (35)  NULL,
    [StanNaGranicy] CHAR (1)       NULL,
    [GranicaKom]    NVARCHAR (140) NULL,
    [IdTowarZWA]    DECIMAL (19)   NOT NULL,
    CONSTRAINT [PK_ZWA_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC)
);

