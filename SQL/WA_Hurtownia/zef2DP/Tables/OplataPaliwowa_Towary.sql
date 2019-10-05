CREATE TABLE [zef2DP].[OplataPaliwowa_Towary] (
    [IdentyfikatorWpisu]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NULL,
    [KodCN]                  NVARCHAR (255)  NULL,
    [NazwaGrupyWyrobow]      NVARCHAR (4000) NULL,
    [JednostkaMiary]         NVARCHAR (4000) NULL,
    [IloscWyrobow]           DECIMAL (19, 4) NULL,
    [StawkaOplPaliw]         DECIMAL (19, 4) NULL,
    [TytulPlatnosci]         INT             NULL,
    [KwotaOplPaliw]          DECIMAL (19, 2) NULL,
    [RodzajOplPaliw]         INT             NULL,
    [DataArch]               DATETIME2 (7)   NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [OplataPaliwowa_Towary_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DP]
);

