CREATE TABLE [ncts2].[zapytania_o_przesylki] (
    [id]                                                        BIGINT         NOT NULL,
    [mrn]                                                       NVARCHAR (18)  NULL,
    [data_utworzenia]                                           DATETIME       NULL,
    [data_odpowiedzi]                                           DATETIME       NULL,
    [status_odpowiedzi]                                         NVARCHAR (3)   NULL,
    [uzytkownik_id]                                             BIGINT         NULL,
    [uc_przedstawienia_zapytania]                               NVARCHAR (8)   NULL,
    [uc_wyslania_zapytania]                                     NVARCHAR (8)   NULL,
    [komunikat_ie027_id]                                        BIGINT         NULL,
    [komunikat_odpowiedzi_ie038_id]                             BIGINT         NULL,
    [zapytanie_o_dodatkowe_informacje_o_przesylce]              NVARCHAR (140) NULL,
    [odpowiedz_na_zapytanie_o_dodatkowe_informacje_o_przesylce] NVARCHAR (140) NULL,
    [poinformowano_o_przeladunku]                               BIT            NULL,
    [poinformowano_o_zdarzeniu]                                 BIT            NULL,
    CONSTRAINT [zapytania_o_przesylki_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
);

