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
    CONSTRAINT [PK_SAD_Historia] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

