CREATE TABLE [ncts2].[ar_metody_kontroli] (
    [id]                             BIGINT        NOT NULL,
    [ar_obsluga_wskazan_kontroli_id] BIGINT        NULL,
    [poziom_zdefiniowania]           NVARCHAR (36) NULL,
    [metoda_kontroli]                NVARCHAR (36) NULL,
    CONSTRAINT [ar_metody_kontroli_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

