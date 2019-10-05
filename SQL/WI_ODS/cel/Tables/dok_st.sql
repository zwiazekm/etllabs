CREATE TABLE [cel].[dok_st] (
    [id_dok]       VARCHAR (30) NOT NULL,
    [ZglaszWe]     VARCHAR (30) NULL,
    [ZglaszWy]     VARCHAR (30) NULL,
    [NazwaJedn]    VARCHAR (35) NULL,
    [KodTransp]    VARCHAR (2)  NULL,
    [NrRej]        VARCHAR (7)  NULL,
    [Kraj]         VARCHAR (2)  NULL,
    [Bandera]      VARCHAR (2)  NULL,
    [Wypor]        NUMERIC (11) NULL,
    [EtapPort]     CHAR (1)     NULL,
    [Status]       CHAR (1)     NULL,
    [DataZamknEST] DATETIME     NULL,
    CONSTRAINT [PK_DOK_ST] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_ST_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok]),
    CONSTRAINT [FK_DOK_ST_REFERENCE_KONTRAHE] FOREIGN KEY ([ZglaszWe]) REFERENCES [cel].[kontrahenci] ([id_kntr]),
    CONSTRAINT [FK_DOK_ST_REFERENCE_KONTRAHE2] FOREIGN KEY ([ZglaszWy]) REFERENCES [cel].[kontrahenci] ([id_kntr])
);

