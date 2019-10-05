CREATE TABLE [ncts2].[wnioski_o_uniewaznienie] (
    [id]                        BIGINT         NOT NULL,
    [operacja_tranzytowa_id]    BIGINT         NULL,
    [status]                    NVARCHAR (16)  NULL,
    [uzasadnienie_wniosku]      NVARCHAR (350) NULL,
    [data_wniosku]              DATETIME       NULL,
    [uzasadnienie_decyzji]      NVARCHAR (350) NULL,
    [data_decyzji]              DATETIME       NULL,
    [rejestrator_id]            BIGINT         NULL,
    [data_rejestracji]          DATETIME       NULL,
    [komunikat_przychodzacy_id] BIGINT         NULL,
    [komunikat_odpowiedzi_id]   BIGINT         NULL,
    [decydent_id]               BIGINT         NULL,
    CONSTRAINT [wnioski_o_uniewaznienie_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

