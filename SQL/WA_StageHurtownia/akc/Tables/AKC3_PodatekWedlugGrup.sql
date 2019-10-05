CREATE TABLE [akc].[AKC3_PodatekWedlugGrup] (
    [IdDok]                            VARCHAR (30)    NOT NULL,
    [OgolemPodatekOdAlkoholuEtylowego] DECIMAL (19, 2) NULL,
    [OgolemPodatekOdWinaNapojFerment]  DECIMAL (19, 2) NULL,
    [OgolemPodatekOdPiwa]              DECIMAL (19, 2) NULL,
    [OgolemPodatekOdPaliwSilnik]       DECIMAL (19, 2) NULL,
    [OgolemPodatekOdSamochOsob]        DECIMAL (19, 2) NULL,
    [OgolemPodatekOdWyrobTyton]        DECIMAL (19, 2) NULL,
    [OgolemPodatekOdPozostalychWyrob]  DECIMAL (19, 2) NULL,
    [OgolemPodatekOdEnergiiElektr]     DECIMAL (19, 2) NULL,
    [OgolemPodatekOdPaliwOpal]         DECIMAL (19, 2) NULL,
    [OgolemPodatekOdGazu]              DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_AKC3_PodatekWedlugGrup] PRIMARY KEY CLUSTERED ([IdDok] ASC)
);

