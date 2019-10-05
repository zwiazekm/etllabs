CREATE TABLE [zef2DW].[DZWR_Pierwotny] (
    [IdentyfikatorDokumentu]  BIGINT         NOT NULL,
    [PierwotneRodzaj]         NVARCHAR (255) NULL,
    [PierwotneNumer]          NVARCHAR (255) NULL,
    [PierwotneDataUiszczenia] DATE           NULL,
    [DataArch]                DATE           NULL,
    [ID_Pismo_xml]            BIGINT         NULL,
    [operacja]                NVARCHAR (1)   NULL
);

