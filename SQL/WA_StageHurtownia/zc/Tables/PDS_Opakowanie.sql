CREATE TABLE [zc].[PDS_Opakowanie] (
    [Id]                      DECIMAL (19)  NOT NULL,
    [RodzajOpakowan]          CHAR (2)      NULL,
    [RodzajOpakowanPid]       INT           NULL,
    [RodzajNaGranicy]         CHAR (2)      NULL,
    [RodzajNaGranicyPid]      INT           NULL,
    [ZnakiOpakowan]           VARCHAR (140) NULL,
    [ZnakiNaGranicy]          VARCHAR (140) NULL,
    [LiczbaSztuk]             INT           NULL,
    [LiczbaSztukNaGranicy]    INT           NULL,
    [LiczbaOpakowan]          INT           NULL,
    [LiczbaOpakowanNaGranicy] INT           NULL,
    [StanOpakowanNaGranicy]   VARCHAR (4)   NULL,
    [IdTowarPDS]              DECIMAL (19)  NULL,
    CONSTRAINT [PK_PDS_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

