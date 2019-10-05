CREATE TABLE [aimp2].[DPDZ_Opakowanie] (
    [IdOpakowania]        NUMERIC (19)  NOT NULL,
    [IdTowarDPDZ]         NUMERIC (19)  NULL,
    [NumeryZnakiOpakowan] NVARCHAR (42) NULL,
    [LiczbaOpakowan]      NUMERIC (8)   NULL,
    [RodzajOpakowan]      NVARCHAR (3)  NULL,
    [RodzajOpakowanPid]   INT           NULL,
    [DanePokontrolne]     NTEXT         NULL,
    CONSTRAINT [DPDZ_Opakowanie_PK] PRIMARY KEY CLUSTERED ([IdOpakowania] ASC) ON [FG_AIMP2],
    CONSTRAINT [DPDZ_Opakowanie$FK_DPDZ_Towar] FOREIGN KEY ([IdTowarDPDZ]) REFERENCES [aimp2].[DPDZ_Towar] ([IdPozycji])
) TEXTIMAGE_ON [FG_AIMP2];

