CREATE TABLE [zef2DW].[SADU_Pozycje] (
    [IdentyfikatorDokumentu]        BIGINT          NOT NULL,
    [CzyZwolnienieZZaplaty]         NVARCHAR (5)    NULL,
    [CzyOdroczenieTerminuPlatnosci] NVARCHAR (5)    NULL,
    [RodzajNaleznosci]              BIGINT          NULL,
    [KwotaNaleznosci]               DECIMAL (19, 2) NULL,
    [MetodaPlatnosci]               INT             NULL,
    [DataArch]                      DATE            NULL,
    [ID_Pismo_xml]                  BIGINT          NULL,
    [operacja]                      NVARCHAR (1)    NULL
);

