CREATE TABLE [ncts2].[ar_zespol_kontroli] (
    [id]                             BIGINT         NOT NULL,
    [ar_obsluga_wskazan_kontroli_id] BIGINT         NULL,
    [login]                          NVARCHAR (200) NULL,
    [rejestrator_wynikow_zisar]      SMALLINT       NULL,
    CONSTRAINT [ar_zespol_kontroli_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

