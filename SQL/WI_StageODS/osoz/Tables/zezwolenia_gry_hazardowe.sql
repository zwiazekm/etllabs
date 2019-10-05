CREATE TABLE [osoz].[zezwolenia_gry_hazardowe] (
    [id]                      BIGINT       NOT NULL,
    [czas_modyfikacji]        DATETIME     NULL,
    [data_zezwolenia_do]      DATETIME     NULL,
    [data_zezwolenia_od]      DATETIME     NOT NULL,
    [data_wydania_zezwolenia] DATETIME     NULL,
    [numer_zezwolenia]        VARCHAR (45) NOT NULL,
    [zabezpieczenie_id]       BIGINT       NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

