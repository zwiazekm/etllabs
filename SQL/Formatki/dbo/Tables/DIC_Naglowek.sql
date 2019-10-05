﻿CREATE TABLE [dbo].[DIC_Naglowek] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [FormatkaKod]      VARCHAR (5)    NOT NULL,
    [JednostkaOrgId]   INT            NOT NULL,
    [Rok]              SMALLINT       NOT NULL,
    [Kwartal]          TINYINT        NOT NULL,
    [StatusKod]        CHAR (1)       NOT NULL,
    [ModyfikacjaLogin] NVARCHAR (256) NOT NULL,
    [ModyfikacjaData]  DATETIME       NOT NULL,
    [Wersja]           NUMERIC (5, 2) NOT NULL,
    [Aktualny]         BIT            DEFAULT ((1)) NOT NULL,
    [Komentarz]        VARCHAR (3500) NULL,
    [ID_SharePoint]    INT            NULL,
    CONSTRAINT [PK_DIC_Naglowek] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_DIC_Naglowek_Formatka] FOREIGN KEY ([FormatkaKod]) REFERENCES [dbo].[Formatka] ([FormatkaKod]),
    CONSTRAINT [FK_DIC_Naglowek_FormatkaStatus] FOREIGN KEY ([StatusKod]) REFERENCES [dbo].[FormatkaStatus] ([StatusKod]),
    CONSTRAINT [FK_DIC_Naglowek_StrukturaOrganizacyjna] FOREIGN KEY ([JednostkaOrgId]) REFERENCES [dbo].[StrukturaOrganizacyjna] ([JednostkaId])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_DIC_Naglowek]
    ON [dbo].[DIC_Naglowek]([JednostkaOrgId] ASC, [FormatkaKod] ASC, [Rok] ASC, [Kwartal] ASC, [Wersja] ASC);

