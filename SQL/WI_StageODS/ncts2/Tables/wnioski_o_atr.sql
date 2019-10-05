CREATE TABLE [ncts2].[wnioski_o_atr] (
    [id]                         BIGINT        NOT NULL,
    [uc_wyjscia]                 NVARCHAR (8)  NULL,
    [uc_przedstawienia_wniosku]  NVARCHAR (8)  NULL,
    [status]                     NVARCHAR (12) NULL,
    [mrn]                        NVARCHAR (18) NULL,
    [zmiana_statusu_data]        DATETIME      NULL,
    [komunikat_ie114_id]         BIGINT        NULL,
    [data_przekroczenia_granicy] DATETIME      NULL,
    [komunikat_ie115_id]         BIGINT        NULL,
    [data_zwolnienia]            DATETIME      NULL,
    [rewizja]                    INT           NULL,
    [data_utworzenia]            DATETIME      NULL,
    [data_modyfikacji]           DATETIME      NULL,
    CONSTRAINT [wnioski_o_atr_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

