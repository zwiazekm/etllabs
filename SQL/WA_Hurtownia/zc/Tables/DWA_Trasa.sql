CREATE TABLE [zc].[DWA_Trasa] (
    [Id]       DECIMAL (19) NOT NULL,
    [Kraj]     CHAR (2)     NULL,
    [IdDokDWA] DECIMAL (19) NULL,
    CONSTRAINT [PK_DWA_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWA_Trasa_IdDokDWA_DWA_Dokument_Id] FOREIGN KEY ([IdDokDWA]) REFERENCES [zc].[DWA_Dokument] ([Id])
);

