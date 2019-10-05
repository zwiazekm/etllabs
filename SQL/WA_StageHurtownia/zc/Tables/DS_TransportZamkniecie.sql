CREATE TABLE [zc].[DS_TransportZamkniecie] (
    [IdDok]               BIGINT       NOT NULL,
    [IdPozycji]           SMALLINT     NOT NULL,
    [IdPozycjiZamkniecie] SMALLINT     NOT NULL,
    [Ilosc]               SMALLINT     NULL,
    [NrZamknieciaCeln]    VARCHAR (20) NULL,
    CONSTRAINT [PK_DS_TransportZamkniecie] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiZamkniecie] ASC)
);

