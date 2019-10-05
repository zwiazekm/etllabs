CREATE TABLE [ncts2].[operacje_tranzytowe_gwarancje] (
    [id]                     BIGINT       NOT NULL,
    [operacja_tranzytowa_id] BIGINT       NULL,
    [rodzaj]                 NVARCHAR (1) NULL,
    [poz_id]                 INT          NULL,
    CONSTRAINT [operacje_tranzytowe_gwarancje_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

