CREATE TABLE [zef2DW].[POWK_Pozycje] (
    [IdentyfikatorPozycji]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]            BIGINT         NOT NULL,
    [PozycjeRodzajNaleznosciKod]        NVARCHAR (8)   NULL,
    [PozycjeNumerDokumentu]             NVARCHAR (255) NULL,
    [RwOkres]                           NVARCHAR (25)  NULL,
    [DataPowstaniaObowiazkuPodatkowego] DATE           NULL,
    [DataArch]                          DATE           NULL,
    [ID_Pismo_xml]                      BIGINT         NULL,
    CONSTRAINT [POWK_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

