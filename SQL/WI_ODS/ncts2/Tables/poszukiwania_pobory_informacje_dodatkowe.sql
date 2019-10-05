CREATE TABLE [ncts2].[poszukiwania_pobory_informacje_dodatkowe] (
    [id]                        BIGINT        NOT NULL,
    [typ]                       NVARCHAR (5)  NULL,
    [mrn]                       NVARCHAR (18) NULL,
    [data_wyslania]             DATETIME      NULL,
    [komunikat_id]              BIGINT        NULL,
    [zapytanie_poszukiwacze_id] BIGINT        NULL,
    [data_utworzenia]           DATETIME      NULL,
    CONSTRAINT [poszukiwania_pobory_informacje_dodatkowe_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [poszukiwania_pobory_informacje_dodatkowe_komunikat_id_id_fk] FOREIGN KEY ([komunikat_id]) REFERENCES [ncts2].[komunikaty] ([id]),
    CONSTRAINT [poszukiwania_pobory_informacje_dodatkowe_zapytanie_poszukiwacze_id_id_fk] FOREIGN KEY ([zapytanie_poszukiwacze_id]) REFERENCES [ncts2].[poszukiwania_pobory] ([id])
);

