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
    CONSTRAINT [komunikaty_systemy_zewnetrzne_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

