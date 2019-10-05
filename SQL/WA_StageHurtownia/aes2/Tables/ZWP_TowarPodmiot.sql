CREATE TABLE [aes2].[ZWP_TowarPodmiot] (
    [Id]                        NUMERIC (19)   NOT NULL,
    [UlicaNumer]                NVARCHAR (210) NULL,
    [KodPocztowy]               NVARCHAR (9)   NULL,
    [Miejscowosc]               NVARCHAR (210) NULL,
    [Nazwa]                     NVARCHAR (210) NULL,
    [Kraj]                      NVARCHAR (2)   NULL,
    [KrajPid]                   NVARCHAR (2)   NULL,
    [TIN]                       NVARCHAR (17)  NULL,
    [IdTowarZWP]                NUMERIC (19)   NULL,
    [EORI]                      NVARCHAR (17)  NULL,
    [Email]                     NVARCHAR (70)  NULL,
    [IdGrupyNumerowAEOPodmiotu] NUMERIC (19)   NULL,
    [RodzPodmiotu]              NVARCHAR (20)  NOT NULL,
    CONSTRAINT [ZWP_TowarPodmiot$PK_ZWP_TowarPodmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC)
);

