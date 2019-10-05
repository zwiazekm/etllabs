CREATE TABLE [ncts2].[historia_zmian_towarow] (
    [id]                        BIGINT          NOT NULL,
    [wersja]                    INT             NULL,
    [calkowita_liczba_sztuk]    INT             NULL,
    [calkowita_liczba_opakowan] INT             NULL,
    [calkowita_masa_brutto]     NUMERIC (14, 3) NULL,
    [poz_id]                    INT             NULL,
    [kod_towarowy]              NVARCHAR (8)    NULL,
    [opis_towaru]               NVARCHAR (280)  NULL,
    [liczba_opakowan]           INT             NULL,
    [liczba_sztuk]              INT             NULL,
    [operacja_tranzytowa_id]    BIGINT          NULL,
    [komunikat_id]              BIGINT          NULL,
    [masa_brutto]               NUMERIC (14, 3) NULL,
    CONSTRAINT [historia_zmian_towarow_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

