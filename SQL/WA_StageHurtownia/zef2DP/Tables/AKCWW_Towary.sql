CREATE TABLE [zef2DP].[AKCWW_Towary] (
    [IdentyfikatorDokumentu]   BIGINT          NULL,
    [NazwaGrupyWyrobow]        NVARCHAR (4000) NULL,
    [Ubytki]                   NVARCHAR (16)   NULL,
    [KodCN]                    NVARCHAR (255)  NULL,
    [WartoscOpalowaWGJ]        DECIMAL (19, 4) NULL,
    [StawkaPodatku]            DECIMAL (19, 4) NULL,
    [KwotaPodatku]             DECIMAL (19, 2) NULL,
    [StawkaSpozaISZTAR]        NVARCHAR (5)    NULL,
    [WartoscStawkiSpozaISZTAR] DECIMAL (19, 4) NULL,
    [DataArch]                 DATETIME2 (7)   NULL,
    [ID_Pismo_xml]             BIGINT          NULL,
    [operacja]                 NVARCHAR (1)    NULL
);

