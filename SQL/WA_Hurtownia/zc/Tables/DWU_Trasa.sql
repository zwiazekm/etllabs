CREATE TABLE [zc].[DWU_Trasa] (
    [Id]       DECIMAL (19) NOT NULL,
    [Kraj]     CHAR (2)     NULL,
    [IdDokDWU] DECIMAL (19) NULL,
    CONSTRAINT [PK_DWU_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWU_Trasa_IdDokDWU_DWU_Dokument_Id] FOREIGN KEY ([IdDokDWU]) REFERENCES [zc].[DWU_Dokument] ([Id])
);

