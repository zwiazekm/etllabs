CREATE TABLE [zef2DW].[DOPO_Pozycje] (
    [IdentyfikatorDokumentu]    BIGINT          NOT NULL,
    [PozycjeNumerDokumentu]     NVARCHAR (255)  NULL,
    [SaldoEwidencji]            DECIMAL (19, 2) NULL,
    [PozycjeKwotaDecyzji]       DECIMAL (19, 2) NULL,
    [PozycjeDataWplatyZaliczki] DATE            NULL,
    [PozycjeRodzajNaleznosci]   NVARCHAR (255)  NULL,
    [PozycjeTerminPlatnosci]    DATE            NULL,
    [DataArch]                  DATE            NULL,
    [ID_Pismo_xml]              BIGINT          NULL,
    [operacja]                  NVARCHAR (1)    NULL
);

