CREATE TABLE [zef2DW].[DOUP_Dokument] (
    [IdentyfikatorDokumentu]                BIGINT         NOT NULL,
    [TypDochodu]                            NVARCHAR (32)  NULL,
    [NumerDecyzji]                          NVARCHAR (255) NULL,
    [DataDecyzji]                           DATE           NULL,
    [DataDoreczenia]                        DATE           NULL,
    [RodzajPodatku]                         NVARCHAR (64)  NULL,
    [OrganWydajacy]                         NVARCHAR (255) NULL,
    [WWynikuKontroliPostepowania]           NVARCHAR (12)  NULL,
    [NrUpowaznienia]                        NVARCHAR (255) NULL,
    [NrPostanowieniaOWszczeciuPostepowania] NVARCHAR (255) NULL,
    [WynikKontroliNumerWniosku]             NVARCHAR (255) NULL,
    [RodzajDokumentu]                       NVARCHAR (255) NULL,
    [NumerDokumentu]                        NVARCHAR (255) NULL,
    [WnioskodawcaPostepowania]              NVARCHAR (25)  NULL,
    [AdnotacjeIUwagi]                       NVARCHAR (512) NULL,
    [RaportWyslaniaSK]                      NVARCHAR (MAX) NULL,
    [DataArch]                              DATE           NULL,
    [ID_Pismo_xml]                          BIGINT         NULL,
    [IdentyfikatorPodatnika]                BIGINT         NOT NULL,
    CONSTRAINT [DOUP_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

