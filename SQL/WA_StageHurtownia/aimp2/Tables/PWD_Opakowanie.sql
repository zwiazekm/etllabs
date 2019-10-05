CREATE TABLE [aimp2].[PWD_Opakowanie] (
    [IdOpakowania]        NUMERIC (19)  NOT NULL,
    [IdTowarPWD]          NUMERIC (19)  NULL,
    [NumeryZnakiOpakowan] NVARCHAR (42) NULL,
    [LiczbaOpakowan]      NUMERIC (8)   NULL,
    [RodzajOpakowan]      NVARCHAR (3)  NULL,
    [RodzajOpakowanPid]   INT           NULL,
    [DanePokontrolne]     NTEXT         NULL,
    CONSTRAINT [PWD_Opakowanie_PK] PRIMARY KEY CLUSTERED ([IdOpakowania] ASC)
);

