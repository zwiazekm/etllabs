CREATE TABLE [cel].[dok_operacje] (
    [id_dok]         VARCHAR (30)  NOT NULL,
    [IdPoz]          INT           NOT NULL,
    [DataZm]         DATETIME      NOT NULL,
    [IdJedn]         VARCHAR (9)   NULL,
    [IdUsr]          VARCHAR (16)  NULL,
    [SymbolOperacji] VARCHAR (16)  NULL,
    [Adnotacja]      VARCHAR (255) NULL,
    [RodzAdnotacji]  VARCHAR (4)   NULL,
    CONSTRAINT [PK_DOK_OPERACJE] PRIMARY KEY CLUSTERED ([id_dok] ASC, [IdPoz] ASC, [DataZm] ASC) WITH (FILLFACTOR = 90)
);

