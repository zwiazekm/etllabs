CREATE TABLE [wald].[agregaty_import_przeslane_z_GUS_arch] (
    [pcn_p]       VARCHAR (8)   NULL,
    [kraj_poch]   VARCHAR (2)   NULL,
    [kraj_wys]    VARCHAR (2)   NULL,
    [regon]       VARCHAR (14)  NULL,
    [mies]        VARCHAR (2)   NULL,
    [rok]         VARCHAR (2)   NULL,
    [tranzak]     VARCHAR (2)   NULL,
    [trans]       VARCHAR (1)   NULL,
    [war_dos]     VARCHAR (3)   NULL,
    [urz_cel]     VARCHAR (2)   NULL,
    [proc]        VARCHAR (4)   NULL,
    [prog]        VARCHAR (1)   NULL,
    [masa_net]    VARCHAR (15)  NULL,
    [ilosc]       VARCHAR (15)  NULL,
    [wart_zl]     VARCHAR (15)  NULL,
    [wart_dol]    VARCHAR (15)  NULL,
    [wart_euro]   VARCHAR (15)  NULL,
    [komentarz]   VARCHAR (255) NULL,
    [propozycja]  VARCHAR (15)  NULL,
    [GUS_zglosil] DATETIME      NULL,
    [uwagi_CAAC]  VARCHAR (255) NULL
) ON [WaldDane];

