CREATE TABLE [zc].[ZWA_TowarKomentarz] (
    [Id]         DECIMAL (19)   NOT NULL,
    [Komentarz]  NVARCHAR (140) NULL,
    [IdTowarZWA] DECIMAL (19)   NULL,
    CONSTRAINT [PK_ZWA_TowarKomentarz] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWA_TowarKomentarz_IdTowarZWA_ZWA_Towar_Id] FOREIGN KEY ([IdTowarZWA]) REFERENCES [zc].[ZWA_Towar] ([Id])
);

