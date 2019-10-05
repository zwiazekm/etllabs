CREATE TABLE [zef2DW].[DOOP_Pozycje] (
    [IdentyfikatorDokumentu]           BIGINT          NOT NULL,
    [PozycjeNumerDokumentu]            NVARCHAR (255)  NULL,
    [PozycjeRodzajNaleznosci]          NVARCHAR (255)  NULL,
    [PozycjeNumerRaty]                 INT             NULL,
    [PozycjeDataZaliczki]              DATE            NULL,
    [PozycjeKwotaOdroczona]            DECIMAL (19, 2) NULL,
    [PozycjeOdsetki]                   DECIMAL (19, 2) NULL,
    [PozycjeOplataProlongacyjna]       DECIMAL (19, 2) NULL,
    [PozycjeTerminPlatnosciOdroczonej] DATE            NULL,
    [PozycjeTerminPlatnosci]           DATE            NULL,
    [DataArch]                         DATE            NULL,
    [ID_Pismo_xml]                     BIGINT          NULL,
    [operacja]                         NVARCHAR (1)    NULL
);

