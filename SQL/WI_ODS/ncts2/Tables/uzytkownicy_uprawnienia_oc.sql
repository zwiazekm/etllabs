CREATE TABLE [ncts2].[uzytkownicy_uprawnienia_oc] (
    [id]              BIGINT    NOT NULL,
    [uzytkownik_id]   BIGINT    NOT NULL,
    [typ_uprawnienia] NCHAR (1) NOT NULL,
    [kod_urzedu]      NCHAR (8) NOT NULL,
    CONSTRAINT [uzytkownicy_uprawnienia_oc_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [uzytkownicy_uprawnienia_oc__uzytkownik_id__uzytkownicy__fk] FOREIGN KEY ([uzytkownik_id]) REFERENCES [ncts2].[uzytkownicy] ([id])
);

