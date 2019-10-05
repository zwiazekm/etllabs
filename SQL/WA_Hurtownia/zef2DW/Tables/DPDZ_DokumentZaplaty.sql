CREATE TABLE [zef2DW].[DPDZ_DokumentZaplaty] (
    [IdentyfikatorWpisu]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [DataWykonaniaPrzelewu]  DATE            NULL,
    [KwotaPrzelewu]          DECIMAL (19, 2) NULL,
    [FormaPlatnosci]         NVARCHAR (255)  NULL,
    [NumerDokumentuZaplaty]  NVARCHAR (255)  NULL,
    [DataDokumentuZaplaty]   DATE            NULL,
    [DokumentZaplatyKwota]   DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [DPDZ_DokumentZaplaty_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

