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
    CONSTRAINT [wnioski_o_uniewaznienie_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [wnioski_o_uniewaznienie_decydent_id_id_fk] FOREIGN KEY ([decydent_id]) REFERENCES [ncts2].[uzytkownicy] ([id]),
    CONSTRAINT [wnioski_o_uniewaznienie_komunikat_odpowiedzi_id_id_fk] FOREIGN KEY ([komunikat_odpowiedzi_id]) REFERENCES [ncts2].[komunikaty] ([id]),
    CONSTRAINT [wnioski_o_uniewaznienie_komunikat_przychodzacy_id_id_fk] FOREIGN KEY ([komunikat_przychodzacy_id]) REFERENCES [ncts2].[komunikaty] ([id]),
    CONSTRAINT [wnioski_o_uniewaznienie_operacja_tranzytowa_id_id_fk] FOREIGN KEY ([operacja_tranzytowa_id]) REFERENCES [ncts2].[operacje_tranzytowe] ([id]),
    CONSTRAINT [wnioski_o_uniewaznienie_rejestrator_id_id_fk] FOREIGN KEY ([rejestrator_id]) REFERENCES [ncts2].[uzytkownicy] ([id])
);

