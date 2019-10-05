CREATE TABLE [zef2DW].[KZD_Dokument] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [IdentyfikatorPodatnika] BIGINT          NULL,
    [NumerPokwitowania]      NVARCHAR (255)  NULL,
    [KwotaKaucji]            DECIMAL (19, 4) NULL,
    [NumerDecyzji]           NVARCHAR (255)  NULL,
    [DataWydaniaDecyzji]     DATE            NULL,
    [DataOtrzymaniaDecyzji]  DATE            NULL,
    [KaraRazem]              DECIMAL (19, 4) NULL,
    [AdnotacjeIUwagi]        NVARCHAR (4000) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL,
    CONSTRAINT [KZD_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

