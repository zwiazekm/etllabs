CREATE TABLE [zef2DW].[DZAB_Dokument] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [DataDoreczenia]         DATE            NULL,
    [DataWydania]            DATE            NULL,
    [Naleznosci]             DECIMAL (19, 2) NULL,
    [Odsetki]                NVARCHAR (255)  NULL,
    [OrganWydajacy]          NVARCHAR (255)  NULL,
    [Razem]                  DECIMAL (19, 2) NULL,
    [RodzajPodatku]          NVARCHAR (64)   NULL,
    [NumerDecyzji]           NVARCHAR (255)  NULL,
    [TypDochodu]             NVARCHAR (32)   NULL,
    [DataWygaszenia]         DATE            NULL,
    [AdnotacjeIUwagi]        NVARCHAR (512)  NULL,
    [RaportWyslaniaSK]       NVARCHAR (MAX)  NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL,
    [IdentyfikatorPodatnika] BIGINT          NULL,
    CONSTRAINT [DZAB_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

