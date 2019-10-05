CREATE TABLE [ncts2].[wnioski_o_procedure_awaryjna] (
    [id]                         BIGINT          NOT NULL,
    [data_utworzenia]            DATETIME        NULL,
    [identyfikator]              NVARCHAR (14)   NULL,
    [kod_przyczyny]              NVARCHAR (1)    NULL,
    [kod_urzedu]                 NVARCHAR (8)    NULL,
    [status]                     NVARCHAR (1)    NULL,
    [tin]                        NVARCHAR (17)   NULL,
    [login]                      NVARCHAR (255)  NULL,
    [lrn]                        NVARCHAR (21)   NULL,
    [mrn]                        NVARCHAR (18)   NULL,
    [grn]                        NVARCHAR (24)   NULL,
    [data_od]                    DATETIME        NULL,
    [data_do]                    DATETIME        NULL,
    [opis]                       NVARCHAR (2000) NULL,
    [odpowiedz_odpowiadajacy]    NVARCHAR (100)  NULL,
    [odpowiedz_uzasadnienie]     NVARCHAR (2000) NULL,
    [odpowiedz_data]             DATETIME        NULL,
    [data_obowiazywania_od]      DATETIME        NULL,
    [data_obowiazywania_do]      DATETIME        NULL,
    [identyfikator_obowiazujacy] NVARCHAR (3)    NULL,
    CONSTRAINT [wnioski_o_procedure_awaryjna_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
);

