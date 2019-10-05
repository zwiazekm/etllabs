CREATE TABLE [cel].[v2_pwd_zamkniecie] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   SMALLINT     NOT NULL,
    [Nr]      VARCHAR (20) NULL,
    CONSTRAINT [PK_V2_PWD_ZAMKNIECIE] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_PWD_ZAMK_DOK_PWD] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_pwd] ([idDokNr])
);

