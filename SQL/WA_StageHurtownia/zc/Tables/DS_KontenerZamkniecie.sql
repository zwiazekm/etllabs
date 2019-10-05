﻿CREATE TABLE [zc].[DS_KontenerZamkniecie] (
    [IdDok]                BIGINT       NOT NULL,
    [IdPozycji]            SMALLINT     NOT NULL,
    [IdPozycjiZamkniecie]  SMALLINT     NOT NULL,
    [Ilosc]                SMALLINT     NULL,
    [NrZamknieciaCelnKont] VARCHAR (20) NULL,
    CONSTRAINT [PK_DS_KontenerZamkniecie] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiZamkniecie] ASC)
);

