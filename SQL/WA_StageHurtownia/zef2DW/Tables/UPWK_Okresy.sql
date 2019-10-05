CREATE TABLE [zef2DW].[UPWK_Okresy] (
    [IdentyfikatorDokumentu]   BIGINT       NOT NULL,
    [Okres]                    NVARCHAR (7) NULL,
    [DataArch]                 DATE         NULL,
    [ID_Pismo_xml]             BIGINT       NULL,
    [operacja]                 NVARCHAR (1) NULL,
    [DataObowiazkuPodatkowego] DATE         NULL
);

