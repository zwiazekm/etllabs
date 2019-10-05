CREATE TABLE [zef2DP].[AKC4_ZalacznikH] (
    [IdentyfikatorZalacznika]             NVARCHAR (255)  NOT NULL,
    [IdentyfikatorDokumentu]              BIGINT          NOT NULL,
    [OznaczenieZalacznika]                NVARCHAR (32)   NULL,
    [NumerKolejnyZalacznika]              INT             NULL,
    [NIPLubPESELPodatnika]                NVARCHAR (18)   NULL,
    [DeklaracjaZaOkres]                   NVARCHAR (7)    NULL,
    [RazemObliczonyPodatek]               DECIMAL (19, 2) NULL,
    [ZwolnieniaObnizenia]                 DECIMAL (19, 2) NULL,
    [KwotaZwolOdAkcArt30Ust1]             DECIMAL (19, 4) NULL,
    [KwotaZwolOdAkcArt30Ust6]             DECIMAL (19, 4) NULL,
    [KwotaZwolOdAkcArt30Ust7]             DECIMAL (19, 4) NULL,
    [OgolemPodatek]                       DECIMAL (19, 2) NULL,
    [EksportIloscEnergiiElektrycznejWMWh] DECIMAL (19, 4) NULL,
    [EksportStawkaPodatku]                DECIMAL (19, 4) NULL,
    [EksportKwotaPodatku]                 DECIMAL (19, 4) NULL,
    [RazemIloscEnergiiElektrycznejWMWh]   DECIMAL (19, 4) NULL,
    [RazemKwotaPodatku]                   DECIMAL (19, 2) NULL,
    [id1]                                 NVARCHAR (150)  NULL,
    [KwotaZwolOdAkcArt30Ust7a]            DECIMAL (19, 4) NULL,
    CONSTRAINT [AKC4_ZalacznikH_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorZalacznika] ASC, [IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DP]
);

