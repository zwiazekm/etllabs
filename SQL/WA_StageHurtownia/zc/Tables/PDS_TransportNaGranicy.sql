CREATE TABLE [zc].[PDS_TransportNaGranicy] (
    [Id]                           DECIMAL (19)  NOT NULL,
    [RodzajTransportuNaGranicy]    CHAR (2)      NULL,
    [ZnakiTranspNaGranicy]         VARCHAR (31)  NULL,
    [Kraj]                         CHAR (2)      NULL,
    [KrajPid]                      INT           NULL,
    [StanTransportuNaGranicy]      VARCHAR (4)   NULL,
    [KrajUCWprow]                  CHAR (2)      NULL,
    [KrajUCWprowPid]               INT           NULL,
    [Komentarz]                    VARCHAR (140) NULL,
    [IdTowarPDS]                   DECIMAL (19)  NULL,
    [RodzajTransportuNaGranicyPid] INT           NULL,
    CONSTRAINT [PK_PDS_TransportNaGranicy] PRIMARY KEY CLUSTERED ([Id] ASC)
);

