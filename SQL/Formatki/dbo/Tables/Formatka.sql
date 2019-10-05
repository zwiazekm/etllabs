CREATE TABLE [dbo].[Formatka] (
    [FormatkaKod] VARCHAR (5)   NOT NULL,
    [Nazwa]       VARCHAR (50)  NULL,
    [Opis]        VARCHAR (500) NULL,
    CONSTRAINT [PK_Formatka] PRIMARY KEY CLUSTERED ([FormatkaKod] ASC),
    CONSTRAINT [UQ_Formatka_FormatkaKod] UNIQUE NONCLUSTERED ([FormatkaKod] ASC)
);

