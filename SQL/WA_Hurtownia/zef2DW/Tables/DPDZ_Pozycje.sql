CREATE TABLE [zef2DW].[DPDZ_Pozycje] (
    [IdentyfikatorPozycji]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RodzajNaleznosci]       BIGINT          NULL,
    [KwotaNaleznosci]        DECIMAL (19, 2) NULL,
    [MetodaPlatnosci]        INT             NULL,
    [CzyZwolniony]           NVARCHAR (5)    NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [DPDZ_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

