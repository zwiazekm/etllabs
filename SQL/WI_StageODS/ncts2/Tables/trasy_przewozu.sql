CREATE TABLE [ncts2].[trasy_przewozu] (
    [operacja_tranzytowa_id] BIGINT       NULL,
    [trasa]                  NVARCHAR (2) NULL,
    [id]                     BIGINT       NOT NULL,
    CONSTRAINT [trasy_przewozu_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

