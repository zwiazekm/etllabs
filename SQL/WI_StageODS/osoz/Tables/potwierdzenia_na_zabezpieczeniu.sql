CREATE TABLE [osoz].[potwierdzenia_na_zabezpieczeniu] (
    [id]                     BIGINT          NOT NULL,
    [czas_modyfikacji]       DATETIME        NULL,
    [kwota_na_potwierdzeniu] NUMERIC (19, 2) NOT NULL,
    [status_wpisu]           VARCHAR (1)     NOT NULL,
    [potwierdzenie_id]       BIGINT          NOT NULL,
    [zabezpieczenie_id]      BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

