CREATE TABLE [gust].[tbl_dane_zrodlowe] (
    [miesiac_rok]            VARCHAR (4)  NULL,
    [CN]                     VARCHAR (8)  NULL,
    [masa]                   VARCHAR (15) NULL,
    [ilosc]                  VARCHAR (15) NULL,
    [wartosc_zl]             VARCHAR (15) NULL,
    [kraj_przeznaczenia]     VARCHAR (15) NULL,
    [kraj_pochodzenia]       VARCHAR (15) NULL,
    [kraj_wysylki]           VARCHAR (15) NULL,
    [kraj_srodka_transportu] VARCHAR (15) NULL,
    [ExtractDate]            DATETIME     NULL,
    [flaga]                  CHAR (1)     NULL
);

