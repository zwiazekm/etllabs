CREATE TABLE [zef2DW].[USAD_DokumentZaplaty] (
    [IdentyfikatorWpisu]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [FormaPlatnosci]          NVARCHAR (255)  NULL,
    [NumerDokumentuZaplaty]   NVARCHAR (255)  NULL,
    [DokumentZaplatyData]     DATE            NULL,
    [DokumentZaplatyKwota]    DECIMAL (19, 2) NULL,
    [DokumentZaplatyUsuniety] NVARCHAR (5)    NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    CONSTRAINT [USAD_DokumentZaplaty_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

