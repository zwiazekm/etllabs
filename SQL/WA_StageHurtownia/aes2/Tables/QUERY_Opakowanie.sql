CREATE TABLE [aes2].[QUERY_Opakowanie] (
    [Id]                      NUMERIC (19)  NOT NULL,
    [RodzajOpakowan]          NVARCHAR (3)  NULL,
    [RodzajOpakowanPid]       INT           NULL,
    [ZnakiOpakowan]           NVARCHAR (42) NULL,
    [KodJezykaZnakowOpakowan] NVARCHAR (2)  NULL,
    [LiczbaOpakowan]          INT           NULL,
    [LiczbaSztuk]             INT           NULL,
    [IdTowarQUERY]            NUMERIC (19)  NULL,
    CONSTRAINT [QUERY_Opakowanie$PK_QUERY_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

