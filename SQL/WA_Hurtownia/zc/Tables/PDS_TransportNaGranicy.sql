CREATE TABLE [zc].[PDS_TransportNaGranicy] (
    [Id]                        DECIMAL (19)  NOT NULL,
    [RodzajTransportuNaGranicy] CHAR (2)      NULL,
    [ZnakiTranspNaGranicy]      VARCHAR (31)  NULL,
    [Kraj]                      CHAR (2)      NULL,
    [StanTransportuNaGranicy]   VARCHAR (4)   NULL,
    [KrajUCWprow]               CHAR (2)      NULL,
    [Komentarz]                 VARCHAR (140) NULL,
    [IdTowarPDS]                DECIMAL (19)  NULL,
    CONSTRAINT [PK_PDS_TransportNaGranicy] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PDS_TransportNaGranicy_IdTowarPDS_PDS_Towar_Id] FOREIGN KEY ([IdTowarPDS]) REFERENCES [zc].[PDS_Towar] ([Id])
);

