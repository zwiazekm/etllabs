CREATE TABLE [akc].[AKC3_ZalacznikJ] (
    [IdDok]                              VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]               CHAR (1)        NOT NULL,
    [NumerZalacznikaSys]                 INT             NOT NULL,
    [NumerAkcyzowy]                      VARCHAR (40)    NULL,
    [NumerFormularzaZDokumentu]          VARCHAR (10)    NULL,
    [ZapasPoczatkowy]                    DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasPoczatk]             DECIMAL (19, 3) NULL,
    [IloscWyrobPrzyjetaNaSklad]          DECIMAL (19, 3) NULL,
    [IloscWyprodukWyrobAkc]              DECIMAL (19, 3) NULL,
    [IloscWyrobZeSklad]                  DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladWprocedZawiesz]    DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladPozaProcedZawiesz] DECIMAL (19, 3) NULL,
    [UbytkiNiedobory]                    DECIMAL (19, 3) NULL,
    [ZapasKoncowy]                       DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasKoncow]              DECIMAL (19, 3) NULL,
    [RazemObliczonyPodatek]              DECIMAL (19, 3) NULL,
    [ZwolnieniaPomniejszenia]            DECIMAL (19, 3) NULL,
    [OgolemPodatek]                      DECIMAL (19, 3) NULL,
    CONSTRAINT [PK_AKC3_ZalacznikJ] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC)
);

