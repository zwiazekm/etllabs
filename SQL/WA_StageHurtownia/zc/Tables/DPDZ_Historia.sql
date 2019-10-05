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
    CONSTRAINT [PK_DPDZ_Historia] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

