CREATE TABLE [zef2DP].[AKC4_ZalacznikI_Towary] (
    [IdentyfikatorZalacznika]  NVARCHAR (255)  NOT NULL,
    [NazwaGrupyWyrobow]        NVARCHAR (4000) NULL,
    [Ubytki]                   NVARCHAR (16)   NULL,
    [KodCN]                    NVARCHAR (255)  NULL,
    [IloscWyrobowWTysLitrow]   DECIMAL (19, 4) NULL,
    [IloscWyrobowWTysKg]       DECIMAL (19, 4) NULL,
    [WartoscOpalowaWGJ]        DECIMAL (19, 4) NULL,
    [StawkaPodatku]            DECIMAL (19, 4) NULL,
    [KwotaPodatku]             DECIMAL (19, 2) NULL,
    [StawkaSpozaISZTAR]        NVARCHAR (5)    NULL,
    [WartoscStawkiSpozaISZTAR] DECIMAL (19, 4) NULL,
    [id1]                      NVARCHAR (150)  NULL,
    [operacja]                 NVARCHAR (1)    NULL
);

