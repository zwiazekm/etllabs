CREATE TABLE [aimp2].[DSK_Opakowanie] (
    [IdOpakowania]          NUMERIC (19)   NOT NULL,
    [IdTowarDSK]            NUMERIC (19)   NULL,
    [LiczbaOpakowan]        NUMERIC (8)    NULL,
    [NumeryZnakiOpakowania] NVARCHAR (512) NULL,
    [RodzajOpakowania]      NCHAR (3)      NULL,
    [RodzajOpakowaniaPid]   INT            NULL,
    CONSTRAINT [DSK_Opakowanie_PK] PRIMARY KEY CLUSTERED ([IdOpakowania] ASC) ON [FG_AIMP2],
    CONSTRAINT [DSK_Opakowanie$FK_DSK_Towar] FOREIGN KEY ([IdTowarDSK]) REFERENCES [aimp2].[DSK_Towar] ([IdPozycji])
);

