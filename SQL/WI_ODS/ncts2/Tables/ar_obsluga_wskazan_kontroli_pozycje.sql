CREATE TABLE [ncts2].[ar_obsluga_wskazan_kontroli_pozycje] (
    [id]                             BIGINT NOT NULL,
    [ar_obsluga_wskazan_kontroli_id] BIGINT NOT NULL,
    [nr_pozycji]                     INT    NOT NULL,
    CONSTRAINT [ar_obsluga_wskazan_kontroli_pozycje_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ar_obsluga_wskazan_kontroli_p_ar_obsluga_wskazan_kontroli__fk] FOREIGN KEY ([ar_obsluga_wskazan_kontroli_id]) REFERENCES [ncts2].[ar_obsluga_wskazan_kontroli] ([id])
);

