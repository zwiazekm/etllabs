CREATE TABLE [zef2DW].[DPDZ_DokumentZaplaty] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [DataWykonaniaPrzelewu]  DATE            NULL,
    [KwotaPrzelewu]          DECIMAL (19, 2) NULL,
    [FormaPlatnosci]         NVARCHAR (255)  NULL,
    [NumerDokumentuZaplaty]  NVARCHAR (255)  NULL,
    [DataDokumentuZaplaty]   DATE            NULL,
    [DokumentZaplatyKwota]   DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

