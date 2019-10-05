CREATE TABLE [zc].[PDS_Podmiot] (
    [Id]             DECIMAL (19)  NOT NULL,
    [RodzajPodmiotu] VARCHAR (255) NOT NULL,
    [TIN]            VARCHAR (17)  NULL,
    [Nazwa]          VARCHAR (35)  NULL,
    [UlicaNumer]     VARCHAR (35)  NULL,
    [KodPocztowy]    VARCHAR (9)   NULL,
    [Miejscowosc]    VARCHAR (50)  NULL,
    [Kraj]           CHAR (2)      NULL,
    [KrajPid]        INT           NULL,
    [IdDokPDS]       DECIMAL (19)  NULL,
    CONSTRAINT [PK_PDS_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzajPodmiotu] ASC)
);

