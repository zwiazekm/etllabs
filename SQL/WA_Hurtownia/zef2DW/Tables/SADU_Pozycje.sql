CREATE TABLE [zef2DW].[SADU_Pozycje] (
    [IdentyfikatorPozycji]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]        BIGINT          NOT NULL,
    [CzyZwolnienieZZaplaty]         NVARCHAR (5)    NULL,
    [CzyOdroczenieTerminuPlatnosci] NVARCHAR (5)    NULL,
    [RodzajNaleznosci]              BIGINT          NULL,
    [KwotaNaleznosci]               DECIMAL (19, 2) NULL,
    [MetodaPlatnosci]               INT             NULL,
    [DataArch]                      DATE            NULL,
    [ID_Pismo_xml]                  BIGINT          NULL,
    CONSTRAINT [SADU_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

