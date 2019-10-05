CREATE TABLE [aes2].[ZWP_Komentarz] (
    [Id]        NUMERIC (19)   NOT NULL,
    [Komentarz] NVARCHAR (840) NULL,
    [IdDokZWP]  NUMERIC (19)   NULL,
    CONSTRAINT [ZWP_Komentarz$PK_ZWP_Komentarz] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWP_Komentarz_IdDokZWP__ZWP_Dokument_id] FOREIGN KEY ([IdDokZWP]) REFERENCES [aes2].[ZWP_Dokument] ([Id])
);

