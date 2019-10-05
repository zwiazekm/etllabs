CREATE TABLE [zef2DW].[DZMW_Pozycje] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RodzajNaleznosciKod]    NVARCHAR (255)  NULL,
    [StaraNaleznosc]         DECIMAL (19, 2) NULL,
    [NowaNaleznosc]          DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

