CREATE TABLE [zc].[ZWU_Trasa] (
    [Id]       DECIMAL (19) NOT NULL,
    [Kraj]     CHAR (2)     NULL,
    [IdDokZWU] DECIMAL (19) NOT NULL,
    CONSTRAINT [PK_ZWU_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_Trasa_IdDokZWU_ZWU_Dokument_Id] FOREIGN KEY ([IdDokZWU]) REFERENCES [zc].[ZWU_Dokument] ([Id])
);

