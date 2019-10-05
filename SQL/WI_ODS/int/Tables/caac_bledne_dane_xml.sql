CREATE TABLE [int].[caac_bledne_dane_xml] (
    [id_xml]          NUMERIC (18) NOT NULL,
    [zrodlo]          VARCHAR (10) NOT NULL,
    [id_jedn]         VARCHAR (10) NOT NULL,
    [status]          VARCHAR (1)  NOT NULL,
    [operator]        VARCHAR (20) NOT NULL,
    [data_utworzenia] DATETIME     NOT NULL,
    [xml]             TEXT         NULL,
    CONSTRAINT [PK_caac_bledne_dane_xml] PRIMARY KEY CLUSTERED ([id_xml] ASC, [zrodlo] ASC) WITH (FILLFACTOR = 90) ON [FG_INT]
) TEXTIMAGE_ON [FG_INT];

