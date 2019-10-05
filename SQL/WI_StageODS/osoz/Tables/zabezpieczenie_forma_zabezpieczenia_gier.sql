CREATE TABLE [osoz].[zabezpieczenie_forma_zabezpieczenia_gier] (
    [id]                      BIGINT          NOT NULL,
    [czas_modyfikacji]        DATETIME        NULL,
    [status_wpisu]            VARCHAR (1)     NOT NULL,
    [wartosc_zabezpieczenia]  NUMERIC (19, 2) NULL,
    [forma_zabezpieczenia_id] BIGINT          NOT NULL,
    [gwarancja_id]            BIGINT          NULL,
    [hipoteka_id]             BIGINT          NULL,
    [zabezpieczenie_id]       BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

