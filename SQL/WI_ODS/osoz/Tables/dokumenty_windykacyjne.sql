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
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fkd42f3c3d12fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id])
);

