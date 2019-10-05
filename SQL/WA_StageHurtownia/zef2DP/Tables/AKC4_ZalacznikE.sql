CREATE TABLE [zef2DP].[AKC4_ZalacznikE] (
    [IdentyfikatorZalacznika]              NVARCHAR (255)  NOT NULL,
    [IdentyfikatorDokumentu]               BIGINT          NOT NULL,
    [OznaczenieZalacznika]                 NVARCHAR (32)   NULL,
    [NumerKolejnyZalacznika]               INT             NULL,
    [NIPLubPESELPodatnika]                 NVARCHAR (18)   NULL,
    [DeklaracjaZaOkres]                    NVARCHAR (7)    NULL,
    [RazemObliczonyPodatek]                DECIMAL (19, 2) NULL,
    [EksportLiczbaSamochObjetychPodatkiem] DECIMAL (19, 4) NULL,
    [EksportPodstawaOpodatkowania]         DECIMAL (19, 2) NULL,
    [EksportStawkaPodatku]                 DECIMAL (19, 4) NULL,
    [EksportKwotaPodatku]                  DECIMAL (19, 4) NULL,
    [RazemLiczbaSamochObjetychPodatkiem]   DECIMAL (19, 4) NULL,
    [RazemKwotaPodatku]                    DECIMAL (19, 2) NULL,
    [id1]                                  NVARCHAR (150)  NULL,
    [operacja]                             NVARCHAR (1)    NULL,
    CONSTRAINT [AKC4_ZalacznikE_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorZalacznika] ASC, [IdentyfikatorDokumentu] ASC)
);

