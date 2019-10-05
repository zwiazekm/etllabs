CREATE TABLE [int].[intr_fwpdk] (
    [id_pod]        VARCHAR (35) NOT NULL,
    [nr_poz]        INT          NOT NULL,
    [fw]            VARCHAR (3)  NULL,
    [pkd]           VARCHAR (5)  NULL,
    [poczatek_obow] DATETIME     NULL,
    [koniec_obow]   DATETIME     NULL,
    CONSTRAINT [PK_intr_fwpdk] PRIMARY KEY CLUSTERED ([id_pod] ASC, [nr_poz] ASC) WITH (FILLFACTOR = 90) ON [FG_INT],
    CONSTRAINT [FK_INTR_FWPDK_REF_DANE_POD] FOREIGN KEY ([id_pod]) REFERENCES [int].[intr_dane_pod] ([id_pod])
);


GO
CREATE NONCLUSTERED INDEX [idx_fwpdk_koniec_obow]
    ON [int].[intr_fwpdk]([koniec_obow] ASC) WITH (FILLFACTOR = 90)
    ON [FG_INT];


GO
CREATE NONCLUSTERED INDEX [idx_fwpdk_poczatek_obow]
    ON [int].[intr_fwpdk]([poczatek_obow] ASC) WITH (FILLFACTOR = 90)
    ON [FG_INT];

