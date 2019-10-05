CREATE TABLE [aes2].[DWU_Trasa] (
    [Id]       NUMERIC (19) NOT NULL,
    [Kraj]     NVARCHAR (2) NULL,
    [KrajPid]  INT          NULL,
    [IdDokDWU] NUMERIC (19) NULL,
    CONSTRAINT [DWU_Trasa$PK_DWU_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__DWU_Trasa_IdDokDWU__DWU_Dokument_id] FOREIGN KEY ([IdDokDWU]) REFERENCES [aes2].[DWU_Dokument] ([Id])
);

