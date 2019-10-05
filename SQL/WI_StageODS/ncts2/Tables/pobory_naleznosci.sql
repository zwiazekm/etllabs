CREATE TABLE [ncts2].[pobory_naleznosci] (
    [id]                                     BIGINT        NOT NULL,
    [uc]                                     NVARCHAR (8)  NULL,
    [operacja_tranzytowa_id]                 BIGINT        NULL,
    [mrn]                                    NVARCHAR (18) NULL,
    [rola_urzedu]                            NVARCHAR (1)  NULL,
    [status]                                 NVARCHAR (8)  NULL,
    [status_data]                            DATETIME      NULL,
    [uc_poboru]                              NVARCHAR (8)  NULL,
    [uc_przeprowadzajacy_pobor]              NVARCHAR (8)  NULL,
    [poszukiwanie_pobor_id]                  BIGINT        NULL,
    [data_utworzenia]                        DATETIME      NULL,
    [data_modyfikacji]                       DATETIME      NULL,
    [rewizja]                                INT           NULL,
    [typ_deklaracji]                         NVARCHAR (5)  NULL,
    [uc_wyjscia]                             NVARCHAR (8)  NULL,
    [procedura_uproszczona_uc_przeznaczenia] BIT           NULL,
    [przedstawiajacy_tin]                    NVARCHAR (17) NULL,
    [przedstawiajacy_nazwa]                  NVARCHAR (35) NULL,
    CONSTRAINT [pobory_naleznosci_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

