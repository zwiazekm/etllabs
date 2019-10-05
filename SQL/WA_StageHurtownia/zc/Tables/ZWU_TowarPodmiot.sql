CREATE TABLE [zc].[ZWU_TowarPodmiot] (
    [Id]              DECIMAL (19)  NOT NULL,
    [RodzPodmiotu]    CHAR (1)      NOT NULL,
    [RodzPodmiotuPid] CHAR (1)      NOT NULL,
    [TIN]             VARCHAR (17)  NULL,
    [REGON]           VARCHAR (14)  NULL,
    [Nazwa]           NVARCHAR (35) NULL,
    [UlicaNumer]      NVARCHAR (35) NULL,
    [KodPocztowy]     VARCHAR (9)   NULL,
    [Miejscowosc]     NVARCHAR (35) NULL,
    [Kraj]            CHAR (2)      NULL,
    [KrajPid]         INT           NULL,
    [EORI]            VARCHAR (17)  NULL,
    [IdTowarZWU]      DECIMAL (19)  NULL,
    CONSTRAINT [PK_ZWU_TowarPodmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC)
);

