CREATE TABLE [ncts2].[ar_metody_kontroli] (
    [id]                             BIGINT        NOT NULL,
    [ar_obsluga_wskazan_kontroli_id] BIGINT        NOT NULL,
    [poziom_zdefiniowania]           NVARCHAR (36) NOT NULL,
    [metoda_kontroli]                NVARCHAR (36) NOT NULL,
    CONSTRAINT [ar_metody_kontroli_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ar_metody_kontroli_ar_obsluga_wskazan_kontroli_id_fk] FOREIGN KEY ([ar_obsluga_wskazan_kontroli_id]) REFERENCES [ncts2].[ar_obsluga_wskazan_kontroli] ([id])
);

