﻿CREATE TABLE [zef2DW].[DOPN_Dokument] (
    [IdentyfikatorDokumentu]     BIGINT          NOT NULL,
    [NumerZglaszajacego]         NVARCHAR (32)   NULL,
    [NazwaZglaszajacego]         NVARCHAR (255)  NULL,
    [System]                     NVARCHAR (8)    NULL,
    [NipZglaszajacego]           NVARCHAR (255)  NULL,
    [PeselZglaszajacego]         NVARCHAR (255)  NULL,
    [RegonZglaszajacego]         NVARCHAR (4000) NULL,
    [NazwaPelnaZglaszajacego]    NVARCHAR (4000) NULL,
    [RodzajZglaszajacego]        NVARCHAR (64)   NULL,
    [NazwiskoZglaszajacego]      NVARCHAR (4000) NULL,
    [ImieZglaszajacego]          NVARCHAR (4000) NULL,
    [DataUrodzeniaZglaszajacego] DATE            NULL,
    [KrajZglaszajacego]          NVARCHAR (4000) NULL,
    [WojewodztwoZglaszajacego]   NVARCHAR (4000) NULL,
    [PowiatZglaszajacego]        NVARCHAR (4000) NULL,
    [GminaZglaszajacego]         NVARCHAR (4000) NULL,
    [UlicaZglaszajacego]         NVARCHAR (4000) NULL,
    [NrDomuZglaszajacego]        NVARCHAR (4000) NULL,
    [NrLokaluZglaszajacego]      NVARCHAR (4000) NULL,
    [MiejscowoscZglaszajacego]   NVARCHAR (4000) NULL,
    [KodPocztowyZglaszajacego]   NVARCHAR (4000) NULL,
    [PocztaZglaszajacego]        NVARCHAR (4000) NULL,
    [NrEORIZglaszajacego]        NVARCHAR (4000) NULL,
    [NrDokumentuZglaszajacego]   NVARCHAR (4000) NULL,
    [NrVatUeZglaszajacego]       NVARCHAR (4000) NULL,
    [UwagiZglaszajacego]         NVARCHAR (4000) NULL,
    [DataWystawienia]            DATE            NULL,
    [DataPowiadomienia]          DATE            NULL,
    [DataDlugu]                  DATE            NULL,
    [TerminPlatnosci]            DATE            NULL,
    [RaportWyslaniaSK]           NVARCHAR (MAX)  NULL,
    [SumaNaleznosci]             DECIMAL (19, 2) NULL,
    [NumerDecyzji]               NVARCHAR (255)  NULL,
    [AdnotacjeIUwagi]            NVARCHAR (512)  NULL,
    [PierwotnyRodzajDokumentu]   NVARCHAR (255)  NULL,
    [PierwotnyNumerDokumentu]    NVARCHAR (255)  NULL,
    [PozycjeRodzajNaleznosci]    NVARCHAR (255)  NULL,
    [PozycjeKwota]               DECIMAL (19, 2) NULL,
    [DataArch]                   DATE            NULL,
    [ID_Pismo_xml]               BIGINT          NULL,
    [IdentyfikatorPodatnika]     BIGINT          NOT NULL,
    CONSTRAINT [DOPN_Dokument_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DW]
) TEXTIMAGE_ON [FG_ZEF2DW];

