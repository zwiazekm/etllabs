CREATE TABLE [zef2DW].[DOOD_Pozycje] (
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [PozycjeDataZaliczki]     DATE            NULL,
    [PozycjeRodzajNaleznosci] NVARCHAR (255)  NULL,
    [PozycjeKwotaZaliczki]    DECIMAL (19, 2) NULL,
    [PozycjeTerminPlatnosci]  DATE            NULL,
    [PozycjeKwotaOdsetek]     DECIMAL (19, 2) NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    [operacja]                NVARCHAR (1)    NULL
);

