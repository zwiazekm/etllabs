CREATE TABLE [zef2DW].[DUNA_Pozycje] (
    [IdentyfikatorPozycji]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]     BIGINT          NOT NULL,
    [PozycjeRodzajNaleznosciKod] NVARCHAR (8)    NULL,
    [PozycjeRataNr]              INT             NULL,
    [PozycjeNaleznosci]          DECIMAL (19, 2) NULL,
    [PozycjeUmorzenie]           DECIMAL (19, 2) NULL,
    [Saldo]                      DECIMAL (19, 2) NULL,
    [DataArch]                   DATE            NULL,
    [ID_Pismo_xml]               BIGINT          NULL,
    CONSTRAINT [DUNA_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

