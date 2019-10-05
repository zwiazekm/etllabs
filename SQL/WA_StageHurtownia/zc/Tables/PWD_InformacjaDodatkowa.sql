CREATE TABLE [zc].[PWD_InformacjaDodatkowa] (
    [IdDok]          BIGINT        NOT NULL,
    [IdPozycji]      SMALLINT      NOT NULL,
    [IdPozycjiTowar] SMALLINT      NOT NULL,
    [KodInfDod]      VARCHAR (5)   NULL,
    [Tekst]          VARCHAR (255) NULL,
    CONSTRAINT [PK_V2_PWD_INF_DOD] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiTowar] ASC)
);

