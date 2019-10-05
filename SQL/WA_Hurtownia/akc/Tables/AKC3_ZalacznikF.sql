﻿CREATE TABLE [akc].[AKC3_ZalacznikF] (
    [IdDok]                                       VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]                        CHAR (1)        NOT NULL,
    [NumerZalacznikaSys]                          INT             NOT NULL,
    [NumerAkcyzowy]                               VARCHAR (40)    NULL,
    [NumerFormularzaZDokumentu]                   VARCHAR (10)    NULL,
    [ZapasPoczatPapierosy]                        DECIMAL (19, 3) NULL,
    [KwotaPodatkuWZawieszeniuPapierosy]           DECIMAL (19, 3) NULL,
    [IloscWyrobPrzyjetaNaSkladPapierosy]          DECIMAL (19, 3) NULL,
    [IloscWyprodukWyrobAkcPapierosy]              DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladPapierosy]                  DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladWprocedZawieszPapierosy]    DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladPozaProcedZawieszPapierosy] DECIMAL (19, 3) NULL,
    [UbytkiNiedoboryPapierosy]                    DECIMAL (19, 3) NULL,
    [ZapasKoncowyPapierosy]                       DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasKoncowPapierosy]              DECIMAL (19, 3) NULL,
    [ZapasPoczatCygara]                           DECIMAL (19, 3) NULL,
    [KwotaPodatkuWZawieszeniuCygara]              DECIMAL (19, 3) NULL,
    [IloscWyrobPrzyjetaNaSkladCygara]             DECIMAL (19, 3) NULL,
    [IloscWyprodukWyrobAkcCygara]                 DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladCygara]                     DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladWprocedZawieszCygara]       DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladPozaProcedZawieszCygara]    DECIMAL (19, 3) NULL,
    [UbytkiNiedoboryCygara]                       DECIMAL (19, 3) NULL,
    [ZapasKoncowyCygara]                          DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasKoncowCygara]                 DECIMAL (19, 3) NULL,
    [ZapasPoczatTyton]                            DECIMAL (19, 3) NULL,
    [KwotaPodatkuWZawieszeniuTyton]               DECIMAL (19, 3) NULL,
    [IloscWyrobPrzyjetaNaSkladTyton]              DECIMAL (19, 3) NULL,
    [IloscWyprodukWyrobAkcTyton]                  DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladTyton]                      DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladWprocedZawieszTyton]        DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladPozaProcedZawieszTyton]     DECIMAL (19, 3) NULL,
    [UbytkiNiedoboryTyton]                        DECIMAL (19, 3) NULL,
    [ZapasKoncowyTyton]                           DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasKoncowTyton]                  DECIMAL (19, 3) NULL,
    [RazemObliczonyPodatek]                       DECIMAL (19, 3) NULL,
    [ZwolnieniaPomniejszenia]                     DECIMAL (19, 3) NULL,
    [OgolemPodatek]                               DECIMAL (19, 3) NULL,
    [KwotaZnakowAkcyzy]                           DECIMAL (19, 3) NULL,
    [PodatekNalezny]                              DECIMAL (19, 3) NULL,
    [Nadplata]                                    DECIMAL (19, 3) NULL,
    CONSTRAINT [PK_AKC3_ZalacznikF] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC) ON [FG_AKC],
    CONSTRAINT [FK_AKC3_ZalacznikF_IdDok_AKC3_Deklaracja_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [akc].[AKC3_Deklaracja] ([IdDok])
);

