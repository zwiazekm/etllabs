CREATE TABLE [zc].[DPDZ_Historia] (
    [IdDok]         BIGINT         NOT NULL,
    [IdPozycji]     BIGINT         NOT NULL,
    [DataZmiany]    DATETIME       NULL,
    [UC]            VARCHAR (9)    NULL,
    [UCPid]         INT            NULL,
    [Operator]      VARCHAR (30)   NULL,
    [Akcja]         VARCHAR (16)   NULL,
    [Adnotacja]     VARCHAR (2000) NULL,
    [RodzAdnotacji] VARCHAR (10)   NULL,
    CONSTRAINT [PK_DPDZ_Historia] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DPDZ_Dokument_UCPid] FOREIGN KEY ([UCPid]) REFERENCES [pdr].[c001] ([c001_id]),
    CONSTRAINT [FK_DPDZ_Historia_IdDok_DPDZ_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[DPDZ_Dokument] ([IdDok])
);

