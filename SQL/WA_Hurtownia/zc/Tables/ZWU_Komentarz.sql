CREATE TABLE [zc].[ZWU_Komentarz] (
    [Id]        DECIMAL (19)   NOT NULL,
    [Komentarz] NVARCHAR (140) NULL,
    [IdDokZWU]  DECIMAL (19)   NULL,
    CONSTRAINT [PK_ZWU_Komentarz] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_Komentarz_IdDokZWU_ZWU_Dokument_Id] FOREIGN KEY ([IdDokZWU]) REFERENCES [zc].[ZWU_Dokument] ([Id])
);

