CREATE TABLE [zef2DW].[DZWR_Pozycje] (
    [IdentyfikatorPozycji]           BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]         BIGINT          NOT NULL,
    [PozycjeKwotaNaleznosci]         DECIMAL (19, 2) NULL,
    [PozycjeKwotaWplat]              DECIMAL (19, 2) NULL,
    [PozycjeKwotaZwrotu]             DECIMAL (19, 2) NULL,
    [PozycjeRodzajNaleznosci]        NVARCHAR (255)  NULL,
    [PozycjePierwotnyNumerDokumentu] NVARCHAR (255)  NULL,
    [DataArch]                       DATE            NULL,
    [ID_Pismo_xml]                   BIGINT          NULL,
    CONSTRAINT [DZWR_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

