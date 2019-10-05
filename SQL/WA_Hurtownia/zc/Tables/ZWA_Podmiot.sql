CREATE TABLE [zc].[ZWA_Podmiot] (
    [Id]           DECIMAL (19)  NOT NULL,
    [RodzPodmiotu] CHAR (1)      NOT NULL,
    [TIN]          VARCHAR (17)  NULL,
    [Nazwa]        NVARCHAR (35) NULL,
    [UlicaNumer]   NVARCHAR (35) NULL,
    [KodPocztowy]  VARCHAR (9)   NULL,
    [Miejscowosc]  NVARCHAR (35) NULL,
    [Kraj]         CHAR (2)      NULL,
    [IdDokZWA]     DECIMAL (19)  NULL,
    CONSTRAINT [PK_ZWA_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWA_Podmiot_IdDokZWA_ZWA_Dokument_IdDok] FOREIGN KEY ([IdDokZWA]) REFERENCES [zc].[ZWA_Dokument] ([Id])
);

