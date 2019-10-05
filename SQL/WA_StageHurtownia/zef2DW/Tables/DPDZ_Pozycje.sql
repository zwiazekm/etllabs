CREATE TABLE [zef2DW].[DPDZ_Pozycje] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RodzajNaleznosci]       BIGINT          NULL,
    [KwotaNaleznosci]        DECIMAL (19, 2) NULL,
    [MetodaPlatnosci]        INT             NULL,
    [CzyZwolniony]           NVARCHAR (5)    NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

