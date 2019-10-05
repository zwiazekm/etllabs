CREATE TABLE [zef2DW].[OZWW_Pozycje] (
    [IdentyfikatorDokumentu]     BIGINT          NOT NULL,
    [PozycjeRodzajNaleznosciKod] NVARCHAR (8)    NULL,
    [Saldo]                      DECIMAL (19, 2) NULL,
    [PozycjeKwotaWstrzymana]     DECIMAL (19, 2) NULL,
    [PozycjeTerminPlatnosci]     DATE            NULL,
    [DataArch]                   DATE            NULL,
    [ID_Pismo_xml]               BIGINT          NULL,
    [operacja]                   NVARCHAR (1)    NULL
);

