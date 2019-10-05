CREATE TABLE [zef2DP].[AKCP_Towary] (
    [IdentyfikatorWpisu]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]  BIGINT          NULL,
    [KodCN]                   NVARCHAR (255)  NULL,
    [Marka]                   NVARCHAR (32)   NULL,
    [Model]                   NVARCHAR (32)   NULL,
    [RokProdukcji]            NVARCHAR (255)  NULL,
    [PojazdElektryczny]       NVARCHAR (5)    NULL,
    [PojemnoscSkokowaSilnika] DECIMAL (19, 4) NULL,
    [NumerVIN]                NVARCHAR (255)  NULL,
    [InformacjeDodatkowe]     NVARCHAR (4000) NULL,
    [NiestandardowyNumerVIN]  NVARCHAR (5)    NULL,
    [DataSprzedazSamoch]      DATETIME2 (7)   NULL,
    [PodstawObliczPodatku]    DECIMAL (19, 4) NULL,
    [StawkaPodatkuProcent]    DECIMAL (19, 4) NULL,
    [KwotaPodatku]            DECIMAL (19, 2) NULL,
    [DataArch]                DATETIME2 (7)   NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    CONSTRAINT [AKCP_Towary_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DP]
);

