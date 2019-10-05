CREATE TABLE [intr2].[intr_priorytet] (
    [id_pod]        NVARCHAR (35) NOT NULL,
    [nr_poz]        INT           NULL,
    [rodzaj_prior]  NCHAR (1)     NOT NULL,
    [priorytet]     DECIMAL (2)   NULL,
    [wazna_od_mies] INT           NOT NULL,
    [wazna_od_rok]  INT           NOT NULL,
    [wazna_do_mies] INT           NULL,
    [wazna_do_rok]  INT           NULL,
    [w_systemie_od] DATETIME2 (3) NULL
);

