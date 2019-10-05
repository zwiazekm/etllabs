CREATE TABLE [wald].[tbl_sprawdzenie_powiazan] (
    [wartosc_star]     NVARCHAR (255) NULL,
    [niedozw_wart_pow] NVARCHAR (255) NULL,
    [deklaracja_INTR]  VARCHAR (50)   NULL,
    [pozycja_INTR]     NVARCHAR (255) NULL,
    [dokument_SAD]     NVARCHAR (255) NULL,
    [pozycja_SAD]      NVARCHAR (255) NULL,
    [rodzaj_bledu]     NVARCHAR (255) NULL,
    [stat]             CHAR (1)       NULL,
    [pk]               BIGINT         IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_tbl_sprawdzenie_powiazan] PRIMARY KEY CLUSTERED ([pk] ASC) ON [WaldDane]
);

