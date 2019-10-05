CREATE TABLE [aes2].[ZWU_ZamkniecieCelne] (
    [Id]            NUMERIC (19)   NOT NULL,
    [IdDokZWU]      NUMERIC (19)   NULL,
    [ZnakiZamkniec] NVARCHAR (765) NULL,
    CONSTRAINT [ZWU_ZamkniecieCelne$PK_ZWU_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_ZamkniecieCelne_IdDokZWU_ZWU_Dokument_id] FOREIGN KEY ([IdDokZWU]) REFERENCES [aes2].[ZWU_Dokument] ([Id])
);

