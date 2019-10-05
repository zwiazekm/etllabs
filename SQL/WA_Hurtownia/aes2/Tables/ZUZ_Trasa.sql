CREATE TABLE [aes2].[ZUZ_Trasa] (
    [Id]              NUMERIC (19) NOT NULL,
    [Kraj]            NVARCHAR (2) NULL,
    [KrajPid]         NVARCHAR (2) NULL,
    [IdDokZUZ]        NUMERIC (19) NULL,
    [KrajZUzupeln]    NVARCHAR (2) NULL,
    [KrajZUzupelnPid] NVARCHAR (2) NULL,
    CONSTRAINT [ZUZ_Trasa$PK_ZUZ_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZUZ_Trasa_IdDokZUZ__ZUZ_Dokument_id] FOREIGN KEY ([IdDokZUZ]) REFERENCES [aes2].[ZUZ_Dokument] ([Id])
);

