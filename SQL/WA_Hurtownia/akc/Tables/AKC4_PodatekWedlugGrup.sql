CREATE TABLE [akc].[AKC4_PodatekWedlugGrup] (
    [IdDok]                            VARCHAR (30)    NOT NULL,
    [OgolemPodatekOdAlkoholuEtylowego] DECIMAL (19, 2) NULL,
    [OgolemPodatekOdWinaNapojFerment]  DECIMAL (19, 2) NULL,
    [OgolemPodatekOdPiwa]              DECIMAL (19, 2) NULL,
    [OgolemPodatekOdPaliwSilnik]       DECIMAL (19, 2) NULL,
    [OgolemPodatekOdSamochOsob]        DECIMAL (19, 2) NULL,
    [OgolemPodatekOdWyrobTyton]        DECIMAL (19, 2) NULL,
    [OgolemPodatekOdEnergiiElektr]     DECIMAL (19, 2) NULL,
    [OgolemPodatekOdPaliwOpal]         DECIMAL (19, 2) NULL,
    [OgolemPodatekOdGazu]              DECIMAL (19, 2) NULL,
    [OgolemPodatekOdOlejSmar]          DECIMAL (19, 2) NULL,
    [OgolemPodatekOdWyrobGazow]        DECIMAL (19, 2) NULL,
    CONSTRAINT [PK_AKC4_PodatekWedlugGrup] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_AKC],
    CONSTRAINT [FK_AKC4_PodatekWedlugGrup_IdDok_AKC4_Deklaracja_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [akc].[AKC4_Deklaracja] ([IdDok])
);

