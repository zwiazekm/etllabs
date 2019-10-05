CREATE TABLE [zef2DW].[ODPN_Pozycje] (
    [IdentyfikatorDokumentu] BIGINT          NOT NULL,
    [RodzajNaleznosci]       BIGINT          NULL,
    [NumerRaty]              NVARCHAR (255)  NULL,
    [KwotaPozycji]           DECIMAL (19, 2) NULL,
    [OdpisPrzypis]           DECIMAL (19, 2) NULL,
    [SaldoKoncowe]           DECIMAL (19, 2) NULL,
    [DataArch]               DATE            NULL,
    [ID_Pismo_xml]           BIGINT          NULL,
    [operacja]               NVARCHAR (1)    NULL
);

