CREATE TABLE [zef2DP].[POG5_ZalacznikD] (
    [IdentyfikatorZalacznika]        NVARCHAR (255)  NOT NULL,
    [IdentyfikatorDokumentu]         BIGINT          NOT NULL,
    [OznaczenieZalacznika]           NVARCHAR (32)   NULL,
    [NumerKolejnyZalacznika]         INT             NULL,
    [NIPLubPESELPodatnika]           NVARCHAR (18)   NULL,
    [DeklaracjaZaOkres]              NVARCHAR (7)    NULL,
    [NumerZezwolenia]                NVARCHAR (128)  NULL,
    [DataWydaniaZezwolenia]          DATETIME2 (7)   NULL,
    [OrganWydajacyZezwolenie]        NVARCHAR (128)  NULL,
    [PodstawaOpodatkGryBingoFantowe] DECIMAL (19, 4) NULL,
    [StawkaPodatkuGryBingoFantowe]   DECIMAL (19, 4) NULL,
    [KwotaPodatkuGryBingoFantowe]    DECIMAL (19, 2) NULL,
    [PodstawaOpodatkLoterieFantowe]  DECIMAL (19, 4) NULL,
    [StawkaPodatkuLoterieFantowe]    DECIMAL (19, 4) NULL,
    [KwotaPodatkuLoterieFantowe]     DECIMAL (19, 2) NULL,
    [RazemKwotaPodatku]              DECIMAL (19, 2) NULL,
    [id1]                            NVARCHAR (150)  NULL,
    CONSTRAINT [POG5_ZalacznikD_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorZalacznika] ASC, [IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DP]
);

