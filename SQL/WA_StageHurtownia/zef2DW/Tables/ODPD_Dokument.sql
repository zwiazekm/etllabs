CREATE TABLE [zef2DW].[ODPD_Dokument] (
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [DataWystawienia]         DATE            NULL,
    [PrzyczynaOdpisuPrzypisu] NVARCHAR (13)   NULL,
    [NumerDokumentu]          NVARCHAR (255)  NULL,
    [AdnotacjeIUwagi]         NVARCHAR (512)  NULL,
    [RazemNaleznosc]          DECIMAL (19, 2) NULL,
    [RazemUmorzenia]          DECIMAL (19, 2) NULL,
    [RaportWyslaniaSK]        NVARCHAR (MAX)  NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    [operacja]                NVARCHAR (1)    NULL,
    [IdentyfikatorPodatnika]  BIGINT          NULL,
    CONSTRAINT [ODPD_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

