CREATE TABLE [intr2].[intr_historia_podmiotu] (
    [id_poz]        NVARCHAR (30)  NOT NULL,
    [id_pod]        NVARCHAR (35)  NULL,
    [data_zmiany]   DATETIME2 (3)  NULL,
    [operator]      NVARCHAR (30)  NULL,
    [pozycja]       SMALLINT       NULL,
    [nazwa_danej]   NVARCHAR (255) NULL,
    [wartosc_przed] NVARCHAR (320) NULL,
    [wartosc_po]    NVARCHAR (320) NULL,
    [komentarz]     NVARCHAR (255) NULL,
    CONSTRAINT [intr_historia_podmiotu$PK_INTR_HISTORIA_PODMIOTU] PRIMARY KEY CLUSTERED ([id_poz] ASC) ON [FG_INTR2],
    CONSTRAINT [intr_historia_podmiotu$FK_int_hist_podm_intr_dane_pod] FOREIGN KEY ([id_pod]) REFERENCES [intr2].[intr_dane_pod] ([id_pod])
);

