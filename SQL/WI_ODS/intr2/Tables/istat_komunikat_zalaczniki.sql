CREATE TABLE [intr2].[istat_komunikat_zalaczniki] (
    [id]            NUMERIC (19)   NOT NULL,
    [id_komunikatu] NUMERIC (19)   NOT NULL,
    [nazwa_pliku]   NVARCHAR (100) NULL,
    [mime]          NVARCHAR (50)  NULL,
    [zawartosc]     IMAGE          NULL,
    CONSTRAINT [istat_komunikat_zalaczniki$PK_istat_komunikat_zalaczniki] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_INTR2],
    CONSTRAINT [istat_komunikat_zalaczniki$FK_istat_komunikat_zalaczniki__istat_komunikat] FOREIGN KEY ([id_komunikatu]) REFERENCES [intr2].[istat_komunikat] ([id])
) TEXTIMAGE_ON [FG_INTR2];

