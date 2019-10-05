CREATE TABLE [zef2DP].[AKC4_ZalacznikL] (
    [IdentyfikatorZalacznika] NVARCHAR (255)  NOT NULL,
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [OznaczenieZalacznika]    NVARCHAR (32)   NULL,
    [NumerKolejnyZalacznika]  INT             NULL,
    [NIPLubPESELPodatnika]    NVARCHAR (18)   NULL,
    [DeklaracjaZaOkres]       NVARCHAR (7)    NULL,
    [RazemObliczonyPodatek]   DECIMAL (19, 2) NULL,
    [ZwolnieniaObnizenia]     DECIMAL (19, 2) NULL,
    [OgolemPodatek]           DECIMAL (19, 2) NULL,
    [RazemIloscGJ]            DECIMAL (19, 4) NULL,
    [RazemKwotaPodatku]       DECIMAL (19, 2) NULL,
    [id1]                     NVARCHAR (150)  NULL,
    CONSTRAINT [AKC4_ZalacznikL_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorZalacznika] ASC, [IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DP]
);

