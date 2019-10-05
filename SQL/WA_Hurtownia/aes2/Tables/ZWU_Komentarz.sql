CREATE TABLE [aes2].[ZWU_Komentarz] (
    [Id]        NUMERIC (19)   NOT NULL,
    [IdDokZWU]  NUMERIC (19)   NULL,
    [Komentarz] NVARCHAR (420) NULL,
    CONSTRAINT [ZWU_Komentarz$PK_ZWU_Komentarz] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_Komentarz_IdDokZWU_ZWU_Dokument_id] FOREIGN KEY ([IdDokZWU]) REFERENCES [aes2].[ZWU_Dokument] ([Id])
);

