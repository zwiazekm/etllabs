CREATE TABLE [aes2].[ZWA_Komentarz] (
    [Id]        NUMERIC (19)   NOT NULL,
    [Komentarz] NVARCHAR (420) NULL,
    [IdDokZWA]  NUMERIC (19)   NULL,
    CONSTRAINT [ZWA_Komentarz$PK_ZWA_Komentarz] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWA_Komentarz_IdDokZWA__ZWA_Dokument_id] FOREIGN KEY ([IdDokZWA]) REFERENCES [aes2].[ZWA_Dokument] ([Id])
);

