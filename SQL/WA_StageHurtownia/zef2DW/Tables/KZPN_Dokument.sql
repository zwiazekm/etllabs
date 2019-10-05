CREATE TABLE [zef2DW].[KZPN_Dokument] (
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [DataDecyzji]             DATE            NULL,
    [DataOtrzymania]          DATE            NULL,
    [DokumentArchiwalny]      NVARCHAR (5)    NULL,
    [KategoriaZezwolenia]     NVARCHAR (1)    NULL,
    [OsobaKrajowaZagraniczna] NVARCHAR (32)   NULL,
    [PozycjeRazem]            DECIMAL (19, 2) NULL,
    [NumerDecyzji]            NVARCHAR (255)  NULL,
    [SposobZaplaty]           NVARCHAR (27)   NULL,
    [MigracjaReczna]          NVARCHAR (5)    NULL,
    [AdnotacjeIUwagi]         NVARCHAR (512)  NULL,
    [TerminPlatnosci]         DATE            NULL,
    [RaportWyslaniaSK]        NVARCHAR (MAX)  NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    [operacja]                NVARCHAR (1)    NULL,
    [IdentyfikatorPodatnika]  BIGINT          NULL,
    [KodJednostki]            NVARCHAR (6)    NULL,
    CONSTRAINT [KZPN_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

