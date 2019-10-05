CREATE TABLE [zef2DW].[BO_Pozycje] (
    [IdentyfikatorDokumentu]  BIGINT          NULL,
    [PozycjeRodzajNaleznosci] NVARCHAR (255)  NULL,
    [PozycjeKwota]            DECIMAL (19, 2) NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    [operacja]                NVARCHAR (1)    NULL
);

