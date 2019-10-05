CREATE TABLE [zc].[PDS_TowarPodmiot] (
    [Id]             DECIMAL (19) NOT NULL,
    [RodzajPodmiotu] INT          NOT NULL,
    [TIN]            VARCHAR (17) NULL,
    [Nazwa]          VARCHAR (35) NULL,
    [UlicaNumer]     VARCHAR (35) NULL,
    [KodPocztowy]    VARCHAR (9)  NULL,
    [Miejscowosc]    VARCHAR (50) NULL,
    [Kraj]           CHAR (2)     NULL,
    [IdTowarPDS]     DECIMAL (19) NULL,
    CONSTRAINT [PK_PDS_TowarPodmiot] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PDS_TowarPodmiot_IdTowarPDS_PDS_Towar_Id] FOREIGN KEY ([IdTowarPDS]) REFERENCES [zc].[PDS_Towar] ([Id])
);

