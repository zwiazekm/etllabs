CREATE TABLE [ncts2].[ref_pozwolenia_na_procedure_uproszczona] (
    [id]                           BIGINT        NOT NULL,
    [idsisc]                       NVARCHAR (17) NULL,
    [numer_pozwolenia]             NVARCHAR (25) NULL,
    [forma_procedury_uproszczonej] NVARCHAR (50) NULL,
    [wazne_od]                     DATETIME      NULL,
    [status]                       NVARCHAR (1)  NULL,
    [data_zawieszenia]             DATETIME      NULL,
    [valid_from]                   DATETIME      NULL,
    [valid_to]                     DATETIME      NULL,
    [numer_klucz]                  NVARCHAR (33) NULL,
    CONSTRAINT [ref_pozwolenia_na_procedure_uproszczona_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

