CREATE TABLE [zef2DP].[AKCST_Towary] (
    [IdentyfikatorDokumentu]   BIGINT          NULL,
    [KodCN]                    NVARCHAR (255)  NULL,
    [StawkaPodatku]            DECIMAL (19, 4) NULL,
    [IloscSuszuTyton]          DECIMAL (19, 4) NULL,
    [KwotaPodatku]             DECIMAL (19, 2) NULL,
    [StawkaSpozaISZTAR]        NVARCHAR (5)    NULL,
    [WartoscStawkiSpozaISZTAR] DECIMAL (19, 4) NULL,
    [DataArch]                 DATETIME2 (7)   NULL,
    [ID_Pismo_xml]             BIGINT          NULL,
    [operacja]                 NVARCHAR (1)    NULL,
    [NazwaTowarow]             NVARCHAR (4000) NULL
);

