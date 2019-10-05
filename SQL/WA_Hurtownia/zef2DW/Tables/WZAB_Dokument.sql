CREATE TABLE [zef2DW].[WZAB_Dokument] (
    [IdentyfikatorDokumentu]       BIGINT          NOT NULL,
    [TypDochodu]                   NVARCHAR (32)   NULL,
    [NumerWniosku]                 NVARCHAR (255)  NULL,
    [DataZlozeniaWniosku]          DATE            NULL,
    [DataWplywuWniosku]            DATE            NULL,
    [NumerDecyzji]                 NVARCHAR (255)  NULL,
    [KwotaZabezpieczenia]          DECIMAL (19, 2) NULL,
    [ProponowanaFormaZabezpieczen] NVARCHAR (255)  NULL,
    [DataArch]                     DATE            NULL,
    [ID_Pismo_xml]                 BIGINT          NULL,
    [IdentyfikatorPodatnika]       BIGINT          NOT NULL,
    CONSTRAINT [WZAB_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
);

