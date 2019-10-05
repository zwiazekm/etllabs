CREATE TABLE [zef2].[Dedykowane_OpisyStatusow] (
    [IDKierunkuPisma]             INT            NOT NULL,
    [IDStatusu]                   INT            NOT NULL,
    [Opis]                        NVARCHAR (100) NULL,
    [ID_Dedykowane_OpisyStatusow] INT            NOT NULL,
    CONSTRAINT [PK_Dedykowane_OpisyStatusow] PRIMARY KEY CLUSTERED ([ID_Dedykowane_OpisyStatusow] ASC) WITH (FILLFACTOR = 90) ON [FG_ZEF2]
);


GO
ALTER TABLE [zef2].[Dedykowane_OpisyStatusow] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160518-140823]
    ON [zef2].[Dedykowane_OpisyStatusow]([IDStatusu] ASC)
    ON [FG_ZEF2];

