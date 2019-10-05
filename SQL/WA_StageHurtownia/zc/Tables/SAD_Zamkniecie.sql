CREATE TABLE [zc].[SAD_Zamkniecie] (
    [IdDok]        BIGINT       NOT NULL,
    [IdPozycji]    SMALLINT     NOT NULL,
    [NrZamkniecia] VARCHAR (20) NULL,
    CONSTRAINT [PK_SAD_Zamkniecie] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC)
);

