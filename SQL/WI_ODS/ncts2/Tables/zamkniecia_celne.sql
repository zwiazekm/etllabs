CREATE TABLE [ncts2].[zamkniecia_celne] (
    [operacja_tranzytowa_id] BIGINT        NULL,
    [nr]                     NVARCHAR (20) NULL,
    [id]                     BIGINT        NOT NULL,
    [poz_id]                 INT           NULL,
    CONSTRAINT [zamkniecia_celne_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [zamkniecia_celne_operacja_tranzytowa_id_id_fk] FOREIGN KEY ([operacja_tranzytowa_id]) REFERENCES [ncts2].[operacje_tranzytowe] ([id])
);

