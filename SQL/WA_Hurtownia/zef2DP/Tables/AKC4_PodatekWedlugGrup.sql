CREATE TABLE [zef2DP].[AKC4_PodatekWedlugGrup] (
    [IdentyfikatorWpisu]               BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]           BIGINT          NULL,
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
    [DataArch]                         DATETIME2 (7)   NULL,
    [ID_Pismo_xml]                     BIGINT          NULL,
    CONSTRAINT [AKC4_PodatekWedlugGrup_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DP]
);

