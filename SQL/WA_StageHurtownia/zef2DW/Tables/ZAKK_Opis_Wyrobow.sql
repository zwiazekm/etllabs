CREATE TABLE [zef2DW].[ZAKK_Opis_Wyrobow] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [NazwaWyrobu]            NVARCHAR (255)  NULL,
    [Ilosc]                  DECIMAL (19, 2) NULL,
    [KodCN]                  NVARCHAR (4000) NULL,
    [KwotaAkcyzy]            DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

