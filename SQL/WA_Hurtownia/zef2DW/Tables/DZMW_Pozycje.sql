CREATE TABLE [zef2DW].[DZMW_Pozycje] (
    [IdentyfikatorPozycji]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RodzajNaleznosciKod]    NVARCHAR (255)  NULL,
    [StaraNaleznosc]         DECIMAL (19, 2) NULL,
    [NowaNaleznosc]          DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [DZMW_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

