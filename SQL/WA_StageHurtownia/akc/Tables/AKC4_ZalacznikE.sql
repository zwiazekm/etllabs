CREATE TABLE [akc].[AKC4_ZalacznikE] (
    [IdDok]                     VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]      CHAR (2)        NULL,
    [NumerZalacznikaSys]        INT             NOT NULL,
    [NumerFormularzaZDokumentu] VARCHAR (10)    NULL,
    [RazemObliczonyPodatek]     DECIMAL (19, 3) NULL,
    [Okres]                     DATE            NULL,
    CONSTRAINT [PK_AKC4_ZalacznikE] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC)
);

