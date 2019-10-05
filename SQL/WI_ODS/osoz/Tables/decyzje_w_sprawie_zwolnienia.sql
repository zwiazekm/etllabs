CREATE TABLE [osoz].[decyzje_w_sprawie_zwolnienia] (
    [id]                              BIGINT          NOT NULL,
    [czas_modyfikacji]                DATETIME        NULL,
    [data_rejestracji_zwolnienia]     DATETIME        NOT NULL,
    [data_zmiany_decyzji]             DATETIME        NOT NULL,
    [kwota_zwolnienia]                NUMERIC (19, 2) NOT NULL,
    [numer_decyzji_kancelaryjny]      VARCHAR (30)    NOT NULL,
    [obcy_sklad_podatkowy]            BIT             NOT NULL,
    [status_decyzji]                  VARCHAR (15)    NOT NULL,
    [wazne_do]                        DATETIME        NULL,
    [wazne_od]                        DATETIME        NOT NULL,
    [zabezpieczenie_id]               BIGINT          NOT NULL,
    [numer_decyzji_naczelnika_urzedu] VARCHAR (30)    NOT NULL,
    [urzad_zmieniajacy_decyzje_id]    BIGINT          NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk8b6c41f712fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id])
);

