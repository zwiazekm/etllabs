CREATE TABLE [aes2].[ZWA_TowarKomentarz] (
    [Id]         NUMERIC (19)   NOT NULL,
    [Komentarz]  NVARCHAR (420) NULL,
    [IdTowarZWA] NUMERIC (19)   NULL,
    CONSTRAINT [ZWA_TowarKomentarz$PK_ZWA_TowarKomentarz] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWA_TowarKomentarz_IdTowarZWA__ZWA_Towar_id] FOREIGN KEY ([IdTowarZWA]) REFERENCES [aes2].[ZWA_Towar] ([Id])
);

