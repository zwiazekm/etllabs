CREATE TABLE [stat].[caac_bledne_dane_xml] (
    [id_xml]          NUMERIC (18)  IDENTITY (1, 1) NOT NULL,
    [zrodlo]          VARCHAR (10)  NOT NULL,
    [id_jedn]         VARCHAR (10)  NOT NULL,
    [status]          CHAR (1)      NOT NULL,
    [operator]        VARCHAR (20)  NOT NULL,
    [data_utworzenia] DATETIME      CONSTRAINT [DF__caac_bled__data___4B63BD14] DEFAULT (getdate()) NOT NULL,
    [xml]             VARCHAR (MAX) NULL,
    CONSTRAINT [PK_caac_bledne_dane_xml] PRIMARY KEY CLUSTERED ([id_xml] ASC, [zrodlo] ASC) ON [StatIndeksy]
) TEXTIMAGE_ON [StatDane];

