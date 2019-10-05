CREATE TABLE [ncts2].[zdarzenia_kontenery] (
    [id]           BIGINT        NOT NULL,
    [zdarzenie_id] BIGINT        NULL,
    [poz_id]       INT           NULL,
    [numer]        NVARCHAR (17) NULL,
    CONSTRAINT [zdarzenia_kontenery_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [zdarzenia_kontenery_zdarzenie_id_id_fk] FOREIGN KEY ([zdarzenie_id]) REFERENCES [ncts2].[zdarzenia] ([id])
);

