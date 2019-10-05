CREATE TABLE [zc].[DWU_TowarPodmiot] (
    [Id]              DECIMAL (19)  NOT NULL,
    [RodzPodmiotu]    CHAR (1)      NOT NULL,
    [RodzPodmiotuPid] CHAR (1)      NOT NULL,
    [TIN]             VARCHAR (17)  NULL,
    [Nazwa]           VARCHAR (255) NULL,
    [UlicaNumer]      VARCHAR (210) NULL,
    [KodPocztowy]     VARCHAR (9)   NULL,
    [Miejscowosc]     VARCHAR (50)  NULL,
    [Kraj]            CHAR (2)      NULL,
    [KrajPid]         INT           NULL,
    [REGON]           VARCHAR (14)  NULL,
    [EORI]            VARCHAR (17)  NULL,
    [IdTowarDWU]      DECIMAL (19)  NULL,
    CONSTRAINT [PK_DWU_TowarPodmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC)
);

