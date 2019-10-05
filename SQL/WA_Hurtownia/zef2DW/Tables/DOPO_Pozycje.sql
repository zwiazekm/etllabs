CREATE TABLE [zef2DW].[DOPO_Pozycje] (
    [IdentyfikatorPozycji]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]    BIGINT          NOT NULL,
    [PozycjeNumerDokumentu]     NVARCHAR (255)  NULL,
    [SaldoEwidencji]            DECIMAL (19, 2) NULL,
    [PozycjeKwotaDecyzji]       DECIMAL (19, 2) NULL,
    [PozycjeDataWplatyZaliczki] DATE            NULL,
    [PozycjeRodzajNaleznosci]   NVARCHAR (255)  NULL,
    [PozycjeTerminPlatnosci]    DATE            NULL,
    [DataArch]                  DATE            NULL,
    [ID_Pismo_xml]              BIGINT          NULL,
    CONSTRAINT [DOPO_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

