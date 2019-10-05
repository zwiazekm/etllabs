CREATE TABLE [zef2DW].[DWNN_DokumentZaplaty] (
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [FormaPlatnosci]          NVARCHAR (255)  NULL,
    [NumerDokumentuZaplaty]   NVARCHAR (255)  NULL,
    [DataDokumentuZaplaty]    DATE            NULL,
    [DokumentZaplatyKwota]    DECIMAL (19, 2) NULL,
    [DokumentZaplatyUsuniety] NVARCHAR (5)    NULL,
    [MigracjaReczna]          NVARCHAR (5)    NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    [operacja]                NVARCHAR (1)    NULL
);

