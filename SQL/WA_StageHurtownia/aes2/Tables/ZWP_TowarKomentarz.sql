CREATE TABLE [aes2].[ZWP_TowarKomentarz] (
    [Id]         NUMERIC (19)   NOT NULL,
    [Komentarz]  NVARCHAR (840) NULL,
    [IdTowarZWP] NUMERIC (19)   NULL,
    CONSTRAINT [ZWP_TowarKomentarz$PK_ZWP_TowarKomentarz] PRIMARY KEY CLUSTERED ([Id] ASC)
);

