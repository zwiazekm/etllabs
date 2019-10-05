CREATE TABLE [zef2DW].[POPC_Pozycje] (
    [IdentyfikatorPozycji]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]    BIGINT          NOT NULL,
    [RodzajNaleznosci]          BIGINT          NULL,
    [KwotaOplaty]               DECIMAL (19, 2) NULL,
    [DataArch]                  DATE            NULL,
    [ID_Pismo_xml]              BIGINT          NULL,
    [MigracjaReczna]            NVARCHAR (50)   NULL,
    [PotwierdzeniaDataPrzelewu] DATE            NULL,
    CONSTRAINT [POPC_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

