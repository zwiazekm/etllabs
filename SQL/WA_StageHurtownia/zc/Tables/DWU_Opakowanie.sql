CREATE TABLE [zc].[DWU_Opakowanie] (
    [Id]                DECIMAL (19) NOT NULL,
    [LiczbaSztuk]       INT          NULL,
    [RodzajOpakowan]    CHAR (2)     NULL,
    [RodzajOpakowanPid] INT          NULL,
    [ZnakiOpakowan]     VARCHAR (42) NULL,
    [LiczbaOpakowan]    INT          NULL,
    [IdTowarDWU]        DECIMAL (19) NULL,
    CONSTRAINT [PK_DWU_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

