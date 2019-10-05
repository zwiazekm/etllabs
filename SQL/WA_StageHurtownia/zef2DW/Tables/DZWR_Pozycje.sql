CREATE TABLE [zef2DW].[DZWR_Pozycje] (
    [IdentyfikatorDokumentu]         BIGINT          NOT NULL,
    [PozycjeKwotaNaleznosci]         DECIMAL (19, 2) NULL,
    [PozycjeKwotaWplat]              DECIMAL (19, 2) NULL,
    [PozycjeKwotaZwrotu]             DECIMAL (19, 2) NULL,
    [PozycjeRodzajNaleznosci]        NVARCHAR (255)  NULL,
    [PozycjePierwotnyNumerDokumentu] NVARCHAR (255)  NULL,
    [DataArch]                       DATE            NULL,
    [ID_Pismo_xml]                   BIGINT          NULL,
    [operacja]                       NVARCHAR (1)    NULL
);

