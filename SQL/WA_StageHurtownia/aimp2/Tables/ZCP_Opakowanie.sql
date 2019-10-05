CREATE TABLE [aimp2].[ZCP_Opakowanie] (
    [IdOpakowania]        NUMERIC (19)  NOT NULL,
    [IdTowarZCP]          NUMERIC (19)  NULL,
    [NumeryZnakiOpakowan] NVARCHAR (42) NULL,
    [LiczbaOpakowan]      NUMERIC (8)   NULL,
    [RodzajOpakowania]    NVARCHAR (3)  NULL,
    [RodzajOpakowaniaPid] INT           NULL,
    [DanePokontrolne]     NTEXT         NULL,
    CONSTRAINT [ZCP_Opakowanie_PK] PRIMARY KEY CLUSTERED ([IdOpakowania] ASC)
);

