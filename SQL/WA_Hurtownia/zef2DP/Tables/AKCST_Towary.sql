CREATE TABLE [zef2DP].[AKCST_Towary] (
    [IdentyfikatorWpisu]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]   BIGINT          NULL,
    [KodCN]                    NVARCHAR (255)  NULL,
    [StawkaPodatku]            DECIMAL (19, 4) NULL,
    [IloscSuszuTyton]          DECIMAL (19, 4) NULL,
    [KwotaPodatku]             DECIMAL (19, 2) NULL,
    [StawkaSpozaISZTAR]        NVARCHAR (5)    NULL,
    [WartoscStawkiSpozaISZTAR] DECIMAL (19, 4) NULL,
    [DataArch]                 DATETIME2 (7)   NULL,
    [ID_Pismo_xml]             BIGINT          NULL,
    [NazwaTowarow]             NVARCHAR (4000) NULL,
    CONSTRAINT [AKCST_Towary_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DP]
);

