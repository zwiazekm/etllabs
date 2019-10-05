CREATE TABLE [akc].[AKC3_ZalacznikG] (
    [IdDok]                     VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]      CHAR (1)        NOT NULL,
    [NumerZalacznikaSys]        INT             NOT NULL,
    [NumerFormularzaZDokumentu] VARCHAR (10)    NULL,
    [RazemObliczonyPodatek]     DECIMAL (19, 3) NULL,
    [ZwolnieniaPomniejszenia]   DECIMAL (19, 3) NULL,
    [OgolemPodatek]             DECIMAL (19, 3) NULL,
    CONSTRAINT [PK_AKC3_ZalacznikG] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC) ON [FG_AKC],
    CONSTRAINT [FK_AKC3_ZalacznikG_IdDok_AKC3_Deklaracja_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [akc].[AKC3_Deklaracja] ([IdDok])
);

