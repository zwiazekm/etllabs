CREATE TABLE [aes2].[DWU_Opakowanie] (
    [Id]                NUMERIC (19)  NOT NULL,
    [RodzajOpakowan]    NVARCHAR (2)  NULL,
    [RodzajOpakowanPid] INT           NULL,
    [ZnakiOpakowan]     NVARCHAR (42) NULL,
    [LiczbaOpakowan]    INT           NULL,
    [LiczbaSztuk]       INT           NULL,
    [IdTowarDWU]        NUMERIC (19)  NULL,
    CONSTRAINT [DWU_Opakowanie$PK_DWU_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

