CREATE TABLE [ncts2].[komunikaty_systemy_zewnetrzne] (
    [id]                                  BIGINT          NOT NULL,
    [data_utworzenia]                     DATETIME        NULL,
    [data_modyfikacji]                    DATETIME        NULL,
    [nadawca]                             NVARCHAR (25)   NULL,
    [odbiorca]                            NVARCHAR (25)   NULL,
    [kierunek]                            NVARCHAR (8)    NULL,
    [typ]                                 NVARCHAR (100)  NULL,
    [status]                              NVARCHAR (40)   NULL,
    [komunikat_id]                        BIGINT          NULL,
    [operacja_tranzytowa_id]              BIGINT          NULL,
    [zadanie_id]                          BIGINT          NULL,
    [zewnetrzny_identyfikator_komunikatu] NVARCHAR (1024) NULL,
    [wsa_komunikat_id]                    NVARCHAR (1024) NULL,
    [wsa_dotyczy_id]                      NVARCHAR (1024) NULL,
    [zawartosc_id]                        BIGINT          NULL,
    [rewizja]                             INT             NULL,
    CONSTRAINT [komunikaty_systemy_zewnetrzne_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [komunikaty_systemy_zewnetrzne_zadanie_id_fk] FOREIGN KEY ([zadanie_id]) REFERENCES [ncts2].[komunikaty_systemy_zewnetrzne] ([id])
);


GO
ALTER TABLE [ncts2].[komunikaty_systemy_zewnetrzne] NOCHECK CONSTRAINT [komunikaty_systemy_zewnetrzne_zadanie_id_fk];

