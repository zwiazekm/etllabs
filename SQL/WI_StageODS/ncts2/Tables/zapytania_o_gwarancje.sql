CREATE TABLE [ncts2].[zapytania_o_gwarancje] (
    [id]                           BIGINT        NOT NULL,
    [data_utworzenia]              DATETIME      NULL,
    [komunikat_zapytania_id]       BIGINT        NULL,
    [komunikat_odpowiedzi_id]      BIGINT        NULL,
    [komunikat_zapytania_osoz_id]  BIGINT        NULL,
    [komunikat_odpowiedzi_osoz_id] BIGINT        NULL,
    [komunikacja_odbiorca_nta]     NVARCHAR (35) NULL,
    [kod_uc_pytajacego]            NVARCHAR (8)  NULL,
    CONSTRAINT [zapytania_o_gwarancje_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

