﻿CREATE TABLE [cel].[v2_sad_kontyngent] (
    [idDokNr]                     BIGINT          NOT NULL,
    [PozId]                       SMALLINT        NOT NULL,
    [Kontyngent_PozId]            SMALLINT        NOT NULL,
    [NrPorzadkowy]                VARCHAR (6)     NULL,
    [WnioskowanaIlosc]            DECIMAL (18, 3) NULL,
    [Jm]                          CHAR (1)        NULL,
    [TQS]                         CHAR (1)        NULL,
    [PrzyznanaIlosc]              DECIMAL (18, 3) NULL,
    [WykorzystanaIlosc]           DECIMAL (18, 3) NULL,
    [NrWniosku]                   VARCHAR (35)    NULL,
    [NrDecyzji]                   VARCHAR (35)    NULL,
    [nNrPorzadkowy]               VARCHAR (6)     NULL,
    [nWnioskowanaIlosc]           DECIMAL (18, 3) NULL,
    [nJm]                         CHAR (1)        NULL,
    [Korekta]                     BIT             NULL,
    [Err]                         VARCHAR (10)    NULL,
    [JednostkaMiary]              CHAR (3)        NULL,
    [KwalifikatorJednostkiMiary]  CHAR (1)        NULL,
    [nJednostkaMiary]             CHAR (3)        NULL,
    [nKwalifikatorJednostkiMiary] CHAR (1)        NULL,
    CONSTRAINT [PK_V2_SAD_KONTYNGENT] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Kontyngent_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_KONTYNG_SAD_DPDZ_T] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_sad_dpdz_tow] ([idDokNr], [PozId])
);

