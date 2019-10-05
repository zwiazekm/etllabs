CREATE TABLE [akc].[AKC4_ZalacznikH] (
    [IdDok]                                   VARCHAR (30)    NOT NULL,
    [OznaczenieZalacznika]                    CHAR (2)        NULL,
    [NumerZalacznikaSys]                      INT             NOT NULL,
    [NumerFormularzaZDokumentu]               VARCHAR (10)    NULL,
    [KwotaPodatku]                            DECIMAL (19, 3) NULL,
    [RazemObliczonyPodatek]                   DECIMAL (19, 3) NULL,
    [ZwolnieniaObnizenia]                     DECIMAL (19, 3) NULL,
    [OgolemPodatek]                           DECIMAL (19, 3) NULL,
    [KwotaWstepWplatMies]                     DECIMAL (19, 3) NULL,
    [NadplataWplatMiesDoRozliczPoprzedDeklar] DECIMAL (19, 3) NULL,
    [KwotaZwolOdAkcArt30Ust1]                 DECIMAL (19, 3) NULL,
    [DoZaplaty]                               DECIMAL (19, 3) NULL,
    [KwotaZwolOdAkcArt30Ust6]                 DECIMAL (19, 3) NULL,
    [NadplataWplatMiesDoRozlicz]              DECIMAL (19, 3) NULL,
    [KwotaZwolOdAkcArt30Ust7]                 DECIMAL (19, 3) NULL,
    [Okres]                                   DATE            NULL,
    [OkresDo]                                 DATE            NULL,
    CONSTRAINT [PK_AKC4_ZalacznikH] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznikaSys] ASC)
);

