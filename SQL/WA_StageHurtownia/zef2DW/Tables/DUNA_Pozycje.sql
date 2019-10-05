﻿CREATE TABLE [zef2DW].[DUNA_Pozycje] (
    [IdentyfikatorDokumentu]     BIGINT          NOT NULL,
    [PozycjeRodzajNaleznosciKod] NVARCHAR (8)    NULL,
    [PozycjeRataNr]              INT             NULL,
    [PozycjeNaleznosci]          DECIMAL (19, 2) NULL,
    [PozycjeUmorzenie]           DECIMAL (19, 2) NULL,
    [Saldo]                      DECIMAL (19, 2) NULL,
    [DataArch]                   DATE            NULL,
    [ID_Pismo_xml]               BIGINT          NULL,
    [operacja]                   NVARCHAR (1)    NULL
);

