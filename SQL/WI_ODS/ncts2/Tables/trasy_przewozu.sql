CREATE TABLE [ncts2].[trasy_przewozu] (
    [operacja_tranzytowa_id] BIGINT       NULL,
    [trasa]                  NVARCHAR (2) NULL,
    [id]                     BIGINT       NOT NULL,
    CONSTRAINT [trasy_przewozu_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [trasy_przewozu_operacja_tranzytowa_id_id_fk] FOREIGN KEY ([operacja_tranzytowa_id]) REFERENCES [ncts2].[operacje_tranzytowe] ([id])
);

