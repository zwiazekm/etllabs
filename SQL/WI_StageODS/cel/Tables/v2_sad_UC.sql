CREATE TABLE [cel].[v2_sad_UC] (
    [idDokNr]             BIGINT       NOT NULL,
    [UCZgloszenia]        VARCHAR (8)  NULL,
    [UCGraniczny]         VARCHAR (8)  NULL,
    [UCPrzeznaczenia]     VARCHAR (8)  NULL,
    [UCKontrolny]         VARCHAR (8)  NULL,
    [Lokalizacja_Miejsce] VARCHAR (17) NULL,
    [Lokalizacja_UC]      VARCHAR (8)  NULL,
    [Lokalizacja_Opis]    VARCHAR (35) NULL,
    [SkladCelny_Miejsce]  VARCHAR (14) NULL,
    [SkladCelny_Typ]      VARCHAR (1)  NULL,
    [SkladCelny_Kraj]     VARCHAR (2)  NULL,
    [UCK_Nazwa]           VARCHAR (35) NULL,
    [UCK_UlicaNumer]      VARCHAR (35) NULL,
    [UCK_KodPocztowy]     VARCHAR (9)  NULL,
    [UCK_Miejscowosc]     VARCHAR (35) NULL,
    [UCK_Kraj]            VARCHAR (2)  NULL,
    CONSTRAINT [PK_V2_SAD_UC] PRIMARY KEY CLUSTERED ([idDokNr] ASC) WITH (FILLFACTOR = 90)
);

