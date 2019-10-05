CREATE TABLE [zc].[DWA_Podmiot] (
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
    [IdDokDWA]     DECIMAL (19)  NULL,
    CONSTRAINT [PK_DWA_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC)
);

