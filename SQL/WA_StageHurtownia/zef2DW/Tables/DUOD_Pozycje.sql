CREATE TABLE [zef2DW].[DUOD_Pozycje] (
    [IdentyfikatorDokumentu]              BIGINT          NOT NULL,
    [PozycjeRodzajNaleznosciKod]          NVARCHAR (8)    NULL,
    [PozycjeNaleznosci]                   DECIMAL (19, 2) NULL,
    [PozycjeTerminPlatnosci]              DATE            NULL,
    [PozycjeKwotaOdKtorejUmorzonoOdsetki] DECIMAL (19, 2) NULL,
    [PozycjaDataOd]                       DATE            NULL,
    [PozycjaDataDo]                       DATE            NULL,
    [DataArch]                            DATE            NULL,
    [ID_Pismo_xml]                        BIGINT          NULL,
    [operacja]                            NVARCHAR (1)    NULL
);

