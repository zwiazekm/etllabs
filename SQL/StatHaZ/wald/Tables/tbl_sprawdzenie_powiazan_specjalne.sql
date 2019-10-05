CREATE TABLE [wald].[tbl_sprawdzenie_powiazan_specjalne] (
    [wartosc_star]     NVARCHAR (255) NULL,
    [niedozw_wart_pow] NVARCHAR (255) NULL,
    [deklaracja_INTR]  NVARCHAR (255) NULL,
    [pozycja_INTR]     NVARCHAR (255) NULL,
    [dokument_SAD]     BIGINT         NULL,
    [pozycja_SAD]      BIGINT         NULL,
    [rodzaj_bledu]     NVARCHAR (255) NULL,
    [stat]             NVARCHAR (50)  NULL,
    [pk]               BIGINT         IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_tbl_sprawdzenie_powiazan_specjalne] PRIMARY KEY CLUSTERED ([pk] ASC) ON [WaldDane]
);

