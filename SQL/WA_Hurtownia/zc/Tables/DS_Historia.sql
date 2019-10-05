CREATE TABLE [zc].[DS_Historia] (
    [IdDok]         BIGINT         NOT NULL,
    [IdPozycji]     BIGINT         NOT NULL,
    [DataOperacji]  DATETIME       NULL,
    [UC]            VARCHAR (9)    NULL,
    [UCPid]         INT            NULL,
    [Operator]      VARCHAR (30)   NULL,
    [Operacja]      VARCHAR (16)   NULL,
    [Adnotacja]     VARCHAR (2000) NULL,
    [RodzAdnotacji] VARCHAR (10)   NULL,
    CONSTRAINT [PK_DS_Historia] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DS_Historia_IdDok_DS_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[DS_Dokument] ([IdDok]),
    CONSTRAINT [FK_DS_Historia_UCPid] FOREIGN KEY ([UCPid]) REFERENCES [pdr].[c001] ([c001_id])
);

