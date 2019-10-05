CREATE TABLE [ncts2].[zdarzenia_krytyczne] (
    [id]                     BIGINT        NOT NULL,
    [operacja_tranzytowa_id] BIGINT        NULL,
    [uzytkownik_id]          BIGINT        NULL,
    [komunikat_id]           BIGINT        NULL,
    [etykieta]               NVARCHAR (32) NULL,
    [czas_wykrycia]          DATETIME      NULL,
    [informacja]             NVARCHAR (50) NULL,
    CONSTRAINT [zdarzenia_krytyczne_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

