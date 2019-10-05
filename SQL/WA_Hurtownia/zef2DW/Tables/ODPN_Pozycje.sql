CREATE TABLE [zef2DW].[ODPN_Pozycje] (
    [IdentyfikatorPozycji]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RodzajNaleznosci]       BIGINT          NULL,
    [NumerRaty]              NVARCHAR (255)  NULL,
    [KwotaPozycji]           DECIMAL (19, 2) NULL,
    [OdpisPrzypis]           DECIMAL (19, 2) NULL,
    [SaldoKoncowe]           DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    CONSTRAINT [ODPN_Pozycje_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorPozycji] ASC) ON [FG_ZEF2DW]
);

