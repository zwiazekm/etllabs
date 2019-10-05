CREATE TABLE [zef2DW].[DVIM_Pozycje] (
    [IdentyfikatorPozycji]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]  BIGINT          NOT NULL,
    [PozycjeRodzajNaleznosci] NVARCHAR (255)  NULL,
    [PozycjeVATIm]            DECIMAL (19, 2) NULL,
    [PozycjeVAT7]             DECIMAL (19, 2) NULL,
    [DataArch]                DATE            NULL,
    [ID_Pismo_xml]            BIGINT          NULL,
    [PozycjeKwotaDoZaplaty]   DECIMAL (19, 2) NULL,
    CONSTRAINT [DVIM_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

