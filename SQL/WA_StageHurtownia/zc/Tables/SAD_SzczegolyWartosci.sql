CREATE TABLE [zc].[SAD_SzczegolyWartosci] (
    [IdDok]               BIGINT      NOT NULL,
    [IdPozycji]           SMALLINT    NOT NULL,
    [IdPozycjiSzczegWart] SMALLINT    NOT NULL,
    [KodWartosci]         VARCHAR (5) NULL,
    [KodWartosciPid]      INT         NULL,
    CONSTRAINT [PK_SAD_SzczegolyWartosci] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiSzczegWart] ASC)
);

