CREATE TABLE [ncts2].[komunikaty_zawartosc] (
    [id]            BIGINT          NOT NULL,
    [rozmiar_bytes] BIGINT          NULL,
    [nazwa_pliku]   NVARCHAR (510)  NULL,
    [rozszerzenie]  NVARCHAR (100)  NULL,
    [zawartosc]     VARBINARY (MAX) NULL,
    CONSTRAINT [komunikaty_zawartosc_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

