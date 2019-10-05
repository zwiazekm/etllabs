CREATE TABLE [zef2DW].[DVIM_Pozycje] (
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [PozycjeRodzajNaleznosci] NVARCHAR (255)  NULL,
    [PozycjeKwotaDoZaplaty]   DECIMAL (19, 2) NULL,
    [PozycjeVATIm]            DECIMAL (19, 2) NULL,
    [PozycjeVAT7]             DECIMAL (19, 2) NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    [operacja]                NVARCHAR (1)    NULL
);

