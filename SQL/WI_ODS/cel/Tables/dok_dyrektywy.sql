CREATE TABLE [cel].[dok_dyrektywy] (
    [id_dok]      VARCHAR (30)   NOT NULL,
    [NrDyrektywy] NUMERIC (4)    NOT NULL,
    [IdProfilu]   VARCHAR (40)   NULL,
    [AutorProf]   VARCHAR (40)   NULL,
    [RodzDyr]     CHAR (1)       NULL,
    [Adresat]     VARCHAR (16)   NULL,
    [Status]      CHAR (1)       NULL,
    [Tresc]       VARCHAR (1024) NULL,
    [Koment]      VARCHAR (512)  NULL,
    [KomentDysp]  VARCHAR (512)  NULL,
    CONSTRAINT [PK_DOK_DYREKTYWY] PRIMARY KEY CLUSTERED ([id_dok] ASC, [NrDyrektywy] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_DYRE_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok])
);

