CREATE TABLE [zef2DW].[POZA_Pierwotny] (
    [IdentyfikatorDokumentu] BIGINT         NOT NULL,
    [PierwotneNumer]         NVARCHAR (255) NULL,
    [PierwotneData]          DATE           NULL,
    [PierwotneRodzaj]        NVARCHAR (255) NULL,
    [DataArch]               DATE           NULL,
    [ID_Pismo_xml]           BIGINT         NULL,
    [operacja]               NVARCHAR (1)   NULL
);

