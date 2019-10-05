CREATE TABLE [ncts2].[uzytkownicy] (
    [id]                        BIGINT         NOT NULL,
    [nazwisko]                  NVARCHAR (64)  NULL,
    [imie]                      NVARCHAR (64)  NULL,
    [uc]                        NVARCHAR (8)   NULL,
    [login]                     NVARCHAR (128) NULL,
    [ostatni_tryb_urzedu]       NVARCHAR (1)   NULL,
    [data_ostatniego_logowania] DATETIME       NULL,
    [czy_zalogowany]            BIT            NULL,
    [mail]                      NVARCHAR (256) NULL,
    [id_login]                  BIGINT         NULL,
    [jednostka_organizacyjna]   NVARCHAR (64)  NULL,
    [telefon]                   NVARCHAR (32)  NULL,
    CONSTRAINT [uzytkownicy_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
);

