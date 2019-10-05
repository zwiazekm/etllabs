CREATE TABLE [zef2DW].[SADS_DokumentZaplaty] (
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [FormaPlatnosci]          NVARCHAR (255)  NULL,
    [DokumentZaplatyData]     DATE            NULL,
    [NumerDokumentuZaplaty]   NVARCHAR (255)  NULL,
    [DokumentZaplatyKwota]    DECIMAL (19, 2) NULL,
    [DokumentZaplatyUsuniety] NVARCHAR (5)    NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    [operacja]                NVARCHAR (1)    NULL
);

