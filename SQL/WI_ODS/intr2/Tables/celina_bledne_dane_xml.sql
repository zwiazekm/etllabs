CREATE TABLE [intr2].[celina_bledne_dane_xml] (
    [id_xml]          NUMERIC (18)  NOT NULL,
    [zrodlo]          NVARCHAR (10) NOT NULL,
    [id_jedn]         NVARCHAR (10) NOT NULL,
    [status]          NVARCHAR (1)  NOT NULL,
    [operator]        NVARCHAR (50) NOT NULL,
    [data_utworzenia] DATETIME2 (3) NOT NULL,
    [xml]             NTEXT         NULL,
    CONSTRAINT [celina_bledne_dane_xml$pk_celina_bledne_dane_xml] PRIMARY KEY CLUSTERED ([id_xml] ASC, [zrodlo] ASC) ON [FG_INTR2]
) TEXTIMAGE_ON [FG_INTR2];

