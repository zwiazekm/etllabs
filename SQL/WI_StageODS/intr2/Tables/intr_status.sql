CREATE TABLE [intr2].[intr_status] (
    [id_pod]            NVARCHAR (35) NOT NULL,
    [nr_poz]            INT           NOT NULL,
    [status]            NVARCHAR (2)  NULL,
    [poczatek_obow]     DATETIME2 (3) NULL,
    [koniec_obow]       DATETIME2 (3) NULL,
    [data_aktualizacji] DATETIME2 (3) NOT NULL,
    [operator]          NVARCHAR (40) NULL
);

