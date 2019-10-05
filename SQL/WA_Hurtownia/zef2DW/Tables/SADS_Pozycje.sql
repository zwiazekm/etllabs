CREATE TABLE [zef2DW].[SADS_Pozycje] (
    [IdentyfikatorPozycji]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]        BIGINT          NOT NULL,
    [MetodaPlatnosci]               INT             NULL,
    [RodzajNaleznosci]              BIGINT          NULL,
    [KwotaNaleznosci]               DECIMAL (19, 2) NULL,
    [CzyZwolnienieZZaplaty]         NVARCHAR (5)    NULL,
    [CzyOdroczenieTerminuPlatnosci] NVARCHAR (5)    NULL,
    [DataArch]                      DATE            NULL,
    [ID_Pismo_xml]                  BIGINT          NULL,
    CONSTRAINT [SADS_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

