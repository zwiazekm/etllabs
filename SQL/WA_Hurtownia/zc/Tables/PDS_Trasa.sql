CREATE TABLE [zc].[PDS_Trasa] (
    [Id]       DECIMAL (19) NOT NULL,
    [Kraj]     CHAR (2)     NULL,
    [IdDokPDS] DECIMAL (19) NULL,
    CONSTRAINT [PK_PDS_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PDS_Trasa_IdDokPDS_PDS_Dokument_Id] FOREIGN KEY ([IdDokPDS]) REFERENCES [zc].[PDS_Dokument] ([Id])
);

