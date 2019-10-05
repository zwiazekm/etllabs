CREATE TABLE [aes2].[ZUZ_Opakowanie] (
    [Id]                       NUMERIC (19)  NOT NULL,
    [RodzajOpakowan]           NVARCHAR (2)  NULL,
    [RodzajOpakowanPid]        NVARCHAR (2)  NULL,
    [RodzajOpakowanWUzupln]    NVARCHAR (2)  NULL,
    [RodzajOpakowanWUzuplnPid] NVARCHAR (2)  NULL,
    [ZnakiOpakowan]            NVARCHAR (42) NULL,
    [LiczbaOpakowan]           INT           NULL,
    [LiczbaOpakowanWUzupln]    INT           NULL,
    [LiczbaSztuk]              INT           NULL,
    [LiczbaSztukWUzupln]       INT           NULL,
    [IdTowarZUZ]               NUMERIC (19)  NULL,
    CONSTRAINT [ZUZ_Opakowanie$PK_ZUZ_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

