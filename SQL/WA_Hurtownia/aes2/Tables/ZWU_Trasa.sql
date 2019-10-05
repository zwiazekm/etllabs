CREATE TABLE [aes2].[ZWU_Trasa] (
    [Id]       NUMERIC (19) NOT NULL,
    [Kraj]     NVARCHAR (2) NULL,
    [KrajPid]  NVARCHAR (2) NULL,
    [IdDokZWU] NUMERIC (19) NULL,
    CONSTRAINT [ZWU_Trasa$PK_ZWU_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_Trasa_IdDokZWU_ZWU_Dokument_id] FOREIGN KEY ([IdDokZWU]) REFERENCES [aes2].[ZWU_Dokument] ([Id])
);

