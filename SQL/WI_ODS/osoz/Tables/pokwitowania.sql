﻿CREATE TABLE [osoz].[pokwitowania] (
    [id]                                    BIGINT          NOT NULL,
    [czas_modyfikacji]                      DATETIME        NULL,
    [bezterminowe]                          BIT             NOT NULL,
    [data_rejestracji]                      DATETIME        NOT NULL,
    [data_wydania_pokwitowania]             DATETIME        NULL,
    [data_wydania_potwierdzenia]            DATETIME        NULL,
    [kwota_pokwitowania_potwierdzenia]      NUMERIC (19, 2) NOT NULL,
    [nabywca_wewnetrzny_z_zaplacona_akcyza] BIT             NOT NULL,
    [nr]                                    VARCHAR (50)    NULL,
    [numer_pokwitowania]                    VARCHAR (150)   NULL,
    [numer_potwierdzenia]                   VARCHAR (150)   NULL,
    [numer_sprawy]                          VARCHAR (50)    NOT NULL,
    [obcy_sklad_podatkowy]                  BIT             NOT NULL,
    [podatnik_okreslony_w_art_13_ust_3]     BIT             NOT NULL,
    [powod_odrzucenia]                      VARCHAR (255)   NULL,
    [powod_uniewaznienia]                   VARCHAR (30)    NULL,
    [przedstawiciel_podatkowy]              BIT             NOT NULL,
    [rodzaj]                                VARCHAR (255)   NOT NULL,
    [rodzaj_zabezpieczenia]                 VARCHAR (255)   NOT NULL,
    [saldo]                                 NUMERIC (19, 2) NOT NULL,
    [seria]                                 VARCHAR (10)    NULL,
    [status]                                VARCHAR (1)     NOT NULL,
    [typ_zabezpieczenia]                    VARCHAR (255)   NOT NULL,
    [wazne_do]                              DATETIME        NULL,
    [wazne_od]                              DATETIME        NOT NULL,
    [zlozenie_zab_przez_os_trzecia]         BIT             NOT NULL,
    [zwrocone_srodki]                       BIT             NOT NULL,
    [forma_zabezpieczenia_id]               BIGINT          NOT NULL,
    [kontrahent_skladajacy_id]              BIGINT          NOT NULL,
    [kontrahent_zobowiazany_id]             BIGINT          NOT NULL,
    [urzad_zlozenia_zabezpieczenia_id]      BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fkd55581834792384d] FOREIGN KEY ([forma_zabezpieczenia_id]) REFERENCES [osoz].[forma_zabezpieczenia] ([id]),
    CONSTRAINT [fkd5558183719cf6e4] FOREIGN KEY ([kontrahent_skladajacy_id]) REFERENCES [osoz].[kontrahenci] ([id]),
    CONSTRAINT [fkd5558183bdda77dd] FOREIGN KEY ([urzad_zlozenia_zabezpieczenia_id]) REFERENCES [osoz].[struktura_organizacyjna] ([id]),
    CONSTRAINT [fkd5558183da965cc2] FOREIGN KEY ([kontrahent_zobowiazany_id]) REFERENCES [osoz].[kontrahenci] ([id])
);

