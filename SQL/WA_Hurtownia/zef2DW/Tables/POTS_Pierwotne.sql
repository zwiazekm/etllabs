CREATE TABLE [zef2DW].[POTS_Pierwotne] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [IdentyfikatorPierwotne] DECIMAL (19, 2) NULL,
    [PierwotnyRodzaj]        NVARCHAR (255)  NULL,
    [PierwotnyNumer]         NVARCHAR (255)  NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [POTS_Pierwotne_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
);

