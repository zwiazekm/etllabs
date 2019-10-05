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
    [EtapPort]     VARCHAR (1)  NULL,
    [Status]       VARCHAR (1)  NULL,
    [DataZamknEST] DATETIME     NULL,
    CONSTRAINT [PK_DOK_ST] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90)
);

