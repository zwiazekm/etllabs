CREATE TABLE [ncts2].[operacje_tranzytowe_inne_informacje] (
    [id]                           BIGINT         NOT NULL,
    [operacja_tranzytowa_id]       BIGINT         NULL,
    [uwagi]                        NVARCHAR (140) NULL,
    [uwagi_jezyk]                  NVARCHAR (2)   NULL,
    [tryb_utworzenia_pozycji]      NVARCHAR (1)   NULL,
    [iteracja_uwag_rozladunkowych] SMALLINT       NULL,
    CONSTRAINT [operacje_tranzytowe_inne_informacje_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [operacje_tranzytowe_inne_informacje_optr_id_operacje_tranzytowe_fk] FOREIGN KEY ([operacja_tranzytowa_id]) REFERENCES [ncts2].[operacje_tranzytowe] ([id])
);

