﻿CREATE TABLE [aes2].[DWU_TowarPodmiot] (
    [Id]                        NUMERIC (19)   NOT NULL,
    [Miejscowosc]               NVARCHAR (255) NULL,
    [KrajPid]                   INT            NULL,
    [Kraj]                      NVARCHAR (255) NULL,
    [Nazwa]                     NVARCHAR (255) NULL,
    [KodPocztowy]               NVARCHAR (255) NULL,
    [UlicaNumer]                NVARCHAR (255) NULL,
    [TIN]                       NVARCHAR (255) NULL,
    [EORI]                      NVARCHAR (17)  NULL,
    [REGON]                     NVARCHAR (14)  NULL,
    [IdTowarDWU]                NUMERIC (19)   NULL,
    [Email]                     NVARCHAR (70)  NULL,
    [IdGrupyNumerowAEOPodmiotu] NUMERIC (19)   NULL,
    [RodzPodmiotu]              NVARCHAR (20)  NOT NULL,
    CONSTRAINT [DWU_TowarPodmiot$PK_DWU_TowarPodmiot] PRIMARY KEY CLUSTERED ([Id] ASC, [RodzPodmiotu] ASC)
);

