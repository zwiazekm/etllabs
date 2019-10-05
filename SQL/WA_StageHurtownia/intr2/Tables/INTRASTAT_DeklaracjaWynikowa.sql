CREATE TABLE [intr2].[INTRASTAT_DeklaracjaWynikowa] (
    [IdDeklWynikowej] NVARCHAR (30) NOT NULL,
    [Status]          NCHAR (1)     NULL,
    [Typ]             NCHAR (1)     NULL,
    [TypPid]          NCHAR (1)     NULL,
    [Rok]             INT           NULL,
    [Miesiac]         INT           NULL,
    [Numer]           SMALLINT      NULL,
    [NIP]             NVARCHAR (10) NULL,
    [REGON]           NVARCHAR (14) NULL,
    [Wersja]          NVARCHAR (3)  NULL,
    [Symbol]          NVARCHAR (40) NULL,
    [IdSprawy]        NVARCHAR (50) NULL,
    [DataUtworzenia]  DATETIME2 (3) NULL,
    CONSTRAINT [INTRASTAT_DeklaracjaWynikowa$PK_INTRASTAT_DeklaracjaWynikowa] PRIMARY KEY CLUSTERED ([IdDeklWynikowej] ASC)
);

