CREATE TABLE [dbo].[FormatkaStatus] (
    [StatusKod]    CHAR (1)     NOT NULL,
    [NazwaStatusu] VARCHAR (20) NOT NULL,
    [LP]           TINYINT      NULL,
    CONSTRAINT [PK_FormatkaStatus] PRIMARY KEY CLUSTERED ([StatusKod] ASC),
    CONSTRAINT [UQ_FormatkaStatus_StatusKod] UNIQUE NONCLUSTERED ([StatusKod] ASC)
);

