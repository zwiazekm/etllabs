CREATE TABLE [cel].[dok_psp] (
    [id_dok]        VARCHAR (30)  NOT NULL,
    [Status]        CHAR (1)      NULL,
    [id_przewoznik] VARCHAR (30)  NULL,
    [kierunek]      VARCHAR (6)   NULL,
    [KodTransp]     VARCHAR (2)   NULL,
    [Uwagi]         VARCHAR (255) NULL,
    CONSTRAINT [PK_DOK_PSP] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_PSP_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok]),
    CONSTRAINT [FK_DOK_PSP_REFERENCE_KONTRAHE] FOREIGN KEY ([id_przewoznik]) REFERENCES [cel].[kontrahenci] ([id_kntr])
);

