CREATE TABLE [osoz].[uzycia_zabezpieczenia] (
    [id]                      BIGINT          NOT NULL,
    [czas_modyfikacji]        DATETIME        NULL,
    [data_uzycia]             DATETIME2 (7)   NOT NULL,
    [kod_urzedu_wyjscia]      VARCHAR (8)     NULL,
    [kwota_uzycia]            NUMERIC (19, 2) NOT NULL,
    [saldo_uzycia]            NUMERIC (19, 2) NOT NULL,
    [status]                  VARCHAR (15)    NULL,
    [wycofane]                BIT             NOT NULL,
    [dokument_obciazajacy_id] BIGINT          NOT NULL,
    [zabezpieczenie_id]       BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ]
);

