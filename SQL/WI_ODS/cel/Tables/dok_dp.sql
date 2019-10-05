CREATE TABLE [cel].[dok_dp] (
    [id_dok]    VARCHAR (30)  NOT NULL,
    [DataWyd]   DATETIME      NULL,
    [Opis]      VARCHAR (255) NULL,
    [Status]    CHAR (1)      NULL,
    [Odwolanie] CHAR (1)      NULL,
    CONSTRAINT [PK_DOK_DP] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_DP_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok])
);

