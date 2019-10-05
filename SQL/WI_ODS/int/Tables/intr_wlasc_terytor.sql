CREATE TABLE [int].[intr_wlasc_terytor] (
    [id_pod]        VARCHAR (35) NOT NULL,
    [nr_poz]        INT          NOT NULL,
    [identyfikator] VARCHAR (10) NULL,
    [wazna_od_mies] INT          NULL,
    [wazna_od_rok]  INT          NULL,
    [wazna_do_mies] INT          NULL,
    [wazna_do_rok]  INT          NULL,
    CONSTRAINT [PK_intr_wlasc_terytor] PRIMARY KEY CLUSTERED ([id_pod] ASC, [nr_poz] ASC) WITH (FILLFACTOR = 90) ON [FG_INT]
);

