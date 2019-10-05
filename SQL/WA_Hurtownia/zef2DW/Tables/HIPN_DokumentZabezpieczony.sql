CREATE TABLE [zef2DW].[HIPN_DokumentZabezpieczony] (
    [IdentyfikatorWpisu]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RodzajDokumentu]        NVARCHAR (255)  NULL,
    [NumerDokumentu]         NVARCHAR (255)  NULL,
    [DataWpisu]              DATE            NULL,
    [KwotaZabezpieczenia]    DECIMAL (19, 2) NULL,
    [SaldoZabezpieczenia]    DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [HIPN_DokumentZabezpieczony_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DW]
);

