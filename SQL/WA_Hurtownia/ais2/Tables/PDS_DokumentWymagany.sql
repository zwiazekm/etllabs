CREATE TABLE [ais2].[PDS_DokumentWymagany] (
    [Id]                                  NUMERIC (19)  NOT NULL,
    [KodDokWym]                           VARCHAR (4)   NULL,
    [KodDokWymPid]                        INT           NULL,
    [DokumentyWymaganeNaGranicy]          VARCHAR (140) NULL,
    [NrDokWym]                            NVARCHAR (35) NULL,
    [DokumentyWymaganeKomentarzNaGranicy] INT           NULL,
    [IdTowarPDS]                          NUMERIC (19)  NULL,
    CONSTRAINT [PDS_DokumentWymagany$PK_PDS_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AIS2],
    CONSTRAINT [FK__PDS_DokumentWymagany_IdTowarPDS__PDS_Towar_id] FOREIGN KEY ([IdTowarPDS]) REFERENCES [ais2].[PDS_Towar] ([Id])
);

