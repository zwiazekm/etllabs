CREATE TABLE [aimp2].[DSK_Opakowanie] (
    [IdOpakowania]          NUMERIC (19)   NOT NULL,
    [IdTowarDSK]            NUMERIC (19)   NULL,
    [LiczbaOpakowan]        NUMERIC (8)    NULL,
    [NumeryZnakiOpakowania] NVARCHAR (512) NULL,
    [RodzajOpakowania]      NCHAR (3)      NULL,
    [RodzajOpakowaniaPid]   INT            NULL,
    CONSTRAINT [DSK_Opakowanie_PK] PRIMARY KEY CLUSTERED ([IdOpakowania] ASC)
);

