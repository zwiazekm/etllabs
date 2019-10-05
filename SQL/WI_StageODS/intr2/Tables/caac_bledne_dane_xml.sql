﻿CREATE TABLE [intr2].[caac_bledne_dane_xml] (
    [id_xml]          NUMERIC (18)  NOT NULL,
    [zrodlo]          NVARCHAR (10) NOT NULL,
    [id_jedn]         NVARCHAR (10) NOT NULL,
    [status]          NVARCHAR (1)  NOT NULL,
    [operator]        NVARCHAR (20) NOT NULL,
    [data_utworzenia] DATETIME2 (3) NOT NULL,
    [xml]             NTEXT         NULL,
    CONSTRAINT [caac_bledne_dane_xml$PK_caac_bledne_dane_xml] PRIMARY KEY CLUSTERED ([id_xml] ASC, [zrodlo] ASC)
);

