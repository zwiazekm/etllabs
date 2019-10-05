CREATE TABLE [zef2DW].[DOPR_Pozycje] (
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [PozycjeRodzajNaleznosci] NVARCHAR (4000) NULL,
    [PozycjeKwota]            DECIMAL (19, 2) NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    [operacja]                NVARCHAR (1)    NULL
);

