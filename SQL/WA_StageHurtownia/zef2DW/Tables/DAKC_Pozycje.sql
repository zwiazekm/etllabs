CREATE TABLE [zef2DW].[DAKC_Pozycje] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RodzajNaleznosci]       BIGINT          NULL,
    [PozycjaKwotaDecyzji]    DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

