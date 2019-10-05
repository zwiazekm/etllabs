CREATE TABLE [zef2DW].[ZNPN_Dokument] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [NumerDrukuZezwolenia]   NVARCHAR (255)  NULL,
    [KategoriaZezwolenia]    NVARCHAR (12)   NULL,
    [DataWystawienia]        DATE            NULL,
    [NrZezwolenia]           NVARCHAR (255)  NULL,
    [DataOtrzymania]         DATE            NULL,
    [OkresWaznosci]          NVARCHAR (7)    NULL,
    [DataWaznosciOd]         NVARCHAR (20)   NULL,
    [AdnotacjeIUwagi]        NVARCHAR (512)  NULL,
    [MigracjaReczna]         NVARCHAR (5)    NULL,
    [PozycjeRazem]           DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL,
    [Do]                     NVARCHAR (20)   NULL,
    [IdentyfikatorPodatnika] BIGINT          NULL,
    [NumerDokumentuWplaty]   NVARCHAR (255)  NULL,
    [KwotaWplaty]            DECIMAL (19, 4) NULL,
    CONSTRAINT [ZNPN_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

