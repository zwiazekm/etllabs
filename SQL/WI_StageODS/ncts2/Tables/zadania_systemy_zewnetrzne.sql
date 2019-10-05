CREATE TABLE [ncts2].[zadania_systemy_zewnetrzne] (
    [id]                     BIGINT          NOT NULL,
    [operacja_tranzytowa_id] BIGINT          NULL,
    [komunikat_id]           BIGINT          NULL,
    [zrodlo]                 NVARCHAR (8)    NULL,
    [poz_id]                 INT             NULL,
    [kod]                    INT             NULL,
    [komunikat]              NVARCHAR (350)  NULL,
    [opis]                   NVARCHAR (MAX)  NULL,
    [status]                 NVARCHAR (3)    NULL,
    [komentarz]              NVARCHAR (1000) NULL,
    [typ_uc]                 NVARCHAR (1)    NULL,
    CONSTRAINT [zadania_systemy_zewnetrzne_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

