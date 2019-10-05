CREATE TABLE [ncts2].[RefPozwolNaProcUproszcz] (
    [Id]                         BIGINT        NOT NULL,
    [IdSISC]                     NVARCHAR (17) NULL,
    [NumerPozwolenia]            NVARCHAR (25) NULL,
    [FormaProceduryUproszczonej] NVARCHAR (50) NULL,
    [WazneOd]                    DATETIME      NULL,
    [Status]                     NVARCHAR (1)  NULL,
    [DataZawieszenia]            DATETIME      NULL,
    [DataWaznosciOdRekordu]      DATETIME      NULL,
    [DataWaznosciDoRekordu]      DATETIME      NULL,
    [NumerKlucz]                 NVARCHAR (33) NULL,
    CONSTRAINT [RefPozwolNaProcUproszcz_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

