CREATE TABLE [zef2DW].[MAND_Dokument] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [DataUkarania]           DATE            NULL,
    [FunkcjonariuszImie]     NVARCHAR (4000) NULL,
    [FunkcjonariuszNazwisko] NVARCHAR (4000) NULL,
    [GrzywnaRazem]           DECIMAL (19, 2) NULL,
    [RodzajMandatu]          NVARCHAR (32)   NULL,
    [AdnotacjeIUwagi]        NVARCHAR (512)  NULL,
    [NumerMandatu]           NVARCHAR (255)  NULL,
    [TerminPlatnosci]        DATE            NULL,
    [RaportWyslaniaSK]       NVARCHAR (MAX)  NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [IdentyfikatorPodatnika] BIGINT          NOT NULL,
    CONSTRAINT [MAND_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

