CREATE TABLE [zef2DW].[OKAR_Pozycje] (
    [IdentyfikatorPozycji]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [PozycjeRodzajNaleznosci] NVARCHAR (255)  NULL,
    [PozycjeKwota]            DECIMAL (19, 2) NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    CONSTRAINT [OKAR_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

