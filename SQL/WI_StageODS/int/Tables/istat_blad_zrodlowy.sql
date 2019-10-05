CREATE TABLE [int].[istat_blad_zrodlowy] (
    [id_bledu]  VARCHAR (30)  NOT NULL,
    [id_dok]    VARCHAR (30)  NULL,
    [sym_dok]   VARCHAR (40)  NULL,
    [kod]       VARCHAR (6)   NULL,
    [komunikat] VARCHAR (255) NULL,
    [id_jedn]   VARCHAR (20)  NULL,
    CONSTRAINT [PK_ISTAT_BLAD_ZRODLOWY] PRIMARY KEY CLUSTERED ([id_bledu] ASC) WITH (FILLFACTOR = 70)
);

