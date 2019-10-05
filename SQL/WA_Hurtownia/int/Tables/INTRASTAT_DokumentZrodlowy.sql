CREATE TABLE [int].[INTRASTAT_DokumentZrodlowy] (
    [IdDok]              VARCHAR (30) NOT NULL,
    [Symbol]             VARCHAR (40) NULL,
    [Rodzaj]             VARCHAR (4)  NULL,
    [RodzajPid]          INT          NULL,
    [SposobWprowadzania] CHAR (1)     NULL,
    [DataWprowadzenia]   DATETIME     NULL,
    [Uzytkownik]         VARCHAR (40) NULL,
    [IdDeklWynikowej]    VARCHAR (30) NULL,
    [IdJednostki]        VARCHAR (20) NULL,
    [REGON]              VARCHAR (14) NULL,
    CONSTRAINT [PK_INTRASTAT_DokumentZrodlowy] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_INT],
    CONSTRAINT [FK_INTRASTAT_DokumentZrodlowy_RodzajPid] FOREIGN KEY ([RodzajPid]) REFERENCES [pdr].[s061] ([s061_id])
);

