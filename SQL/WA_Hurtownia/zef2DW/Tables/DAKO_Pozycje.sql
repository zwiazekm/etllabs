CREATE TABLE [zef2DW].[DAKO_Pozycje] (
    [IdentyfikatorPozycji]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [PozycjeKwotaZEwidencji] DECIMAL (19, 2) NULL,
    [PozycjeKwotaDecyzji]    DECIMAL (19, 2) NULL,
    [Saldo]                  DECIMAL (19, 2) NULL,
    [PozycjeTerminPlatnosci] DATE            NULL,
    [PozycjeNazleznosci]     DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [PK_DAKO_Pozycje] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

