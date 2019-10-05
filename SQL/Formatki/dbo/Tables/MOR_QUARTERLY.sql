﻿CREATE TABLE [dbo].[MOR_QUARTERLY] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [FormatkaKod]      VARCHAR (5)    NOT NULL,
    [JednostkaOrgId]   INT            NOT NULL,
    [Rok]              SMALLINT       NOT NULL,
    [Kwartal]          TINYINT        NOT NULL,
    [StatusKod]        CHAR (1)       NOT NULL,
    [Wersja]           NUMERIC (5, 2) NOT NULL,
    [ModyfikacjaLogin] VARCHAR (50)   NOT NULL,
    [ModyfikacjaData]  DATETIME       NOT NULL,
    [Aktualny]         BIT            DEFAULT ((1)) NOT NULL,
    [Komentarz]        VARCHAR (3500) NULL,
    [DZ1_1_1]          BIGINT         NULL,
    [DZ1_1_2]          BIGINT         NULL,
    [DZ1_1_3]          BIGINT         NULL,
    [DZ1_1_4]          BIGINT         NULL,
    [DZ1_1_5]          BIGINT         NULL,
    [DZ1_1_6]          BIGINT         NULL,
    [DZ1_2_1]          BIGINT         NULL,
    [DZ1_2_2]          BIGINT         NULL,
    [DZ1_2_3]          BIGINT         NULL,
    [DZ1_2_4]          BIGINT         NULL,
    [DZ1_2_5]          BIGINT         NULL,
    [DZ1_2_6]          BIGINT         NULL,
    [DZ2_1_1_1]        BIGINT         NULL,
    [DZ2_1_1_2]        BIGINT         NULL,
    [DZ2_1_1_3]        BIGINT         NULL,
    [DZ2_1_1_4]        BIGINT         NULL,
    [DZ2_1_1_5]        BIGINT         NULL,
    [DZ2_1_1_6]        BIGINT         NULL,
    [DZ2_1_1_7]        BIGINT         NULL,
    [DZ2_1_1_8]        BIGINT         NULL,
    [DZ2_1_2_1]        BIGINT         NULL,
    [DZ2_1_2_2]        BIGINT         NULL,
    [DZ2_1_2_3]        BIGINT         NULL,
    [DZ2_1_2_4]        BIGINT         NULL,
    [DZ2_1_2_5]        BIGINT         NULL,
    [DZ2_1_2_6]        BIGINT         NULL,
    [DZ2_1_2_7]        BIGINT         NULL,
    [DZ2_1_2_8]        BIGINT         NULL,
    [DZ2_1_2_9]        BIGINT         NULL,
    [DZ2_1_2_10]       BIGINT         NULL,
    [DZ2_2_1_1]        BIGINT         NULL,
    [DZ2_2_1_2]        BIGINT         NULL,
    [DZ2_2_1_3]        BIGINT         NULL,
    [DZ2_2_1_4]        BIGINT         NULL,
    [DZ2_2_1_5]        BIGINT         NULL,
    [DZ2_2_1_6]        BIGINT         NULL,
    [DZ2_2_1_7]        BIGINT         NULL,
    [DZ2_2_1_8]        BIGINT         NULL,
    [DZ2_2_2_1]        BIGINT         NULL,
    [DZ2_2_2_2]        BIGINT         NULL,
    [DZ2_2_2_3]        BIGINT         NULL,
    [DZ2_2_2_4]        BIGINT         NULL,
    [DZ2_2_2_5]        BIGINT         NULL,
    [DZ2_2_2_6]        BIGINT         NULL,
    [DZ2_2_2_7]        BIGINT         NULL,
    [DZ2_2_2_8]        BIGINT         NULL,
    [DZ2_2_2_9]        BIGINT         NULL,
    [DZ2_2_2_10]       BIGINT         NULL,
    [ID_SharePoint]    INT            NULL,
    CONSTRAINT [PK_MOR_QUARTERLY] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_MOR_QUARTERLY_Formatka] FOREIGN KEY ([FormatkaKod]) REFERENCES [dbo].[Formatka] ([FormatkaKod]),
    CONSTRAINT [FK_MOR_QUARTERLY_FormatkaStatus] FOREIGN KEY ([StatusKod]) REFERENCES [dbo].[FormatkaStatus] ([StatusKod]),
    CONSTRAINT [FK_MOR_QUARTERLY_StrukturaOrganizacyjna] FOREIGN KEY ([JednostkaOrgId]) REFERENCES [dbo].[StrukturaOrganizacyjna] ([JednostkaId])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_MOR_QUARTERLY]
    ON [dbo].[MOR_QUARTERLY]([JednostkaOrgId] ASC, [FormatkaKod] ASC, [Rok] ASC, [Kwartal] ASC, [Wersja] ASC);

