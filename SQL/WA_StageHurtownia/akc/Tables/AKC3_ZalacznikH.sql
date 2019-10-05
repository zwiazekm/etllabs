CREATE TABLE [akc].[AKC3_ZalacznikH] (
    [IdDok]                     VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]      CHAR (1)        NOT NULL,
    [NumerZalacznikaSys]        INT             NOT NULL,
    [NumerFormularzaZDokumentu] VARCHAR (10)    NULL,
    [RazemObliczonyPodatek]     DECIMAL (19, 3) NULL,
    [ZwolnieniaPomniejszenia]   DECIMAL (19, 3) NULL,
    [OgolemPodatek]             DECIMAL (19, 3) NULL,
    CONSTRAINT [PK_AKC3_ZalacznikH] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC)
);

