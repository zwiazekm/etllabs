CREATE TABLE [gust].[Kody_CN_Sprawdzenie] (
    [data]                   NVARCHAR (4)   CONSTRAINT [DF_Kody_CN_Sprawdzenie_data] DEFAULT (N'(Arkusz XLS)') NULL,
    [CN]                     NVARCHAR (8)   NULL,
    [Kraj_przeznaczenia]     NVARCHAR (255) NULL,
    [Kraj_pochodzenia]       NVARCHAR (255) NULL,
    [Kraj_srodka_transportu] NVARCHAR (255) NULL,
    [Kraj_wysylki]           NVARCHAR (255) NULL,
    [zrodlo]                 NVARCHAR (50)  NULL
);

