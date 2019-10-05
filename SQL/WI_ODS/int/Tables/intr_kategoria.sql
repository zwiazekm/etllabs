CREATE TABLE [int].[intr_kategoria] (
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
    CONSTRAINT [PK_intr_kategoria] PRIMARY KEY CLUSTERED ([id_pod] ASC, [rodz_kat] ASC, [wazna_od_mies] ASC, [wazna_od_rok] ASC) WITH (FILLFACTOR = 90) ON [FG_INT],
    CONSTRAINT [FK_INTR_KATEGORIA_REF_DANE_POD] FOREIGN KEY ([id_pod]) REFERENCES [int].[intr_dane_pod] ([id_pod])
);

