CREATE TABLE [zef2DW].[DOOP_Pozycje] (
    [IdentyfikatorPozycji]             BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]           BIGINT          NOT NULL,
    [PozycjeNumerDokumentu]            NVARCHAR (255)  NULL,
    [PozycjeRodzajNaleznosci]          NVARCHAR (255)  NULL,
    [PozycjeNumerRaty]                 INT             NULL,
    [PozycjeDataZaliczki]              DATE            NULL,
    [PozycjeKwotaOdroczona]            DECIMAL (19, 2) NULL,
    [PozycjeOdsetki]                   DECIMAL (19, 2) NULL,
    [PozycjeOplataProlongacyjna]       DECIMAL (19, 2) NULL,
    [PozycjeTerminPlatnosci]           DATE            NULL,
    [PozycjeTerminPlatnosciOdroczonej] DATE            NULL,
    [DataArch]                         DATE            NULL,
    [ID_Pismo_xml]                     BIGINT          NULL,
    CONSTRAINT [DOOP_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

