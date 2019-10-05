CREATE TABLE [ncts2].[zamkniecia_celne] (
    [operacja_tranzytowa_id] BIGINT        NULL,
    [nr]                     NVARCHAR (20) NULL,
    [id]                     BIGINT        NOT NULL,
    [poz_id]                 INT           NULL,
    CONSTRAINT [zamkniecia_celne_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

