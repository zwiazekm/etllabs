CREATE TABLE [gust].[kopia_tbl_dane_zrodlowe] (
    [ID_numer]               INT          IDENTITY (1, 1) NOT NULL,
    [miesiac_rok]            VARCHAR (4)  NULL,
    [CN]                     VARCHAR (8)  NULL,
    [masa]                   VARCHAR (15) NULL,
    [ilosc]                  VARCHAR (15) NULL,
    [wartosc_zl]             VARCHAR (15) NULL,
    [kraj_przeznaczenia]     VARCHAR (2)  NULL,
    [kraj_pochodzenia]       VARCHAR (2)  NULL,
    [kraj_wysylki]           VARCHAR (2)  NULL,
    [kraj_srodka_transportu] VARCHAR (2)  NULL,
    [extractdate]            DATETIME     NULL,
    [flaga]                  CHAR (1)     NULL,
    [okres_od]               VARCHAR (6)  NOT NULL,
    [okres_do]               VARCHAR (6)  NOT NULL,
    CONSTRAINT [PK_kopia_tbl_dane_zrodlowe] PRIMARY KEY CLUSTERED ([ID_numer] ASC)
);

