CREATE TABLE [zef2DW].[IOZA_Pierwotne] (
    [IdentyfikatorDokumentu] BIGINT         NOT NULL,
    [PierwotneRodzaj]        NVARCHAR (255) NULL,
    [PierwotneNumer]         NVARCHAR (255) NULL,
    [PierwotneData]          DATE           NULL,
    [DataArch]               DATE           NULL,
    [ID_Pismo_xml]           BIGINT         NULL,
    [operacja]               NVARCHAR (1)   NULL
);

