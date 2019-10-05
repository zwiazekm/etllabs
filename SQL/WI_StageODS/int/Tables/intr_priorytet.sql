CREATE TABLE [int].[intr_priorytet] (
    [id_pod]        VARCHAR (35) NOT NULL,
    [nr_poz]        INT          NULL,
    [rodzaj_prior]  CHAR (1)     NOT NULL,
    [priorytet]     DECIMAL (2)  NULL,
    [wazna_od_mies] INT          NOT NULL,
    [wazna_od_rok]  INT          NOT NULL,
    [wazna_do_mies] INT          NULL,
    [wazna_do_rok]  INT          NULL,
    [w_systemie_od] DATETIME     NULL,
    CONSTRAINT [PK_intr_priorytet] PRIMARY KEY CLUSTERED ([id_pod] ASC, [rodzaj_prior] ASC, [wazna_od_mies] ASC, [wazna_od_rok] ASC)
);

