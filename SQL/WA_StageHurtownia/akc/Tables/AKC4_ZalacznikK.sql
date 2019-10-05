CREATE TABLE [akc].[AKC4_ZalacznikK] (
    [IdDok]                     VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]      CHAR (2)        NULL,
    [NumerZalacznikaSys]        INT             NOT NULL,
    [NumerFormularzaZDokumentu] VARCHAR (10)    NULL,
    [NumerAkcyzowy]             VARCHAR (40)    NULL,
    [TypSEED]                   CHAR (2)        NULL,
    [RazemObliczonyPodatek]     DECIMAL (19, 3) NULL,
    [ZwolnieniaObnizenia]       DECIMAL (19, 3) NULL,
    [OgolemPodatek]             DECIMAL (19, 3) NULL,
    [KwotaPrzedplatyAkcyzy]     DECIMAL (19, 3) NULL,
    [PodatekNalezny]            DECIMAL (19, 3) NULL,
    [NadwyzkaPrzedplaty]        DECIMAL (19, 3) NULL,
    [Okres]                     DATE            NULL,
    CONSTRAINT [PK_AKC4_ZalacznikK] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC)
);

