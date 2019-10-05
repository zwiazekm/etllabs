CREATE TABLE [zef2DW].[POTS_Pierwotne] (
    [IdentyfikatorDokumentu] BIGINT         NOT NULL,
    [PierwotnyRodzaj]        NVARCHAR (255) NULL,
    [PierwotnyNumer]         NVARCHAR (255) NULL,
    [DataArch]               DATE           NULL,
    [ID_Pismo_xml]           BIGINT         NULL,
    [operacja]               NVARCHAR (1)   NULL,
    CONSTRAINT [POTS_Pierwotne_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC)
);

