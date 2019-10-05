CREATE TABLE [zef2DW].[OZWW_Pozycje] (
    [IdentyfikatorPozycji]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]     BIGINT          NOT NULL,
    [PozycjeRodzajNaleznosciKod] NVARCHAR (8)    NULL,
    [Saldo]                      DECIMAL (19, 2) NULL,
    [PozycjeKwotaWstrzymana]     DECIMAL (19, 2) NULL,
    [PozycjeTerminPlatnosci]     DATE            NULL,
    [DataArch]                   DATE            NULL,
    [ID_Pismo_xml]               BIGINT          NULL,
    CONSTRAINT [OZWW_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

