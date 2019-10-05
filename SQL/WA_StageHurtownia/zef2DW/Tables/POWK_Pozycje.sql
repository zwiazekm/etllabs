CREATE TABLE [zef2DW].[POWK_Pozycje] (
    [IdentyfikatorDokumentu]            BIGINT         NOT NULL,
    [PozycjeRodzajNaleznosciKod]        NVARCHAR (8)   NULL,
    [PozycjeNumerDokumentu]             NVARCHAR (255) NULL,
    [RwOkres]                           NVARCHAR (25)  NULL,
    [DataPowstaniaObowiazkuPodatkowego] DATE           NULL,
    [DataArch]                          DATE           NULL,
    [ID_Pismo_xml]                      BIGINT         NULL,
    [operacja]                          NVARCHAR (1)   NULL
);

