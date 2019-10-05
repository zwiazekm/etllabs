CREATE TABLE [zc].[ZWU_TowarKomentarz] (
    [Id]         DECIMAL (19)   NOT NULL,
    [Komentarz]  NVARCHAR (140) NULL,
    [IdTowarZWU] DECIMAL (19)   NULL,
    CONSTRAINT [PK_ZWU_TowarKomentarz] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_TowarKomentarz_IdTowarZWU_ZWU_Towar_Id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [zc].[ZWU_Towar] ([Id])
);

