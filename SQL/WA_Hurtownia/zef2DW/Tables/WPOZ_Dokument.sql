CREATE TABLE [zef2DW].[WPOZ_Dokument] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [DataWydania]            DATE            NULL,
    [DataDoreczenia]         DATE            NULL,
    [OrganWydajacy]          NVARCHAR (255)  NULL,
    [NumerWniosku]           NVARCHAR (255)  NULL,
    [NumerDecyzji]           NVARCHAR (255)  NULL,
    [NumerPostanowienia]     NVARCHAR (255)  NULL,
    [NumerZabezpieczenia]    NVARCHAR (255)  NULL,
    [DataZlozenia]           DATE            NULL,
    [KwotaZabezpieczenia]    DECIMAL (19, 2) NULL,
    [KwotaPrzyjeta]          DECIMAL (19, 2) NULL,
    [AdnotacjeIUwagi]        NVARCHAR (512)  NULL,
    [PrzyjecieOdmowa]        NVARCHAR (9)    NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [IdentyfikatorPodatnika] BIGINT          NOT NULL,
    CONSTRAINT [WPOZ_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
);

