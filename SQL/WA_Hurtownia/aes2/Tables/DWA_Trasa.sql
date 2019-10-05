CREATE TABLE [aes2].[DWA_Trasa] (
    [Id]       NUMERIC (19) NOT NULL,
    [Kraj]     NVARCHAR (2) NULL,
    [KrajPid]  INT          NULL,
    [IdDokDWA] NUMERIC (19) NULL,
    CONSTRAINT [DWA_Trasa$PK_DWA_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__DWA_Trasa_IdDokDWA__DWA_Dokument_id] FOREIGN KEY ([IdDokDWA]) REFERENCES [aes2].[DWA_Dokument] ([Id])
);

