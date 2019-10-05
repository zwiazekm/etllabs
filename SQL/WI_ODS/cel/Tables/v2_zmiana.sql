CREATE TABLE [cel].[v2_zmiana] (
    [idDokNr]  BIGINT         NOT NULL,
    [Operacja] VARCHAR (16)   NULL,
    [XQLPath]  VARCHAR (1024) NULL,
    [Nazwa]    VARCHAR (255)  NULL,
    [przed]    VARCHAR (2048) NULL,
    [po]       VARCHAR (2048) NULL
);


GO
CREATE CLUSTERED INDEX [IDX_idDokNr]
    ON [cel].[v2_zmiana]([idDokNr] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];

