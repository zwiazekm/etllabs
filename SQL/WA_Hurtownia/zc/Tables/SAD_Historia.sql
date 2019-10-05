CREATE TABLE [zc].[SAD_Historia] (
    [IdDok]           BIGINT         NOT NULL,
    [IdPozycji]       BIGINT         NOT NULL,
    [DataOperacji]    DATETIME       NULL,
    [UC]              VARCHAR (9)    NULL,
    [UCPid]           INT            NULL,
    [Operator]        VARCHAR (30)   NULL,
    [Operacja]        VARCHAR (16)   NULL,
    [Adnotacja]       VARCHAR (2000) NULL,
    [RodzAdnotacji]   VARCHAR (10)   NULL,
    [DataRejestracji] DATETIME       NULL,
    CONSTRAINT [PK_SAD_Historia] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_Historia_IdDok_SAD_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[SAD_Dokument] ([IdDok]),
    CONSTRAINT [FK_SAD_Historia_UCPid] FOREIGN KEY ([UCPid]) REFERENCES [pdr].[c001] ([c001_id])
);

