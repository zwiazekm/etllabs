CREATE TABLE [cel].[sad_p14] (
    [id_dok]       VARCHAR (30) NOT NULL,
    [id_kntr]      VARCHAR (30) NULL,
    [ImpExp]       CHAR (1)     NULL,
    [NazwiskoImie] VARCHAR (40) NULL,
    [NrDowOs]      VARCHAR (30) NULL,
    [NrWpisu]      VARCHAR (6)  NULL,
    [DataWpisu]    DATETIME     NULL,
    CONSTRAINT [PK_SAD_P14] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_P14_REFERENCE_DOK_SAD] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_sad] ([id_dok])
);

