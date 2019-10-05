CREATE TABLE [zef2DW].[DKOR_Pozycje] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RodzajNaleznosci]       BIGINT          NULL,
    [KwotaNaleznosci]        DECIMAL (19, 2) NULL,
    [KwotaDecyzji]           DECIMAL (19, 2) NULL,
    [CzyDokumentZwolniony]   NVARCHAR (5)    NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

