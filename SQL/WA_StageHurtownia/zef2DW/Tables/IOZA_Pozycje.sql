CREATE TABLE [zef2DW].[IOZA_Pozycje] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RodzajNaleznosci]       BIGINT          NULL,
    [TerminPlatnosci]        DATE            NULL,
    [PozycjeKwota]           DECIMAL (19, 4) NULL,
    [PozycjeOdsetki]         DECIMAL (19, 4) NULL,
    [OplataProlongacyjna]    DECIMAL (19, 4) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

