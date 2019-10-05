CREATE TABLE [zc].[ZWA_DokumentWymagany] (
    [Id]            DECIMAL (19)   NOT NULL,
    [KodDokWym]     VARCHAR (4)    NULL,
    [NrDokWym]      NVARCHAR (35)  NULL,
    [StanNaGranicy] CHAR (1)       NULL,
    [GranicaKom]    NVARCHAR (140) NULL,
    [IdTowarZWA]    DECIMAL (19)   NOT NULL,
    CONSTRAINT [PK_ZWA_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWA_DokumentWymagany_IdTowarZWA_ZWA_Towar_Id] FOREIGN KEY ([IdTowarZWA]) REFERENCES [zc].[ZWA_Towar] ([Id])
);

