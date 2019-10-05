CREATE TABLE [cel].[st_PrzyWy] (
    [id_dok]     VARCHAR (30)  NOT NULL,
    [typ]        VARCHAR (1)   NOT NULL,
    [Port]       VARCHAR (35)  NULL,
    [LiczbaPas]  NUMERIC (5)   NULL,
    [Zaloga]     NUMERIC (5)   NULL,
    [LiczPozTow] NUMERIC (5)   NULL,
    [Kont]       VARCHAR (1)   NULL,
    [KontPust]   VARCHAR (1)   NULL,
    [Tranzyt]    VARCHAR (1)   NULL,
    [OpisTow]    VARCHAR (140) NULL,
    CONSTRAINT [PK_ST_PRZYWY] PRIMARY KEY CLUSTERED ([id_dok] ASC, [typ] ASC) WITH (FILLFACTOR = 90)
);

