CREATE TABLE [zef2DW].[DKOR_DokumentZaplaty] (
    [IdentyfikatorWpisu]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [FormaPlatnosci]         NVARCHAR (255)  NULL,
    [NumerDokumentuZaplaty]  NVARCHAR (255)  NULL,
    [DataDokumentuZaplaty]   DATE            NULL,
    [Kwota]                  DECIMAL (19, 2) NULL,
    [Usunieto]               NVARCHAR (5)    NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [DKOR_DokumentZaplaty_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

