CREATE TABLE [int].[intr_fwpdk] (
    [id_pod]        VARCHAR (35) NOT NULL,
    [nr_poz]        INT          NOT NULL,
    [fw]            VARCHAR (3)  NULL,
    [pkd]           VARCHAR (5)  NULL,
    [poczatek_obow] DATETIME     NULL,
    [koniec_obow]   DATETIME     NULL,
    CONSTRAINT [PK_intr_fwpdk] PRIMARY KEY CLUSTERED ([id_pod] ASC, [nr_poz] ASC) WITH (FILLFACTOR = 70)
);

