CREATE TABLE [zef2DP].[POG4_ZalacznikR] (
    [IdentyfikatorZalacznika]   NVARCHAR (255)  NOT NULL,
    [IdentyfikatorDokumentu]    BIGINT          NOT NULL,
    [OznaczenieZalacznika]      NVARCHAR (32)   NULL,
    [NumerKolejnyZalacznika]    INT             NULL,
    [NIPLubPESELPodatnika]      NVARCHAR (18)   NULL,
    [DeklaracjaZaOkres]         NVARCHAR (7)    NULL,
    [REGON]                     NVARCHAR (4000) NULL,
    [NumerZezwolenia]           NVARCHAR (128)  NULL,
    [DataWydaniaZezwolenia]     DATETIME2 (7)   NULL,
    [OrganWydajacyZezwolenie]   NVARCHAR (128)  NULL,
    [LacznaLiczbaAutomatow]     DECIMAL (19, 4) NULL,
    [AutomatyWycofane]          DECIMAL (19, 4) NULL,
    [AutomatyCzasowoZawieszone] DECIMAL (19, 4) NULL,
    [AutomatyNowoWprowadzone]   DECIMAL (19, 4) NULL,
    [ZryczaltowanyPodatek]      DECIMAL (19, 2) NULL,
    [id1]                       NVARCHAR (150)  NULL,
    CONSTRAINT [POG4_ZalacznikR_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorZalacznika] ASC, [IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DP]
);

