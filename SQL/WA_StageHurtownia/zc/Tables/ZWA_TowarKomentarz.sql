CREATE TABLE [zc].[ZWA_TowarKomentarz] (
    [Id]         DECIMAL (19)   NOT NULL,
    [Komentarz]  NVARCHAR (140) NULL,
    [IdTowarZWA] DECIMAL (19)   NULL,
    CONSTRAINT [PK_ZWA_TowarKomentarz] PRIMARY KEY CLUSTERED ([Id] ASC)
);

