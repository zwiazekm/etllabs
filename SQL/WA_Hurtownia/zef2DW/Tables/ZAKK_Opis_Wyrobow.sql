CREATE TABLE [zef2DW].[ZAKK_Opis_Wyrobow] (
    [IdentyfikatorOpisuWyrobow] BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu]    BIGINT          NOT NULL,
    [NazwaWyrobu]               NVARCHAR (255)  NULL,
    [Ilosc]                     DECIMAL (19, 2) NULL,
    [KodCN]                     NVARCHAR (4000) NULL,
    [KwotaAkcyzy]               DECIMAL (19, 2) NULL,
    [DataArch]                  DATE            NULL,
    [ID_Pismo_xml]              BIGINT          NULL,
    CONSTRAINT [ZAKK_Opis_Wyrobow_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorOpisuWyrobow] ASC) ON [FG_ZEF2DW]
);

