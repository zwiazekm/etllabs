CREATE TABLE [zef].[slowniki] (
    [id_rodz_slow]          CHAR (6)        NOT NULL,
    [id_slown]              CHAR (6)        NOT NULL,
    [symbol]                CHAR (10)       NULL,
    [nazwa]                 VARCHAR (80)    NULL,
    [rodzaj]                CHAR (1)        NULL,
    [typ]                   CHAR (1)        NULL,
    [kwota]                 NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [kwota2]                NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [kwota3]                NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [data]                  DATETIME        NULL,
    [liczba]                INT             NULL,
    [opis]                  VARCHAR (1000)  NULL,
    [raport]                VARCHAR (6)     NULL,
    [aktywny]               CHAR (1)        DEFAULT ('Y') NULL,
    [data_rejestracji]      DATETIME        NULL,
    [operator]              VARCHAR (15)    NULL,
    [data_obowiazywania_od] DATETIME        NULL,
    [data_obowiazywania_do] DATETIME        NULL,
    [typ2]                  CHAR (1)        NULL,
    [typ3]                  CHAR (1)        NULL,
    CONSTRAINT [PK_SLOWNIKI] PRIMARY KEY CLUSTERED ([id_rodz_slow] ASC, [id_slown] ASC)
);

