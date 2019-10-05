CREATE TABLE [akc].[AKC3_ZalacznikE] (
    [IdDok]                          VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]           CHAR (1)        NOT NULL,
    [NumerZalacznikaSys]             INT             NOT NULL,
    [NumerAkcyzowy]                  VARCHAR (40)    NULL,
    [NumerFormularzaZDokumentu]      VARCHAR (10)    NULL,
    [RazemObliczonyPodatek]          DECIMAL (19, 3) NULL,
    [ZwolnieniaPomniejszenia]        DECIMAL (19, 3) NULL,
    [KwotaNadwyzBiezMies]            DECIMAL (19, 3) NULL,
    [PodatekNalezny]                 DECIMAL (19, 3) NULL,
    [KwotaNadwyzPoprzedOkres]        DECIMAL (19, 3) NULL,
    [RoznicaPodatNaleznAkwotNadwyz]  DECIMAL (19, 3) NULL,
    [KwotaNadwyzDoRozliczWnastOkres] DECIMAL (19, 3) NULL,
    CONSTRAINT [PK_AKC3_ZalacznikE] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC) ON [FG_AKC],
    CONSTRAINT [FK_AKC3_ZalacznikE_IdDok_AKC3_Deklaracja_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [akc].[AKC3_Deklaracja] ([IdDok])
);

