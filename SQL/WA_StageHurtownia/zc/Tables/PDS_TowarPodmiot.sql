CREATE TABLE [zc].[PDS_TowarPodmiot] (
    [Id]             DECIMAL (19) NOT NULL,
    [RodzajPodmiotu] INT          NOT NULL,
    [TIN]            VARCHAR (17) NULL,
    [Nazwa]          VARCHAR (35) NULL,
    [UlicaNumer]     VARCHAR (35) NULL,
    [KodPocztowy]    VARCHAR (9)  NULL,
    [Miejscowosc]    VARCHAR (50) NULL,
    [Kraj]           CHAR (2)     NULL,
    [KrajPid]        INT          NULL,
    [IdTowarPDS]     DECIMAL (19) NULL,
    CONSTRAINT [PK_PDS_TowarPodmiot] PRIMARY KEY CLUSTERED ([Id] ASC)
);

