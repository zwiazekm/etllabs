CREATE TABLE [ncts2].[niedostepnosci] (
    [id]                            BIGINT         NOT NULL,
    [kraj]                          NVARCHAR (2)   NULL,
    [typ_niedostepnosci]            NVARCHAR (1)   NULL,
    [kod_funkcjonanosci_biznesowej] NVARCHAR (1)   NULL,
    [czas_poczatku_niedostepnosci]  DATETIME       NULL,
    [czas_konca_niedostepnosci]     DATETIME       NULL,
    [wyjasnienia]                   NVARCHAR (350) NULL,
    [wyjasnienia_lng]               NVARCHAR (2)   NULL,
    CONSTRAINT [niedostepnosci_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

