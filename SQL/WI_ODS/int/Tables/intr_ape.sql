CREATE TABLE [int].[intr_ape] (
    [id_pod]        VARCHAR (35) NOT NULL,
    [nr_poz]        INT          NOT NULL,
    [ape]           VARCHAR (2)  NULL,
    [poczatek_obow] DATETIME     NULL,
    [koniec_obow]   DATETIME     NULL,
    CONSTRAINT [PK_intr_ape] PRIMARY KEY CLUSTERED ([id_pod] ASC, [nr_poz] ASC) WITH (FILLFACTOR = 90) ON [FG_INT]
);

