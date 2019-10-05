CREATE TABLE [zef2DW].[DORA_Pierwotne] (
    [IdentyfikatorDokumentu]   BIGINT          NOT NULL,
    [PierwotneRodzaj]          NVARCHAR (255)  NULL,
    [PierwotneNumer]           NVARCHAR (255)  NULL,
    [PierwotneKwotaNaleznosci] DECIMAL (19, 2) NULL,
    [PierwotneKwotaRozkladana] DECIMAL (19, 2) NULL,
    [DataArch]                 DATE            NULL,
    [ID_Pismo_xml]             BIGINT          NULL,
    [operacja]                 NVARCHAR (1)    NULL
);

