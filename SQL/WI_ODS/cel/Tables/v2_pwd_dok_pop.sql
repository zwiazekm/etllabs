CREATE TABLE [cel].[v2_pwd_dok_pop] (
    [idDokNr]     BIGINT       NOT NULL,
    [PozId]       SMALLINT     NOT NULL,
    [Towar_PozId] SMALLINT     NOT NULL,
    [Kod]         VARCHAR (3)  NULL,
    [Nr]          VARCHAR (35) NULL,
    [NrCelina]    VARCHAR (25) NULL,
    CONSTRAINT [PK_V2_PWD_DOK_POP] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Towar_PozId] ASC),
    CONSTRAINT [FK_V2_PWD_DOK_POP_TOWAR] FOREIGN KEY ([idDokNr], [Towar_PozId]) REFERENCES [cel].[v2_towar] ([idDokNr], [PozId])
);

