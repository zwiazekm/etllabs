CREATE TABLE [zc].[DS_KontenerZamkniecie] (
    [IdDok]                BIGINT       NOT NULL,
    [IdPozycji]            SMALLINT     NOT NULL,
    [IdPozycjiZamkniecie]  SMALLINT     NOT NULL,
    [Ilosc]                SMALLINT     NULL,
    [NrZamknieciaCelnKont] VARCHAR (20) NULL,
    CONSTRAINT [PK_DS_KontenerZamkniecie] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiZamkniecie] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DS_KontenerZamkniecie_IdDokIdPozycji_DS_Kontener_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[DS_Kontener] ([IdDok], [IdPozycji])
);

