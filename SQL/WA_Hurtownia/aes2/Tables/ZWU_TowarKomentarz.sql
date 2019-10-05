CREATE TABLE [aes2].[ZWU_TowarKomentarz] (
    [Id]         NUMERIC (19)   NOT NULL,
    [Komentarz]  NVARCHAR (420) NULL,
    [IdTowarZWU] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ZWU_TowarKomentarz$PK_ZWU_TowarKomentarz] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_TowarKomentarz_IdTowarZWU_ZWU_Towar_id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [aes2].[ZWU_Towar] ([Id])
);

