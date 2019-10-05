CREATE TABLE [aimp2].[DPDZ_Opakowanie] (
    [IdOpakowania]        NUMERIC (19)  NOT NULL,
    [IdTowarDPDZ]         NUMERIC (19)  NULL,
    [NumeryZnakiOpakowan] NVARCHAR (42) NULL,
    [LiczbaOpakowan]      NUMERIC (8)   NULL,
    [RodzajOpakowan]      NVARCHAR (3)  NULL,
    [RodzajOpakowanPid]   INT           NULL,
    [DanePokontrolne]     NTEXT         NULL,
    CONSTRAINT [DPDZ_Opakowanie_PK] PRIMARY KEY CLUSTERED ([IdOpakowania] ASC)
);

