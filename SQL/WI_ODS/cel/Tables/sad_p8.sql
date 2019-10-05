CREATE TABLE [cel].[sad_p8] (
    [id_dok]  VARCHAR (30) NOT NULL,
    [id_kntr] VARCHAR (30) NOT NULL,
    [poz_id]  NUMERIC (2)  NOT NULL,
    CONSTRAINT [PK_SAD_P8] PRIMARY KEY CLUSTERED ([id_dok] ASC, [id_kntr] ASC, [poz_id] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_P8_REFERENCE_DOK_SAD] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_sad] ([id_dok]),
    CONSTRAINT [FK_SAD_P8_REFERENCE_KONTRAHE] FOREIGN KEY ([id_kntr]) REFERENCES [cel].[kontrahenci] ([id_kntr])
);

