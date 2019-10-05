CREATE TABLE [zef2DW].[POZA_Pozycje] (
    [IdentyfikatorDokumentu]     BIGINT          NOT NULL,
    [PozycjeKwota]               DECIMAL (19, 2) NULL,
    [PozycjeOdsetki]             DECIMAL (19, 2) NULL,
    [PozycjeOplataProlongacyjna] DECIMAL (19, 2) NULL,
    [PozycjeRodzajNaleznosci]    NVARCHAR (255)  NULL,
    [TerminPlatnosci]            DATE            NULL,
    [DataArch]                   DATE            NULL,
    [ID_Pismo_xml]               BIGINT          NULL,
    [operacja]                   NVARCHAR (1)    NULL
);

