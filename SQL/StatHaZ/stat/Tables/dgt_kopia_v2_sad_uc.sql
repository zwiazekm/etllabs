CREATE TABLE [stat].[dgt_kopia_v2_sad_uc] (
    [idDokNr]             BIGINT       NOT NULL,
    [UCZgloszenia]        VARCHAR (8)  NULL,
    [UCGraniczny]         VARCHAR (8)  NULL,
    [UCPrzeznaczenia]     VARCHAR (8)  NULL,
    [UCKontrolny]         VARCHAR (8)  NULL,
    [Lokalizacja_Miejsce] VARCHAR (17) NULL,
    [Lokalizacja_UC]      VARCHAR (8)  NULL,
    [Lokalizacja_Opis]    VARCHAR (35) NULL,
    [SkladCelny_Miejsce]  VARCHAR (14) NULL,
    [SkladCelny_Typ]      CHAR (1)     NULL,
    [SkladCelny_Kraj]     VARCHAR (2)  NULL,
    [UCK_Nazwa]           VARCHAR (35) NULL,
    [UCK_UlicaNumer]      VARCHAR (35) NULL,
    [UCK_KodPocztowy]     VARCHAR (9)  NULL,
    [UCK_Miejscowosc]     VARCHAR (35) NULL,
    [UCK_Kraj]            VARCHAR (2)  NULL,
    [generacjaId]         INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_v2_sad_uc] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [Lokalizacja_Miejsce]
    ON [stat].[dgt_kopia_v2_sad_uc]([Lokalizacja_Miejsce]);


GO
CREATE STATISTICS [Lokalizacja_Opis]
    ON [stat].[dgt_kopia_v2_sad_uc]([Lokalizacja_Opis]);


GO
CREATE STATISTICS [Lokalizacja_UC]
    ON [stat].[dgt_kopia_v2_sad_uc]([Lokalizacja_UC]);


GO
CREATE STATISTICS [SkladCelny_Kraj]
    ON [stat].[dgt_kopia_v2_sad_uc]([SkladCelny_Kraj]);


GO
CREATE STATISTICS [SkladCelny_Miejsce]
    ON [stat].[dgt_kopia_v2_sad_uc]([SkladCelny_Miejsce]);


GO
CREATE STATISTICS [SkladCelny_Typ]
    ON [stat].[dgt_kopia_v2_sad_uc]([SkladCelny_Typ]);


GO
CREATE STATISTICS [UCGraniczny]
    ON [stat].[dgt_kopia_v2_sad_uc]([UCGraniczny]);


GO
CREATE STATISTICS [UCK_KodPocztowy]
    ON [stat].[dgt_kopia_v2_sad_uc]([UCK_KodPocztowy]);


GO
CREATE STATISTICS [UCK_Kraj]
    ON [stat].[dgt_kopia_v2_sad_uc]([UCK_Kraj]);


GO
CREATE STATISTICS [UCK_Miejscowosc]
    ON [stat].[dgt_kopia_v2_sad_uc]([UCK_Miejscowosc]);


GO
CREATE STATISTICS [UCK_Nazwa]
    ON [stat].[dgt_kopia_v2_sad_uc]([UCK_Nazwa]);


GO
CREATE STATISTICS [UCK_UlicaNumer]
    ON [stat].[dgt_kopia_v2_sad_uc]([UCK_UlicaNumer]);


GO
CREATE STATISTICS [UCKontrolny]
    ON [stat].[dgt_kopia_v2_sad_uc]([UCKontrolny]);


GO
CREATE STATISTICS [UCPrzeznaczenia]
    ON [stat].[dgt_kopia_v2_sad_uc]([UCPrzeznaczenia]);

