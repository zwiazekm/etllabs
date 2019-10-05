CREATE TABLE [int].[intr_upowaznienie] (
    [id_pod]        VARCHAR (35) NOT NULL,
    [nr_poz]        INT          NOT NULL,
    [id_up_pod]     VARCHAR (35) NULL,
    [zakres]        CHAR (1)     NULL,
    [poczatek_obow] DATETIME     NULL,
    [koniec_obow]   DATETIME     NULL,
    CONSTRAINT [PK_intr_upowaznienie] PRIMARY KEY CLUSTERED ([id_pod] ASC, [nr_poz] ASC) WITH (FILLFACTOR = 90) ON [FG_INT]
);

