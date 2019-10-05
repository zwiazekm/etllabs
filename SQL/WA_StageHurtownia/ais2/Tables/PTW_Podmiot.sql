﻿CREATE TABLE [ais2].[PTW_Podmiot] (
    [Id]             NUMERIC (19)  NOT NULL,
    [Email]          VARCHAR (255) NULL,
    [Nazwa]          VARCHAR (35)  NULL,
    [TIN]            VARCHAR (17)  NULL,
    [Miejscowosc]    VARCHAR (35)  NULL,
    [Kraj]           VARCHAR (2)   NULL,
    [KrajPid]        VARCHAR (2)   NULL,
    [KodPocztowy]    VARCHAR (9)   NULL,
    [UlicaNumer]     VARCHAR (35)  NULL,
    [RodzajPodmiotu] VARCHAR (4)   NULL,
    [IdDokPTW]       NUMERIC (19)  NULL,
    CONSTRAINT [PTW_Podmiot$PK_PTW_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC)
);

