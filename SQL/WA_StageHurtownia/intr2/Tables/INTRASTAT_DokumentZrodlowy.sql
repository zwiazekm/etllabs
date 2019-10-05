CREATE TABLE [intr2].[INTRASTAT_DokumentZrodlowy] (
    [IdDok]                     NVARCHAR (30) NOT NULL,
    [Symbol]                    NVARCHAR (40) NULL,
    [Rodzaj]                    NVARCHAR (4)  NULL,
    [RodzajPid]                 NVARCHAR (4)  NULL,
    [SposobWprowadzania]        NCHAR (1)     NULL,
    [DataWprowadzenia]          DATETIME2 (3) NULL,
    [IdDeklWynikowej]           NVARCHAR (30) NULL,
    [REGON]                     NVARCHAR (14) NULL,
    [NIP]                       NVARCHAR (10) NULL,
    [Status]                    NCHAR (1)     NULL,
    [Wersja]                    NVARCHAR (3)  NULL,
    [IdOsoby]                   NVARCHAR (50) NULL,
    [IdPodmiotu]                NVARCHAR (50) NULL,
    [IdPodmiotuPosredniczacego] NVARCHAR (50) NULL,
    [NumerWlasny]               NVARCHAR (14) NULL,
    CONSTRAINT [INTRASTAT_DokumentZrodlowy$PK_INTRASTAT_DokumentZrodlowy] PRIMARY KEY CLUSTERED ([IdDok] ASC)
);

