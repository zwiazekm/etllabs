CREATE TABLE [zef2DW].[KZD_Pozycje] (
    [IdentyfikatorPozycji]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RodzajNaleznosci]       BIGINT          NULL,
    [TerminPlatnosci]        DATE            NULL,
    [PozycjeKwota]           DECIMAL (19, 4) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [KZD_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

