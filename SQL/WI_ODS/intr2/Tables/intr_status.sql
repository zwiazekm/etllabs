CREATE TABLE [intr2].[intr_status] (
    [id_pod]            NVARCHAR (35) NOT NULL,
    [nr_poz]            INT           NOT NULL,
    [status]            NVARCHAR (2)  NULL,
    [poczatek_obow]     DATETIME2 (3) NULL,
    [koniec_obow]       DATETIME2 (3) NULL,
    [data_aktualizacji] DATETIME2 (3) NOT NULL,
    [operator]          NVARCHAR (40) NULL,
    CONSTRAINT [intr_status$intr_statu_13600048452] PRIMARY KEY CLUSTERED ([id_pod] ASC, [nr_poz] ASC) ON [FG_INTR2],
    CONSTRAINT [intr_status$FK_INTR_STATUS_REF_INTR_DANE_POD] FOREIGN KEY ([id_pod]) REFERENCES [intr2].[intr_dane_pod] ([id_pod])
);

