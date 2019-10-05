CREATE TABLE [zc].[DS_TransportZamkniecie] (
    [IdDok]               BIGINT       NOT NULL,
    [IdPozycji]           SMALLINT     NOT NULL,
    [IdPozycjiZamkniecie] SMALLINT     NOT NULL,
    [Ilosc]               SMALLINT     NULL,
    [NrZamknieciaCeln]    VARCHAR (20) NULL,
    CONSTRAINT [PK_DS_TransportZamkniecie] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiZamkniecie] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DS_TransportZamkniecie_IdDokIdPozycji_DS_SrodekPrzewozowy_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[DS_SrodekPrzewozowy] ([IdDok], [IdPozycji])
);

