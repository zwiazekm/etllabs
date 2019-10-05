CREATE TABLE [zc].[PWD_TransportZamkniecie] (
    [IdDok]               BIGINT       NOT NULL,
    [IdPozycji]           SMALLINT     NOT NULL,
    [IdPozycjiZamkniecie] SMALLINT     NOT NULL,
    [NrZamknieciaCeln]    VARCHAR (20) NULL,
    CONSTRAINT [PK_PWD_TransportZamkniecie] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiZamkniecie] ASC)
);

