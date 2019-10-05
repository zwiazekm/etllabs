CREATE TABLE [zc].[PDS_Podmiot] (
    [Id]             DECIMAL (19)  NOT NULL,
    [RodzajPodmiotu] VARCHAR (255) NOT NULL,
    [TIN]            VARCHAR (17)  NULL,
    [Nazwa]          VARCHAR (35)  NULL,
    [UlicaNumer]     VARCHAR (35)  NULL,
    [KodPocztowy]    VARCHAR (9)   NULL,
    [Miejscowosc]    VARCHAR (50)  NULL,
    [Kraj]           CHAR (2)      NULL,
    [IdDokPDS]       DECIMAL (19)  NULL,
    CONSTRAINT [PK_PDS_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzajPodmiotu] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PDS_Podmiot_IdDokPDS_PDS_Dokument_Id] FOREIGN KEY ([IdDokPDS]) REFERENCES [zc].[PDS_Dokument] ([Id])
);

