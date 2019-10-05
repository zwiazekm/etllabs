CREATE TABLE [akc].[AKC4_ZalacznikA] (
    [IdDok]                           VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]            CHAR (2)        NULL,
    [NumerZalacznikaSys]              INT             NOT NULL,
    [NumerFormularzaZDokumentu]       VARCHAR (10)    NULL,
    [NumerAkcyzowy]                   VARCHAR (40)    NULL,
    [TypSEED]                         CHAR (2)        NULL,
    [RazemObliczonyPodatek]           DECIMAL (19, 3) NULL,
    [ZwolnieniaObnizenia]             DECIMAL (19, 3) NULL,
    [OgolemPodatek]                   DECIMAL (19, 3) NULL,
    [KwotaZnakowAkcyzy]               DECIMAL (19, 3) NULL,
    [KwotaPrzedplatyAkcyzy]           DECIMAL (19, 3) NULL,
    [PodatekNalezny]                  DECIMAL (19, 3) NULL,
    [NadwyzkaPrzedplatyProdPozaSklad] DECIMAL (19, 3) NULL,
    [Okres]                           DATE            NULL,
    CONSTRAINT [PK_AKC4_ZalacznikA] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC) ON [FG_AKC],
    CONSTRAINT [FK_AKC4_ZalacznikA_IdDok_AKC4_Deklaracja_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [akc].[AKC4_Deklaracja] ([IdDok])
);

