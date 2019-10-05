CREATE TABLE [osoz].[potwierdzenia] (
    [id]                             BIGINT          NOT NULL,
    [czas_modyfikacji]               DATETIME        NULL,
    [data_wystawienia_potwierdzenia] DATETIME        NOT NULL,
    [kwota_na_potwierdzeniu]         NUMERIC (19, 2) NOT NULL,
    [numer_potwierdzenia]            VARCHAR (40)    NOT NULL,
    [potwierdzenie_wazne_do]         DATETIME        NULL,
    [potwierdzenie_wazne_od]         DATETIME2 (7)   NOT NULL,
    [forma_zabezpieczenia_id]        BIGINT          NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ]
);

