CREATE TABLE [zef2DP].[POG5_ZalacznikD_v4] (
    [IdentyfikatorZalacznika]       NVARCHAR (255)  NOT NULL,
    [IdentyfikatorDokumentu]        BIGINT          NOT NULL,
    [OznaczenieZalacznika]          NVARCHAR (32)   NULL,
    [NumerKolejnyZalacznika]        INT             NULL,
    [NIPLubPESELPodatnika]          NVARCHAR (18)   NULL,
    [DeklaracjaZaOkres]             NVARCHAR (7)    NULL,
    [NumerZezwolenia]               NVARCHAR (128)  NULL,
    [DataWydaniaZezwolenia]         DATETIME2 (7)   NULL,
    [OrganWydajacyZezwolenie]       NVARCHAR (128)  NULL,
    [PodstawaOpodatkBingoFantowe]   DECIMAL (19, 4) NULL,
    [StawkaPodatkuBingoFantowe]     DECIMAL (19, 4) NULL,
    [KwotaPodatkuBingoFantowe]      DECIMAL (19, 4) NULL,
    [PodstawaOpodatkLoterieFantowe] DECIMAL (19, 4) NULL,
    [StawkaPodatkuLoterieFantowe]   DECIMAL (19, 4) NULL,
    [KwotaPodatkuLoterieFantowe]    DECIMAL (19, 4) NULL,
    [RazemKwotaPodatku]             DECIMAL (19, 4) NULL,
    [RazemKwotaPodatkuSPR]          DECIMAL (19, 4) NULL,
    [id1]                           NVARCHAR (150)  NULL,
    CONSTRAINT [POG5_ZalacznikD_v4_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorZalacznika] ASC, [IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DP]
);

