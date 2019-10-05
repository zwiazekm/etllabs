CREATE TABLE [zef2DW].[USAD_Pozycje] (
    [IdentyfikatorPozycji]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]        BIGINT          NOT NULL,
    [RodzajNaleznosci]              NVARCHAR (32)   NULL,
    [KwotaNaleznosci]               DECIMAL (19, 2) NULL,
    [MetodaPlatnosci]               INT             NULL,
    [CzyZwolnienieZZaplaty]         NVARCHAR (5)    NULL,
    [CzyOdroczenieTerminuPlatnosci] NVARCHAR (5)    NULL,
    [DataArch]                      DATE            NULL,
    [ID_Pismo_xml]                  BIGINT          NULL,
    CONSTRAINT [USAD_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

