CREATE TABLE [ncts2].[powiadomienia_komunikatow] (
    [id]              BIGINT         NOT NULL,
    [data_utworzenia] DATETIME       NULL,
    [mrn]             NVARCHAR (18)  NULL,
    [typ_komunikatu]  NVARCHAR (128) NULL,
    [tresc]           NVARCHAR (MAX) NULL,
    [czy_obsluzone]   BIT            NULL,
    [kod_uc]          NVARCHAR (8)   NULL,
    [uzytkownik_id]   BIGINT         NULL,
    CONSTRAINT [powiadomienia_komunikatow_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [powiadomienia_komunikatow_uzytkownik_id_id_fk] FOREIGN KEY ([uzytkownik_id]) REFERENCES [ncts2].[uzytkownicy] ([id])
) TEXTIMAGE_ON [FG_NCTS2];

