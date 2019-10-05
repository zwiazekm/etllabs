﻿CREATE TABLE [zef2DP].[POG5_ZalacznikA_v4] (
    [IdentyfikatorZalacznika]                              NVARCHAR (255)  NOT NULL,
    [IdentyfikatorDokumentu]                               BIGINT          NOT NULL,
    [OznaczenieZalacznika]                                 NVARCHAR (32)   NULL,
    [NumerKolejnyZalacznika]                               INT             NULL,
    [NIPLubPESELPodatnika]                                 NVARCHAR (18)   NULL,
    [DeklaracjaZaOkres]                                    NVARCHAR (7)    NULL,
    [REGON]                                                NVARCHAR (4000) NULL,
    [NumerZezwolenia]                                      NVARCHAR (128)  NULL,
    [DataWydaniaZezwolenia]                                DATETIME2 (7)   NULL,
    [OrganWydajacyZezwolenie]                              NVARCHAR (128)  NULL,
    [PodstawaOpodatkGryCylindryczne]                       DECIMAL (19, 4) NULL,
    [StawkaPodatkuGryCylindryczne]                         DECIMAL (19, 4) NULL,
    [KwotaPodatkuGryCylindryczne]                          DECIMAL (19, 4) NULL,
    [PodstawaOpodatkGryAutomaty]                           DECIMAL (19, 4) NULL,
    [StawkaPodatkuGryAutomaty]                             DECIMAL (19, 4) NULL,
    [KwotaPodatkuGryAutomaty]                              DECIMAL (19, 4) NULL,
    [PodstawaOpodatkGryKarty]                              DECIMAL (19, 4) NULL,
    [StawkaPodatkuGryKarty]                                DECIMAL (19, 4) NULL,
    [KwotaPodatkuGryKarty]                                 DECIMAL (19, 4) NULL,
    [PodstawaOpodatkGryKosci]                              DECIMAL (19, 4) NULL,
    [StawkaPodatkuGryKosci]                                DECIMAL (19, 4) NULL,
    [KwotaPodatkuGryKosci]                                 DECIMAL (19, 4) NULL,
    [PodstawaOpodatkGryBingoIPieniezne]                    DECIMAL (19, 4) NULL,
    [StawkaPodatkuGryBingoIPieniezne]                      DECIMAL (19, 4) NULL,
    [KwotaPodatkuGryBingoIPieniezne]                       DECIMAL (19, 4) NULL,
    [PodstawaOpodatkZakladyDotWspolzawodnLudziPunkty]      DECIMAL (19, 4) NULL,
    [StawkaPodatkuZakladyDotWspolzawodnLudziPunkty]        DECIMAL (19, 4) NULL,
    [KwotaPodatkuZakladyDotWspolzawodnLudziPunkty]         DECIMAL (19, 4) NULL,
    [PodstawaOpodatkZakladyDotWspolzawodnLudziInternet]    DECIMAL (19, 4) NULL,
    [StawkaPodatkuZakladyDotWspolzawodnLudziInternet]      DECIMAL (19, 4) NULL,
    [KwotaPodatkuZakladyDotWspolzawodnLudziInternet]       DECIMAL (19, 4) NULL,
    [PodstawaOpodatkZakladyDotWspolzawodnLudziRAZEM]       DECIMAL (19, 4) NULL,
    [KwotaPodatkuZakladyDotWspolzawodnLudziRAZEM]          DECIMAL (19, 4) NULL,
    [PodstawaOpodatkZakladyDotWspolzawodnZwierzatPunkty]   DECIMAL (19, 4) NULL,
    [StawkaPodatkuZakladyDotWspolzawodnZwierzatPunkty]     DECIMAL (19, 4) NULL,
    [KwotaPodatkuZakladyDotWspolzawodnZwierzatPunkty]      DECIMAL (19, 4) NULL,
    [PodstawaOpodatkZakladyDotWspolzawodnZwierzatInternet] DECIMAL (19, 4) NULL,
    [StawkaPodatkuZakladyDotWspolzawodnZwierzatInternet]   DECIMAL (19, 4) NULL,
    [KwotaPodatkuZakladyDotWspolzawodnZwierzatInternet]    DECIMAL (19, 4) NULL,
    [PodstawaOpodatkZakladyDotWspolzawodnZwierzatRAZEM]    DECIMAL (19, 4) NULL,
    [KwotaPodatkuZakladyDotWspolzawodnZwierzatRAZEM]       DECIMAL (19, 4) NULL,
    [PodstawaOpodatkZdarzeniaWirtualnePunkty]              DECIMAL (19, 4) NULL,
    [StawkaPodatkuZdarzeniaWirtualnePunkty]                DECIMAL (19, 4) NULL,
    [KwotaPodatkuZdarzeniaWirtualnePunkty]                 DECIMAL (19, 4) NULL,
    [PodstawaOpodatkZdarzeniaWirtualneInternet]            DECIMAL (19, 4) NULL,
    [StawkaPodatkuZdarzeniaWirtualneInternet]              DECIMAL (19, 4) NULL,
    [KwotaPodatkuZdarzeniaWirtualneInternet]               DECIMAL (19, 4) NULL,
    [PodstawaOpodatkPozostaleRodzZakladowWzajemnPunkty]    DECIMAL (19, 4) NULL,
    [StawkaPodatkuPozostaleRodzZakladowWzajemnPunkty]      DECIMAL (19, 4) NULL,
    [KwotaPodatkuPozostaleRodzZakladowWzajemnPunkty]       DECIMAL (19, 4) NULL,
    [PodstawaOpodatkPozostaleRodzZakladowWzajemnInternet]  DECIMAL (19, 4) NULL,
    [StawkaPodatkuPozostaleRodzZakladowWzajemnInternet]    DECIMAL (19, 4) NULL,
    [KwotaPodatkuPozostaleRodzZakladowWzajemnInternet]     DECIMAL (19, 4) NULL,
    [PodstawaOpodatkPozostaleRodzZakladowWzajemnRAZEM]     DECIMAL (19, 4) NULL,
    [KwotaPodatkuPozostaleRodzZakladowWzajemnRAZEM]        DECIMAL (19, 4) NULL,
    [PodstawaOpodatkLoterieAudiotekstowe]                  DECIMAL (19, 4) NULL,
    [StawkaPodatkuLoterieAudiotekstowe]                    DECIMAL (19, 4) NULL,
    [KwotaPodatkuLoterieAudiotekstowe]                     DECIMAL (19, 4) NULL,
    [RazemKwotaPodatku]                                    DECIMAL (19, 4) NULL,
    [RazemKwotaPodatkuSPR]                                 DECIMAL (19, 4) NULL,
    [id1]                                                  NVARCHAR (150)  NULL,
    CONSTRAINT [POG5_ZalacznikA_v4_PK] PRIMARY KEY CLUSTERED ([IdentyfikatorZalacznika] ASC, [IdentyfikatorDokumentu] ASC) ON [FG_ZEF2DP]
);

