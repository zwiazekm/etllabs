CREATE TABLE [zef2DW].[USAD_Pozycje] (
    [IdentyfikatorDokumentu]        BIGINT          NOT NULL,
    [RodzajNaleznosci]              NVARCHAR (32)   NULL,
    [KwotaNaleznosci]               DECIMAL (19, 2) NULL,
    [MetodaPlatnosci]               INT             NULL,
    [CzyZwolnienieZZaplaty]         NVARCHAR (5)    NULL,
    [CzyOdroczenieTerminuPlatnosci] NVARCHAR (5)    NULL,
    [DataArch]                      DATE            NULL,
    [ID_Pismo_xml]                  BIGINT          NULL,
    [operacja]                      NVARCHAR (1)    NULL,
    CONSTRAINT [USAD_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

