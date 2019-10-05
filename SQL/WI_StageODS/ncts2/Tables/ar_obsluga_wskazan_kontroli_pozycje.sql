CREATE TABLE [ncts2].[ar_obsluga_wskazan_kontroli_pozycje] (
    [id]                             BIGINT NOT NULL,
    [ar_obsluga_wskazan_kontroli_id] BIGINT NULL,
    [nr_pozycji]                     INT    NULL,
    CONSTRAINT [ar_obsluga_wskazan_kontroli_pozycje_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

