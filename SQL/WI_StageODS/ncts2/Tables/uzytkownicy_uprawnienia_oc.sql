CREATE TABLE [ncts2].[uzytkownicy_uprawnienia_oc] (
    [id]              BIGINT    NOT NULL,
    [uzytkownik_id]   BIGINT    NULL,
    [typ_uprawnienia] NCHAR (1) NULL,
    [kod_urzedu]      NCHAR (8) NULL,
    CONSTRAINT [uzytkownicy_uprawnienia_oc_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

