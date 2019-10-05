CREATE TABLE [zef2DW].[HIPN_Dokument] (
    [IdentyfikatorDokumentu]   BIGINT          NOT NULL,
    [NumerDokumentuWpisu]      NVARCHAR (255)  NULL,
    [KwotaZabezpieczenia]      DECIMAL (19, 2) NULL,
    [NumerDokumentu]           NVARCHAR (255)  NULL,
    [DataWystawienia]          DATE            NULL,
    [KwotaZabezpieczeniaRazem] DECIMAL (19, 2) NULL,
    [SaldoZabezpRazem]         DECIMAL (19, 2) NULL,
    [AdnotacjeIUwagi]          NVARCHAR (512)  NULL,
    [HipotekaZastaw]           NVARCHAR (15)   NULL,
    [MigracjaReczna]           NVARCHAR (5)    NULL,
    [WpisWycofanie]            NVARCHAR (9)    NULL,
    [DataArch]                 DATE            NULL,
    [ID_Pismo_xml]             BIGINT          NULL,
    [IdentyfikatorPodatnika]   BIGINT          NOT NULL,
    CONSTRAINT [HIPN_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
);

