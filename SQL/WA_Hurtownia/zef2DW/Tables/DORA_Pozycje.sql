CREATE TABLE [zef2DW].[DORA_Pozycje] (
    [IdentyfikatorPozycji]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]     BIGINT          NOT NULL,
    [PozycjeNumerDokumentu]      NVARCHAR (255)  NULL,
    [PozycjeRodzajNaleznosci]    NVARCHAR (255)  NULL,
    [PozycjeDataZaliczki]        DATE            NULL,
    [PozycjeKwotaNaleznosci]     DECIMAL (19, 2) NULL,
    [PozycjeKwotaRozkladana]     DECIMAL (19, 2) NULL,
    [PozycjeTerminPlatnosci]     DATE            NULL,
    [PozycjeTerminPierwszejRaty] DATE            NULL,
    [DataArch]                   DATE            NULL,
    [ID_Pismo_xml]               BIGINT          NULL,
    CONSTRAINT [DORA_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

