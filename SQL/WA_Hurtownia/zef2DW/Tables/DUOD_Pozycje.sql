CREATE TABLE [zef2DW].[DUOD_Pozycje] (
    [IdentyfikatorPozycji]                BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]              BIGINT          NOT NULL,
    [PozycjeRodzajNaleznosciKod]          NVARCHAR (8)    NULL,
    [PozycjeNaleznosci]                   DECIMAL (19, 2) NULL,
    [PozycjeTerminPlatnosci]              DATE            NULL,
    [PozycjeKwotaOdKtorejUmorzonoOdsetki] DECIMAL (19, 2) NULL,
    [PozycjaDataOd]                       DATE            NULL,
    [PozycjaDataDo]                       DATE            NULL,
    [DataArch]                            DATE            NULL,
    [ID_Pismo_xml]                        BIGINT          NULL,
    CONSTRAINT [DUOD_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

