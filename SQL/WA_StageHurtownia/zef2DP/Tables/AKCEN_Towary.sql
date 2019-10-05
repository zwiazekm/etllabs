CREATE TABLE [zef2DP].[AKCEN_Towary] (
    [IdentyfikatorDokumentu]       BIGINT          NULL,
    [KodCN]                        NVARCHAR (255)  NULL,
    [StawkaPodatku]                DECIMAL (19, 4) NULL,
    [IloscEnergiiElektrycznejWMWh] NVARCHAR (4000) NULL,
    [KwotaPodatku]                 DECIMAL (19, 2) NULL,
    [DataArch]                     DATETIME2 (7)   NULL,
    [ID_Pismo_xml]                 BIGINT          NULL,
    [operacja]                     NVARCHAR (1)    NULL
);

