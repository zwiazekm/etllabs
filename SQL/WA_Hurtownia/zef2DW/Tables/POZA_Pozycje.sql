CREATE TABLE [zef2DW].[POZA_Pozycje] (
    [IdentyfikatorPozycji]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]     BIGINT          NOT NULL,
    [PozycjeKwota]               DECIMAL (19, 2) NULL,
    [PozycjeOdsetki]             DECIMAL (19, 2) NULL,
    [PozycjeOplataProlongacyjna] DECIMAL (19, 2) NULL,
    [PozycjeRodzajNaleznosci]    NVARCHAR (255)  NULL,
    [TerminPlatnosci]            DATE            NULL,
    [DataArch]                   DATE            NULL,
    [ID_Pismo_xml]               BIGINT          NULL,
    CONSTRAINT [POZA_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

