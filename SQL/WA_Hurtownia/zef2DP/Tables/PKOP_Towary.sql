CREATE TABLE [zef2DP].[PKOP_Towary] (
    [IdentyfikatorWpisu]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]  BIGINT          NULL,
    [PodstawaOpodatkowaniaAg] DECIMAL (19, 4) NULL,
    [PodstawaOpodatkowaniaCu] DECIMAL (19, 4) NULL,
    [SredniaCenaAg]           DECIMAL (19, 2) NULL,
    [SredniaCenaCu]           DECIMAL (19, 2) NULL,
    [StawkaPodatkuAg]         DECIMAL (19, 4) NULL,
    [StawkaPodatkuCu]         DECIMAL (19, 4) NULL,
    [KwotaPodatkuAg]          DECIMAL (19, 2) NULL,
    [KwotaPodatkuCu]          DECIMAL (19, 2) NULL,
    [DataArch]                DATETIME2 (7)   NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    CONSTRAINT [PKOP_Towary_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DP]
);

