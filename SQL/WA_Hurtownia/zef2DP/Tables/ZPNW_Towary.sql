CREATE TABLE [zef2DP].[ZPNW_Towary] (
    [IdentyfikatorWpisu]                     BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]                 BIGINT          NULL,
    [NazwaGrupyWyrobow]                      NVARCHAR (4000) NULL,
    [NazwaWyrobu]                            NVARCHAR (4000) NULL,
    [KodCN]                                  NVARCHAR (255)  NULL,
    [PodstawObliczPodatkuIloscWyrobow]       DECIMAL (19, 4) NULL,
    [PodstawObliczPodatkuWartoscWyrobow]     DECIMAL (19, 4) NULL,
    [StawkaPodatkuProcent]                   DECIMAL (19, 4) NULL,
    [StawkaPodatkuKwota]                     DECIMAL (19, 4) NULL,
    [MinimalnaStawkaPodatkuOdWyrTytoniowych] DECIMAL (19, 4) NULL,
    [KwotaPodatku]                           DECIMAL (19, 2) NULL,
    [StawkaSpozaISZTAR]                      NVARCHAR (5)    NULL,
    [RodzajStawkiSpozaISZTAR]                NVARCHAR (16)   NULL,
    [WartoscStawkiSpozaISZTAR]               DECIMAL (19, 4) NULL,
    [DataArch]                               DATETIME2 (7)   NULL,
    [ID_Pismo_xml]                           BIGINT          NULL,
    CONSTRAINT [ZPNW_Towary_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DP]
);

