CREATE TABLE [ncts2].[zapytania_o_gwarancje] (
    [id]                           BIGINT        NOT NULL,
    [data_utworzenia]              DATETIME      NULL,
    [komunikat_zapytania_id]       BIGINT        NULL,
    [komunikat_odpowiedzi_id]      BIGINT        NULL,
    [komunikat_zapytania_osoz_id]  BIGINT        NULL,
    [komunikat_odpowiedzi_osoz_id] BIGINT        NULL,
    [komunikacja_odbiorca_nta]     NVARCHAR (35) NULL,
    [kod_uc_pytajacego]            NVARCHAR (8)  NULL,
    CONSTRAINT [zapytania_o_gwarancje_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [zapytania_o_gwarancje_komunikat_odpowiedzi_id_id_fk] FOREIGN KEY ([komunikat_odpowiedzi_id]) REFERENCES [ncts2].[komunikaty] ([id]),
    CONSTRAINT [zapytania_o_gwarancje_komunikat_odpowiedzi_osoz_id_id_fk] FOREIGN KEY ([komunikat_odpowiedzi_osoz_id]) REFERENCES [ncts2].[komunikaty_systemy_zewnetrzne] ([id]),
    CONSTRAINT [zapytania_o_gwarancje_komunikat_zapytania_id_id_fk] FOREIGN KEY ([komunikat_zapytania_id]) REFERENCES [ncts2].[komunikaty] ([id]),
    CONSTRAINT [zapytania_o_gwarancje_komunikat_zapytania_osoz_id_id_fk] FOREIGN KEY ([komunikat_zapytania_osoz_id]) REFERENCES [ncts2].[komunikaty_systemy_zewnetrzne] ([id])
);

