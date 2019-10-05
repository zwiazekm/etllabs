CREATE TABLE [aimp2].[ZCP_Opakowanie] (
    [IdOpakowania]        NUMERIC (19)  NOT NULL,
    [IdTowarZCP]          NUMERIC (19)  NULL,
    [NumeryZnakiOpakowan] NVARCHAR (42) NULL,
    [LiczbaOpakowan]      NUMERIC (8)   NULL,
    [RodzajOpakowania]    NVARCHAR (3)  NULL,
    [RodzajOpakowaniaPid] INT           NULL,
    [DanePokontrolne]     NTEXT         NULL,
    CONSTRAINT [ZCP_Opakowanie_PK] PRIMARY KEY CLUSTERED ([IdOpakowania] ASC) ON [FG_AIMP2],
    CONSTRAINT [ZCP_Opakowanie$FK_ZCP_Towar] FOREIGN KEY ([IdTowarZCP]) REFERENCES [aimp2].[ZCP_Towar] ([IdPozycji])
) TEXTIMAGE_ON [FG_AIMP2];

