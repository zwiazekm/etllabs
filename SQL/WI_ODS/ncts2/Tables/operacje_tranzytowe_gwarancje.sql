CREATE TABLE [ncts2].[operacje_tranzytowe_gwarancje] (
    [id]                     BIGINT       NOT NULL,
    [operacja_tranzytowa_id] BIGINT       NULL,
    [rodzaj]                 NVARCHAR (1) NULL,
    [poz_id]                 INT          NULL,
    CONSTRAINT [operacje_tranzytowe_gwarancje_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [operacje_tranzytowe_gwarancje_optr_id_operacje_tranzytowe_fk] FOREIGN KEY ([operacja_tranzytowa_id]) REFERENCES [ncts2].[operacje_tranzytowe] ([id])
);

