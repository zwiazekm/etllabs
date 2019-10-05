CREATE TABLE [zef2DP].[PKOPMS_Towary] (
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [DataArch]                DATETIME2 (7)   NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    [operacja]                NVARCHAR (1)    NULL,
    [PodstawaOpodatkowaniaAg] DECIMAL (19, 4) NULL,
    [PodstawaOpodatkowaniaCu] DECIMAL (19, 4) NULL,
    [SredniaCenaAg]           DECIMAL (19, 4) NULL,
    [SredniaCenaCu]           DECIMAL (19, 4) NULL,
    [StawkaPodatkuAg]         DECIMAL (19, 4) NULL,
    [StawkaPodatkuCu]         DECIMAL (19, 4) NULL,
    [KwotaPodatkuAg]          DECIMAL (19, 4) NULL,
    [KwotaPodatkuCu]          DECIMAL (19, 4) NULL
);

