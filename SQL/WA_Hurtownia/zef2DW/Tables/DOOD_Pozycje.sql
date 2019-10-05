CREATE TABLE [zef2DW].[DOOD_Pozycje] (
    [IdentyfikatorPozycji]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [PozycjeDataZaliczki]     DATE            NULL,
    [PozycjeRodzajNaleznosci] NVARCHAR (255)  NULL,
    [PozycjeKwotaZaliczki]    DECIMAL (19, 2) NULL,
    [PozycjeTerminPlatnosci]  DATE            NULL,
    [PozycjeKwotaOdsetek]     DECIMAL (19, 2) NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    CONSTRAINT [DOOD_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

