CREATE TABLE [ais2].[PDS_TransportNaGranicy] (
    [Id]                           NUMERIC (19)  NOT NULL,
    [Komentarz]                    VARCHAR (140) NULL,
    [Kraj]                         VARCHAR (2)   NULL,
    [KrajPid]                      VARCHAR (2)   NULL,
    [KrajUCWprow]                  VARCHAR (2)   NULL,
    [KrajUCWprowPid]               VARCHAR (2)   NULL,
    [ZnakiTranspNaGranicy]         VARCHAR (31)  NULL,
    [StanTransportuNaGranicy]      VARCHAR (4)   NULL,
    [RodzajTransportuNaGranicy]    VARCHAR (2)   NULL,
    [RodzajTransportuNaGranicyPid] VARCHAR (2)   NULL,
    [IdTowarPDS]                   NUMERIC (19)  NULL,
    CONSTRAINT [PDS_TransportNaGranicy$PK_PDS_TransportNaGranicy] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AIS2],
    CONSTRAINT [FK__PDS_TransportNaGranicy_IdTowarPDS__PDS_Towar_id] FOREIGN KEY ([IdTowarPDS]) REFERENCES [ais2].[PDS_Towar] ([Id])
);

