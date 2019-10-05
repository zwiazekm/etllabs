CREATE TABLE [stat].[celina_bledne_dane_xml] (
    [id_xml]          NUMERIC (18)  NOT NULL,
    [zrodlo]          VARCHAR (10)  NOT NULL,
    [id_jedn]         VARCHAR (10)  NOT NULL,
    [status]          CHAR (1)      NOT NULL,
    [operator]        VARCHAR (20)  NOT NULL,
    [data_utworzenia] DATETIME      CONSTRAINT [DF__celina_bl__data___4E4029BF] DEFAULT (getdate()) NOT NULL,
    [xml]             VARCHAR (MAX) NULL,
    CONSTRAINT [PK_celina_bledne_dane_xml] PRIMARY KEY CLUSTERED ([id_xml] ASC, [id_jedn] ASC) ON [StatIndeksy]
) TEXTIMAGE_ON [StatDane];

