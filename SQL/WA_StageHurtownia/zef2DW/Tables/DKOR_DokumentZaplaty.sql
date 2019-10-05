CREATE TABLE [zef2DW].[DKOR_DokumentZaplaty] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [FormaPlatnosci]         NVARCHAR (255)  NULL,
    [NumerDokumentuZaplaty]  NVARCHAR (255)  NULL,
    [DataDokumentuZaplaty]   DATE            NULL,
    [Kwota]                  DECIMAL (19, 2) NULL,
    [Usunieto]               NVARCHAR (5)    NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

