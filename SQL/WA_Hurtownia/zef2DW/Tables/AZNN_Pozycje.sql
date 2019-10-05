CREATE TABLE [zef2DW].[AZNN_Pozycje] (
    [IdentyfikatorPozycji]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]        BIGINT          NOT NULL,
    [ZaleglosciRodzajDokumentu]     NVARCHAR (255)  NULL,
    [ZaleglosciNumerDokumentu]      NVARCHAR (255)  NULL,
    [ZaleglosciRodzajNaleznosci]    NVARCHAR (255)  NULL,
    [ZaleglosciTerminPlatnosci]     DATE            NULL,
    [ZaleglosciKwotaNadplaty]       DECIMAL (19, 2) NULL,
    [ZaleglosciOdsetki]             DECIMAL (19, 2) NULL,
    [ZaleglosciOplataProlongacyjna] DECIMAL (19, 2) NULL,
    [DataArch]                      DATE            NULL,
    [ID_Pismo_xml]                  BIGINT          NULL,
    CONSTRAINT [AZNN_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

