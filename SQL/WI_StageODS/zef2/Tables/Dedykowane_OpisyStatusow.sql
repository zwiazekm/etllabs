CREATE TABLE [zef2].[Dedykowane_OpisyStatusow] (
    [IDKierunkuPisma]             INT            NULL,
    [IDStatusu]                   INT            NULL,
    [Opis]                        NVARCHAR (100) NULL,
    [ID_Dedykowane_OpisyStatusow] INT            NOT NULL,
    [operacja]                    NVARCHAR (1)   NULL,
    CONSTRAINT [PK_Dedykowane_OpisyStatusow] PRIMARY KEY CLUSTERED ([ID_Dedykowane_OpisyStatusow] ASC) WITH (FILLFACTOR = 90)
);

