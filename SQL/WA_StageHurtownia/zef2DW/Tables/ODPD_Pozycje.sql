CREATE TABLE [zef2DW].[ODPD_Pozycje] (
    [IdentyfikatorDokumentu]     BIGINT          NOT NULL,
    [PozycjeRodzajNaleznosciKod] NVARCHAR (8)    NULL,
    [PozycjeRata]                INT             NULL,
    [PozycjeNaleznosci]          DECIMAL (19, 2) NULL,
    [PozycjeOdpisPrzypis]        DECIMAL (19, 2) NULL,
    [Saldo]                      DECIMAL (19, 2) NULL,
    [DataArch]                   DATE            NULL,
    [ID_Pismo_xml]               BIGINT          NULL,
    [operacja]                   NVARCHAR (1)    NULL
);

