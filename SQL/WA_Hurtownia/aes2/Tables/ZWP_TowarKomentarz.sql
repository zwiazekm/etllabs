CREATE TABLE [aes2].[ZWP_TowarKomentarz] (
    [Id]         NUMERIC (19)   NOT NULL,
    [Komentarz]  NVARCHAR (840) NULL,
    [IdTowarZWP] NUMERIC (19)   NULL,
    CONSTRAINT [ZWP_TowarKomentarz$PK_ZWP_TowarKomentarz] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWP_TowarKomentarz_IdTowarZWP__ZWP_Towar_id] FOREIGN KEY ([IdTowarZWP]) REFERENCES [aes2].[ZWP_Towar] ([id])
);

