CREATE TABLE [akc].[AKC4_ZalacznikL] (
    [IdDok]                     VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]      CHAR (2)        NOT NULL,
    [NumerZalacznikaSys]        INT             NOT NULL,
    [NumerFormularzaZDokumentu] VARCHAR (10)    NULL,
    [RazemObliczonyPodatek]     DECIMAL (19, 3) NULL,
    [ZwolnieniaObnizenia]       DECIMAL (19, 3) NULL,
    [OgolemPodatek]             DECIMAL (19, 3) NULL,
    [Okres]                     DATE            NULL,
    CONSTRAINT [PK_AKC4_ZalacznikL] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC)
);

