CREATE TABLE [zef2DW].[DWNN_DokumentZaplaty] (
    [IdentyfikatorWpisu]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [FormaPlatnosci]          NVARCHAR (255)  NULL,
    [NumerDokumentuZaplaty]   NVARCHAR (255)  NULL,
    [DataDokumentuZaplaty]    DATE            NULL,
    [DokumentZaplatyKwota]    DECIMAL (19, 2) NULL,
    [DokumentZaplatyUsuniety] NVARCHAR (5)    NULL,
    [MigracjaReczna]          NVARCHAR (5)    NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    CONSTRAINT [DWNN_DokumentZaplaty_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

