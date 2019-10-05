CREATE TABLE [ncts2].[powiadomienia_komunikatow] (
    [id]              BIGINT         NOT NULL,
    [data_utworzenia] DATETIME       NULL,
    [mrn]             NVARCHAR (18)  NULL,
    [typ_komunikatu]  NVARCHAR (128) NULL,
    [tresc]           NVARCHAR (MAX) NULL,
    [czy_obsluzone]   BIT            NULL,
    [kod_uc]          NVARCHAR (8)   NULL,
    [uzytkownik_id]   BIGINT         NULL,
    CONSTRAINT [powiadomienia_komunikatow_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

