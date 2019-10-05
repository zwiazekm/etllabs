CREATE TABLE [zc].[ZWU_Podmiot] (
    [Id]           DECIMAL (19)  NOT NULL,
    [RodzPodmiotu] CHAR (1)      NOT NULL,
    [TIN]          VARCHAR (17)  NULL,
    [REGON]        VARCHAR (14)  NULL,
    [Nazwa]        NVARCHAR (35) NULL,
    [UlicaNumer]   NVARCHAR (35) NULL,
    [KodPocztowy]  VARCHAR (9)   NULL,
    [Miejscowosc]  NVARCHAR (35) NULL,
    [Kraj]         CHAR (2)      NULL,
    [EORI]         VARCHAR (17)  NULL,
    [IdDokZWU]     DECIMAL (19)  NULL,
    CONSTRAINT [PK_ZWU_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_Podmiot_IdDokZWU_ZWU_Dokument_Id] FOREIGN KEY ([IdDokZWU]) REFERENCES [zc].[ZWU_Dokument] ([Id])
);

