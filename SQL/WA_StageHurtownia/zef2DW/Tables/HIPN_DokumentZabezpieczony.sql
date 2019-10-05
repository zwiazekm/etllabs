CREATE TABLE [zef2DW].[HIPN_DokumentZabezpieczony] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RodzajDokumentu]        NVARCHAR (255)  NULL,
    [NumerDokumentu]         NVARCHAR (255)  NULL,
    [DataWpisu]              DATE            NULL,
    [KwotaZabezpieczenia]    DECIMAL (19, 2) NULL,
    [SaldoZabezpieczenia]    DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

