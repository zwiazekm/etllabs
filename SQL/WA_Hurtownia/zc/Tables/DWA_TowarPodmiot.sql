CREATE TABLE [zc].[DWA_TowarPodmiot] (
    [Id]           DECIMAL (19)  NOT NULL,
    [RodzPodmiotu] CHAR (1)      NOT NULL,
    [TIN]          VARCHAR (17)  NULL,
    [Nazwa]        VARCHAR (255) NULL,
    [UlicaNumer]   VARCHAR (210) NULL,
    [KodPocztowy]  VARCHAR (9)   NULL,
    [Miejscowosc]  VARCHAR (50)  NULL,
    [Kraj]         CHAR (2)      NULL,
    [REGON]        VARCHAR (14)  NULL,
    [EORI]         VARCHAR (17)  NULL,
    [IdTowarDWA]   DECIMAL (19)  NULL,
    CONSTRAINT [PK_DWA_TowarPodmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWA_TowarPodmiot_IdTowarDWA_DWA_Towar_Id] FOREIGN KEY ([IdTowarDWA]) REFERENCES [zc].[DWA_Towar] ([Id])
);

