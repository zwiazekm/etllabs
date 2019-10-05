CREATE TABLE [ais2].[PDS_Opakowanie] (
    [Id]                      NUMERIC (19)  NOT NULL,
    [LiczbaSztuk]             INT           NULL,
    [LiczbaSztukNaGranicy]    INT           NULL,
    [RodzajOpakowan]          VARCHAR (2)   NULL,
    [RodzajOpakowanPid]       INT           NULL,
    [RodzajNaGranicy]         VARCHAR (2)   NULL,
    [RodzajNaGranicyPid]      INT           NULL,
    [ZnakiOpakowan]           VARCHAR (140) NULL,
    [ZnakiNaGranicy]          VARCHAR (140) NULL,
    [LiczbaOpakowan]          INT           NULL,
    [LiczbaOpakowanNaGranicy] INT           NULL,
    [StanOpakowanNaGranicy]   VARCHAR (4)   NULL,
    [IdTowarPDS]              NUMERIC (19)  NULL,
    CONSTRAINT [PDS_Opakowanie$PK_PDS_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

