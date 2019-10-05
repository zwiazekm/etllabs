CREATE TABLE [cel].[st_PrzyWy] (
    [id_dok]     VARCHAR (30)  NOT NULL,
    [typ]        VARCHAR (1)   NOT NULL,
    [Port]       VARCHAR (35)  NULL,
    [LiczbaPas]  NUMERIC (5)   NULL,
    [Zaloga]     NUMERIC (5)   NULL,
    [LiczPozTow] NUMERIC (5)   NULL,
    [Kont]       CHAR (1)      NULL,
    [KontPust]   CHAR (1)      NULL,
    [Tranzyt]    CHAR (1)      NULL,
    [OpisTow]    VARCHAR (140) NULL,
    CONSTRAINT [PK_ST_PRZYWY] PRIMARY KEY CLUSTERED ([id_dok] ASC, [typ] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_ST_PRZYW_REFERENCE_DOK_ST] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_st] ([id_dok])
);

