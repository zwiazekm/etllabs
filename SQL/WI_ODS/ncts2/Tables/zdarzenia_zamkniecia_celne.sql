CREATE TABLE [ncts2].[zdarzenia_zamkniecia_celne] (
    [id]           BIGINT        NOT NULL,
    [zdarzenie_id] BIGINT        NULL,
    [poz_id]       INT           NULL,
    [numer]        NVARCHAR (20) NULL,
    CONSTRAINT [zdarzenia_zamkniecia_celne_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [zdarzenie_zamkniecia_celne_zdarzenie_id_id_fk] FOREIGN KEY ([zdarzenie_id]) REFERENCES [ncts2].[zdarzenia] ([id])
);

