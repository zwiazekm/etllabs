CREATE TABLE [zc].[ZWA_Komentarz] (
    [Id]        DECIMAL (19)   NOT NULL,
    [Komentarz] NVARCHAR (140) NULL,
    [IdDokZWA]  DECIMAL (19)   NULL,
    CONSTRAINT [PK_ZWA_Komentarz] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWA_Komentarz_IdDokZWA_ZWA_Dokument_Id] FOREIGN KEY ([IdDokZWA]) REFERENCES [zc].[ZWA_Dokument] ([Id])
);

