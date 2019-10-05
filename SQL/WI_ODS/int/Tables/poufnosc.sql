CREATE TABLE [int].[poufnosc] (
    [nr_reguly]     NUMERIC (11) NOT NULL,
    [nip]           VARCHAR (10) NULL,
    [kod_tow_p]     VARCHAR (8)  NULL,
    [kraj_przez_p]  VARCHAR (2)  NULL,
    [kraj_wys_p]    VARCHAR (2)  NULL,
    [kraj_poch_p]   VARCHAR (2)  NULL,
    [kraj]          VARCHAR (2)  NULL,
    [wazna_od_mies] INT          NULL,
    [wazna_od_rok]  INT          NULL,
    [wazna_do_mies] INT          NULL,
    [wazna_do_rok]  INT          NULL,
    [regon]         VARCHAR (14) NULL,
    CONSTRAINT [PK_POUFNOSC] PRIMARY KEY CLUSTERED ([nr_reguly] ASC) WITH (FILLFACTOR = 90) ON [FG_INT]
);

