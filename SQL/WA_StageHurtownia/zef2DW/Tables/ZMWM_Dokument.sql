CREATE TABLE [zef2DW].[ZMWM_Dokument] (
    [IdentyfikatorDokumentu]      BIGINT         NOT NULL,
    [NrDokumentu]                 NVARCHAR (255) NULL,
    [DataDokumentu]               DATE           NULL,
    [DataZmiany]                  DATE           NULL,
    [RodzajPodatku]               NVARCHAR (64)  NULL,
    [OrganPrzekazujacyNazwa]      NVARCHAR (255) NULL,
    [OrganPrzyjmujacy]            BIGINT         NULL,
    [PrzekazywanyRodzajDokumentu] NVARCHAR (255) NULL,
    [PrzekazywanyNumerDokumentu]  NVARCHAR (255) NULL,
    [RepeaterPismoPierwotneId]    INT            NULL,
    [AdnotacjeIUwagi]             NVARCHAR (512) NULL,
    [DataArch]                    DATE           NULL,
    [ID_Pismo_xml]                BIGINT         NULL,
    [operacja]                    NVARCHAR (1)   NULL,
    [IdentyfikatorPodatnika]      BIGINT         NULL,
    CONSTRAINT [ZMWM_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

