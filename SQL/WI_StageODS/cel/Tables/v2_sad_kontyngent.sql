CREATE TABLE [cel].[v2_sad_kontyngent] (
    [idDokNr]                     BIGINT          NOT NULL,
    [PozId]                       SMALLINT        NOT NULL,
    [Kontyngent_PozId]            SMALLINT        NOT NULL,
    [NrPorzadkowy]                VARCHAR (6)     NULL,
    [WnioskowanaIlosc]            NUMERIC (18, 3) NULL,
    [Jm]                          VARCHAR (1)     NULL,
    [TQS]                         VARCHAR (1)     NULL,
    [PrzyznanaIlosc]              NUMERIC (18, 3) NULL,
    [WykorzystanaIlosc]           NUMERIC (18, 3) NULL,
    [NrWniosku]                   VARCHAR (35)    NULL,
    [NrDecyzji]                   VARCHAR (35)    NULL,
    [nNrPorzadkowy]               VARCHAR (6)     NULL,
    [nWnioskowanaIlosc]           NUMERIC (18, 3) NULL,
    [nJm]                         VARCHAR (1)     NULL,
    [Korekta]                     BIT             NULL,
    [Err]                         VARCHAR (10)    NULL,
    [JednostkaMiary]              VARCHAR (3)     NULL,
    [KwalifikatorJednostkiMiary]  VARCHAR (1)     NULL,
    [nJednostkaMiary]             VARCHAR (3)     NULL,
    [nKwalifikatorJednostkiMiary] VARCHAR (1)     NULL,
    CONSTRAINT [PK_V2_SAD_KONTYNGENT] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Kontyngent_PozId] ASC) WITH (FILLFACTOR = 90)
);

