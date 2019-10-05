CREATE TABLE [zef2DP].[VAT14_Pozycje] (
    [IdentyfikatorWpisu]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]      BIGINT          NULL,
    [PodatnikNazwa]               NVARCHAR (255)  NULL,
    [PodatnikNIP]                 NVARCHAR (100)  NULL,
    [TransakcjaWlasna]            NVARCHAR (255)  NULL,
    [NumerSkladuOdbiorcy]         NVARCHAR (100)  NULL,
    [DataTransakcji]              DATETIME2 (7)   NULL,
    [CzyStawkaSpozaISZTAR]        NVARCHAR (100)  NULL,
    [KodCN]                       NVARCHAR (255)  NULL,
    [WartoscTransakcji]           DECIMAL (19, 4) NULL,
    [KwotaPodatekNalezny]         DECIMAL (19, 4) NULL,
    [KwotaZryczWynagrodzPlatnika] DECIMAL (19, 4) NULL,
    [StawkaPodatekNalezny]        DECIMAL (19, 4) NULL,
    [DataArch]                    DATETIME2 (7)   NULL,
    [ID_Pismo_xml]                BIGINT          NULL,
    [operacja]                    NVARCHAR (1)    NULL,
    CONSTRAINT [VAT14_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorWpisu] ASC) ON [FG_ZEF2DP]
);

