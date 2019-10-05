CREATE TABLE [zef2DW].[DAKO_Pozycje] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [PozycjeKwotaZEwidencji] DECIMAL (19, 2) NULL,
    [PozycjeKwotaDecyzji]    DECIMAL (19, 2) NULL,
    [Saldo]                  DECIMAL (19, 2) NULL,
    [PozycjeTerminPlatnosci] DATE            NULL,
    [PozycjeNazleznosci]     DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

