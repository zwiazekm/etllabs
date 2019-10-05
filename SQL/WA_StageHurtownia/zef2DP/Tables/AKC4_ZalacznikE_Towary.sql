CREATE TABLE [zef2DP].[AKC4_ZalacznikE_Towary] (
    [IdentyfikatorZalacznika]       NVARCHAR (255)  NULL,
    [NazwaGrupyWyrobow]             NVARCHAR (4000) NULL,
    [KodCN]                         NVARCHAR (255)  NULL,
    [LiczbaSamochObjetychPodatkiem] DECIMAL (19, 4) NULL,
    [PodstawaOpodatkowania]         DECIMAL (19, 2) NULL,
    [StawkaPodatku]                 DECIMAL (19, 4) NULL,
    [KwotaPodatku]                  DECIMAL (19, 2) NULL,
    [StawkaSpozaISZTAR]             NVARCHAR (5)    NULL,
    [WartoscStawkiSpozaISZTAR]      DECIMAL (19, 4) NULL,
    [id1]                           NVARCHAR (150)  NULL,
    [operacja]                      NVARCHAR (1)    NULL
);

