CREATE TABLE [ncts2].[komunikaty_systemy_zewnetrzne_zawartosc] (
    [id]        BIGINT          NOT NULL,
    [rozmiar]   BIGINT          NULL,
    [zawartosc] VARBINARY (MAX) NULL,
    CONSTRAINT [komunikaty_systemy_zewnetrzne_zawartosc_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
) TEXTIMAGE_ON [FG_NCTS2];

