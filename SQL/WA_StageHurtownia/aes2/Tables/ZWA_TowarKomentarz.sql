CREATE TABLE [aes2].[ZWA_TowarKomentarz] (
    [Id]         NUMERIC (19)   NOT NULL,
    [Komentarz]  NVARCHAR (420) NULL,
    [IdTowarZWA] NUMERIC (19)   NULL,
    CONSTRAINT [ZWA_TowarKomentarz$PK_ZWA_TowarKomentarz] PRIMARY KEY CLUSTERED ([Id] ASC)
);

