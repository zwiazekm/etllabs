﻿CREATE TABLE [zc].[PTW_Podmiot] (
    [Id]             NUMERIC (19) NOT NULL,
    [TIN]            VARCHAR (17) NULL,
    [Nazwa]          VARCHAR (35) NULL,
    [UlicaNumer]     VARCHAR (35) NULL,
    [KodPocztowy]    VARCHAR (9)  NULL,
    [Miejscowosc]    VARCHAR (35) NULL,
    [Kraj]           CHAR (2)     NULL,
    [KrajPid]        INT          NULL,
    [RodzajPodmiotu] VARCHAR (4)  NULL,
    [IdDokPTW]       NUMERIC (19) NULL,
    CONSTRAINT [PK_PTW_Podmiot] PRIMARY KEY CLUSTERED ([Id] ASC)
);

