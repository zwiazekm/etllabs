CREATE TABLE [cel].[v2_pwd_dok_wym] (
    [idDokNr]     BIGINT       NOT NULL,
    [PozId]       SMALLINT     NOT NULL,
    [Towar_PozId] SMALLINT     NOT NULL,
    [Kod]         VARCHAR (4)  NULL,
    [Nr]          VARCHAR (35) NULL,
    CONSTRAINT [PK_V2_PWD_DOK_WYM] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Towar_PozId] ASC),
    CONSTRAINT [FK_V2_PWD_DOK_WYM_TOWAR] FOREIGN KEY ([idDokNr], [Towar_PozId]) REFERENCES [cel].[v2_towar] ([idDokNr], [PozId])
);

