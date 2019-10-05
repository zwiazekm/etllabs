CREATE TABLE [ncts2].[ar_zespol_kontroli] (
    [id]                             BIGINT         NOT NULL,
    [ar_obsluga_wskazan_kontroli_id] BIGINT         NOT NULL,
    [login]                          NVARCHAR (200) NOT NULL,
    [rejestrator_wynikow_zisar]      SMALLINT       NOT NULL,
    CONSTRAINT [ar_zespol_kontroli_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ar_zespol_kontroli_ar_obsluga_wskazan_kontroli_id_fk] FOREIGN KEY ([ar_obsluga_wskazan_kontroli_id]) REFERENCES [ncts2].[ar_obsluga_wskazan_kontroli] ([id])
);

