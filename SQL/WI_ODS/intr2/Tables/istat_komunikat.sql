CREATE TABLE [intr2].[istat_komunikat] (
    [id]                                 NUMERIC (19)   NOT NULL,
    [nadrzedny_id]                       NUMERIC (19)   NULL,
    [data]                               DATETIME2 (3)  NOT NULL,
    [kierunek]                           NVARCHAR (10)  NULL,
    [nazwa_pliku]                        NVARCHAR (100) NULL,
    [mime]                               NVARCHAR (50)  NULL,
    [naglowek_koperty]                   NTEXT          NULL,
    [zawartosc]                          NTEXT          NOT NULL,
    [typ]                                NVARCHAR (10)  NULL,
    [status]                             NVARCHAR (12)  NULL,
    [numer_wlasny]                       NVARCHAR (32)  NULL,
    [id_podmiotu]                        NVARCHAR (50)  NULL,
    [manual]                             BIT            NOT NULL,
    [login]                              NVARCHAR (100) NULL,
    [nip]                                NVARCHAR (10)  NULL,
    [zapisany_w_crkid]                   BIT            NOT NULL,
    [podtyp]                             NVARCHAR (4)   NULL,
    [data_wyslania]                      DATETIME2 (3)  NULL,
    [data_dostarczenia]                  DATETIME2 (3)  NULL,
    [nie_obslugiwac_przed_id_komunikatu] NUMERIC (19)   NULL,
    CONSTRAINT [istat_komunikat$PK_istat_komunikat] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_INTR2],
    CONSTRAINT [istat_komunikat$FK_istat_komunikat_self] FOREIGN KEY ([nadrzedny_id]) REFERENCES [intr2].[istat_komunikat] ([id])
) TEXTIMAGE_ON [FG_INTR2];


GO
ALTER TABLE [intr2].[istat_komunikat] NOCHECK CONSTRAINT [istat_komunikat$FK_istat_komunikat_self];

