CREATE TABLE [ncts2].[kraje_wyslane_informacje_o_operacji_tranzytowej] (
    [id]                     BIGINT       NOT NULL,
    [operacja_tranzytowa_id] BIGINT       NULL,
    [kod_kraju]              NVARCHAR (2) NULL,
    [urzad_tranzytowy]       NVARCHAR (8) NULL,
    CONSTRAINT [kraje_wyslane_informacje_o_operacji_tranzytowej_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [operacja_tranzytowa_fk] FOREIGN KEY ([operacja_tranzytowa_id]) REFERENCES [ncts2].[operacje_tranzytowe] ([id])
);

