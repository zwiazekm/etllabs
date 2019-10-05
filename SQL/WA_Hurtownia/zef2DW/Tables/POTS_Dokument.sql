CREATE TABLE [zef2DW].[POTS_Dokument] (
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [DataDokumentu]           DATE            NULL,
    [RodzajPrzypisuOdpisuTSW] NVARCHAR (32)   NULL,
    [OkresTSW]                NVARCHAR (7)    NULL,
    [PozycjeKwotaRazem]       DECIMAL (19, 2) NULL,
    [AdnotacjeIUwagi]         NVARCHAR (512)  NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    [IdentyfikatorPodatnika]  BIGINT          NOT NULL,
    [NumerPostanowienia]      NVARCHAR (255)  NULL,
    [KosztyPoboru]            DECIMAL (19, 4) NULL,
    [JednostkaOrganizacyjna]  NVARCHAR (6)    NULL,
    CONSTRAINT [POTS_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
);

