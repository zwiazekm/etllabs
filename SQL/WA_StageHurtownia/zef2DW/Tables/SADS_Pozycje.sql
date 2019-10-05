CREATE TABLE [zef2DW].[SADS_Pozycje] (
    [IdentyfikatorDokumentu]        BIGINT          NOT NULL,
    [MetodaPlatnosci]               INT             NULL,
    [RodzajNaleznosci]              BIGINT          NULL,
    [KwotaNaleznosci]               DECIMAL (19, 2) NULL,
    [CzyZwolnienieZZaplaty]         NVARCHAR (5)    NULL,
    [CzyOdroczenieTerminuPlatnosci] NVARCHAR (5)    NULL,
    [DataArch]                      DATE            NULL,
    [ID_Pismo_xml]                  BIGINT          NULL,
    [operacja]                      NVARCHAR (1)    NULL
);

