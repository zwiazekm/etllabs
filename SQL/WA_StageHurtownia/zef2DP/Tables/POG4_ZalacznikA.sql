CREATE TABLE [zef2DP].[POG4_ZalacznikA] (
    [IdentyfikatorZalacznika] NVARCHAR (255)  NOT NULL,
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [OznaczenieZalacznika]    NVARCHAR (32)   NULL,
    [NumerKolejnyZalacznika]  INT             NULL,
    [NIPLubPESELPodatnika]    NVARCHAR (18)   NULL,
    [DeklaracjaZaOkres]       NVARCHAR (7)    NULL,
    [REGON]                   NVARCHAR (4000) NULL,
    [NumerZezwolenia]         NVARCHAR (128)  NULL,
    [DataWydaniaZezwolenia]   DATETIME2 (7)   NULL,
    [OrganWydajacyZezwolenie] NVARCHAR (128)  NULL,
    [Monopol]                 NVARCHAR (128)  NULL,
    [DataUtworzenia]          DATETIME2 (7)   NULL,
    [PodstawaOpodatkowania]   DECIMAL (19, 4) NULL,
    [StawkaPodatku]           DECIMAL (19, 4) NULL,
    [KwotaPodatku]            DECIMAL (19, 2) NULL,
    [id1]                     NVARCHAR (150)  NULL,
    [operacja]                NVARCHAR (1)    NULL,
    CONSTRAINT [POG4_ZalacznikA_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorZalacznika] ASC, [IdentyfikatorDokumentu] ASC)
);

