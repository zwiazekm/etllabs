CREATE TABLE [stat].[dot_priorytet] (
    [id_pod]        VARCHAR (35) NOT NULL,
    [nr_poz]        INT          NULL,
    [rodzaj_prior]  CHAR (1)     NOT NULL,
    [priorytet]     DECIMAL (2)  NULL,
    [wazna_od_mies] INT          NOT NULL,
    [wazna_od_rok]  INT          NOT NULL,
    [wazna_do_mies] INT          NULL,
    [wazna_do_rok]  INT          NULL,
    [w_systemie_od] DATETIME     NULL,
    [WaznaOdRokMc]  AS           ([wazna_od_mies]+(100)*[wazna_od_rok]) PERSISTED NOT NULL,
    [WaznaDoRokMc]  AS           (isnull([wazna_do_mies],(12))+(100)*isnull([wazna_do_rok],(2100))) PERSISTED NOT NULL,
    CONSTRAINT [PK_dot_priorytet] PRIMARY KEY CLUSTERED ([WaznaOdRokMc] ASC, [WaznaDoRokMc] ASC, [id_pod] ASC, [rodzaj_prior] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_dot_priorytet_priorytet]
    ON [stat].[dot_priorytet]([priorytet] ASC);


GO
CREATE STATISTICS [nr_poz]
    ON [stat].[dot_priorytet]([nr_poz]);

