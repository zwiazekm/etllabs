CREATE TABLE [intr2].[intr_ape] (
    [id_pod]        NVARCHAR (35) NOT NULL,
    [nr_poz]        INT           NOT NULL,
    [ape]           NVARCHAR (2)  NULL,
    [poczatek_obow] DATETIME2 (3) NULL,
    [koniec_obow]   DATETIME2 (3) NULL,
    CONSTRAINT [intr_ape$PK_INTR_APE] PRIMARY KEY CLUSTERED ([id_pod] ASC, [nr_poz] ASC)
);

