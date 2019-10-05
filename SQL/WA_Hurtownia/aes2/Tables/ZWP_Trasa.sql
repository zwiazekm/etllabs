CREATE TABLE [aes2].[ZWP_Trasa] (
    [Id]       NUMERIC (19) NOT NULL,
    [Kraj]     NVARCHAR (2) NULL,
    [KrajPid]  NVARCHAR (2) NULL,
    [IdDokZWP] NUMERIC (19) NULL,
    CONSTRAINT [ZWP_Trasa$PK_ZWP_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWP_Trasa_IdDokZWP__ZWP_Dokument_id] FOREIGN KEY ([IdDokZWP]) REFERENCES [aes2].[ZWP_Dokument] ([Id])
);

