CREATE TABLE [osoz].[dokumenty_windykacyjne] (
    [id]                          BIGINT          NOT NULL,
    [czas_modyfikacji]            DATETIME        NULL,
    [data_windykacji]             DATETIME        NULL,
    [kwota_ogolem]                NUMERIC (19, 2) NOT NULL,
    [numer_decyzji_deklaracji]    VARCHAR (20)    NOT NULL,
    [odsetki]                     NUMERIC (19, 2) NOT NULL,
    [suma]                        NUMERIC (19, 2) NOT NULL,
    [upomnienie_tytul_wykonawczy] VARCHAR (20)    NOT NULL,
    [zabezpieczenie_id]           BIGINT          NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

