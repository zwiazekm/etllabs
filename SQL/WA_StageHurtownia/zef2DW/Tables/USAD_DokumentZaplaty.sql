CREATE TABLE [zef2DW].[USAD_DokumentZaplaty] (
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [FormaPlatnosci]          NVARCHAR (255)  NULL,
    [NumerDokumentuZaplaty]   NVARCHAR (255)  NULL,
    [DokumentZaplatyData]     DATE            NULL,
    [DokumentZaplatyKwota]    DECIMAL (19, 2) NULL,
    [DokumentZaplatyUsuniety] NVARCHAR (5)    NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    [operacja]                NVARCHAR (1)    NULL,
    CONSTRAINT [USAD_DokumentZaplaty_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

