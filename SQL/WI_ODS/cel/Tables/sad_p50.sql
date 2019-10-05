CREATE TABLE [cel].[sad_p50] (
    [id_dok]           VARCHAR (30)  NOT NULL,
    [id_kntr]          VARCHAR (30)  NOT NULL,
    [PodpNazwiskoImie] VARCHAR (255) NULL,
    [Podp_Stanowisko]  VARCHAR (30)  NULL,
    CONSTRAINT [PK_SAD_P50] PRIMARY KEY CLUSTERED ([id_dok] ASC, [id_kntr] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_P50_REFERENCE_DOK_SAD] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_sad] ([id_dok]),
    CONSTRAINT [FK_SAD_P50_REFERENCE_KONTRAHE] FOREIGN KEY ([id_kntr]) REFERENCES [cel].[kontrahenci] ([id_kntr])
);

