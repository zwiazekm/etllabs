CREATE TABLE [aes2].[ZWP_Opakowanie] (
    [Id]                    NUMERIC (19)   NOT NULL,
    [LiczbaOpakowan]        INT            NULL,
    [RodzajOpakowan]        NVARCHAR (2)   NULL,
    [RodzajOpakowanPid]     NVARCHAR (2)   NULL,
    [LiczbaSztuk]           INT            NULL,
    [StanOpakowanNaGranicy] NCHAR (1)      NOT NULL,
    [ZnakiOpakowan]         NVARCHAR (252) NULL,
    [IdTowarZWP]            NUMERIC (19)   NULL,
    CONSTRAINT [ZWP_Opakowanie$PK_ZWP_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

