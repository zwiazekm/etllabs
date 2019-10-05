CREATE TABLE [stat].[dot_kategoria] (
    [id_pod]        VARCHAR (35) NOT NULL,
    [nr_poz]        INT          NULL,
    [rodz_kat]      CHAR (1)     NOT NULL,
    [kategoria]     CHAR (1)     NULL,
    [zakres_szczeg] VARCHAR (4)  NULL,
    [wazna_od_mies] INT          NOT NULL,
    [wazna_od_rok]  INT          NOT NULL,
    [wazna_do_mies] INT          NULL,
    [wazna_do_rok]  INT          NULL,
    [w_systemie_od] DATETIME     NULL,
    [WaznaOdRokMc]  AS           ([wazna_od_mies]+(100)*[wazna_od_rok]),
    [WaznaDoRokMc]  AS           (isnull([wazna_do_mies],(12))+(100)*isnull([wazna_do_rok],(2100))),
    CONSTRAINT [PK_dot_kategoria] PRIMARY KEY CLUSTERED ([id_pod] ASC, [rodz_kat] ASC, [wazna_od_mies] ASC, [wazna_od_rok] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_dot_kategoria_kategoria]
    ON [stat].[dot_kategoria]([kategoria] ASC);


GO
CREATE STATISTICS [nr_poz]
    ON [stat].[dot_kategoria]([nr_poz]);


GO
CREATE STATISTICS [w_systemie_od]
    ON [stat].[dot_kategoria]([w_systemie_od]);


GO
CREATE STATISTICS [zakres_szczeg]
    ON [stat].[dot_kategoria]([zakres_szczeg]);

